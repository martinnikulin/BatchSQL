unit DMUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.TypInfo,
  System.Generics.Collections, System.DateUtils,
  ServerUnit, ProjectUnit;

type
  TAuthType = (atWindows, atSQLServer);

type
  TAuth = record
    AuthType: TAuthType;
    Login: String;
    Password: String;
  end;

type
  TDM = class(TDataModule)
    BatchSQLDB: TADOConnection;
    Servers: TADOQuery;
    dsServers: TDataSource;
    Databases: TADOQuery;
    CommandQuery: TADOQuery;
    Scripts: TADOQuery;
    dsScripts: TDataSource;
    ServerPackets: TADOQuery;
    dsServerPackets: TDataSource;
    Packets: TADOQuery;
    dsPackets: TDataSource;
    dsDatabases: TDataSource;
    RemoteGDB: TADOConnection;
    RemoteCatalog: TADOConnection;
    procedure PacketsAfterInsert(DataSet: TDataSet);
    procedure ServerPacketsBeforeDelete(DataSet: TDataSet);
  private
    procedure SetLogins;
    procedure ProcessServer;
    procedure ProcessDatabases(ServerAddr, ServerName: String);
    procedure ProcessDataBase(ServerAddr, ServerName, DataBaseName: String);
    procedure ProcessPackets(ServerName, DatabaseName: String);
    function ProcessPacket: Boolean;
  public
    Logins:   TDictionary<String, TAuth>;
    RunPackets: Boolean;
    MemoLines: TStrings;
    function  GetConnectionString(ServerAddr, Database: String; Auth: TAuth): String;
    procedure ExecSQL(Conn: TADOConnection; SQL: String); overload;
    procedure ExecSQL(Conn: TADOConnection; SQL: TStrings); overload;
    procedure OpenTables;
    procedure ConnectToRemoteCatalog(ConnString: String);
    procedure UpdateRecord(Records: TADOQuery; FieldName: String; Value: Variant);
    procedure ProcessServers;
    procedure RequeryDatabases;
    procedure ExecScript;
  end;

var
  DM: TDM;

implementation
uses
  MessengerUnit;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM }

procedure TDM.OpenTables;
begin
  SetLogins;
  BatchSQLDB.Connected := True;
  Packets.Active := True;
  Scripts.Active := True;
  Servers.Active := True;
  RequeryDatabases;
  ServerPackets.Active := True;
end;

procedure TDM.PacketsAfterInsert(DataSet: TDataSet);
begin
  Packets.FieldByName('DateCreated').AsDateTime := Date();
end;

procedure TDM.RequeryDatabases;
var
  ConnString, ServerAddr, Database: String;
  ServerId: Integer;
begin
  ServerAddr := DM.Servers.FieldByName('ServerAddr').AsString;
  ConnString := DM.GetConnectionString(ServerAddr, 'DSCGSystem', Logins[ServerAddr]);
  ConnectToRemoteCatalog(ConnString);
  Databases.Open;
end;

procedure TDM.ProcessServers;
begin
    Servers.First;
    Scripts.DataSource := dsServerPackets;
    while not Servers.Eof do
    begin
      if Servers.FieldByName('Actual').AsBoolean then
        ProcessServer;
      Servers.Next;
    end;
    Scripts.DataSource := dsPackets;
    Servers.First;
end;

procedure TDM.ProcessServer;
var
  ServerName, ServerAddr: String;
begin
  ServerName := Servers.FieldByName('ServerName').AsString;
  ServerAddr := Servers.FieldByName('ServerAddr').AsString;
  Messenger.SendMessage(StringOfChar('-', 200) + ' ' + 'Сервер: ' + ServerName);
  RequeryDatabases;
  ProcessDatabases(ServerAddr, ServerName);
end;

procedure TDM.ProcessDatabases(ServerAddr, ServerName: String);
var
  DatabaseName: String;
begin
  Databases.First;
  while not Databases.Eof do
  begin
    if Databases.FieldByName('ToUpdate').AsBoolean then
    begin
      DatabaseName := Databases.FieldByName('Database').AsString;
      ProcessDatabase(ServerAddr, ServerName, DataBaseName);
    end;
    Databases.Next;
  end;
end;

procedure TDM.ProcessDataBase(ServerAddr, ServerName, DataBaseName: String);
begin
  RemoteGDB.Connected := False;
  RemoteGDB.ConnectionString := GetConnectionString(ServerAddr, DatabaseName, Logins[ServerAddr]);
  RemoteGDB.Connected := True;
  Messenger.SendMessage(DatabaseName + ' --------------------------------');
  if RunPackets then
    ProcessPackets(ServerName, DatabaseName)
  else
    ExecScript;
