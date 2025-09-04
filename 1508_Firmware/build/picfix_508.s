subtitle "Microchip MPLAB XC8 C Compiler v3.00 (Free license) build 20241204225717 Og1 "

pagewidth 120

	opt flic

	processor	12F508
include "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc\12f508.cgen.inc"
getbyte	macro	val,pos
	(((val) >> (8 * pos)) and 0xff)
endm
byte0	macro	val
	(getbyte(val,0))
endm
byte1	macro	val
	(getbyte(val,1))
endm
byte2	macro	val
	(getbyte(val,2))
endm
byte3	macro	val
	(getbyte(val,3))
endm
byte4	macro	val
	(getbyte(val,4))
endm
byte5	macro	val
	(getbyte(val,5))
endm
byte6	macro	val
	(getbyte(val,6))
endm
byte7	macro	val
	(getbyte(val,7))
endm
getword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffff)
endm
word0	macro	val
	(getword(val,0))
endm
word1	macro	val
	(getword(val,2))
endm
word2	macro	val
	(getword(val,4))
endm
word3	macro	val
	(getword(val,6))
endm
gettword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffff)
endm
tword0	macro	val
	(gettword(val,0))
endm
tword1	macro	val
	(gettword(val,3))
endm
tword2	macro	val
	(gettword(val,6))
endm
getdword	macro	val,pos
	(((val) >> (8 * pos)) and 0xffffffff)
endm
dword0	macro	val
	(getdword(val,0))
endm
dword1	macro	val
	(getdword(val,4))
endm
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
# 52 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic12f508.h"
INDF equ 00h ;# 
# 72 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic12f508.h"
TMR0 equ 01h ;# 
# 92 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic12f508.h"
PCL equ 02h ;# 
# 112 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic12f508.h"
STATUS equ 03h ;# 
# 187 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic12f508.h"
FSR equ 04h ;# 
# 207 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic12f508.h"
OSCCAL equ 05h ;# 
# 273 "C:\Program Files\Microchip\xc8\v3.00\pic\include\proc/pic12f508.h"
GPIO equ 06h ;# 
	debug_source C
	FNCALL	_main,___awmod
	FNCALL	_main,_picfix_init
	FNCALL	_main,_picfix_monitor_indicate
	FNCALL	_main,_picfix_read_signal
	FNROOT	_main
	global	_error_timer_ms
	global	_system_timer_ms
	global	_current_state
	global	_counter
	global	_OPTION
_OPTION	set	0x0
	global	_GPIO
_GPIO	set	0x6
	global	_TRIS
_TRIS	set	0x6
	global	_GP1
_GP1	set	0x31
	global	_GP3
_GP3	set	0x33
	global	_GP0
_GP0	set	0x30
; #config settings
	config pad_punits      = on
	config apply_mask      = off
	config ignore_cmsgs    = off
	config default_configs = off
	config default_idlocs  = off
	config OSC = "IntRC"
	config WDT = "ON"
	config CP = "OFF"
	config MCLRE = "OFF"
	file	"build\picfix_508.s"
	line	#
psect cinit,class=ENTRY,delta=2
global start_initialization
start_initialization:

global __initialization
__initialization:
psect	bssBANK0,class=BANK0,space=1,noexec
global __pbssBANK0
__pbssBANK0:
_error_timer_ms:
       ds      2

_system_timer_ms:
       ds      2

_current_state:
       ds      1

_counter:
       ds      1

	file	"build\picfix_508.s"
	line	#
; Clear objects allocated to BANK0
psect cinit,class=ENTRY,delta=2
	clrf	fsr	;select bank0
	clrf	((__pbssBANK0)+0)&01Fh
	clrf	((__pbssBANK0)+1)&01Fh
	clrf	((__pbssBANK0)+2)&01Fh
	clrf	((__pbssBANK0)+3)&01Fh
	clrf	((__pbssBANK0)+4)&01Fh
	clrf	((__pbssBANK0)+5)&01Fh
