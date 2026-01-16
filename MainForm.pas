unit MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  BLEDevice, BLEScanner;

type
  TFormMain = class(TForm)
    ListView1: TListView;
    ButtonStartScan: TButton;
    ButtonStopScan: TButton;
    ButtonClear: TButton;
    LabelStatus: TLabel;
    LabelTitle: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonStartScanClick(Sender: TObject);
    procedure ButtonStopScanClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
  private
    FBLEScanner: TBLEScanner;
    procedure OnDeviceFound(Sender: TObject; Device: TBLEDevice);
    procedure OnScanStatus(Sender: TObject; const Status: string);
    procedure UpdateButtonStates;
    procedure AddDeviceToList(Device: TBLEDevice);
  public
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.FormCreate(Sender: TObject);
begin
  // BLE 스캐너 초기화
  FBLEScanner := TBLEScanner.Create(Self);
  FBLEScanner.OnDeviceFound := OnDeviceFound;
  FBLEScanner.OnScanStatus := OnScanStatus;
  
  // ListView 설정
  ListView1.ViewStyle := vsReport;
  ListView1.Columns.Clear;
  
  with ListView1.Columns.Add do
  begin
    Caption := '기기 이름';
    Width := 200;
  end;
  
  with ListView1.Columns.Add do
  begin
    Caption := 'MAC 주소';
    Width := 150;
  end;
  
  with ListView1.Columns.Add do
  begin
    Caption := 'RSSI (dBm)';
    Width := 100;
  end;
  
  with ListView1.Columns.Add do
  begin
    Caption := '마지막 발견';
    Width := 150;
  end;
  
  UpdateButtonStates;
  LabelStatus.Caption := '준비';
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FBLEScanner.Free;
end;

procedure TFormMain.ButtonStartScanClick(Sender: TObject);
begin
  ListView1.Items.Clear;
  FBLEScanner.StartScanning;
  UpdateButtonStates;
end;

procedure TFormMain.ButtonStopScanClick(Sender: TObject);
begin
  FBLEScanner.StopScanning;
  UpdateButtonStates;
end;

procedure TFormMain.ButtonClearClick(Sender: TObject);
begin
  ListView1.Items.Clear;
  FBLEScanner.ClearDeviceList;
  LabelStatus.Caption := '목록 지워짐';
end;

procedure TFormMain.OnDeviceFound(Sender: TObject; Device: TBLEDevice);
begin
  AddDeviceToList(Device);
end;

procedure TFormMain.OnScanStatus(Sender: TObject; const Status: string);
begin
  LabelStatus.Caption := Status;
  UpdateButtonStates;
end;

procedure TFormMain.UpdateButtonStates;
begin
  ButtonStartScan.Enabled := not FBLEScanner.IsScanning;
  ButtonStopScan.Enabled := FBLEScanner.IsScanning;
  ButtonClear.Enabled := not FBLEScanner.IsScanning;
end;

procedure TFormMain.AddDeviceToList(Device: TBLEDevice);
var
  ListItem: TListItem;
begin
  ListItem := ListView1.Items.Add;
  ListItem.Caption := Device.Name;
  ListItem.SubItems.Add(Device.Address);
  ListItem.SubItems.Add(IntToStr(Device.RSSI));
  ListItem.SubItems.Add(FormatDateTime('hh:nn:ss', Device.LastSeen));
end;

end.
