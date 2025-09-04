@echo off
REM Enhanced PIC12F508 Build Script
REM Builds the robustness-enhanced version with watchdog timer integration
REM Matrix Team compatible with modern code structure

echo Building Enhanced PIC12F508 PICfix Firmware...
echo Features: Watchdog Timer, Glitch Filtering, Multi-stage Error Detection
echo.

REM Set paths (adjust these to your XC8 v3.00 installation)
set XC8_PATH=C:\Program Files\Microchip\xc8\v3.00\bin
set PROJECT_DIR=%~dp0

REM Check if XC8 v3.00 is available
if not exist "%XC8_PATH%\xc8-cc.exe" (
    echo ERROR: XC8 v3.00 compiler not found at %XC8_PATH%
    echo Please install MPLAB XC8 v3.00 or adjust the path in this script
    pause
    exit /b 1
)

REM Create output directory
if not exist "%PROJECT_DIR%build" mkdir "%PROJECT_DIR%build"

echo Compiling with XC8 v3.00...
echo.

REM Minimal compile command for XC8 v3.00
"%XC8_PATH%\xc8-cc.exe" -mcpu=12F508 "%PROJECT_DIR%picfix_508.c" "%PROJECT_DIR%picfix_core.c" -o "%PROJECT_DIR%build\picfix_508.hex"

if %ERRORLEVEL% equ 0 (
    echo Converting to HEX format...
    if exist "%PROJECT_DIR%build\picfix_508.hex" (
        echo HEX file generated successfully!
    ) else (
        echo Looking for generated files...
        dir "%PROJECT_DIR%build" /b
    )
)

if %ERRORLEVEL% neq 0 (
    echo.
    echo ERROR: Compilation failed!
    echo.
    echo If you get compiler errors, try these alternatives:
    echo 1. Use HI-TECH PICC Lite compiler instead
    echo 2. Use MPASM assembler with converted assembly code
    echo 3. Check XC8 free mode limitations
    pause
    exit /b 1
)

echo.
echo Enhanced PIC12F508 firmware built successfully!
echo.
echo Output files:
echo   HEX: build\picfix_508.hex
echo   COF: build\picfix_508.cof
echo.
echo Enhanced Features Include:
echo   ✓ Watchdog Timer Integration (18ms timeout)
echo   ✓ Multi-stage Error Detection
echo   ✓ Glitch Filtering (2-of-3 voting)
echo   ✓ Enhanced Breathing LED Effect
echo   ✓ Matrix Team Compatible Timing
echo   ✓ Robust Error Recovery
echo.
echo Ready for programming with PICkit or similar programmer.
echo.
pause
