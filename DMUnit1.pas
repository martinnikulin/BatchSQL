unit DMUnit1;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.TypInfo,
  System.Generics.Collections,
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
    Projects: TADOQuery;
    CommandQuery: TADOQuery;
    Scripts: TADOQuery;
    dsScritpts: TDataSource;
    ProjectPackets: TADOQuery;
    dsProjectPackets: TDataSource;
    Packets: TADOQuery;
    dsPackets: TDataSource;
    dsProjects: TDataSource;
    procedure ScriptsAfterDelete(DataSet: TDataSet);
    procedure ScriptsAfterPost(DataSet: TDataSet);
    procedure PacketsAfterInsert(DataSet: TDataSet);
    procedure ScriptsAfterInsert(DataSet: TDataSet);
  private
    procedure SetSQLConsts;
    procedure SetLogins;
  public
    RCC: TADOConnection;
    SQL1, SQL2, SQL3, SQL4, SQL5: String;
    Logins:   TDictionary<String, TAuth>;
    function  GetConnection(ConnString: String): TADOConnection; overload;
    function  GetConnection(ServerAddr, Database: String): TADOConnection; overload;
    function  GetConnectionString(ServerAddr, Database: String; Auth: TAuth): String;
    function  GetServers(): TADOQuery;
    function  GetServer(Records: TADOQuery): TServer;
    function  GetProject(Records: TADOQuery): TProject;
    function  GetProcessServersRecords(): TADOQuery;
    function  GetProcessScriptsRecords(): TADOQuery;
    function  GetRemoteProjects(ServerAddr: String): TADOQuery;
    function  GetProjects(ServerId: Integer): TADOQuery;
    function  GetRecords(Conn: TADOConnection; SQL: String): TADOQuery;
    procedure ExecSQL(Conn: TADOConnection; SQL: TStrings); overload;
    procedure ExecSQL(Conn: TADOConnection; SQL: String); overload;
    procedure OpenTables;
    procedure ConnectToRemoteCatalog(ConnString: String);
    procedure UpdateRecord(Records: TADOQuery; FieldName: String; Value: Variant);
  end;

var
  DM: TDM;

implementation
uses
  MainUnit, MessengerUnit;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM }

procedure TDM.OpenTables;
begin
  SetSQLConsts;
  SetLogins;

  BatchSQLDB.Connected := True;
  Packets.Active := True;
  Scripts.Active := True;
  Servers.Active := True;
  Projects.Active := True;
  ProjectPackets.Active := True;
end;

procedure TDM.PacketsAfterInsert(DataSet: TDataSet);
begin
  Packets.FieldByName('DateCreated').AsDateTime := Date();
end;

procedure TDM.ScriptsAfterDelete(DataSet: TDataSet);
begin
  //ScriptApplying.Requery();
end;

procedure TDM.ScriptsAfterInsert(DataSet: TDataSet);
begin
  //Scripts.FieldByName('PacketId').AsInteger := Packets.FieldByName('PacketId').AsInteger;
end;

procedure TDM.ScriptsAfterPost(DataSet: TDataSet);
begin
  //ScriptApplying.Requery();
end;

function TDM.GetServers: TADOQuery;
begin
  //Result := GetRecords(CatalogConnection, SQL1);
end;

function TDM.GetProjects(ServerId: Integer): TADOQuery;
begin
  //Result := GetRecords(CatalogConnection, SQL2 + ' where ServerId = ' + IntToStr(ServerId));
end;

function TDM.GetProcessServersRecords(): TADOQuery;
begin
  //Result := GetRecords(CatalogConnection, SQL3);
end;

function TDM.GetProcessScriptsRecords(): TADOQuery;
begin
  //Result := GetRecords(CatalogConnection, SQL4);
end;

