
_change_opt:

;color mixer2.c,21 :: 		void change_opt(int *opt,int *flag1)
;color mixer2.c,23 :: 		if(portc.b2==1 && *flag1==0)
	BTFSS      PORTC+0, 2
	GOTO       L_change_opt2
	MOVF       FARG_change_opt_flag1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__change_opt67
	MOVLW      0
	XORWF      R1+0, 0
L__change_opt67:
	BTFSS      STATUS+0, 2
	GOTO       L_change_opt2
L__change_opt63:
;color mixer2.c,24 :: 		{*flag1=1;
	MOVF       FARG_change_opt_flag1+0, 0
	MOVWF      FSR
	MOVLW      1
	MOVWF      INDF+0
	MOVLW      0
	INCF       FSR, 1
	MOVWF      INDF+0
;color mixer2.c,25 :: 		(*opt)++;
	MOVF       FARG_change_opt_opt+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
	INCF       R0+0, 1
	BTFSC      STATUS+0, 2
	INCF       R0+1, 1
	MOVF       FARG_change_opt_opt+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
;color mixer2.c,26 :: 		if(*opt==4){*opt=0;}
	MOVF       FARG_change_opt_opt+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__change_opt68
	MOVLW      4
	XORWF      R1+0, 0
L__change_opt68:
	BTFSS      STATUS+0, 2
	GOTO       L_change_opt3
	MOVF       FARG_change_opt_opt+0, 0
	MOVWF      FSR
	CLRF       INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
L_change_opt3:
;color mixer2.c,27 :: 		if(*opt==0){lcd_out(1,1,"   RED     ");}
	MOVF       FARG_change_opt_opt+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__change_opt69
	MOVLW      0
	XORWF      R1+0, 0
L__change_opt69:
	BTFSS      STATUS+0, 2
	GOTO       L_change_opt4
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_color_32mixer2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_change_opt5
L_change_opt4:
;color mixer2.c,28 :: 		else if (*opt==1){lcd_out(1,1,"   BLUE     ");}
	MOVF       FARG_change_opt_opt+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__change_opt70
	MOVLW      1
	XORWF      R1+0, 0
L__change_opt70:
	BTFSS      STATUS+0, 2
	GOTO       L_change_opt6
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_color_32mixer2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_change_opt7
L_change_opt6:
;color mixer2.c,29 :: 		else if (*opt==2){lcd_out(1,1,"   GREEN     ");}
	MOVF       FARG_change_opt_opt+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__change_opt71
	MOVLW      2
	XORWF      R1+0, 0
L__change_opt71:
	BTFSS      STATUS+0, 2
	GOTO       L_change_opt8
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_color_32mixer2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_change_opt9
L_change_opt8:
;color mixer2.c,30 :: 		else if (*opt==3){lcd_out(1,1,"   MIXER     ");}
	MOVF       FARG_change_opt_opt+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__change_opt72
	MOVLW      3
	XORWF      R1+0, 0
L__change_opt72:
	BTFSS      STATUS+0, 2
	GOTO       L_change_opt10
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_color_32mixer2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_change_opt10:
L_change_opt9:
L_change_opt7:
L_change_opt5:
;color mixer2.c,31 :: 		}
L_change_opt2:
;color mixer2.c,32 :: 		if(portc.b2==0){*flag1=0;}
	BTFSC      PORTC+0, 2
	GOTO       L_change_opt11
	MOVF       FARG_change_opt_flag1+0, 0
	MOVWF      FSR
	CLRF       INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
L_change_opt11:
;color mixer2.c,33 :: 		}
L_end_change_opt:
	RETURN
; end of _change_opt

_max_time:

;color mixer2.c,34 :: 		int max_time(int color[4])
;color mixer2.c,37 :: 		mx=color[0];
	MOVF       FARG_max_time_color+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R3+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R3+1
;color mixer2.c,39 :: 		for(i=1;i<3;i++)
	MOVLW      1
	MOVWF      R5+0
	MOVLW      0
	MOVWF      R5+1