psect cinit,class=ENTRY,delta=2,merge=1
global end_of_initialization,__end_of__initialization

;End of C runtime variable initialization code

end_of_initialization:
__end_of__initialization:
clrf fsr
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1,noexec
global __pcstackCOMMON
__pcstackCOMMON:
??_picfix_init:	; 1 bytes @ 0x0
??_picfix_monitor_indicate:	; 1 bytes @ 0x0
??_picfix_read_signal:	; 1 bytes @ 0x0
??___awmod:	; 1 bytes @ 0x0
psect	cstackBANK0,class=BANK0,space=1,noexec
global __pcstackBANK0
__pcstackBANK0:
?_picfix_init:	; 1 bytes @ 0x0
?_picfix_monitor_indicate:	; 1 bytes @ 0x0
	global	?_picfix_read_signal
?_picfix_read_signal:	; 1 bytes @ 0x0
?_main:	; 1 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	1
	global	picfix_read_signal@sample1
picfix_read_signal@sample1:	; 1 bytes @ 0x1
	ds	1
	global	picfix_read_signal@sample2
picfix_read_signal@sample2:	; 1 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	_picfix_read_signal$38
_picfix_read_signal$38:	; 1 bytes @ 0x3
	ds	1
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x4
	ds	1
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x5
	ds	1
??_main:	; 1 bytes @ 0x6
	ds	1
	global	main@j
main@j:	; 1 bytes @ 0x7
	ds	1
	global	main@i_50
main@i_50:	; 1 bytes @ 0x8
	ds	1
	global	main@j_51
main@j_51:	; 1 bytes @ 0x9
	ds	1
	global	main@error_count
main@error_count:	; 1 bytes @ 0xA
	ds	1
	global	main@i
main@i:	; 1 bytes @ 0xB
	ds	1
;!
;!Data Sizes:
;!    Strings     0
;!    Constant    0
;!    Data        0
;!    BSS         6
;!    Persistent  0
;!    Stack       0
;!
;!Auto Spaces:
;!    Space          Size  Autos    Used
;!    COMMON            0      0       0
;!    BANK0            23     12      18

;!
;!Pointer List with Targets:
;!
;!    None.


;!
;!Critical Paths under _main in COMMON
;!
;!    None.
;!
;!Critical Paths under _main in BANK0
;!
;!    _main->___awmod

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;!
;!Call Graph Tables:
;!
;! ---------------------------------------------------------------------------------
;! (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;! ---------------------------------------------------------------------------------
;! (0) _main                                                 6     6      0     621
;!                                              6 BANK0      6     6      0
;!                            ___awmod
;!                        _picfix_init
;!            _picfix_monitor_indicate
;!                 _picfix_read_signal
;! ---------------------------------------------------------------------------------
;! (1) _picfix_read_signal                                   4     3      1      70
;!                                              0 BANK0      4     3      1
;! ---------------------------------------------------------------------------------
;! (1) _picfix_monitor_indicate                              0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) _picfix_init                                          0     0      0       0
;! ---------------------------------------------------------------------------------
;! (1) ___awmod                                              6     2      4     298
;!                                              0 BANK0      6     2      4
;! ---------------------------------------------------------------------------------
;! Estimated maximum stack depth 1
;! ---------------------------------------------------------------------------------
;!
;! Call Graph Graphs:
;!
;! _main (ROOT)
;!   ___awmod
;!   _picfix_init
;!   _picfix_monitor_indicate
;!   _picfix_read_signal
;!

;!Address spaces:

;!Name               Size   Autos  Total    Usage
;!BITCOMMON            0      0       0      0.0%
;!BITBANK0            23      0       0      0.0%
;!COMMON               0      0       0      0.0%
;!BANK0               23     12      18     78.3%
;!STACK                0      0       0      0.0%
;!DATA                 0      0      18      0.0%

	global	_main

