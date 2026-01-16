# BLE Scanner - UI Description

## Application Window

The BLE Scanner application features a clean, modern Windows 11-style interface with Korean language support.

### Main Window Layout

```
┌─────────────────────────────────────────────────────────────────┐
│ Windows 11 BLE 기기 검색기                                    [_][□][X]│
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Bluetooth Low Energy 스캐너                                    │
│                                                                 │
│  [스캔 시작]  [스캔 중지]  [목록 지우기]                         │
│                                                                 │
│ ┌───────────────────────────────────────────────────────────┐ │
│ │ 기기 이름      │ MAC 주소           │ RSSI (dBm) │ 마지막 발견 │ │
│ ├───────────────────────────────────────────────────────────┤ │
│ │ BLE Device 1  │ AA:BB:CC:DD:EE:01  │    -65     │ 14:32:15 │ │
│ │ BLE Device 2  │ AA:BB:CC:DD:EE:02  │    -72     │ 14:32:16 │ │
│ │ BLE Device 3  │ AA:BB:CC:DD:EE:03  │    -58     │ 14:32:17 │ │
│ │               │                    │            │          │ │
│ │               │                    │            │          │ │
│ │               │                    │            │          │ │
│ │               │                    │            │          │ │
│ │               │                    │            │          │ │
│ └───────────────────────────────────────────────────────────┘ │
│                                                                 │
│ 상태: 검색 완료 - 3개 기기 발견                                  │
└─────────────────────────────────────────────────────────────────┘
```

### UI Components

#### 1. Title Label
- **Text**: "Bluetooth Low Energy 스캐너"
- **Font**: Segoe UI, 16pt, Bold
- **Color**: Default window text
- **Position**: Top-left, 16px from edges

#### 2. Control Buttons (Left to Right)

**스캔 시작 (Start Scan)**
- Size: 150×33 pixels
- Position: Row below title
- State: Enabled when not scanning
- Shortcut: Can be triggered with F5
- Action: Starts BLE device discovery

**스캔 중지 (Stop Scan)**
- Size: 150×33 pixels
- Position: Next to Start button
- State: Enabled only when scanning
- Shortcut: Can be triggered with F6
- Action: Stops ongoing scan

**목록 지우기 (Clear List)**
- Size: 150×33 pixels
- Position: Next to Stop button
- State: Enabled when not scanning
- Shortcut: Can be triggered with F7
- Action: Clears all devices from list

#### 3. Device List (ListView)

**Columns:**

| Column | Width | Content | Alignment |
|--------|-------|---------|-----------|
| 기기 이름 (Device Name) | 200px | Device's advertised name | Left |
| MAC 주소 (MAC Address) | 150px | Device's unique identifier | Left |
| RSSI (dBm) | 100px | Signal strength | Center |
| 마지막 발견 (Last Seen) | 150px | Time last detected | Left |

**Properties:**
- View Style: Report (Details)
- Grid Lines: Visible
- Row Select: Enabled
- Read Only: Yes
- Sort: None (order of discovery)
- Size: 648×345 pixels
- Position: Below buttons
- Anchors: Left, Top, Right, Bottom (resizable)

**Sample Data:**
```
기기 이름       │ MAC 주소           │ RSSI (dBm) │ 마지막 발견
─────────────────────────────────────────────────────────
BLE Device 1   │ AA:BB:CC:DD:EE:01  │    -65     │ 14:32:15
BLE Device 2   │ AA:BB:CC:DD:EE:02  │    -72     │ 14:32:16
BLE Device 3   │ AA:BB:CC:DD:EE:03  │    -58     │ 14:32:17
```

#### 4. Status Label
- **Position**: Bottom-left, 16px from edges
- **Text Examples**:
  - "준비" (Ready)
  - "스캔 시작 중..." (Starting scan...)
  - "BLE 기기 검색 중..." (Searching for BLE devices...)
  - "검색 완료 - 3개 기기 발견" (Search complete - 3 devices found)
  - "스캔 중지됨" (Scan stopped)
  - "목록 지워짐" (List cleared)
  - "오류: [error message]" (Error: [error message])
- **Anchors**: Left, Bottom (stays at bottom when resizing)

### Window Properties

- **Title**: "Windows 11 BLE 기기 검색기"
- **Size**: 680×480 pixels (default)
- **Minimum Size**: 600×400 pixels
- **Resizable**: Yes
- **Icon**: Default application icon
- **Font**: Segoe UI (Windows 11 standard)
- **Background**: Default window color (clBtnFace)

### Color Scheme

**Normal State:**
- Background: Default Windows 11 window color
- Text: Black (#000000)
- Button: Default Windows 11 button style
- ListView: White background with grid lines

**Hover State:**
- Buttons: Light blue highlight
- ListView rows: Light gray highlight

**Selected State:**
- ListView row: Blue with white text
- Button: Darker when clicked

### Interaction States

#### Idle State
- Start button: **Enabled**
- Stop button: **Disabled** (grayed out)
- Clear button: **Enabled**
- Status: "준비"

#### Scanning State
- Start button: **Disabled**
- Stop button: **Enabled**
- Clear button: **Disabled**
- Status: "BLE 기기 검색 중..."
- ListView: Updating in real-time

#### Completed State
- Start button: **Enabled**
- Stop button: **Disabled**
- Clear button: **Enabled**
- Status: "검색 완료 - X개 기기 발견"

### Visual Feedback

**During Scan:**
- Buttons update to show which actions are available
- Status label updates with progress messages
- New devices appear in ListView immediately
- No progress bar (instant updates via events)

**RSSI Color Coding (Future Enhancement):**
- Strong (-30 to -50): Green
- Medium (-50 to -70): Yellow/Orange
- Weak (-70 to -85): Red
- Very weak (<-85): Dark Red

### Accessibility

- Tab order: Start → Stop → Clear → ListView
- Keyboard navigation supported
- Clear focus indicators
- High contrast compatible
- Screen reader compatible (standard VCL controls)

### Responsive Design

**Window Resizing:**
- Buttons stay at top-left (fixed position)
- ListView expands/shrinks with window
- Status label stays at bottom
- Minimum width maintains button layout

**High DPI Support:**
- Font scaling supported
- Control spacing maintained
- Layout adapts to DPI settings

### Localization

**Current Language:** Korean (한국어)
- UI labels in Korean
- Status messages in Korean
- Error messages in Korean

**Future Languages:**
- English (planned)
- Other languages (as requested)

### Visual Themes

**Follows Windows 11 Design:**
- Rounded corners (where supported)
- Modern button styling
- Segoe UI font family
- Windows 11 color palette
- Native controls (VCL)

---

## UI Mockup States

### State 1: Initial/Ready
```
스캔 시작: ✓   스캔 중지: ✗   목록 지우기: ✓
ListView: Empty
Status: "준비"
```

### State 2: Scanning
```
스캔 시작: ✗   스캔 중지: ✓   목록 지우기: ✗
ListView: Populating...
Status: "BLE 기기 검색 중..."
```

### State 3: Completed
```
스캔 시작: ✓   스캔 중지: ✗   목록 지우기: ✓
ListView: Contains devices
Status: "검색 완료 - 3개 기기 발견"
```

---

**Note**: This is a text-based representation of the UI. The actual application uses native Windows VCL controls for the best Windows 11 experience.
