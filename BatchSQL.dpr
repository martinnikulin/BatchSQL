program BatchSQL;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  DMUnit in 'DMUnit.pas' {DM: TDataModule},
  MessengerUnit in 'MessengerUnit.pas',
  ServerUnit in 'ServerUnit.pas',
  ProjectUnit in 'ProjectUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
