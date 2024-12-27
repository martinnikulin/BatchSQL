unit ProjectUnit;

interface
uses
  System.SysUtils, System.Classes;

type
  TProject = class
    FServerName: String;
    FServerAddr: String;
    FDatabase: String;
  published
    property ServerName: String read FServerName write FServerName;
    property ServerAddr: String read FServerAddr write FServerAddr;
    property Database: String read FDatabase write FDatabase;
  end;

implementation

end.
