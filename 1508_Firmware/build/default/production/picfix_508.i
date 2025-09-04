# 1 "picfix_508.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 285 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include/language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "picfix_508.c" 2
# 16 "picfix_508.c"
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include/xc.h" 1 3
# 18 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include/xc.h" 3
extern const char __xc8_OPTIM_SPEED;

extern double __fpnormalize(double);


# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/xc8debug.h" 1 3



# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdlib.h" 1 3



# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/musl_xc8.h" 1 3
# 5 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdlib.h" 2 3





# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/features.h" 1 3
# 11 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdlib.h" 2 3
# 21 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdlib.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 1 3
# 24 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef long int wchar_t;
# 128 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef unsigned size_t;
# 174 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef __int24 int24_t;
# 210 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef __uint24 uint24_t;
# 22 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdlib.h" 2 3

int atoi (const char *);
long atol (const char *);



double atof (const char *);


float strtof (const char *restrict, char **restrict);
double strtod (const char *restrict, char **restrict);
long double strtold (const char *restrict, char **restrict);



long strtol (const char *restrict, char **restrict, int);
unsigned long strtoul (const char *restrict, char **restrict, int);





unsigned long __strtoxl(const char * s, char ** endptr, int base, char is_signed);
# 55 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdlib.h" 3
int rand (void);
void srand (unsigned);

void *malloc (size_t);
void *calloc (size_t, size_t);
void *realloc (void *, size_t);
void free (void *);

          void abort (void);
int atexit (void (*) (void));
          void exit (int);
          void _Exit (int);

void *bsearch (const void *, const void *, size_t, size_t, int (*)(const void *, const void *));







__attribute__((nonreentrant)) void qsort (void *, size_t, size_t, int (*)(const void *, const void *));

int abs (int);
long labs (long);




typedef struct { int quot, rem; } div_t;
typedef struct { long quot, rem; } ldiv_t;




div_t div (int, int);
ldiv_t ldiv (long, long);




typedef struct { unsigned int quot, rem; } udiv_t;
typedef struct { unsigned long quot, rem; } uldiv_t;
udiv_t udiv (unsigned int, unsigned int);
uldiv_t uldiv (unsigned long, unsigned long);
# 5 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/xc8debug.h" 2 3







#pragma intrinsic(__builtin_software_breakpoint)
extern void __builtin_software_breakpoint(void);
# 24 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include/xc.h" 2 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include/builtins.h" 1 3



# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdint.h" 1 3
# 26 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/stdint.h" 3
# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 1 3
# 133 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef unsigned short uintptr_t;
# 148 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef short intptr_t;
# 164 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef signed char int8_t;




typedef short int16_t;
# 179 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef long int32_t;
# 192 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
typedef int32_t intmax_t;







typedef unsigned char uint8_t;




typedef unsigned short uint16_t;
# 215 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include\\c99/bits/alltypes.h" 3
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
# 5 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include/builtins.h" 2 3


#pragma intrinsic(__nop)
extern void __nop(void);
# 19 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include/builtins.h" 3
#pragma intrinsic(_delay)
extern __attribute__((nonreentrant)) void _delay(uint32_t);
#pragma intrinsic(_delaywdt)
extern __attribute__((nonreentrant)) void _delaywdt(uint32_t);
# 25 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include/xc.h" 2 3



# 1 "C:/Users/burch/.mchp_packs/Microchip/PIC10-12Fxxx_DFP/1.8.184/xc8\\pic\\include/pic.h" 1 3



# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include/xc.h" 1 3
# 5 "C:/Users/burch/.mchp_packs/Microchip/PIC10-12Fxxx_DFP/1.8.184/xc8\\pic\\include/pic.h" 2 3






# 1 "C:/Users/burch/.mchp_packs/Microchip/PIC10-12Fxxx_DFP/1.8.184/xc8\\pic\\include/pic_chip_select.h" 1 3
# 89 "C:/Users/burch/.mchp_packs/Microchip/PIC10-12Fxxx_DFP/1.8.184/xc8\\pic\\include/pic_chip_select.h" 3
# 1 "C:/Users/burch/.mchp_packs/Microchip/PIC10-12Fxxx_DFP/1.8.184/xc8\\pic\\include\\proc/pic12f508.h" 1 3
# 50 "C:/Users/burch/.mchp_packs/Microchip/PIC10-12Fxxx_DFP/1.8.184/xc8\\pic\\include\\proc/pic12f508.h" 3
extern volatile unsigned char INDF __attribute__((address(0x000)));

__asm("INDF equ 00h");


typedef union {
    struct {
        unsigned INDF :8;
    };
} INDFbits_t;
extern volatile INDFbits_t INDFbits __attribute__((address(0x000)));
# 70 "C:/Users/burch/.mchp_packs/Microchip/PIC10-12Fxxx_DFP/1.8.184/xc8\\pic\\include\\proc/pic12f508.h" 3
extern volatile unsigned char TMR0 __attribute__((address(0x001)));

__asm("TMR0 equ 01h");


