unit BLEScanner;

interface

uses
  System.SysUtils, System.Classes, Winapi.Windows, Winapi.WinRT,
  BLEDevice, BLEManager;

type
  TBLEScannerMode = (smIdle, smScanning, smStopping);

  TBLEScanner = class(TComponent)
  private
    FBLEManager: TBLEManager;
    FMode: TBLEScannerMode;
    FOnDeviceFound: TDeviceFoundEvent;
    FOnScanStatus: TScanStatusEvent;
    
    procedure HandleDeviceFound(Sender: TObject; Device: TBLEDevice);
    procedure HandleScanStatus(Sender: TObject; const Status: string);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    
    procedure StartScanning;
    procedure StopScanning;
    procedure ClearDeviceList;
    
    function IsScanning: Boolean;
    function GetDeviceCount: Integer;
    function GetDeviceInfo(Index: Integer): TBLEDevice;
    
    property Mode: TBLEScannerMode read FMode;
    property OnDeviceFound: TDeviceFoundEvent read FOnDeviceFound write FOnDeviceFound;
    property OnScanStatus: TScanStatusEvent read FOnScanStatus write FOnScanStatus;
  end;

implementation

constructor TBLEScanner.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBLEManager := TBLEManager.Create;
  FBLEManager.OnDeviceFound := HandleDeviceFound;
  FBLEManager.OnScanStatus := HandleScanStatus;
  FMode := smIdle;
end;

destructor TBLEScanner.Destroy;
begin
  FBLEManager.Free;
  inherited;
end;

procedure TBLEScanner.HandleDeviceFound(Sender: TObject; Device: TBLEDevice);
begin
  if Assigned(FOnDeviceFound) then
    FOnDeviceFound(Self, Device);
end;

procedure TBLEScanner.HandleScanStatus(Sender: TObject; const Status: string);
begin
  if Assigned(FOnScanStatus) then
    FOnScanStatus(Self, Status);
end;

procedure TBLEScanner.StartScanning;
begin
  if FMode <> smIdle then
    Exit;
    
  FMode := smScanning;
  FBLEManager.StartScan;
end;

procedure TBLEScanner.StopScanning;
begin
  if FMode = smScanning then
  begin
    FMode := smStopping;
    FBLEManager.StopScan;
    FMode := smIdle;
  end;
end;

procedure TBLEScanner.ClearDeviceList;
begin
  FBLEManager.ClearDevices;
end;

function TBLEScanner.IsScanning: Boolean;
begin
  Result := (FMode = smScanning);
end;

function TBLEScanner.GetDeviceCount: Integer;
begin
  Result := FBLEManager.GetDeviceCount;
end;

function TBLEScanner.GetDeviceInfo(Index: Integer): TBLEDevice;
begin
  Result := FBLEManager.GetDevice(Index);
end;

end.