L_max_time12:
	MOVLW      128
	XORWF      R5+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__max_time74
	MOVLW      3
	SUBWF      R5+0, 0
L__max_time74:
	BTFSC      STATUS+0, 0
	GOTO       L_max_time13
;color mixer2.c,41 :: 		if(color[i] > mx)
	MOVF       R5+0, 0
	MOVWF      R0+0
	MOVF       R5+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDWF      FARG_max_time_color+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      128
	XORWF      R3+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__max_time75
	MOVF       R1+0, 0
	SUBWF      R3+0, 0
L__max_time75:
	BTFSC      STATUS+0, 0
	GOTO       L_max_time15
;color mixer2.c,42 :: 		{mx=color[i];}
	MOVF       R5+0, 0
	MOVWF      R0+0
	MOVF       R5+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDWF      FARG_max_time_color+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R3+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R3+1
L_max_time15:
;color mixer2.c,39 :: 		for(i=1;i<3;i++)
	INCF       R5+0, 1
	BTFSC      STATUS+0, 2
	INCF       R5+1, 1
;color mixer2.c,43 :: 		}
	GOTO       L_max_time12
L_max_time13:
;color mixer2.c,44 :: 		return mx;
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
;color mixer2.c,45 :: 		}
L_end_max_time:
	RETURN
; end of _max_time

_making_color:

;color mixer2.c,46 :: 		void making_color(int mx, int color[4],int *on_off)
;color mixer2.c,48 :: 		rclr=10*color[0];//10*3=30
	MOVF       FARG_making_color_color+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      making_color_rclr_L0+0
	MOVF       R0+1, 0
	MOVWF      making_color_rclr_L0+1
;color mixer2.c,49 :: 		bclr=10*color[1];//10*5=50
	MOVLW      2
	ADDWF      FARG_making_color_color+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      making_color_bclr_L0+0
	MOVF       R0+1, 0
	MOVWF      making_color_bclr_L0+1
;color mixer2.c,50 :: 		gclr=10*color[2];//10*7=70
	MOVLW      4
	ADDWF      FARG_making_color_color+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      making_color_gclr_L0+0
	MOVF       R0+1, 0
	MOVWF      making_color_gclr_L0+1
;color mixer2.c,51 :: 		mx*=10;//70=green
	MOVF       FARG_making_color_mx+0, 0
	MOVWF      R0+0
	MOVF       FARG_making_color_mx+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_making_color_mx+0
	MOVF       R0+1, 0
	MOVWF      FARG_making_color_mx+1
;color mixer2.c,52 :: 		portd=7;//d0=1,d1=1,d2=1
	MOVLW      7
	MOVWF      PORTD+0
;color mixer2.c,53 :: 		for(i=0;i<mx;i++)
	CLRF       making_color_i_L0+0
	CLRF       making_color_i_L0+1
L_making_color16:
	MOVLW      128
	XORWF      making_color_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_making_color_mx+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__making_color77
	MOVF       FARG_making_color_mx+0, 0
	SUBWF      making_color_i_L0+0, 0
L__making_color77:
	BTFSC      STATUS+0, 0
	GOTO       L_making_color17
;color mixer2.c,55 :: 		if(i==rclr){portd.b0=0;}
	MOVF       making_color_i_L0+1, 0
	XORWF      making_color_rclr_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__making_color78
	MOVF       making_color_rclr_L0+0, 0
	XORWF      making_color_i_L0+0, 0
L__making_color78:
	BTFSS      STATUS+0, 2
	GOTO       L_making_color19
	BCF        PORTD+0, 0
L_making_color19:
;color mixer2.c,56 :: 		if(i==bclr){portd.b1=0;}
	MOVF       making_color_i_L0+1, 0
	XORWF      making_color_bclr_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__making_color79
	MOVF       making_color_bclr_L0+0, 0
	XORWF      making_color_i_L0+0, 0
