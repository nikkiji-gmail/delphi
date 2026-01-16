# Quick Reference - BLE Scanner

## 빠른 시작

### 실행
```bash
# Delphi IDE에서
1. BLEScannerApp.dproj 열기
2. F9 눌러 실행

# 명령줄에서
build.bat
```

### 기본 작업
- **스캔 시작**: F5 또는 "스캔 시작" 버튼
- **스캔 중지**: F6 또는 "스캔 중지" 버튼
- **목록 지우기**: F7 또는 "목록 지우기" 버튼

## 프로젝트 파일

| 파일 | 설명 |
|------|------|
| `BLEScannerApp.dpr` | 메인 프로그램 |
| `BLEScannerApp.dproj` | 프로젝트 설정 |
| `MainForm.pas/.dfm` | 메인 UI 폼 |
| `BLEDevice.pas` | 기기 데이터 클래스 |
| `BLEManager.pas` | BLE 관리자 |
| `BLEScanner.pas` | 스캔 컴포넌트 |

## 주요 클래스

### TBLEDevice
```pascal
TBLEDevice.Create(Name, Address, RSSI)
// 속성: Name, Address, RSSI, LastSeen
```

### TBLEManager
```pascal
manager.StartScan();      // 스캔 시작
manager.StopScan();       // 스캔 중지
manager.ClearDevices();   // 목록 초기화
```

### TBLEScanner
```pascal
scanner.StartScanning();  // 검색 시작
scanner.StopScanning();   // 검색 중지
scanner.IsScanning();     // 상태 확인
```

## 이벤트

```pascal
// 기기 발견 시
OnDeviceFound(Sender, Device: TBLEDevice)

// 상태 변경 시
OnScanStatus(Sender, Status: string)
```

## 빌드 구성

### Debug (개발용)
- 디버그 정보 포함
- 최적화 비활성화
- 경로: `Win32/Debug/` 또는 `Win64/Debug/`

### Release (배포용)
- 디버그 정보 제외
- 최적화 활성화
- 경로: `Win32/Release/` 또는 `Win64/Release/`

## 시스템 요구사항

| 항목 | 요구사항 |
|------|----------|
| OS | Windows 11 (64-bit 권장) |
| IDE | Delphi 13+ |
| Hardware | Bluetooth LE 지원 어댑터 |
| Runtime | .NET Framework 4.8+ |

## 문제 해결

### 컴파일 오류
```pascal
// WinRT 유닛 확인
uses
  Winapi.Windows, 
  Winapi.WinRT, 
  System.Win.WinRT;
```

### 런타임 오류
1. Bluetooth 서비스 확인
2. 어댑터 활성화 확인
3. 관리자 권한으로 실행

## 키보드 단축키

| 키 | 기능 |
|----|------|
| F9 | 실행 (IDE) |
| Shift+F9 | 빌드 (IDE) |
| Ctrl+F9 | 컴파일 (IDE) |

## 디렉토리 구조

```
delphi/
├── BLEScannerApp.dpr      # 메인 프로그램
├── BLEScannerApp.dproj    # 프로젝트 파일
├── MainForm.pas/dfm       # UI 폼
├── BLEDevice.pas          # 데이터 모델
├── BLEManager.pas         # BLE 관리
├── BLEScanner.pas         # 스캔 로직
├── build.bat              # 빌드 스크립트
├── README.md              # 메인 문서
├── ARCHITECTURE.md        # 아키텍처
├── USER_GUIDE.md          # 사용 가이드
└── QUICK_REFERENCE.md     # 이 파일
```

## API 참조

### WinRT 네임스페이스
- `Windows.Devices.Bluetooth`
- `Windows.Devices.Bluetooth.Advertisement`
- `Windows.Devices.Enumeration`

### Delphi 유닛
- `System.Win.WinRT`
- `Winapi.WinRT`
- `System.Threading`

## 개발 팁

1. **스레드 안전**: UI 업데이트 시 `TThread.Synchronize` 사용
2. **메모리 관리**: `TObjectList` 사용으로 자동 해제
3. **예외 처리**: Try-Except로 안정성 확보
4. **이벤트 핸들러**: 항목 할당 전 Assigned() 체크

## 링크

- [README.md](README.md) - 전체 문서
- [ARCHITECTURE.md](ARCHITECTURE.md) - 아키텍처 상세
- [USER_GUIDE.md](USER_GUIDE.md) - 사용자 가이드
- [Embarcadero Delphi](https://www.embarcadero.com/products/delphi)
- [Windows BLE Docs](https://docs.microsoft.com/windows/uwp/devices-sensors/bluetooth-low-energy-overview)
