# BLE Scanner Architecture

## Component Hierarchy

```
BLEScannerApp (Application)
    │
    └── TFormMain (Main Form)
            │
            ├── TListView (Device List Display)
            │   ├── Column: 기기 이름
            │   ├── Column: MAC 주소
            │   ├── Column: RSSI (dBm)
            │   └── Column: 마지막 발견
            │
            ├── TButton (스캔 시작)
            ├── TButton (스캔 중지)
            ├── TButton (목록 지우기)
            └── TLabel (Status Display)
```

## Class Diagram

```
┌─────────────────────┐
│   TBLEDevice        │
├─────────────────────┤
│ - Name: string      │
│ - Address: string   │
│ - RSSI: Integer     │
│ - LastSeen: TDateTime│
└─────────────────────┘
          ▲
          │ uses
          │
┌─────────────────────┐
│   TBLEManager       │
├─────────────────────┤
│ - FDevices: TList   │
│ - FScanning: Boolean│
├─────────────────────┤
│ + StartScan()       │
│ + StopScan()        │
│ + ClearDevices()    │
└─────────────────────┘
          ▲
          │ uses
          │
┌─────────────────────┐
│   TBLEScanner       │
├─────────────────────┤
│ - FBLEManager       │
│ - FMode: TScanMode  │
├─────────────────────┤
│ + StartScanning()   │
│ + StopScanning()    │
│ + IsScanning()      │
└─────────────────────┘
          ▲
          │ uses
          │
┌─────────────────────┐
│   TFormMain         │
├─────────────────────┤
│ - FBLEScanner       │
│ - ListView1         │
│ - Buttons...        │
├─────────────────────┤
│ + OnDeviceFound()   │
│ + OnScanStatus()    │
└─────────────────────┘
```

## Event Flow

1. User clicks "스캔 시작" button
   → ButtonStartScanClick()
   → FBLEScanner.StartScanning()
   → FBLEManager.StartScan()
   → Background thread starts scanning

2. Device found
   → TBLEManager.OnDeviceFound event
   → TBLEScanner.HandleDeviceFound()
   → TFormMain.OnDeviceFound()
   → AddDeviceToList()
   → ListView updated

3. Status changed
   → TBLEManager.OnScanStatus event
   → TBLEScanner.HandleScanStatus()
   → TFormMain.OnScanStatus()
   → LabelStatus updated

## WinRT Integration Points

The application uses Windows Runtime APIs for BLE functionality:

- **Windows.Devices.Bluetooth.Advertisement**
  - BluetoothLEAdvertisementWatcher
  - BluetoothLEAdvertisement
  
- **Windows.Devices.Bluetooth**
  - BluetoothLEDevice
  - BluetoothSignalStrengthFilter

- **Windows.Devices.Enumeration**
  - DeviceInformation
  - DeviceWatcher

## Threading Model

- **Main Thread**: UI updates, event handlers
- **Background Thread**: BLE scanning via TTask
- **Synchronization**: TThread.Synchronize for UI updates

## State Machine

```
     ┌─────┐
     │IDLE │◄────────┐
     └──┬──┘         │
        │ StartScan  │
        ▼            │ StopScan
   ┌─────────┐       │
   │SCANNING │───────┘
   └─────────┘
        │
        │ Complete
        ▼
     ┌─────┐
     │IDLE │
     └─────┘
```
