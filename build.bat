@echo off
REM BLE Scanner Build Script for Delphi 13
REM This script builds the BLE Scanner application

echo ========================================
echo  BLE Scanner Build Script
echo ========================================
echo.

REM Check if Delphi is installed
REM Try 64-bit installation path first (Delphi 13 = version 23.0)
set DELPHI_PATH=C:\Program Files\Embarcadero\Studio\23.0
if not exist "%DELPHI_PATH%\bin\dcc32.exe" (
    REM Fall back to 32-bit installation path
    set DELPHI_PATH=C:\Program Files (x86)\Embarcadero\Studio\23.0
)
if not exist "%DELPHI_PATH%\bin\dcc32.exe" (
    REM Try Delphi 11/12 paths as fallback
    set DELPHI_PATH=C:\Program Files\Embarcadero\Studio\22.0
)
if not exist "%DELPHI_PATH%\bin\dcc32.exe" (
    set DELPHI_PATH=C:\Program Files (x86)\Embarcadero\Studio\22.0
)
if not exist "%DELPHI_PATH%\bin\dcc32.exe" (
    echo ERROR: Delphi not found
    echo Please update DELPHI_PATH in this script
    pause
    exit /b 1
)

echo Delphi found at: %DELPHI_PATH%
echo.

REM Set environment variables
set PATH=%DELPHI_PATH%\bin;%PATH%
set BDS=%DELPHI_PATH%

echo Building BLE Scanner (Win32 - Debug)...
echo.

REM Build Win32 Debug
dcc32.exe -B -$D+ -$L+ -$Y+ -$W+ BLEScannerApp.dpr
if errorlevel 1 (
    echo.
    echo ERROR: Build failed!
    pause
    exit /b 1
)

echo.
echo ========================================
echo  Build completed successfully!
echo ========================================
echo.
echo Executable: .\Win32\Debug\BLEScannerApp.exe
echo.

pause
