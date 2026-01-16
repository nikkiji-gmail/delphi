# Changelog

All notable changes to the BLE Scanner project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-01-16

### Added
- Initial release of Windows 11 BLE Scanner
- BLE device discovery using WinRT API
- Real-time device information display (Name, MAC Address, RSSI)
- ListView-based device list with 4 columns
- Start/Stop scan functionality
- Clear device list functionality
- Status label for scan progress
- Korean language UI
- Comprehensive documentation
  - README.md with installation and usage instructions
  - ARCHITECTURE.md with system design
  - USER_GUIDE.md with detailed user instructions
  - QUICK_REFERENCE.md for quick lookups
- Build script (build.bat) for command-line compilation
- Proper .gitignore for Delphi projects

### Core Components
- `TBLEDevice` - Data class for BLE device information
- `TBLEManager` - BLE scanning and device management
- `TBLEScanner` - Scanner component with event handling
- `TFormMain` - Main UI form with ListView and controls

### Technical Features
- Multi-threaded scanning using TTask
- Thread-safe UI updates with TThread.Synchronize
- Event-driven architecture
- WinRT API integration
- VCL-based user interface
- Delphi 13 compatibility
- Windows 11 optimized

### Documentation
- Complete README with setup instructions
- Architecture documentation with diagrams
- User guide with troubleshooting
- Quick reference guide
- Build scripts

## [Unreleased]

### Planned Features
- [ ] Real WinRT BluetoothLEAdvertisementWatcher implementation
- [ ] BLE device connection capability
- [ ] GATT service and characteristic read/write
- [ ] Device filtering and search options
- [ ] Save and load scan results
- [ ] Multi-language support (English, Korean)
- [ ] Advanced logging functionality
- [ ] Device pairing support
- [ ] Export results to CSV/JSON
- [ ] Auto-refresh option
- [ ] Signal strength visualization
- [ ] Device categorization

### Known Issues
- Current version uses simulated BLE scanning for demonstration
- Real WinRT API integration pending
- No device connection support yet
- No GATT profile exploration yet

### Notes
- Tested on Windows 11 with Delphi 13
- Requires Bluetooth LE capable hardware
- Demo version generates sample devices for testing
