
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MyProject.c,1 :: 		void interrupt()
;MyProject.c,3 :: 		if(intcon.b2==1)
	BTFSS      INTCON+0, 2
	GOTO       L_interrupt0
;MyProject.c,5 :: 		portd.b0=~portd.b0;
	MOVLW      1
	XORWF      PORTD+0, 1
;MyProject.c,6 :: 		intcon.b2=0;
	BCF        INTCON+0, 2
;MyProject.c,7 :: 		}
L_interrupt0:
;MyProject.c,8 :: 		}
L_end_interrupt:
L__interrupt4:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;MyProject.c,9 :: 		void main() {
;MyProject.c,10 :: 		trisd=0;
	CLRF       TRISD+0
;MyProject.c,11 :: 		portd=0;
	CLRF       PORTD+0
;MyProject.c,12 :: 		option_reg.b5=0;
	BCF        OPTION_REG+0, 5
;MyProject.c,13 :: 		option_reg.b3=0;
	BCF        OPTION_REG+0, 3
;MyProject.c,14 :: 		option_reg.b2=1;
	BSF        OPTION_REG+0, 2
;MyProject.c,15 :: 		option_reg.b1=1;
	BSF        OPTION_REG+0, 1
;MyProject.c,16 :: 		option_reg.b0=1;
	BSF        OPTION_REG+0, 0
;MyProject.c,17 :: 		intcon.b7=1;
	BSF        INTCON+0, 7
;MyProject.c,18 :: 		intcon.b6=1;
	BSF        INTCON+0, 6
;MyProject.c,19 :: 		intcon.b5=1;
	BSF        INTCON+0, 5
;MyProject.c,20 :: 		intcon.b2=0;
	BCF        INTCON+0, 2
;MyProject.c,21 :: 		tmr0=61;
	MOVLW      61
	MOVWF      TMR0+0
;MyProject.c,22 :: 		while(1){}
L_main1:
	GOTO       L_main1
;MyProject.c,24 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