L__making_color79:
	BTFSS      STATUS+0, 2
	GOTO       L_making_color20
	BCF        PORTD+0, 1
L_making_color20:
;color mixer2.c,57 :: 		if(i==gclr){portd.b2=0;}
	MOVF       making_color_i_L0+1, 0
	XORWF      making_color_gclr_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__making_color80
	MOVF       making_color_gclr_L0+0, 0
	XORWF      making_color_i_L0+0, 0
L__making_color80:
	BTFSS      STATUS+0, 2
	GOTO       L_making_color21
	BCF        PORTD+0, 2
L_making_color21:
;color mixer2.c,58 :: 		if(portc.b1==1){ *on_off=0;break;}
	BTFSS      PORTC+0, 1
	GOTO       L_making_color22
	MOVF       FARG_making_color_on_off+0, 0
	MOVWF      FSR
	CLRF       INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	GOTO       L_making_color17
L_making_color22:
;color mixer2.c,59 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_making_color23:
	DECFSZ     R13+0, 1
	GOTO       L_making_color23
	DECFSZ     R12+0, 1
	GOTO       L_making_color23
	NOP
	NOP
;color mixer2.c,53 :: 		for(i=0;i<mx;i++)
	INCF       making_color_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       making_color_i_L0+1, 1
;color mixer2.c,60 :: 		}
	GOTO       L_making_color16
L_making_color17:
;color mixer2.c,61 :: 		portd=0;
	CLRF       PORTD+0
;color mixer2.c,62 :: 		}
L_end_making_color:
	RETURN
; end of _making_color

_mixing:

;color mixer2.c,64 :: 		void mixing(int mix_t,int *on_off)
;color mixer2.c,66 :: 		if(*on_off==1)
	MOVF       FARG_mixing_on_off+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mixing82
	MOVLW      1
	XORWF      R1+0, 0
L__mixing82:
	BTFSS      STATUS+0, 2
	GOTO       L_mixing24
;color mixer2.c,68 :: 		mix_t*=10;
	MOVF       FARG_mixing_mix_t+0, 0
	MOVWF      R0+0
	MOVF       FARG_mixing_mix_t+1, 0
	MOVWF      R0+1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_mixing_mix_t+0
	MOVF       R0+1, 0
	MOVWF      FARG_mixing_mix_t+1
;color mixer2.c,69 :: 		portd.b3=1;//mixer
	BSF        PORTD+0, 3
;color mixer2.c,70 :: 		for(i=0;i<mix_t;i++)
	CLRF       mixing_i_L0+0
	CLRF       mixing_i_L0+1
L_mixing25:
	MOVLW      128
	XORWF      mixing_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_mixing_mix_t+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__mixing83
	MOVF       FARG_mixing_mix_t+0, 0
	SUBWF      mixing_i_L0+0, 0
L__mixing83:
	BTFSC      STATUS+0, 0
	GOTO       L_mixing26
;color mixer2.c,71 :: 		{if(portc.b1==1){ *on_off=0;break;}
	BTFSS      PORTC+0, 1
	GOTO       L_mixing28
	MOVF       FARG_mixing_on_off+0, 0
	MOVWF      FSR
	CLRF       INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	GOTO       L_mixing26
L_mixing28:
;color mixer2.c,72 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_mixing29:
	DECFSZ     R13+0, 1
	GOTO       L_mixing29
	DECFSZ     R12+0, 1
	GOTO       L_mixing29
	NOP
	NOP
;color mixer2.c,70 :: 		for(i=0;i<mix_t;i++)
	INCF       mixing_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       mixing_i_L0+1, 1
;color mixer2.c,73 :: 		}
	GOTO       L_mixing25
L_mixing26:
;color mixer2.c,74 :: 		portd=0;
	CLRF       PORTD+0
;color mixer2.c,75 :: 		}
L_mixing24:
;color mixer2.c,76 :: 		}
L_end_mixing:
	RETURN
; end of _mixing

_first_move:

