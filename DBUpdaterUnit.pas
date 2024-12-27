unit DBUpdaterUnit;

interface
uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.TypInfo,
  DMUnit, ProjectUnit, MessengerUnit;

type
  TDBUpdater = class
    private
    public
      procedure ProcessServers(Script: TStrings);
      procedure ProcessScripts();
    published
  end;

implementation

{ TDBUpdater }


procedure TDBUpdater.ProcessServers(Script: TStrings);
var
  Conn: TADOConnection;
  Records: TADOQuery;
  Project: TProject;
begin
//  try try
    //Records := DM.GetProcessServersRecords;
    while not Records.Eof do begin
      //Project := DM.GetProject(Records);
      with Project do begin
          //Conn := DM.GetConnection(ServerAddr, Database);
          DM.ExecSQL(Conn, Script);
          Messenger.SendMessage(ServerName + ': ' + Database);
      end;
      Conn.Connected := False;
      Conn.Free;
      Records.Next;
    end;
//  except
//
//  end;
//  finally
//
//  end;
end;

procedure TDBUpdater.ProcessScripts;
var
  Conn: TADOConnection;
  Records: TADOQuery;
  Project: TProject;
begin
//  Records := DM.GetProcessScriptsRecords;
  while not Records.Eof do begin
    //Project := DM.GetProject(Records);
    try
      //Conn := DM.GetConnection(Project.ServerAddr, Project.Database);
      //DM.ExecSQL(Conn, Records.FieldbyName('SQLScript').AsString);
      Messenger.SendMessage(Project.ServerName + ': ' + Project.Database);
      DM.UpdateRecord(Records, 'Applyed', True);
    except
      on e: Exception do
        Messenger.SendMessage(E.Message +
              '. Не удалось подключиться к базе данных ' +
              Project.ServerAddr + '. ' + Project.Database);
    end;
    Conn.Connected := False;
    Conn.Free;
    Records.Next;
  end;
end;

end.
