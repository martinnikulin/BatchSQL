unit CatalogScanerUnit;

interface
uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, System.TypInfo,
  DMUnit, ServerUnit;

type
  TCatalogScaner = class

  private
    Servers: TADOQuery;
    LocalProjects: TADOQuery;
    RemoteProjects: TADOQuery;
    procedure ProcessServer(Server: TServer);
    procedure DeleteProjects(ServerId: Integer);
    procedure AddProjects(ServerId: Integer);
  public
    procedure SyncProjectTable;
  end;

implementation

{ TCatalogScaner }


procedure TCatalogScaner.SyncProjectTable;
var
  Server: TServer;
begin
  Servers := DM.GetServers();
  if not Servers.Eof then begin
    Servers.First;
    while not Servers.Eof do begin
      Server := DM.GetServer(Servers);
      ProcessServer(Server);
      Servers.Next;
    end;
    Servers.First;
  end;
  DM.Projects.Requery();
end;

procedure TCatalogScaner.ProcessServer(Server: TServer);
begin
  with Server do begin
    LocalProjects := DM.GetProjects(ServerId);
    //RemoteProjects := DM.GetRemoteProjects(ServerAddr);
    if not (RemoteProjects = nil) then begin
      DeleteProjects(ServerId);
      AddProjects(ServerId);
      RemoteProjects.Close;
    end;
  end;
end;

procedure TCatalogScaner.DeleteProjects(ServerId: Integer);
begin
  if not LocalProjects.Eof then LocalProjects.First;
  while not LocalProjects.Eof do begin
    if not RemoteProjects.Locate('Database', LocalProjects.FieldByName('Database').AsString, []) then
    begin
      LocalProjects.Edit;
      LocalProjects.Delete;
    end;
    LocalProjects.Next;
  end;
end;

procedure TCatalogScaner.AddProjects(ServerId: Integer);
begin
  if not RemoteProjects.Eof then RemoteProjects.First;
  while not RemoteProjects.Eof do begin
    if not LocalProjects.Locate('Database', RemoteProjects.FieldByName('Database').AsString, []) then begin
      LocalProjects.Edit;
      LocalProjects.Insert;
      LocalProjects.FieldByName('ProjectName').AsString := RemoteProjects.FieldByName('ProjectName').AsString;
      LocalProjects.FieldByName('Database').AsString := RemoteProjects.FieldByName('Database').AsString;
      LocalProjects.FieldByName('ServerId').AsInteger := ServerId;
      try
        LocalProjects.Post;
      except
        LocalProjects.Cancel;
      end;
    end;
    RemoteProjects.Next;
  end;
  RemoteProjects.Close;
end;

end.
