@echo off
REM Simple PIC12F508 Build Script for Testing
REM Uses basic XC8 syntax that should work

echo Building PIC12F508 PICfix Firmware for Testing...
echo.

REM Set paths
set XC8_PATH=C:\Program Files\Microchip\xc8\v3.00\bin
set PROJECT_DIR=%~dp0

REM Check if XC8 is available
if not exist "%XC8_PATH%\xc8-cc.exe" (
    echo ERROR: XC8 compiler not found at %XC8_PATH%
    echo Please install MPLAB XC8 or adjust the path in this script
    pause
    exit /b 1
)

REM Create output directory
if not exist "%PROJECT_DIR%build" mkdir "%PROJECT_DIR%build"

echo Compiling with XC8 v3.00...
echo.

REM Simple compilation command for PIC12F508
"%XC8_PATH%\xc8-cc.exe" ^
    -mcpu=12F508 ^
    -c ^
    "%PROJECT_DIR%picfix_508.c" ^
    "%PROJECT_DIR%picfix_core.c" ^
    -o "%PROJECT_DIR%build\picfix_508.p1"

if %ERRORLEVEL% neq 0 (
    echo.
    echo ERROR: Compilation failed!
    pause
    exit /b 1
)

REM Link and generate HEX
echo Linking and generating HEX file...
"%XC8_PATH%\xc8-cc.exe" ^
    -mcpu=12F508 ^
    -Wl,-Map="%PROJECT_DIR%build\picfix_508.map" ^
    -o "%PROJECT_DIR%build\picfix_508.cof" ^
    "%PROJECT_DIR%build\picfix_508.p1" ^
    "%PROJECT_DIR%build\picfix_core.p1"

if %ERRORLEVEL% neq 0 (
    echo.
    echo ERROR: Linking failed!
    pause
    exit /b 1
)

echo.
echo Build completed!
echo.
echo Generated files:
dir "%PROJECT_DIR%build" /b
echo.
echo Look for .hex file for programming the PIC12F508
echo.
pause
