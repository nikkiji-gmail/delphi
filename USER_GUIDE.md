# BLE Scanner - 사용자 가이드

## 시작하기

### 1. 시스템 준비

#### Windows 11 Bluetooth 설정 확인
1. Windows 설정 열기 (Win + I)
2. Bluetooth 및 기타 디바이스 선택
3. Bluetooth 스위치가 "켜짐"인지 확인

#### Bluetooth 어댑터 상태 확인
PowerShell에서 다음 명령어 실행:
```powershell
Get-PnpDevice -Class Bluetooth
```

정상적으로 동작하는 경우:
```
Status     Class           FriendlyName
------     -----           ------------
OK         Bluetooth       Intel(R) Wireless Bluetooth(R)
```

### 2. 애플리케이션 실행

#### 첫 실행
1. BLEScannerApp.exe를 실행합니다
2. Windows 방화벽 경고가 나타날 수 있습니다 - "액세스 허용"을 클릭
3. 메인 창이 표시됩니다

#### UI 구성요소
- **제목**: "Bluetooth Low Energy 스캐너"
- **스캔 시작 버튼**: BLE 기기 검색 시작
- **스캔 중지 버튼**: 진행 중인 검색 중단
- **목록 지우기 버튼**: 발견된 기기 목록 초기화
- **ListView**: 발견된 BLE 기기 목록 표시
- **상태 레이블**: 현재 스캔 상태 표시

### 3. BLE 기기 검색

#### 스캔 시작
1. "스캔 시작" 버튼 클릭
2. 상태 레이블에 "스캔 시작 중..." 표시
3. "BLE 기기 검색 중..." 메시지로 변경
4. 발견된 기기가 ListView에 추가됨

#### 기기 정보 읽기
ListView의 각 행은 다음 정보를 포함합니다:

| 열 | 설명 | 예시 |
|---|---|---|
| 기기 이름 | BLE 기기의 광고 이름 | "BLE Device 1" |
| MAC 주소 | 기기의 고유 식별자 | "AA:BB:CC:DD:EE:01" |
| RSSI (dBm) | 신호 강도 | "-65" |
| 마지막 발견 | 마지막 감지 시간 | "14:32:15" |

#### RSSI 값 해석
- **-30 dBm ~ -50 dBm**: 매우 강함 (기기가 매우 가까움)
- **-50 dBm ~ -70 dBm**: 강함 (정상 범위)
- **-70 dBm ~ -85 dBm**: 약함 (거리가 멀거나 장애물 있음)
- **-85 dBm 이하**: 매우 약함 (연결이 불안정할 수 있음)

#### 스캔 중지
1. "스캔 중지" 버튼 클릭
2. 진행 중인 검색이 중단됨
3. 발견된 기기는 목록에 유지됨

#### 목록 초기화
1. "목록 지우기" 버튼 클릭
2. ListView의 모든 항목이 제거됨
3. 새로운 스캔을 시작할 수 있음

### 4. 일반적인 BLE 기기

#### 검색 가능한 기기 유형
- **웨어러블**: 스마트워치, 피트니스 밴드
- **스마트 홈**: 온도 센서, 조명, 스마트 플러그
- **헬스케어**: 심박계, 혈압계, 체온계
- **오디오**: 무선 이어폰, 스피커
- **입력 장치**: 키보드, 마우스, 게임패드
- **비콘**: iBeacon, Eddystone

### 5. 문제 해결

#### 기기가 검색되지 않는 경우

**확인 사항:**
1. BLE 기기가 켜져 있고 페어링 모드(광고 모드)인지 확인
2. 기기의 배터리가 충분한지 확인
3. 기기가 이미 다른 장치와 연결되어 있지 않은지 확인
4. Windows Bluetooth 설정에서 해당 기기가 보이는지 확인

**해결 방법:**
1. BLE 기기를 껐다가 다시 켜기
2. Windows Bluetooth를 껐다가 다시 켜기
3. 애플리케이션 재시작
4. PC 재부팅

#### "스캔 시작 중..." 상태에서 멈춤

**원인:**
- Bluetooth 어댑터 드라이버 문제
- Windows Bluetooth 서비스가 실행되지 않음

**해결 방법:**
1. Windows 서비스 확인:
   ```
   services.msc → "Bluetooth Support Service" → 시작
   ```
2. 장치 관리자에서 Bluetooth 어댑터 다시 설치
3. Windows 업데이트 확인

#### 애플리케이션이 시작되지 않음

**확인 사항:**
1. Windows 11인지 확인 (Windows 10에서는 WinRT API가 제한적)
2. .NET Framework 4.8 이상 설치 여부
3. Visual C++ Redistributable 설치 여부

### 6. 고급 사용

#### 로그 확인
애플리케이션 실행 중 상태 레이블의 메시지를 모니터링하여 스캔 진행 상황을 확인할 수 있습니다.

#### 연속 스캔
여러 번 스캔하여 주변의 모든 BLE 기기를 발견할 수 있습니다:
1. 스캔 시작
2. 검색 완료 대기
3. 필요시 "목록 지우기"로 초기화
4. 다시 스캔 시작

#### 기기 식별
- MAC 주소는 각 기기의 고유 식별자입니다
- 같은 기기는 항상 같은 MAC 주소를 가집니다
- 기기 이름은 변경될 수 있습니다

### 7. 제한사항

**현재 버전의 제한사항:**
- ✅ BLE 기기 검색
- ✅ 기기 정보 표시
- ❌ 기기 연결 (향후 업데이트 예정)
- ❌ GATT 서비스 읽기/쓰기 (향후 업데이트 예정)
- ❌ 기기 페어링 (향후 업데이트 예정)

### 8. 보안 고려사항

#### 개인정보
- 애플리케이션은 BLE 기기의 광고 데이터만 읽습니다
- 기기에 연결하거나 데이터를 전송하지 않습니다
- 검색 결과는 로컬에만 저장되며 외부로 전송되지 않습니다

#### 권장사항
- 신뢰할 수 없는 BLE 기기에 연결하지 마세요
- 공공장소에서는 민감한 기기 검색을 피하세요
- 정기적으로 Windows 및 Bluetooth 드라이버를 업데이트하세요

### 9. 추가 리소스

#### 참고 문서
- [Windows Bluetooth Low Energy 개요](https://docs.microsoft.com/windows/uwp/devices-sensors/bluetooth-low-energy-overview)
- [Bluetooth Core Specification](https://www.bluetooth.com/specifications/bluetooth-core-specification/)
- [Delphi WinRT 지원](https://docwiki.embarcadero.com/RADStudio/en/Using_WinRT_API)

#### 커뮤니티
- Delphi 개발자 포럼
- Bluetooth SIG 커뮤니티
- GitHub Issues 페이지

---

**버전**: 1.0.0  
**마지막 업데이트**: 2026-01-16