end;

procedure TDM.ProcessPackets(ServerName, DatabaseName: String);
var
  N, PacketName, ScriptName: String;
begin
  ServerPackets.First;
  while not ServerPackets.Eof do
  begin
    N := ServerPackets.FieldByName('N').AsString;
    PacketName := ServerPackets.FieldByName('Name').AsString;
    if ServerPackets.FieldByName('Appointed').AsBoolean then
    begin
      Messenger.SendMessage('     Пакет ' + N + ': ' + PacketName);
      ProcessPacket;
    end;
    ServerPackets.Next;
  end;
end;

function TDM.ProcessPacket: Boolean;
var
  N, ScriptName: String;
begin
    Scripts.First;
    while not Scripts.Eof do
    begin
      N := Scripts.FieldByName('N').AsString;
      ScriptName := Scripts.FieldByName('Name').AsString;
      CommandQuery.SQL.Text := Scripts.FieldByName('Text').AsString;
      try
        CommandQuery.ExecSQL;
      except
         Messenger.SendMessage('          ' + N + ' ' + ScriptName + '. ' + 'Ошибка!');
      end;
      Scripts.Next;
    end;
end;

procedure TDM.ExecScript;
begin
  CommandQuery.SQL := MemoLines;
  try
    CommandQuery.ExecSQL;
  except
     Messenger.SendMessage('Ошибка!');
  end;
end;



procedure TDM.ExecSQL(Conn: TADOConnection; SQL: String);
var
  ADOQuery: TADOQuery;
begin
  try
    ADOQuery := TADOQuery.Create(nil);
    ADOQuery.Connection := Conn;
    ADOQuery.SQL.Text := SQL;
    Conn.BeginTrans;
    ADOQuery.ExecSQL;
    Conn.CommitTrans;
  except
    on E: Exception do begin
      Conn.RollbackTrans;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TDM.ExecSQL(Conn: TADOConnection; SQL: TStrings);
var
  ADOQuery: TADOQuery;
begin
  try
    ADOQuery := TADOQuery.Create(nil);
    ADOQuery.Connection := Conn;
    ADOQuery.SQL := SQL;
    Conn.BeginTrans;
    ADOQuery.ExecSQL;
    Conn.CommitTrans;
  except
    on E: Exception do begin
      Conn.RollbackTrans;
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TDM.ConnectToRemoteCatalog(ConnString: String);
begin
  with RemoteCatalog do
  begin
    Connected := False;
    ConnectionString := ConnString;
    Connected := True;
  end;
end;

function TDM.GetConnectionString(ServerAddr, Database: String; Auth: TAuth): String;
begin
  if Auth.AuthType = atWindows then
    Result := 'Provider=MSOLEDBSQL.1; Integrated Security=SSPI; Persist Security Info=True;' +
              'Data Source=' + ServerAddr + ';Initial Catalog=' + Database
  else
    Result := 'Provider=MSOLEDBSQL.1; Persist Security Info=True;' +
              'User Id=' + Auth.Login + ';Password=' + Auth.Password +
              ';Data Source=' + ServerAddr + ';Initial Catalog=' + Database;
end;

procedure TDM.SetLogins;
var
  Auth: TAuth;
begin
  Logins := TDictionary<String, TAuth>.Create;
  with Auth do begin
    AuthType := atWindows;
    Logins.Add('localhost', Auth);
    AuthType := atSQLServer; Login := 'DSCG'; Password := 'DSCG';
    Logins.Add('176.196.195.242', Auth);
    Logins.Add('195.208.152.88', Auth);
    Logins.Add('176.196.201.154,61433', Auth);
    Logins.Add('78.41.95.103', Auth);
  end;
end;

procedure TDM.UpdateRecord(Records: TADOQuery; FieldName: String;
  Value: Variant);
begin
  Records.Edit;
  Records.FieldByName(FieldName).Value := Value;
  Records.Post;
end;

procedure TDM.ServerPacketsBeforeDelete(DataSet: TDataSet);
var
  SQL: String;
begin
  SQL := 'delete from ServerPackets where ServerId = ' + ServerPackets.FieldByName('ServerId').AsString +
                                          'and PacketId = ' + ServerPackets.FieldByName('PacketId').AsString;
  ExecSQL(BatchSQLDB, SQL);
  ServerPackets.Requery();
  Abort;
end;

end.
