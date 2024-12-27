unit MessengerUnit;

interface

uses
  System.Classes, System.DateUtils, System.SysUtils;

type
  TMessenger = class
    private
      FMessageText: String;
      FOnMessage: TNotifyEvent;
    protected
      procedure DoMessage; dynamic;
    public
      procedure SendMessage(Text: String);
    published
      property MessageText: String read FMessageText write FMessageText;
      property OnMessage: TNotifyEvent read FOnMessage write FOnMessage;
  end;

var
  Messenger: TMessenger;

implementation

procedure TMessenger.DoMessage;
begin
  if Assigned(FOnMessage) then
    FOnMessage(Self);
end;

procedure TMessenger.SendMessage(Text: String);
begin
  FMessageText := Text;
  DoMessage;
end;

initialization

Messenger := TMessenger.Create;

end.

