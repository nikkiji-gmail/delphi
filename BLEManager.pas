unit BLEManager;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections,
  Winapi.Windows, Winapi.WinRT, System.Win.WinRT,
  BLEDevice;

type
  TDeviceFoundEvent = procedure(Sender: TObject; Device: TBLEDevice) of object;
  TScanStatusEvent = procedure(Sender: TObject; const Status: string) of object;

  TBLEManager = class
  private
    FDevices: TObjectList<TBLEDevice>;
    FScanning: Boolean;
    FOnDeviceFound: TDeviceFoundEvent;
    FOnScanStatus: TScanStatusEvent;
    
    procedure NotifyStatus(const Status: string);
  public
    constructor Create;
    destructor Destroy; override;
    
    procedure StartScan;
    procedure StopScan;
    procedure ClearDevices;
    
    function GetDeviceCount: Integer;
    function GetDevice(Index: Integer): TBLEDevice;
    
    property Scanning: Boolean read FScanning;
    property OnDeviceFound: TDeviceFoundEvent read FOnDeviceFound write FOnDeviceFound;
    property OnScanStatus: TScanStatusEvent read FOnScanStatus write FOnScanStatus;
  end;

implementation

uses
  System.Threading;

constructor TBLEManager.Create;
begin
  inherited Create;
  FDevices := TObjectList<TBLEDevice>.Create(True);
  FScanning := False;
end;

destructor TBLEManager.Destroy;
begin
  StopScan;
  FDevices.Free;
  inherited;
end;

procedure TBLEManager.NotifyStatus(const Status: string);
begin
  if Assigned(FOnScanStatus) then
    FOnScanStatus(Self, Status);
end;

procedure TBLEManager.StartScan;
begin
  if FScanning then
    Exit;
    
  FScanning := True;
  ClearDevices;
  NotifyStatus('스캔 시작 중...');
  
  // WinRT API를 사용한 BLE 스캔 시뮬레이션
  // 실제 구현에서는 Windows.Devices.Bluetooth.Advertisement 네임스페이스 사용
  TTask.Run(procedure
  var
    I: Integer;
  begin
    try
      NotifyStatus('BLE 기기 검색 중...');
      
      // 데모용 기기 추가 (실제로는 WinRT BluetoothLEAdvertisementWatcher 사용)
      Sleep(500);
      
      for I := 1 to 3 do
      begin
        if not FScanning then
          Break;
          
        var Device := TBLEDevice.Create(
          Format('BLE Device %d', [I]),
          Format('AA:BB:CC:DD:EE:%0.2X', [I]),
          -50 - Random(50)
        );
        
        TThread.Synchronize(nil, procedure
        begin
          FDevices.Add(Device);
          if Assigned(FOnDeviceFound) then
            FOnDeviceFound(Self, Device);
        end);
        
        Sleep(300);
      end;
      
      TThread.Synchronize(nil, procedure
      begin
        if FScanning then
          NotifyStatus(Format('검색 완료 - %d개 기기 발견', [FDevices.Count]))
        else
          NotifyStatus('스캔 중지됨');
      end);
      
    except
      on E: Exception do
      begin
        TThread.Synchronize(nil, procedure
        begin
          NotifyStatus('오류: ' + E.Message);
        end);
      end;
    end;
  end);
end;

procedure TBLEManager.StopScan;
begin
  if FScanning then
  begin
    FScanning := False;
    NotifyStatus('스캔 중지 중...');
  end;
end;

procedure TBLEManager.ClearDevices;
begin
  FDevices.Clear;
end;

function TBLEManager.GetDeviceCount: Integer;
begin
  Result := FDevices.Count;
end;

function TBLEManager.GetDevice(Index: Integer): TBLEDevice;
begin
  if (Index >= 0) and (Index < FDevices.Count) then
    Result := FDevices[Index]
  else
    Result := nil;
end;

end.
