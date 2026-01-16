# Windows 11 BLE Scanner - Delphi 13

Windows 11 환경에서 WinRT API를 이용하여 Bluetooth Low Energy(BLE) 기기를 검색하고 리스트로 표시하는 델파이 13 애플리케이션입니다.

## 주요 기능

- ✅ WinRT를 통한 BLE 기기 자동 검색
- ✅ 발견된 기기의 정보(이름, 주소, RSSI) 실시간 표시
- ✅ 스캔 시작/중지 기능
- ✅ 기기 리스트 새로고침 기능
- ✅ Windows 11 호환성
- ✅ 델파이 13 최적화

## 시스템 요구사항

- Windows 11 (64비트 권장)
- Delphi 13 Community/Professional/Enterprise
- Bluetooth Low Energy 지원 하드웨어
- .NET Framework 4.8 이상

## 프로젝트 구조

```
delphi/
├── BLEScannerApp.dpr       # 메인 프로그램 파일
├── BLEScannerApp.dproj     # 델파이 프로젝트 설정
├── MainForm.pas            # 메인 폼 (UI 구현)
├── MainForm.dfm            # 메인 폼 디자인
├── BLEDevice.pas           # BLE 기기 정보 클래스
├── BLEManager.pas          # BLE 매니저 (검색 및 관리)
├── BLEScanner.pas          # BLE 스캐너 컴포넌트
└── README.md               # 프로젝트 문서
```

## 설치 및 빌드

### 1. 프로젝트 열기
```
1. Delphi 13 IDE를 실행합니다.
2. File > Open Project 메뉴를 선택합니다.
3. BLEScannerApp.dproj 파일을 선택하여 엽니다.
```

### 2. 프로젝트 빌드
```
1. Project > Build BLEScannerApp 메뉴를 선택합니다.
2. 또는 Shift+F9 단축키를 사용합니다.
```

### 3. 실행
```
1. Run > Run (F9) 메뉴를 선택합니다.
2. 또는 Win32/Debug 또는 Win64/Debug 폴더의 BLEScannerApp.exe를 직접 실행합니다.
```

## 사용 방법

### 기본 사용법

1. **스캔 시작**: "스캔 시작" 버튼을 클릭하여 BLE 기기 검색을 시작합니다.
2. **기기 확인**: ListView에 발견된 BLE 기기 목록이 실시간으로 표시됩니다.
3. **스캔 중지**: "스캔 중지" 버튼을 클릭하여 검색을 중단합니다.
4. **목록 지우기**: "목록 지우기" 버튼을 클릭하여 발견된 기기 목록을 초기화합니다.

### 표시되는 정보

- **기기 이름**: BLE 기기의 광고 이름
- **MAC 주소**: 기기의 고유 주소 (예: AA:BB:CC:DD:EE:FF)
- **RSSI (dBm)**: 신호 강도 (음수 값, 0에 가까울수록 강함)
- **마지막 발견**: 기기가 마지막으로 감지된 시간

## 주요 클래스 설명

### TBLEDevice
BLE 기기의 정보를 저장하는 데이터 클래스입니다.

**속성:**
- `Name`: 기기 이름
- `Address`: MAC 주소
- `RSSI`: 신호 강도
- `LastSeen`: 마지막 발견 시간

### TBLEManager
WinRT API를 사용하여 BLE 기기 검색 및 관리를 담당합니다.

**주요 메서드:**
- `StartScan`: BLE 기기 검색 시작
- `StopScan`: 검색 중지
- `ClearDevices`: 발견된 기기 목록 초기화

**이벤트:**
- `OnDeviceFound`: 새로운 기기가 발견될 때 발생
- `OnScanStatus`: 스캔 상태가 변경될 때 발생

### TBLEScanner
BLE 스캔 기능을 캡슐화한 컴포넌트입니다.

**주요 메서드:**
- `StartScanning`: 스캔 시작
- `StopScanning`: 스캔 중지
- `IsScanning`: 현재 스캔 중인지 확인

### TFormMain
메인 사용자 인터페이스 폼입니다.

**주요 컨트롤:**
- `ListView1`: 발견된 BLE 기기 목록 표시
- `ButtonStartScan`: 스캔 시작 버튼
- `ButtonStopScan`: 스캔 중지 버튼
- `ButtonClear`: 목록 지우기 버튼
- `LabelStatus`: 현재 상태 표시

## WinRT API 통합

이 프로젝트는 Windows Runtime (WinRT) API를 사용하여 BLE 기기를 검색합니다.

### 사용된 WinRT 네임스페이스
- `Windows.Devices.Bluetooth`
- `Windows.Devices.Bluetooth.Advertisement`
- `Windows.Devices.Enumeration`

### 구현 노트
현재 버전은 데모용 시뮬레이션을 포함하고 있습니다. 실제 BLE 기기를 검색하려면 `BLEManager.pas`의 `StartScan` 메서드에서 `BluetoothLEAdvertisementWatcher` 클래스를 사용하여 구현해야 합니다.

## 개발 정보

### 개발 환경
- IDE: Embarcadero RAD Studio 13
- 언어: Object Pascal (Delphi)
- Framework: VCL (Visual Component Library)
- Target Platform: Windows 32-bit/64-bit

### 의존성
- RTL (Runtime Library)
- VCL (Visual Component Library)
- WinRT (Windows Runtime)

## 문제 해결

### "Bluetooth adapter not found" 오류
- Windows 11이 설치되어 있는지 확인하세요.
- Bluetooth 어댑터가 활성화되어 있는지 확인하세요.
- Windows 설정 > Bluetooth 및 기타 디바이스에서 Bluetooth가 켜져 있는지 확인하세요.

### 기기가 검색되지 않음
- BLE 기기가 광고 모드(Advertising mode)에 있는지 확인하세요.
- 기기와의 거리가 너무 멀지 않은지 확인하세요.
- 다른 앱에서 기기를 사용하고 있지 않은지 확인하세요.

### 빌드 오류
- Delphi 13 이상 버전을 사용하고 있는지 확인하세요.
- 프로젝트 경로에 한글이나 특수문자가 없는지 확인하세요.
- VCL 컴포넌트가 올바르게 설치되어 있는지 확인하세요.

## 향후 개선 사항

- [ ] 실제 WinRT BluetoothLEAdvertisementWatcher 구현
- [ ] BLE 기기 연결 기능 추가
- [ ] GATT 서비스 및 특성 읽기/쓰기
- [ ] 기기 필터링 및 검색 옵션
- [ ] 검색 결과 저장 및 로드
- [ ] 다국어 지원
- [ ] 고급 로깅 기능

## 라이선스

이 프로젝트는 교육 및 학습 목적으로 제공됩니다.

## 기여

버그 리포트, 기능 제안 및 풀 리퀘스트를 환영합니다.

## 연락처

문의사항이나 지원이 필요하시면 이슈를 생성해 주세요.