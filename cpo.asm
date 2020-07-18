;		Author:Pranav Prabhu
;		Date:18 July 2020
;		Brief:Morse Code practice oscillator.Produces tone from piezo buzzer connted to GP1


	
	list		 p=12F508
	#include	<p12f508.inc>				

d1	equ	0x07



 __CONFIG    _MCLRE_ON & _CP_OFF & _WDT_OFF & _IntRC_OSC

RESET	;CODE	0x000
	movwf	OSCCAL

start 
	movlw	b'111101'	;set GP1 as output
	tris	GPIO		;set control register

flash
	movlw	b'000010'	;Switch on GP1
	movwf	GPIO
	call	delay1		;Call delay1 
	movlw	b'000000'	;Switch off GP1
	movwf	GPIO
	call	delay1		;Call delay1
	goto	flash

delay1	movlw	0xA6		;Delay1 function,to generate square wave tone
	movwf	d1
Delay_0
	decfsz	d1, f
	goto	Delay_0
	return

	END
