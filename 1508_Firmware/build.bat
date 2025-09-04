@echo off
REM Build script for PICfix PIC12F508 firmware
REM MPASM assembler (part of MPLAB X)

set MPASM_PATH="C:\Program Files\Microchip\MPLABX\v6.25\mpasmx\mpasmx.exe"
set SOURCE=picfix_508.c
set OUTPUT=picfix_508
set CHIP=12F508

echo Building PICfix firmware for PIC12F508...
echo.

REM Note: PIC12F508 requires MPASM assembler, not XC8
REM For C code, we need to use a different approach or write in assembly

echo *** PIC12F508 C COMPILATION NOT DIRECTLY SUPPORTED ***
echo.
echo PIC12F508 is a baseline PIC that typically requires assembly programming.
echo For C compilation, consider using:
echo 1. HI-TECH PICC compiler (legacy)
echo 2. Assembly implementation
echo 3. Upgrade to PIC12F1572 for full XC8 support
echo.
echo Use the PIC12F1572 version for C development!

pause