;color mixer2.c,78 :: 		void first_move(int *on_off)
;color mixer2.c,79 :: 		{ if(*on_off==1)
	MOVF       FARG_first_move_on_off+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__first_move85
	MOVLW      1
	XORWF      R1+0, 0
L__first_move85:
	BTFSS      STATUS+0, 2
	GOTO       L_first_move30
;color mixer2.c,81 :: 		portd.b4=1;//motor
	BSF        PORTD+0, 4
;color mixer2.c,82 :: 		while(portc.b5==0) // sensor1
L_first_move31:
	BTFSC      PORTC+0, 5
	GOTO       L_first_move32
;color mixer2.c,84 :: 		if(portc.b1==1){ *on_off=0;break;}
	BTFSS      PORTC+0, 1
	GOTO       L_first_move33
	MOVF       FARG_first_move_on_off+0, 0
	MOVWF      FSR
	CLRF       INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	GOTO       L_first_move32
L_first_move33:
;color mixer2.c,86 :: 		}
	GOTO       L_first_move31
L_first_move32:
;color mixer2.c,87 :: 		portd=0;
	CLRF       PORTD+0
;color mixer2.c,88 :: 		} }
L_first_move30:
L_end_first_move:
	RETURN
; end of _first_move

_filling:

;color mixer2.c,90 :: 		void filling( int *on_off)
;color mixer2.c,91 :: 		{ if(*on_off==1)
	MOVF       FARG_filling_on_off+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__filling87
	MOVLW      1
	XORWF      R1+0, 0
L__filling87:
	BTFSS      STATUS+0, 2
	GOTO       L_filling34
;color mixer2.c,93 :: 		portd.b5=1;//VT
	BSF        PORTD+0, 5
;color mixer2.c,94 :: 		while(portc.b6==1) // sensor0
L_filling35:
	BTFSS      PORTC+0, 6
	GOTO       L_filling36
;color mixer2.c,96 :: 		if(portc.b1==1){ *on_off=0;break;}
	BTFSS      PORTC+0, 1
	GOTO       L_filling37
	MOVF       FARG_filling_on_off+0, 0
	MOVWF      FSR
	CLRF       INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	GOTO       L_filling36
L_filling37:
;color mixer2.c,98 :: 		}
	GOTO       L_filling35
L_filling36:
;color mixer2.c,99 :: 		portd=0;
	CLRF       PORTD+0
;color mixer2.c,100 :: 		}
L_filling34:
;color mixer2.c,101 :: 		}
L_end_filling:
	RETURN
; end of _filling

_second_move:

;color mixer2.c,103 :: 		void second_move(int *on_off)
;color mixer2.c,104 :: 		{ if(*on_off==1)
	MOVF       FARG_second_move_on_off+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__second_move89
	MOVLW      1
	XORWF      R1+0, 0
L__second_move89:
	BTFSS      STATUS+0, 2
	GOTO       L_second_move38
;color mixer2.c,106 :: 		portd.b4=1;//motor
	BSF        PORTD+0, 4
;color mixer2.c,107 :: 		while(portc.b7==0) // sensor2
L_second_move39:
	BTFSC      PORTC+0, 7
	GOTO       L_second_move40
;color mixer2.c,109 :: 		if(portc.b1==1){ *on_off=0;break;}
	BTFSS      PORTC+0, 1
	GOTO       L_second_move41
	MOVF       FARG_second_move_on_off+0, 0
	MOVWF      FSR
	CLRF       INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	GOTO       L_second_move40
L_second_move41:
;color mixer2.c,111 :: 		}
	GOTO       L_second_move39
L_second_move40:
;color mixer2.c,112 :: 		portd=0;
	CLRF       PORTD+0
;color mixer2.c,113 :: 		} }
L_second_move38:
L_end_second_move:
	RETURN
; end of _second_move

_capping:

;color mixer2.c,115 :: 		void capping(int *on_off)
;color mixer2.c,117 :: 		if(*on_off==1)
	MOVF       FARG_capping_on_off+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R1+0
	INCF       FSR, 1
	MOVF       INDF+0, 0
	MOVWF      R1+1
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__capping91
	MOVLW      1
	XORWF      R1+0, 0
