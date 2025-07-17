# PIC12F1572 Upgrade Notes

## Overview
This branch (`feature/picfix-v8-v12-pic12f1572`) contains modifications to use the PIC12F1572 microcontroller instead of the original PIC12F508.

## Motivation
- PIC12F508 not available in SOIP package on hand
- PIC12F1572 is available and provides enhanced features
- Pin-compatible upgrade path

## Key Differences

### PIC12F508 (Original)
- 512 words Flash memory
- 25 bytes SRAM  
- Baseline PIC architecture
- 8-pin DIP/SOIC package
- Basic I/O functionality

### PIC12F1572 (Upgrade)
- 2048 words Flash memory
- 128 bytes SRAM
- Enhanced baseline PIC architecture  
- 8-pin DIP/SOIC package (pin compatible)
- Enhanced features:
  - EUSART (Enhanced Universal Synchronous Asynchronous Receiver Transmitter)
  - PWM capability
  - Enhanced ADC
  - More timers
  - Enhanced instruction set

## Pin Compatibility
Both microcontrollers use the same 8-pin DIP package with identical pinouts for basic I/O functions:
- Pin 1: VDD (Power)
- Pin 2: GP5 (I/O)
- Pin 3: GP4 (I/O) 
- Pin 4: GP3/MCLR (I/O/Reset)
- Pin 5: GP2 (I/O)
- Pin 6: GP1 (I/O)
- Pin 7: GP0 (I/O)
- Pin 8: VSS (Ground)

## Changes Made
1. Updated KiCad schematic symbol from `PIC12F508-xP` to `PIC12F1572-xP`
2. Updated component value and description
3. Updated datasheet reference
4. Maintained same footprint (`Package_DIP:DIP-8_W7.62mm`)

## Firmware Considerations
The firmware will need to be updated to take advantage of the PIC12F1572's enhanced features and instruction set. The basic I/O functionality should remain compatible.

## Files Modified
- `pcb/PICfix_v8-v12_Update/PICfix_v8-v12_Update.kicad_sch`

## Datasheet References
- PIC12F508: https://ww1.microchip.com/downloads/en/DeviceDoc/41236E.pdf
- PIC12F1572: https://ww1.microchip.com/downloads/en/DeviceDoc/40001723D.pdf