typedef union {
    struct {
        unsigned TMR0 :8;
    };
} TMR0bits_t;
extern volatile TMR0bits_t TMR0bits __attribute__((address(0x001)));
# 90 "C:/Users/burch/.mchp_packs/Microchip/PIC10-12Fxxx_DFP/1.8.184/xc8\\pic\\include\\proc/pic12f508.h" 3
extern volatile unsigned char PCL __attribute__((address(0x002)));

__asm("PCL equ 02h");


typedef union {
    struct {
        unsigned PCL :8;
    };
} PCLbits_t;
extern volatile PCLbits_t PCLbits __attribute__((address(0x002)));
# 110 "C:/Users/burch/.mchp_packs/Microchip/PIC10-12Fxxx_DFP/1.8.184/xc8\\pic\\include\\proc/pic12f508.h" 3
extern volatile unsigned char STATUS __attribute__((address(0x003)));

__asm("STATUS equ 03h");


typedef union {
    struct {
        unsigned C :1;
        unsigned DC :1;
        unsigned Z :1;
        unsigned nPD :1;
        unsigned nTO :1;
        unsigned :2;
        unsigned GPWUF :1;
    };
    struct {
        unsigned :5;
        unsigned PA0 :1;
    };
    struct {
        unsigned CARRY :1;
        unsigned :1;
        unsigned ZERO :1;
    };
} STATUSbits_t;
extern volatile STATUSbits_t STATUSbits __attribute__((address(0x003)));
# 185 "C:/Users/burch/.mchp_packs/Microchip/PIC10-12Fxxx_DFP/1.8.184/xc8\\pic\\include\\proc/pic12f508.h" 3
extern volatile unsigned char FSR __attribute__((address(0x004)));

__asm("FSR equ 04h");


typedef union {
    struct {
        unsigned FSR :8;
    };
} FSRbits_t;
extern volatile FSRbits_t FSRbits __attribute__((address(0x004)));
# 205 "C:/Users/burch/.mchp_packs/Microchip/PIC10-12Fxxx_DFP/1.8.184/xc8\\pic\\include\\proc/pic12f508.h" 3
extern volatile unsigned char OSCCAL __attribute__((address(0x005)));

__asm("OSCCAL equ 05h");


typedef union {
    struct {
        unsigned :1;
        unsigned CAL :7;
    };
    struct {
        unsigned :1;
        unsigned CAL0 :1;
        unsigned CAL1 :1;
        unsigned CAL2 :1;
        unsigned CAL3 :1;
        unsigned CAL4 :1;
        unsigned CAL5 :1;
        unsigned CAL6 :1;
    };
} OSCCALbits_t;
extern volatile OSCCALbits_t OSCCALbits __attribute__((address(0x005)));
# 271 "C:/Users/burch/.mchp_packs/Microchip/PIC10-12Fxxx_DFP/1.8.184/xc8\\pic\\include\\proc/pic12f508.h" 3
extern volatile unsigned char GPIO __attribute__((address(0x006)));

__asm("GPIO equ 06h");


typedef union {
    struct {
        unsigned GP0 :1;
        unsigned GP1 :1;
        unsigned GP2 :1;
        unsigned GP3 :1;
        unsigned GP4 :1;
        unsigned GP5 :1;
    };
} GPIObits_t;
extern volatile GPIObits_t GPIObits __attribute__((address(0x006)));
# 321 "C:/Users/burch/.mchp_packs/Microchip/PIC10-12Fxxx_DFP/1.8.184/xc8\\pic\\include\\proc/pic12f508.h" 3
extern volatile __control unsigned char OPTION __attribute__((address(0x000)));



extern volatile __control unsigned char TRIS __attribute__((address(0x006)));



extern volatile __control unsigned char TRISGPIO __attribute__((address(0x006)));
# 356 "C:/Users/burch/.mchp_packs/Microchip/PIC10-12Fxxx_DFP/1.8.184/xc8\\pic\\include\\proc/pic12f508.h" 3
extern volatile __bit CAL0 __attribute__((address(0x29)));


extern volatile __bit CAL1 __attribute__((address(0x2A)));


extern volatile __bit CAL2 __attribute__((address(0x2B)));


extern volatile __bit CAL3 __attribute__((address(0x2C)));


extern volatile __bit CAL4 __attribute__((address(0x2D)));


extern volatile __bit CAL5 __attribute__((address(0x2E)));


extern volatile __bit CAL6 __attribute__((address(0x2F)));


extern volatile __bit CARRY __attribute__((address(0x18)));


extern volatile __bit DC __attribute__((address(0x19)));


extern volatile __bit GP0 __attribute__((address(0x30)));


extern volatile __bit GP1 __attribute__((address(0x31)));


extern volatile __bit GP2 __attribute__((address(0x32)));


extern volatile __bit GP3 __attribute__((address(0x33)));


extern volatile __bit GP4 __attribute__((address(0x34)));


extern volatile __bit GP5 __attribute__((address(0x35)));


extern volatile __bit GPWUF __attribute__((address(0x1F)));


extern volatile __bit PA0 __attribute__((address(0x1D)));


extern volatile __bit ZERO __attribute__((address(0x1A)));


