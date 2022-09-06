
_main:

;color mixer.c,23 :: 		void main() {
;color mixer.c,25 :: 		int color[4]={0};
	CLRF       main_color_L0+0
	CLRF       main_color_L0+1
	CLRF       main_color_L0+2
	CLRF       main_color_L0+3
	CLRF       main_color_L0+4
	CLRF       main_color_L0+5
	CLRF       main_color_L0+6
	CLRF       main_color_L0+7
	MOVLW      3
	MOVWF      main_opt_L0+0
	MOVLW      0
	MOVWF      main_opt_L0+1
	CLRF       main_flag1_L0+0
	CLRF       main_flag1_L0+1
	CLRF       main_flag2_L0+0
	CLRF       main_flag2_L0+1
	CLRF       main_flag3_L0+0
	CLRF       main_flag3_L0+1
	CLRF       main_on_off_L0+0
	CLRF       main_on_off_L0+1
;color mixer.c,29 :: 		trisc=255;
	MOVLW      255
	MOVWF      TRISC+0
;color mixer.c,30 :: 		trisd=0;
	CLRF       TRISD+0
;color mixer.c,31 :: 		portd=0;
	CLRF       PORTD+0
;color mixer.c,32 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;color mixer.c,33 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;color mixer.c,34 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;color mixer.c,35 :: 		while(1)
L_main0:
;color mixer.c,36 :: 		{if(on_off==0)
	MOVLW      0
	XORWF      main_on_off_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main27
	MOVLW      0
	XORWF      main_on_off_L0+0, 0
L__main27:
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;color mixer.c,37 :: 		{  if(portc.b2==1 && flag1==0)// change options
	BTFSS      PORTC+0, 2
	GOTO       L_main5
	MOVLW      0
	XORWF      main_flag1_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main28
	MOVLW      0
	XORWF      main_flag1_L0+0, 0
L__main28:
	BTFSS      STATUS+0, 2
	GOTO       L_main5
L__main25:
;color mixer.c,38 :: 		{flag1=1;
	MOVLW      1
	MOVWF      main_flag1_L0+0
	MOVLW      0
	MOVWF      main_flag1_L0+1
;color mixer.c,39 :: 		opt++;//opt=4
	INCF       main_opt_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_opt_L0+1, 1
;color mixer.c,40 :: 		if(opt==4){opt=0;}
	MOVLW      0
	XORWF      main_opt_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main29
	MOVLW      4
	XORWF      main_opt_L0+0, 0
L__main29:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
	CLRF       main_opt_L0+0
	CLRF       main_opt_L0+1
L_main6:
;color mixer.c,41 :: 		if(opt==0){lcd_out(1,1,"   RED     ");}
	MOVLW      0
	XORWF      main_opt_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVLW      0
	XORWF      main_opt_L0+0, 0
L__main30:
	BTFSS      STATUS+0, 2
	GOTO       L_main7
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_color_32mixer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main8
L_main7:
;color mixer.c,42 :: 		else if (opt==1){lcd_out(1,1,"   BLUE     ");}
	MOVLW      0
	XORWF      main_opt_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main31
	MOVLW      1
	XORWF      main_opt_L0+0, 0
L__main31:
	BTFSS      STATUS+0, 2
	GOTO       L_main9
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_color_32mixer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main10
L_main9:
;color mixer.c,43 :: 		else if (opt==2){lcd_out(1,1,"   GREEN     ");}
	MOVLW      0
	XORWF      main_opt_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main32
	MOVLW      2
	XORWF      main_opt_L0+0, 0
L__main32:
	BTFSS      STATUS+0, 2
	GOTO       L_main11
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_color_32mixer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_main12
L_main11:
;color mixer.c,44 :: 		else if (opt==3){lcd_out(1,1,"   MIXER     ");}
	MOVLW      0
	XORWF      main_opt_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main33
	MOVLW      3
	XORWF      main_opt_L0+0, 0
L__main33:
	BTFSS      STATUS+0, 2
	GOTO       L_main13
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_color_32mixer+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_main13:
L_main12:
L_main10:
L_main8:
;color mixer.c,45 :: 		}
L_main5:
;color mixer.c,46 :: 		if(portc.b2==0){flag1=0;}
	BTFSC      PORTC+0, 2
	GOTO       L_main14
	CLRF       main_flag1_L0+0
	CLRF       main_flag1_L0+1
L_main14:
;color mixer.c,48 :: 		if(portc.b3==1 && flag2==0 && color[opt]<10){flag2=1; (color[opt])++;} // incre
	BTFSS      PORTC+0, 3
	GOTO       L_main17
	MOVLW      0
	XORWF      main_flag2_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main34
	MOVLW      0
	XORWF      main_flag2_L0+0, 0
L__main34:
	BTFSS      STATUS+0, 2
	GOTO       L_main17
	MOVF       main_opt_L0+0, 0
	MOVWF      R0+0
	MOVF       main_opt_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_color_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main35
	MOVLW      10
	SUBWF      R1+0, 0
L__main35:
	BTFSC      STATUS+0, 0
	GOTO       L_main17
L__main24:
	MOVLW      1
	MOVWF      main_flag2_L0+0
	MOVLW      0
	MOVWF      main_flag2_L0+1
	MOVF       main_opt_L0+0, 0
	MOVWF      R0+0
	MOVF       main_opt_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_color_L0+0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
L_main17:
;color mixer.c,49 :: 		if(portc.b3==0){flag2=0;}
	BTFSC      PORTC+0, 3
	GOTO       L_main18
	CLRF       main_flag2_L0+0
	CLRF       main_flag2_L0+1
L_main18:
;color mixer.c,51 :: 		if(portc.b4==1 && flag3==0 && color[opt]>0 ){flag3=1; (color[opt])--;} //decre
	BTFSS      PORTC+0, 4
	GOTO       L_main21
	MOVLW      0
	XORWF      main_flag3_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main36
	MOVLW      0
	XORWF      main_flag3_L0+0, 0
L__main36:
	BTFSS      STATUS+0, 2
	GOTO       L_main21
	MOVF       main_opt_L0+0, 0
	MOVWF      R0+0
	MOVF       main_opt_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_color_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main37
	MOVF       R1+0, 0
	SUBLW      0
L__main37:
	BTFSC      STATUS+0, 0
	GOTO       L_main21
L__main23:
	MOVLW      1
	MOVWF      main_flag3_L0+0
	MOVLW      0
	MOVWF      main_flag3_L0+1
	MOVF       main_opt_L0+0, 0
	MOVWF      R0+0
	MOVF       main_opt_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_color_L0+0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
	MOVLW      1
	SUBWF      R0+0, 1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
L_main21:
;color mixer.c,52 :: 		if(portc.b4==0){flag3=0;}
	BTFSC      PORTC+0, 4
	GOTO       L_main22
	CLRF       main_flag3_L0+0
	CLRF       main_flag3_L0+1
L_main22:
;color mixer.c,53 :: 		inttostr(color[opt],txt);
	MOVF       main_opt_L0+0, 0
	MOVWF      R0+0
	MOVF       main_opt_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      main_color_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_IntToStr_input+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      main_txt_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;color mixer.c,54 :: 		lcd_out(2,1,txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      main_txt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;color mixer.c,55 :: 		}
L_main2:
;color mixer.c,57 :: 		}
	GOTO       L_main0
;color mixer.c,58 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
