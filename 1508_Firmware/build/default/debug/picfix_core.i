# 1 "picfix_core.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 285 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include/language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "picfix_core.c" 2








# 1 "./picfix_common.h" 1
# 26 "./picfix_common.h"
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdint.h" 1 3



# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/musl_xc8.h" 1 3
# 5 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdint.h" 2 3
# 26 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdint.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 1 3
# 133 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef unsigned short uintptr_t;
# 148 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef short intptr_t;
# 164 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef signed char int8_t;




typedef short int16_t;




typedef __int24 int24_t;




typedef long int32_t;
# 192 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef int32_t intmax_t;







typedef unsigned char uint8_t;




typedef unsigned short uint16_t;




typedef __uint24 uint24_t;




typedef unsigned long uint32_t;
# 233 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef uint32_t uintmax_t;
# 27 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdint.h" 2 3

typedef int8_t int_fast8_t;




typedef int8_t int_least8_t;
typedef int16_t int_least16_t;

typedef int24_t int_least24_t;
typedef int24_t int_fast24_t;

typedef int32_t int_least32_t;




typedef uint8_t uint_fast8_t;




typedef uint8_t uint_least8_t;
typedef uint16_t uint_least16_t;

typedef uint24_t uint_least24_t;
typedef uint24_t uint_fast24_t;

typedef uint32_t uint_least32_t;
# 148 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdint.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/stdint.h" 1 3
typedef int16_t int_fast16_t;
typedef int32_t int_fast32_t;
typedef uint16_t uint_fast16_t;
typedef uint32_t uint_fast32_t;
# 149 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdint.h" 2 3
# 27 "./picfix_common.h" 2
# 43 "./picfix_common.h"
typedef enum {
    STATE_STARTUP,
    STATE_MONITORING,
    STATE_TRIGGERED
} picfix_state_t;


void picfix_init(void);
void picfix_startup_indicate(void);
void picfix_monitor_indicate(void);
void picfix_error_indicate(void);
void picfix_activate_reset(void);
uint8_t picfix_read_signal(void);
void picfix_delay_ms(uint8_t ms);
void picfix_watchdog_clear(void);


void picfix_core_update(void);
void picfix_handle_startup(void);
void picfix_handle_monitoring(void);
void picfix_handle_triggered(void);
void picfix_timer_update(void);







extern volatile uint16_t system_timer_ms;
extern volatile uint16_t error_timer_ms;
extern volatile picfix_state_t current_state;
# 10 "picfix_core.c" 2


volatile uint16_t system_timer_ms = 0;
volatile uint16_t error_timer_ms = 0;
volatile picfix_state_t current_state = STATE_STARTUP;




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







void picfix_handle_startup(void) {

    picfix_startup_indicate();


    if(system_timer_ms >= 2000) {
        current_state = STATE_MONITORING;
        error_timer_ms = 0;
    }
}







void picfix_handle_monitoring(void) {

    picfix_monitor_indicate();






        if(picfix_read_signal() == 0) {

            error_timer_ms++;


            if(error_timer_ms >= 2000) {
                current_state = STATE_TRIGGERED;
            }
        } else {

            error_timer_ms = 0;
        }

}







void picfix_handle_triggered(void) {

    picfix_error_indicate();


    picfix_activate_reset();


    picfix_watchdog_clear();



}





void picfix_timer_update(void) {
    system_timer_ms++;
}