extern volatile __bit nPD __attribute__((address(0x1B)));


extern volatile __bit nTO __attribute__((address(0x1C)));
# 90 "C:/Users/burch/.mchp_packs/Microchip/PIC10-12Fxxx_DFP/1.8.184/xc8\\pic\\include/pic_chip_select.h" 2 3
# 12 "C:/Users/burch/.mchp_packs/Microchip/PIC10-12Fxxx_DFP/1.8.184/xc8\\pic\\include/pic.h" 2 3
# 60 "C:/Users/burch/.mchp_packs/Microchip/PIC10-12Fxxx_DFP/1.8.184/xc8\\pic\\include/pic.h" 3
__attribute__((__unsupported__("The " "FLASH_READ" " macro function is no longer supported. Please use the MPLAB X MCC."))) unsigned char __flash_read(unsigned short addr);

__attribute__((__unsupported__("The " "FLASH_WRITE" " macro function is no longer supported. Please use the MPLAB X MCC."))) void __flash_write(unsigned short addr, unsigned short data);

__attribute__((__unsupported__("The " "FLASH_ERASE" " macro function is no longer supported. Please use the MPLAB X MCC."))) void __flash_erase(unsigned short addr);


# 1 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include/eeprom_routines.h" 1 3
# 68 "C:/Users/burch/.mchp_packs/Microchip/PIC10-12Fxxx_DFP/1.8.184/xc8\\pic\\include/pic.h" 2 3
# 102 "C:/Users/burch/.mchp_packs/Microchip/PIC10-12Fxxx_DFP/1.8.184/xc8\\pic\\include/pic.h" 3
extern __bank0 unsigned char __resetbits;
extern __bank0 __bit __powerdown;
extern __bank0 __bit __timeout;
# 29 "C:\\Program Files\\Microchip\\xc8\\v3.00\\pic\\include/xc.h" 2 3
# 17 "picfix_508.c" 2

# 1 "./picfix_common.h" 1
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
# 19 "picfix_508.c" 2





#pragma config OSC = IntRC
#pragma config WDT = ON
#pragma config CP = OFF
#pragma config MCLRE = OFF
# 44 "picfix_508.c"
static volatile uint8_t flash_counter = 0;
static volatile uint8_t led_state = 0;
static volatile uint8_t watchdog_counter = 0;
static volatile uint8_t signal_stable_count = 0;
static volatile uint8_t error_confirmed = 0;


typedef enum {
    ERROR_CHECK_IDLE,
    ERROR_CHECK_INITIAL,
    ERROR_CHECK_CONFIRMING,
    ERROR_CHECK_VERIFIED
} error_check_state_t;

static error_check_state_t error_state = ERROR_CHECK_IDLE;




void picfix_init(void) {

    __asm("clrwdt");


    TRIS = 0b001000;


    GP0 = 0;
    GP1 = 0;


    system_timer_ms = 0;
    error_timer_ms = 0;
    watchdog_counter = 0;
    signal_stable_count = 0;
    error_confirmed = 0;
    error_state = ERROR_CHECK_IDLE;
    current_state = STATE_STARTUP;


    __asm("clrwdt");
}




void picfix_startup_indicate(void) {

    if((system_timer_ms % 250) < (250 / 2)) {
        GP0 = 1;
    } else {
        GP0 = 0;
    }
}





void picfix_monitor_indicate(void) {

    static uint8_t led_brightness = 0;
    static int8_t led_direction = 1;


    if((watchdog_counter % 8) == 0) {
        led_brightness += led_direction;
        if(led_brightness >= 15) {
            led_direction = -1;
        } else if(led_brightness == 0) {
            led_direction = 1;
        }
    }



    if((watchdog_counter % 16) < led_brightness) {
        GP0 = 1;
    } else {
        GP0 = 0;
    }
}




void picfix_error_indicate(void) {
    GP0 = 1;
}




void picfix_activate_reset(void) {
    GP1 = 1;
}






uint8_t picfix_read_signal(void) {
    uint8_t sample1, sample2, sample3;


    sample1 = GP3;
    _delay((unsigned long)((10)*(4000000/4000000.0)));
    sample2 = GP3;
    _delay((unsigned long)((10)*(4000000/4000000.0)));
    sample3 = GP3;


    if((sample1 + sample2 + sample3) >= 2) {
        return 1;
    } else {
        return 0;
    }
}
# 173 "picfix_508.c"
void picfix_watchdog_clear(void) {

    __asm("clrwdt");


    watchdog_counter++;


    if(watchdog_counter > 200) {
        watchdog_counter = 0;
    }
}
# 196 "picfix_508.c"
void picfix_timer_update_simple(void) {
    static uint8_t delay_count = 0;

    _delay((unsigned long)((1)*(4000000/4000.0)));
    delay_count++;

    if(delay_count >= 1) {
        picfix_timer_update();
        delay_count = 0;
    }
}




int main(void) {

    picfix_init();


    while(1) {

        picfix_timer_update_simple();


        picfix_core_update();


        picfix_watchdog_clear();
    }

    return 0;
}
