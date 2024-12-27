unit ServerUnit;

interface
type
  TServer = class
    FServerId: Integer;
    FServerName: String;
    FServerAddr: String;
    FActual: Boolean;
  published
    property ServerId: Integer read FServerId write FServerId;
    property ServerName: String read FServerName write FServerName;
    property ServerAddr: String read FServerAddr write FServerAddr;
    property Actual: Boolean read FActual write FActual;
  end;

implementation

end.