L__capping91:
	BTFSS      STATUS+0, 2
	GOTO       L_capping42
;color mixer2.c,118 :: 		{portd.b6=1;//capping
	BSF        PORTD+0, 6
;color mixer2.c,119 :: 		for(i=0;i<30;i++)
	CLRF       R3+0
	CLRF       R3+1
L_capping43:
	MOVLW      128
	XORWF      R3+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__capping92
	MOVLW      30
	SUBWF      R3+0, 0
L__capping92:
	BTFSC      STATUS+0, 0
	GOTO       L_capping44
;color mixer2.c,120 :: 		{if(portc.b1==1){ *on_off=0;break;}
	BTFSS      PORTC+0, 1
	GOTO       L_capping46
	MOVF       FARG_capping_on_off+0, 0
	MOVWF      FSR
	CLRF       INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	GOTO       L_capping44
L_capping46:
;color mixer2.c,121 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_capping47:
	DECFSZ     R13+0, 1
	GOTO       L_capping47
	DECFSZ     R12+0, 1
	GOTO       L_capping47
	NOP
	NOP
;color mixer2.c,119 :: 		for(i=0;i<30;i++)
	INCF       R3+0, 1
	BTFSC      STATUS+0, 2
	INCF       R3+1, 1
;color mixer2.c,122 :: 		}
	GOTO       L_capping43
L_capping44:
;color mixer2.c,123 :: 		portd=0;
	CLRF       PORTD+0
;color mixer2.c,124 :: 		}
L_capping42:
;color mixer2.c,125 :: 		}
L_end_capping:
	RETURN
; end of _capping

_main:

