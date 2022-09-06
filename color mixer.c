 // LCD module connections
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;

// strat c0
// stop c1
//option c2
// incr  c3
// decr c4


void main() {
char txt[17];
int color[4]={0};
int opt=3;
int flag1=0,flag2=0,flag3=0;
int on_off=0;
trisc=255;
trisd=0;
portd=0;
Lcd_Init();                        // Initialize LCD
Lcd_Cmd(_LCD_CLEAR);               // Clear display
Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
 while(1)
 {if(on_off==0)
 {  if(portc.b2==1 && flag1==0)// change options
     {flag1=1;
      opt++;//opt=4
      if(opt==4){opt=0;}
      if(opt==0){lcd_out(1,1,"   RED     ");}
      else if (opt==1){lcd_out(1,1,"   BLUE     ");}
      else if (opt==2){lcd_out(1,1,"   GREEN     ");}
      else if (opt==3){lcd_out(1,1,"   MIXER     ");}
     }
     if(portc.b2==0){flag1=0;}
     
     if(portc.b3==1 && flag2==0 && color[opt]<10){flag2=1; (color[opt])++;} // incre
     if(portc.b3==0){flag2=0;}
     
     if(portc.b4==1 && flag3==0 && color[opt]>0 ){flag3=1; (color[opt])--;} //decre
     if(portc.b4==0){flag3=0;}
     inttostr(color[opt],txt);
     lcd_out(2,1,txt);
 }
 
 }
}