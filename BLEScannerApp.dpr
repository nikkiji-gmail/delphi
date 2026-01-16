program BLEScannerApp;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {FormMain},
  BLEDevice in 'BLEDevice.pas',
  BLEManager in 'BLEManager.pas',
  BLEScanner in 'BLEScanner.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