;color mixer2.c,129 :: 		void main() {
;color mixer2.c,132 :: 		int color[4]={0};
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
;color mixer2.c,138 :: 		trisc=255;
	MOVLW      255
	MOVWF      TRISC+0
;color mixer2.c,139 :: 		trisd=0;
	CLRF       TRISD+0
;color mixer2.c,140 :: 		portd=0;
	CLRF       PORTD+0
;color mixer2.c,141 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;color mixer2.c,142 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;color mixer2.c,143 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;color mixer2.c,144 :: 		while(1)
L_main48:
;color mixer2.c,145 :: 		{ if(portc.b1==1){ on_off=0;}
	BTFSS      PORTC+0, 1
	GOTO       L_main50
	CLRF       main_on_off_L0+0
	CLRF       main_on_off_L0+1
	GOTO       L_main51
L_main50:
;color mixer2.c,146 :: 		else if(portc.b0==1){lcd_out(1,14,"ON "); on_off=1;}
	BTFSS      PORTC+0, 0
	GOTO       L_main52
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_color_32mixer2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      1
	MOVWF      main_on_off_L0+0
	MOVLW      0
	MOVWF      main_on_off_L0+1
L_main52:
L_main51:
;color mixer2.c,148 :: 		if(on_off==0)
	MOVLW      0
	XORWF      main_on_off_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main94
	MOVLW      0
	XORWF      main_on_off_L0+0, 0
L__main94:
	BTFSS      STATUS+0, 2
	GOTO       L_main53
;color mixer2.c,149 :: 		{   lcd_out(1,14,"OFF");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_color_32mixer2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;color mixer2.c,150 :: 		change_opt(&opt,&flag1);
	MOVLW      main_opt_L0+0
	MOVWF      FARG_change_opt_opt+0
	MOVLW      main_flag1_L0+0
	MOVWF      FARG_change_opt_flag1+0
	CALL       _change_opt+0
;color mixer2.c,152 :: 		if(portc.b3==1 && flag2==0 && color[opt]<10){flag2=1; (color[opt])++;}
	BTFSS      PORTC+0, 3
	GOTO       L_main56
	MOVLW      0
	XORWF      main_flag2_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main95
	MOVLW      0
	XORWF      main_flag2_L0+0, 0
L__main95:
	BTFSS      STATUS+0, 2
	GOTO       L_main56
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
	GOTO       L__main96
	MOVLW      10
	SUBWF      R1+0, 0
L__main96:
	BTFSC      STATUS+0, 0
	GOTO       L_main56
L__main65:
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
L_main56:
;color mixer2.c,153 :: 		if(portc.b3==0){flag2=0;}
	BTFSC      PORTC+0, 3
	GOTO       L_main57
	CLRF       main_flag2_L0+0
	CLRF       main_flag2_L0+1
L_main57:
;color mixer2.c,155 :: 		if(portc.b4==1 && flag3==0 && color[opt]>0 ){flag3=1; (color[opt])--;}
	BTFSS      PORTC+0, 4
	GOTO       L_main60
	MOVLW      0
	XORWF      main_flag3_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main97
	MOVLW      0
	XORWF      main_flag3_L0+0, 0
L__main97:
	BTFSS      STATUS+0, 2
	GOTO       L_main60
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
	GOTO       L__main98
	MOVF       R1+0, 0
	SUBLW      0
L__main98:
	BTFSC      STATUS+0, 0
	GOTO       L_main60
L__main64:
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
L_main60:
;color mixer2.c,156 :: 		if(portc.b4==0){flag3=0;}
	BTFSC      PORTC+0, 4
	GOTO       L_main61
	CLRF       main_flag3_L0+0
	CLRF       main_flag3_L0+1
L_main61:
;color mixer2.c,157 :: 		inttostr(color[opt],txt);
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
;color mixer2.c,158 :: 		lcd_out(2,1,txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      main_txt_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;color mixer2.c,159 :: 		}
	GOTO       L_main62
L_main53:
;color mixer2.c,161 :: 		{ lcd_out(1,14,"ON ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      14
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_color_32mixer2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;color mixer2.c,162 :: 		mx=max_time(color);
	MOVLW      main_color_L0+0
	MOVWF      FARG_max_time_color+0
	CALL       _max_time+0
;color mixer2.c,163 :: 		making_color(mx,color,&on_off);
	MOVF       R0+0, 0
	MOVWF      FARG_making_color_mx+0
	MOVF       R0+1, 0
	MOVWF      FARG_making_color_mx+1
	MOVLW      main_color_L0+0
	MOVWF      FARG_making_color_color+0
	MOVLW      main_on_off_L0+0
	MOVWF      FARG_making_color_on_off+0
	CALL       _making_color+0
;color mixer2.c,164 :: 		mixing(color[3],&on_off);
	MOVF       main_color_L0+6, 0
	MOVWF      FARG_mixing_mix_t+0
	MOVF       main_color_L0+7, 0
	MOVWF      FARG_mixing_mix_t+1
	MOVLW      main_on_off_L0+0
	MOVWF      FARG_mixing_on_off+0
	CALL       _mixing+0
;color mixer2.c,165 :: 		first_move(&on_off);
	MOVLW      main_on_off_L0+0
	MOVWF      FARG_first_move_on_off+0
	CALL       _first_move+0
;color mixer2.c,166 :: 		filling(&on_off);
	MOVLW      main_on_off_L0+0
	MOVWF      FARG_filling_on_off+0
	CALL       _filling+0
;color mixer2.c,167 :: 		second_move(&on_off);
	MOVLW      main_on_off_L0+0
	MOVWF      FARG_second_move_on_off+0
	CALL       _second_move+0
;color mixer2.c,168 :: 		capping(&on_off);
	MOVLW      main_on_off_L0+0
	MOVWF      FARG_capping_on_off+0
	CALL       _capping+0
;color mixer2.c,169 :: 		on_off=0;
	CLRF       main_on_off_L0+0
	CLRF       main_on_off_L0+1
;color mixer2.c,170 :: 		}
L_main62:
;color mixer2.c,171 :: 		}
	GOTO       L_main48
;color mixer2.c,172 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