function TDM.GetServer(Records: TADOQuery): TServer;
begin
  Result := TServer.Create;
  with Result do begin
    ServerId := Records.FieldByName('ServerId').AsInteger;
    ServerName := Records.FieldByName('ServerName').AsString;
    ServerAddr := Records.FieldByName('ServerAddr').AsString;
    Actual := Records.FieldByName('Actual').AsBoolean;
  end;
end;

function TDM.GetProject(Records: TADOQuery): TProject;
begin
  Result := TProject.Create;
  with Result do begin
    ServerName := Records.FieldbyName('ServerName').AsString;
    ServerAddr := Records.FieldbyName('ServerAddr').AsString;
    Database := Records.FieldbyName('Database').AsString;
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
  RCC := GetConnection(ConnString);
end;

function TDM.GetConnectionString(ServerAddr, Database: String; Auth: TAuth): String;
begin
  if Auth.AuthType = atWindows then
    Result := 'Provider=MSOLEDBSQL.1; Integrated Security=SSPI; Persist Security Info=True;' +
              'Data Source=' + ServerAddr + ';' + ';Initial Catalog=' + Database
  else
    Result := 'Provider=MSOLEDBSQL.1; Persist Security Info=True;' +
              'User Id=' + Auth.Login + ';Password=' + Auth.Password +
              ';Data Source=' + ServerAddr + ';Initial Catalog=' + Database;
end;

function TDM.GetRecords(Conn: TADOConnection; SQL: String): TADOQuery;
begin
  Result := TADOQuery.Create(nil);
  Result.Connection := Conn;
  Result.SQL.Add(SQL);
  Result.Active := True;
end;

function TDM.GetRemoteProjects(ServerAddr: String): TADOQuery;
var
  Conn: TADOConnection;
begin
  try
    Conn := GetConnection(ServerAddr, 'DSCGSystem');
    Result := GetRecords(Conn, SQL5);
  except
    on e: exception do begin
      Messenger.SendMessage('Ну удалось подключиться к серверу ' + ServerAddr);
      Result := nil;
    end;
  end;
end;

function TDM.GetConnection(ServerAddr, Database: String): TADOConnection;
var
  Auth: TAuth;
begin
  Auth := Logins[ServerAddr];
  Result := GetConnection(GetConnectionString(ServerAddr, Database, Auth));
end;

function TDM.GetConnection(ConnString: String): TADOConnection;
begin
  Result := TADOConnection.Create(nil);
  Result.ConnectionTimeout := 1;
  Result.LoginPrompt := False;
  Result.ConnectionString := ConnString;
  Result.Connected := True;
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

procedure TDM.SetSQLConsts;
begin
  SQL1 := 'select Id as ServerId, ServerName, RemoteServer As ServerAddr, Actual ' +
          'from [Servers] where Actual = 1 order by Id';
  SQL2 := 'select Id, ProjectName, [Database], ServerId ' +
          'from Projects';
  SQL3 := 'select ServerName, RemoteServer as ServerAddr, ProjectName, [Database] ' +
          'from Projects p ' +
          'inner join	[Servers] s on p.ServerId = s.Id ' +
          'where s.Actual = 1 and p.ToUpdate = 1' +
          'order by	s.Id, p.[Database]';
  SQL4 := 'select ServerName, RemoteServer as ServerAddr, ProjectName, [Database], [Text] as SQLScript, Applyed ' +
          'from ScriptApplying sa ' +
          'inner join SQLScripts sc on sa.ScriptId = sc.Id ' +
          'inner join Projects p on sa.ProjectId = p.Id ' +
          'inner join [Servers] s on p.ServerId = s.Id ' +
          'where s.Actual = 1 and p.ToUpdate = 1 and sa.Applyed = 0' +
          'order by [Date]';
  SQL5 := 'select Id, ProjectName, [Database] ' +
          'from Projects';
end;

procedure TDM.UpdateRecord(Records: TADOQuery; FieldName: String;
  Value: Variant);
begin
  Records.Edit;
  Records.FieldByName(FieldName).Value := Value;
  Records.Post;
end;

end.
