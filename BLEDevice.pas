unit BLEDevice;

interface

uses
  System.SysUtils, System.Classes;

type
  TBLEDevice = class
  private
    FName: string;
    FAddress: string;
    FRSSI: Integer;
    FLastSeen: TDateTime;
  public
    constructor Create(const AName, AAddress: string; ARSSI: Integer);
    
    property Name: string read FName write FName;
    property Address: string read FAddress write FAddress;
    property RSSI: Integer read FRSSI write FRSSI;
    property LastSeen: TDateTime read FLastSeen write FLastSeen;
    
    function ToString: string; override;
  end;

implementation

constructor TBLEDevice.Create(const AName, AAddress: string; ARSSI: Integer);
begin
  inherited Create;
  FName := AName;
  FAddress := AAddress;
  FRSSI := ARSSI;
  FLastSeen := Now;
end;

function TBLEDevice.ToString: string;
begin
  Result := Format('Name: %s, Address: %s, RSSI: %d dBm', [FName, FAddress, FRSSI]);
end;

end.