;; *************** function _main *****************
;; Defined at:
;;		line 50 in file "I:\81-PS2 Fun\23-Git\Projects\PicfixPCB_v8-v12\PIC12F508_Firmware\picfix_508.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               1    9[BANK0 ] unsigned char 
;;  j               1    7[BANK0 ] unsigned char 
;;  i               1    8[BANK0 ] unsigned char 
;;  i               1   11[BANK0 ] unsigned char 
;;  error_count     1   10[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1   34[None  ] void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : B00/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       5
;;      Temps:          0       1
;;      Totals:         0       6
;;Total ram usage:        6 bytes
;; Hardware stack levels required when called: 1
;; This function calls:
;;		___awmod
;;		_picfix_init
;;		_picfix_monitor_indicate
;;		_picfix_read_signal
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext,global,class=CODE,delta=2,split=1,group=0
	file	"I:\81-PS2 Fun\23-Git\Projects\PicfixPCB_v8-v12\PIC12F508_Firmware\picfix_508.c"
	line	50
global __pmaintext
__pmaintext:	;psect for function _main
psect	maintext
	file	"I:\81-PS2 Fun\23-Git\Projects\PicfixPCB_v8-v12\PIC12F508_Firmware\picfix_508.c"
	line	50
	
_main:	
;incstack = 0
	callstack 1
; Regs used in _main: [wreg-fsr0h+status,2-btemp+1+pclath+cstack]
	line	51
	
l812:	
	clrf	(main@error_count)
	line	52
	
l814:	
	fcall	entry__picfix_init
	line	55
	
l816:	
	clrf	(main@i)
	line	57
	
l822:	
	movlw	019h
	movwf	(___awmod@divisor)
	movlw	0
	movwf	((___awmod@divisor))+1
	movf	(main@i),w
	movwf	btemp+0
	clrf	btemp+1
	movf	0+wtemp0,w
	movwf	(___awmod@dividend)
	movf	1+wtemp0,w
	movwf	(___awmod@dividend+1)
	fcall	entry____awmod
	movf	((0+(?___awmod))),w
iorwf	((1+(?___awmod))),w
	btfss	status,2
	goto	u381
	goto	u380
u381:
	goto	l826
u380:
	line	58
	
l824:	
	movlw	1<<((48)&7)
	xorwf	((48)/8),f
	line	62
	
l826:	
	clrf	(main@j)
	
l38:	
	line	63
# 63 "I:\81-PS2 Fun\23-Git\Projects\PicfixPCB_v8-v12\PIC12F508_Firmware\picfix_508.c"
clrwdt ;# 
psect	maintext
	line	64
	asmopt	push
	asmopt	off
	nop
	asmopt	pop
	line	65
	
l832:	
	movlw	low(01h)
	addwf	(main@j),f
		incf	((main@j)),w
	btfss	status,2
	goto	u391
	goto	u390
u391:
	goto	l38
u390:
	line	66
	
l834:	
	movlw	low(01h)
	addwf	(main@i),f
	
l836:	
	movlw	low(0C8h)
	subwf	(main@i),w
	skipc
	goto	u401
	goto	u400
u401:
	goto	l822
u400:
	line	69
	
l40:	
	line	70
# 70 "I:\81-PS2 Fun\23-Git\Projects\PicfixPCB_v8-v12\PIC12F508_Firmware\picfix_508.c"
clrwdt ;# 
psect	maintext
	line	73
	
l838:	
	fcall	entry__picfix_read_signal
	movf	(0+?_picfix_read_signal),w
	movwf	(??_main+0)+0
	movf	((??_main+0)+0),w
	btfss	status,2
	goto	u411
	goto	u410
u411:
	goto	l848
u410:
	line	74
	
l840:	
		incf	((main@error_count)),w
	btfsc	status,2
	goto	u421
	goto	u420
u421:
	goto	l844
u420:
	
l842:	
	movlw	low(01h)
	addwf	(main@error_count),f
	line	75
	
l844:	
	movlw	low(0C8h)
	subwf	(main@error_count),w
	skipc
	goto	u431
	goto	u430
u431:
	goto	l850
u430:
	line	77
	
l846:	
	bsf	(48/8),(48)&7	;volatile
	line	78
	bsf	(49/8),(49)&7	;volatile
	line	79
	
l44:	
	line	80
# 80 "I:\81-PS2 Fun\23-Git\Projects\PicfixPCB_v8-v12\PIC12F508_Firmware\picfix_508.c"
clrwdt ;# 
psect	maintext
	goto	l44
	line	84
	
l848:	
	clrf	(main@error_count)
	line	88
	
l850:	
	fcall	entry__picfix_monitor_indicate
	line	91
	
l852:	
	clrf	(main@i_50)
	line	92
	
l858:	
	clrf	(main@j_51)
	
l50:	
	line	93
	asmopt	push
	asmopt	off
	nop
	asmopt	pop
	line	94
	
l864:	
	movlw	low(01h)
	addwf	(main@j_51),f
	
l866:	
	movlw	low(04h)
	subwf	(main@j_51),w
	skipc
	goto	u441
	goto	u440
u441:
	goto	l50
u440:
	line	95
	
l868:	
	movlw	low(01h)
	addwf	(main@i_50),f
		incf	((main@i_50)),w
	btfss	status,2
	goto	u451
	goto	u450
u451:
	goto	l858
u450:
	goto	l40
	global	start
	ljmp	start
	callstack 0
	line	97
GLOBAL	__end_of_main
	__end_of_main:
	signat	_main,89
	global	_picfix_read_signal

;; *************** function _picfix_read_signal *****************
;; Defined at:
;;		line 39 in file "I:\81-PS2 Fun\23-Git\Projects\PicfixPCB_v8-v12\PIC12F508_Firmware\picfix_508.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  sample2         1    2[BANK0 ] unsigned char 
;;  sample1         1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    0[BANK0 ] unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       1
;;      Locals:         0       3
;;      Temps:          0       0
;;      Totals:         0       4
;;Total ram usage:        4 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_picfix_handle_monitoring
;; This function uses a non-reentrant model
;;
psect	text1,local,class=CODE,delta=2,merge=1,group=0
	line	39
global __ptext1
__ptext1:	;psect for function _picfix_read_signal
psect	text1
	file	"I:\81-PS2 Fun\23-Git\Projects\PicfixPCB_v8-v12\PIC12F508_Firmware\picfix_508.c"
	line	39
	
_picfix_read_signal:	
;incstack = 0
	callstack 1
; Regs used in _picfix_read_signal: [wreg-fsr0h+status,2+status,0]
psect	jmp_tab,class=ENTRY,delta=2
global __pjmp_tab
__pjmp_tab:
	global	entry__picfix_read_signal
entry__picfix_read_signal:
	ljmp	_picfix_read_signal

psect	text1
	line	42
	
l752:	
	movlw	0
	btfsc	(51/8),(51)&7	;volatile
	movlw	1
	movwf	(picfix_read_signal@sample1)
	line	43
	
l754:	
	asmopt	push
	asmopt	off
	nop
	asmopt	pop
	
l756:	
	asmopt	push
	asmopt	off
	nop
	asmopt	pop
	
l758:	
	asmopt	push
	asmopt	off
	nop
	asmopt	pop
	
l760:	
	asmopt	push
	asmopt	off
	nop
	asmopt	pop
	line	44
	movlw	0
	btfsc	(51/8),(51)&7	;volatile
	movlw	1
	movwf	(picfix_read_signal@sample2)
	line	46
	
l762:	
	clrf	(_picfix_read_signal$38)
	
l764:	
	movf	((picfix_read_signal@sample1)),w
	btfsc	status,2
	goto	u271
	goto	u270
u271:
	goto	l770
u270:
	
l766:	
	movf	((picfix_read_signal@sample2)),w
	btfsc	status,2
	goto	u281
	goto	u280
u281:
	goto	l770
u280:
	
l768:	
	movlw	01h
	movwf	(_picfix_read_signal$38)
	
l770:	
	movf	(_picfix_read_signal$38),w
	movwf	(?_picfix_read_signal)
	line	47
	
l30:	
	retlw 0
	callstack 0
GLOBAL	__end_of_picfix_read_signal
	__end_of_picfix_read_signal:
	signat	_picfix_read_signal,89
	global	_picfix_monitor_indicate

;; *************** function _picfix_monitor_indicate *****************
;; Defined at:
;;		line 28 in file "I:\81-PS2 Fun\23-Git\Projects\PicfixPCB_v8-v12\PIC12F508_Firmware\picfix_508.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1   21[None  ] void 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_picfix_handle_monitoring
;; This function uses a non-reentrant model
;;
psect	text2,local,class=CODE,delta=2,merge=1,group=0
	line	28
global __ptext2
__ptext2:	;psect for function _picfix_monitor_indicate
psect	text2
	file	"I:\81-PS2 Fun\23-Git\Projects\PicfixPCB_v8-v12\PIC12F508_Firmware\picfix_508.c"
	line	28
	
_picfix_monitor_indicate:	
;incstack = 0
	callstack 1
; Regs used in _picfix_monitor_indicate: [wreg-fsr0h+status,2+status,0]
psect	jmp_tab
	global	entry__picfix_monitor_indicate
entry__picfix_monitor_indicate:
	ljmp	_picfix_monitor_indicate

psect	text2
	line	29
	
l742:	
	movlw	low(032h)
	subwf	(_counter),w
	skipnc
	goto	u251
	goto	u250
u251:
	goto	l746
u250:
	line	30
	
l744:	
	bsf	(48/8),(48)&7	;volatile
	line	31
	goto	l748
	line	32
	
l746:	
	bcf	(48/8),(48)&7	;volatile
	line	35
	
l748:	
	movlw	low(01h)
	addwf	(_counter),f
		incf	(((_counter))),w
	btfss	status,2
	goto	u261
	goto	u260
u261:
	goto	l25
u260:
	
l750:	
	clrf	(_counter)
	line	36
	
l25:	
	retlw 0
	callstack 0
GLOBAL	__end_of_picfix_monitor_indicate
	__end_of_picfix_monitor_indicate:
	signat	_picfix_monitor_indicate,89
	global	_picfix_init

;; *************** function _picfix_init *****************
;; Defined at:
;;		line 20 in file "I:\81-PS2 Fun\23-Git\Projects\PicfixPCB_v8-v12\PIC12F508_Firmware\picfix_508.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1   18[None  ] void 
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text3,local,class=CODE,delta=2,merge=1,group=0
	line	20
global __ptext3
__ptext3:	;psect for function _picfix_init
psect	text3
	file	"I:\81-PS2 Fun\23-Git\Projects\PicfixPCB_v8-v12\PIC12F508_Firmware\picfix_508.c"
	line	20
	
_picfix_init:	
;incstack = 0
	callstack 1
; Regs used in _picfix_init: [wreg+status,2]
psect	jmp_tab
	global	entry__picfix_init
entry__picfix_init:
	ljmp	_picfix_init

psect	text3
	line	21
	
l736:	
	movlw	low(08h)
	tris	0x6
	line	22
	
l738:	
	clrf	(6)	;volatile
	line	23
	
l740:	
	movlw	low(0Fh)
	option
	line	24
# 24 "I:\81-PS2 Fun\23-Git\Projects\PicfixPCB_v8-v12\PIC12F508_Firmware\picfix_508.c"
clrwdt ;# 
psect	text3
	line	25
	
l19:	
	retlw 0
	callstack 0
GLOBAL	__end_of_picfix_init
	__end_of_picfix_init:
	signat	_picfix_init,89
	global	___awmod

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\Microchip\xc8\v3.00\pic\sources\c99\common\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] int 
;;  dividend        2    2[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    5[BANK0 ] unsigned char 
;;  counter         1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+0, btemp+1
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       4
;;      Locals:         0       2
;;      Temps:          0       0
;;      Totals:         0       6
;;Total ram usage:        6 bytes
;; Hardware stack levels used: 1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text4,local,class=CODE,delta=2,merge=1,group=1
	file	"C:\Program Files\Microchip\xc8\v3.00\pic\sources\c99\common\awmod.c"
	line	5
global __ptext4
__ptext4:	;psect for function ___awmod
psect	text4
	file	"C:\Program Files\Microchip\xc8\v3.00\pic\sources\c99\common\awmod.c"
	line	5
	
___awmod:	
;incstack = 0
	callstack 1
; Regs used in ___awmod: [wreg-fsr0h+status,2-btemp+1]
psect	jmp_tab
	global	entry____awmod
entry____awmod:
	ljmp	___awmod

psect	text4
	line	12
	
l774:	
	clrf	(___awmod@sign)
	line	13
	
l776:	
	btfss	(___awmod@dividend+1),7
	goto	u291
	goto	u290
u291:
	goto	l782
u290:
	line	14
	
l778:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	15
	
l780:	
	movlw	01h
	movwf	(___awmod@sign)
	line	17
	
l782:	
	btfss	(___awmod@divisor+1),7
	goto	u301
	goto	u300
u301:
	goto	l786
u300:
	line	18
	
l784:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	line	19
	
l786:	
	movf	((___awmod@divisor)),w
iorwf	((___awmod@divisor+1)),w
	btfsc	status,2
	goto	u311
	goto	u310
u311:
	goto	l804
u310:
	line	20
	
l788:	
	movlw	01h
	movwf	(___awmod@counter)
	line	21
	goto	l794
	line	22
	
l790:	
	movlw	01h
	movwf	btemp+0
u325:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	decfsz	btemp+0,f
	goto	u325
	line	23
	
l792:	
	movlw	low(01h)
	addwf	(___awmod@counter),f
	line	21
	
l794:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u331
	goto	u330
u331:
	goto	l790
u330:
	line	26
	
l796:	
	movf	(___awmod@divisor+1),w
	movwf	btemp+1
	movf	(___awmod@divisor),w
	movwf	btemp+0
	movf	1+wtemp0,w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u345
	movf	0+wtemp0,w
	subwf	(___awmod@dividend),w
u345:
	skipc
	goto	u341
	goto	u340
u341:
	goto	l800
u340:
	line	27
	
l798:	
	movf	(___awmod@divisor+1),w
	movwf	btemp+1
	movf	(___awmod@divisor),w
	movwf	btemp+0
	movf	0+wtemp0,w
	subwf	(___awmod@dividend),f
	movf	1+wtemp0,w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	line	28
	
l800:	
	movlw	01h
	movwf	btemp+0
u355:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	decfsz	btemp+0,f
	goto	u355
	line	29
	
l802:	
	movlw	01h
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u361
	goto	u360
u361:
	goto	l796
u360:
	line	31
	
l804:	
	movf	((___awmod@sign)),w
	btfsc	status,2
	goto	u371
	goto	u370
u371:
	goto	l808
u370:
	line	32
	
l806:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	33
	
l808:	
	movf	(___awmod@dividend+1),w
	movwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	movwf	(?___awmod)
	line	34
	
l272:	
	retlw 0
	callstack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
	signat	___awmod,8314
global	___latbits
___latbits	equ	0
	global	btemp
	btemp set 01Ch

	DABS	1,28,4	;btemp
	global	wtemp0
	wtemp0 set btemp+0
	global	wtemp1
	wtemp1 set btemp+2
	global	ttemp0
	ttemp0 set btemp+0
	global	ltemp0
	ltemp0 set btemp+0
	end
