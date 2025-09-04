# PICfix PIC12F508 Firmware

## Overview
This directory contains the PIC12F508 firmware implementation that maintains compatibility with the original Matrix Team design while using modern code structure.

## Features
- **Matrix Team Compatible**: Same pin assignments and timing as original
- **Simple LED Indication**: Basic on/off LED status
- **Robust Error Detection**: Multi-stage verification system
- **Watchdog Protection**: Built-in safety features
- **Low Cost**: Uses inexpensive PIC12F508 microcontroller

## Pin Configuration
| Pin | Function | Description |
|-----|----------|-------------|
| GP0 (Pin 7) | LED Output | Simple on/off status indication |
| GP1 (Pin 6) | Reset Control | NPN transistor base drive |
| GP3 (Pin 4) | Signal Monitor | /INT_1869 line monitoring (/MCLR pin) |

## Files
- `picfix_508.c` - PIC12F508 hardware implementation
- `picfix_core.c` - Shared core algorithm 
- `picfix_common.h` - Common definitions
- `build.bat` - Build script (Note: requires special compiler)
- `original_MFIX_H8.HEX` - Original Matrix Team firmware

## Build Notes
⚠️ **Important**: PIC12F508 is a baseline PIC that has limited C compiler support. Modern XC8 does not support PIC12F508 for C compilation.

### Options for PIC12F508:
1. **Assembly Programming**: Write firmware in assembly language
2. **Legacy Compiler**: Use HI-TECH PICC (discontinued)
3. **Upgrade Recommendation**: Use PIC12F1572 for full C development support

## Timing Specifications
- **Startup Delay**: 2000ms with LED flashing
- **Error Timeout**: 2000ms signal monitoring
- **Clock Speed**: 4MHz internal RC oscillator

## Status Indicators
| LED Pattern | System State | Description |
|-------------|--------------|-------------|
| Rapid Flash (2s) | Startup | System initialization |
| Solid ON | Monitoring | Normal operation |
| Solid ON | Error | Reset triggered |

## Installation
Same as original Matrix Team installation:
1. Program PIC12F508 with firmware
2. Install with 1.5kΩ resistor (2kΩ for V9 consoles)
3. Connect according to PS2 version diagrams

## Advantages
- **Drop-in Replacement**: Compatible with existing Matrix installations
- **Proven Reliability**: Based on 20+ years of successful operation
- **Low Cost**: Minimal component cost
- **Simple Design**: Easy to understand and modify

## Limitations
- **Basic LED**: No PWM breathing effects
- **Limited Memory**: 512 words program space
- **No Interrupts**: Polling-based timing
- **Assembly Required**: C compilation not supported by modern tools

## Recommendation
For new designs, consider the **PIC12F1572 Enhanced Version** which offers:
- Full XC8 compiler support
- Enhanced features (PWM breathing LED)
- Better development tools
- Same core protection functionality
