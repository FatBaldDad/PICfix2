/*
 * PICfix Common Definitions - Shared between PIC12F508 and PIC12F1572
 * 
 * Original Concept: Matrix Infinity Team (PS2 Protection Circuit)
 * Enhanced Implementation: FatBaldDad & GitHub Copilot (July 2025)
 * 
 * This firmware is FREE and OPEN for the PS2 Community!
 * Feel free to use, modify, and distribute for any PS2 protection projects.
 * 
 * This header defines the core functionality that both microcontroller
 * variants implement, allowing for identical behavior with different
 * hardware capabilities.
 * 
 * Enhanced Features:
 * - Matrix Team compatible timing and behavior
 * - Watchdog timer integration for robustness
 * - Multi-stage error detection with glitch filtering
 * - Professional code architecture with shared core algorithm
 * 
 * License: Public Domain - No restrictions, use freely!
 */

#ifndef PICFIX_COMMON_H
#define PICFIX_COMMON_H

#include <stdint.h>

// Version definitions
#define PICFIX_VERSION_MAJOR    1
#define PICFIX_VERSION_MINOR    0
#define PICFIX_BUILD_DATE       "2025-07-25"

// Common timing constants (in milliseconds)
#define STARTUP_DELAY_MS        2000    // 2 second startup delay
#define ERROR_TIMEOUT_MS        2000    // 2 second error detection timeout
#define FLASH_PERIOD_MS         250     // 250ms flash period during startup

// Signal definitions - /INT_1869 monitoring
#define SIGNAL_NORMAL           1       // Signal HIGH = normal operation
#define SIGNAL_ERROR            0       // Signal LOW = error condition

// Common state definitions
typedef enum {
    STATE_STARTUP,      // Initial delay with LED indication
    STATE_MONITORING,   // Normal operation monitoring /INT_1869
    STATE_TRIGGERED     // Error detected - reset activated
} picfix_state_t;

// Core function prototypes (must be implemented by each variant)
void picfix_init(void);                     // Initialize hardware
void picfix_startup_indicate(void);         // Startup LED indication
void picfix_monitor_indicate(void);         // Normal monitoring indication  
void picfix_error_indicate(void);           // Error triggered indication
void picfix_activate_reset(void);           // Activate PS2 reset
uint8_t picfix_read_signal(void);           // Read /INT_1869 signal
void picfix_delay_ms(uint8_t ms);          // Delay function
void picfix_watchdog_clear(void);           // Clear watchdog if enabled

// Core algorithm functions (implemented in picfix_core.c)
void picfix_core_update(void);              // Main state machine update
void picfix_handle_startup(void);           // Startup state handler
void picfix_handle_monitoring(void);        // Monitoring state handler  
void picfix_handle_triggered(void);         // Triggered state handler
void picfix_timer_update(void);             // Timer update function

// Enhanced monitoring (PIC12F508 specific - when available)
#ifdef ENHANCED_MONITORING_AVAILABLE
void picfix_enhanced_monitoring(void);      // Matrix Team style enhanced monitoring
#endif

// Core timing variables (extern - defined in main implementation)
extern volatile uint16_t system_timer_ms;
extern volatile uint16_t error_timer_ms;
extern volatile picfix_state_t current_state;

#endif // PICFIX_COMMON_H
