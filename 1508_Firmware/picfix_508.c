// PIC12F508 PICfix Implementation
#include <xc.h>
#include "picfix_common.h"

// Pin definitions for PIC12F508
#define LED_PIN      GP0    // Pin 7 - Status LED
#define RESET_PIN    GP1    // Pin 6 - Reset output to NPN transistor
#define SIGNAL_PIN   GP3    // Pin 4 - Input from DSP _INIT signal

// Configuration bits
#pragma config OSC = IntRC      // Internal RC oscillator
#pragma config WDT = ON         // Watchdog timer ON
#pragma config CP = OFF         // Code protection off
#pragma config MCLRE = OFF      // GP3/MCLR pin function is digital I/O

// Combine counters into one byte to save RAM
static uint8_t counter = 0;

// Initialize hardware
void picfix_init(void) {
    TRIS = 0b00001000;  // GP3 input, others output
    GPIO = 0x00;        // All outputs LOW
    OPTION = 0b00001111;  // WDT prescaler 1:128
    CLRWDT();
}

// Simple monitoring indication
void picfix_monitor_indicate(void) {
    if(counter < 50) {
        LED_PIN = 1;
    } else {
        LED_PIN = 0;
    }
    
    if(++counter >= 255) counter = 0;
}

// Read input with debouncing
uint8_t picfix_read_signal(void) {
    uint8_t sample1, sample2;
    
    sample1 = SIGNAL_PIN;
    __nop(); __nop(); __nop(); __nop();
    sample2 = SIGNAL_PIN;
    
    return (sample1 && sample2);  // Both must be HIGH
}

// Main function
void main(void) {
    uint8_t error_count = 0;
    picfix_init();
    
    // Startup indication - blink for ~2 seconds (250ms on/off)
    for(uint8_t i = 0; i < 200; i++) {  // 200 * 10ms = 2000ms (2 seconds)
        // Toggle LED every 25 counts (250ms)
        if((i % 25) == 0) {
            LED_PIN = !LED_PIN;
        }
        
        // ~10ms delay with watchdog clear
        for(uint8_t j = 0; j < 255; j++) {
            CLRWDT();
            __nop();
        }
    }
        
    // Main monitoring loop
    while(1) {
        CLRWDT();
        
        // Check input signal
        if(!picfix_read_signal()) {
            if(error_count < 255) error_count++;
            if(error_count >= 200) {  // ~2 seconds
                // Trigger reset
                LED_PIN = 1;
                RESET_PIN = 1;
                while(1) {
                    CLRWDT();
                }
            }
        } else {
            error_count = 0;
        }
        
        // Update LED pattern
        picfix_monitor_indicate();
        
        // ~10ms delay
        for(uint8_t i = 0; i < 255; i++) {
            for(uint8_t j = 0; j < 4; j++) {
                __nop();
            }
        }
    }
}