/*
 * PICfix Core Algorithm - Shared Implementation
 * 
 * This file contains the main state machine and logic that both
 * PIC12F508 and PIC12F1572 variants use. Hardware-specific functions
 * are abstracted through the picfix_common.h interface.
 */

#include "picfix_common.h"

// Global state variables
volatile uint16_t system_timer_ms = 0;
volatile uint16_t error_timer_ms = 0;
volatile picfix_state_t current_state = STATE_STARTUP;

/*
 * Core state machine handler - called from main loop
 */
void picfix_core_update(void) {
    switch(current_state) {
        case STATE_STARTUP:
            picfix_handle_startup();
            break;
            
        case STATE_MONITORING:
            picfix_handle_monitoring();
            break;
            
        case STATE_TRIGGERED:
            picfix_handle_triggered();
            break;
    }
}

/*
 * Startup state handler
 * - Provides visual indication that PIC is alive
 * - Allows PS2 system to stabilize
 * - Transitions to monitoring after delay
 */
void picfix_handle_startup(void) {
    // Hardware-specific startup indication (flashing LED)
    picfix_startup_indicate();
    
    // Check if startup delay has elapsed
    if(system_timer_ms >= STARTUP_DELAY_MS) {
        current_state = STATE_MONITORING;
        error_timer_ms = 0;     // Reset error timer
    }
}

/*
 * Monitoring state handler  
 * - Provides normal operation indication
 * - Monitors /INT_1869 signal for stuck condition
 * - Implements error detection timeout
 */
void picfix_handle_monitoring(void) {
    // Hardware-specific monitoring indication (breathing LED, etc.)
    picfix_monitor_indicate();
    
    // Use enhanced monitoring if available (PIC12F508 specific)
    #ifdef ENHANCED_MONITORING_AVAILABLE
        picfix_enhanced_monitoring();
    #else
        // Standard monitoring for basic implementations
        if(picfix_read_signal() == SIGNAL_ERROR) {
            // Signal is LOW (stuck condition)
            error_timer_ms++;
            
            // Check if error persists for timeout period
            if(error_timer_ms >= ERROR_TIMEOUT_MS) {
                current_state = STATE_TRIGGERED;
            }
        } else {
            // Signal is HIGH (normal operation)
            error_timer_ms = 0;     // Reset error timer
        }
    #endif
}

/*
 * Triggered state handler
 * - Activates reset protection
 * - Provides error indication
 * - Permanent latch until power cycle
 */
void picfix_handle_triggered(void) {
    // Hardware-specific error indication (solid LED)
    picfix_error_indicate();
    
    // Activate PS2 reset (permanent until power cycle)
    picfix_activate_reset();
    
    // Clear watchdog to prevent system reset
    picfix_watchdog_clear();
    
    // Stay in this state permanently
    // (No transition out - requires power cycle)
}

/*
 * System timer update - called every millisecond
 * This function should be called from timer interrupt or main loop
 */
void picfix_timer_update(void) {
    system_timer_ms++;
}

