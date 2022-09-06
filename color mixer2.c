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
void change_opt(int *opt,int *flag1)
{
 if(portc.b2==1 && *flag1==0)
     {*flag1=1;
      (*opt)++;
      if(*opt==4){*opt=0;}
      if(*opt==0){lcd_out(1,1,"   RED     ");}
      else if (*opt==1){lcd_out(1,1,"   BLUE     ");}
      else if (*opt==2){lcd_out(1,1,"   GREEN     ");}
      else if (*opt==3){lcd_out(1,1,"   MIXER     ");}
     }
     if(portc.b2==0){*flag1=0;}
}
int max_time(int color[4])
{ int mx;
  int i;
  mx=color[0];

  for(i=1;i<3;i++)
  {
   if(color[i] > mx)
   {mx=color[i];}
  }
  return mx;
}
void making_color(int mx, int color[4],int *on_off)
{ int rclr,bclr,gclr,i;
  rclr=10*color[0];//10*3=30
  bclr=10*color[1];//10*5=50
  gclr=10*color[2];//10*7=70
  mx*=10;//70=green
  portd=7;//d0=1,d1=1,d2=1
  for(i=0;i<mx;i++)
  {
    if(i==rclr){portd.b0=0;}
    if(i==bclr){portd.b1=0;}
    if(i==gclr){portd.b2=0;}
    if(portc.b1==1){ *on_off=0;break;}
   delay_ms(100);
  }
  portd=0;
}

void mixing(int mix_t,int *on_off)
{ int i;
 if(*on_off==1)
 {
   mix_t*=10;
   portd.b3=1;//mixer
   for(i=0;i<mix_t;i++)
   {if(portc.b1==1){ *on_off=0;break;}
   delay_ms(100);
   }
   portd=0;
  }
}

void first_move(int *on_off)
{ if(*on_off==1)
  {
  portd.b4=1;//motor
  while(portc.b5==0) // sensor1
   {
     if(portc.b1==1){ *on_off=0;break;}

  }
  portd=0;
} }

void filling( int *on_off)
{ if(*on_off==1)
  {
   portd.b5=1;//VT
  while(portc.b6==1) // sensor0
   {
     if(portc.b1==1){ *on_off=0;break;}

  }
  portd=0;
  }
}

void second_move(int *on_off)
{ if(*on_off==1)
  {
  portd.b4=1;//motor
  while(portc.b7==0) // sensor2
   {
     if(portc.b1==1){ *on_off=0;break;}

  }
  portd=0;
} }

void capping(int *on_off)
{  int i;
  if(*on_off==1)
  {portd.b6=1;//capping
  for(i=0;i<30;i++)
   {if(portc.b1==1){ *on_off=0;break;}
   delay_ms(100);
   }
   portd=0;
  }
}



void main() {
char txt[17];
int mx;
int color[4]={0};
int opt=3;

int i;
int flag1=0,flag2=0,flag3=0;
int on_off=0;
trisc=255;
trisd=0;
portd=0;
Lcd_Init();                        // Initialize LCD
Lcd_Cmd(_LCD_CLEAR);               // Clear display
Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
 while(1)
 { if(portc.b1==1){ on_off=0;}
   else if(portc.b0==1){lcd_out(1,14,"ON "); on_off=1;}
 
  if(on_off==0)
   {   lcd_out(1,14,"OFF");
       change_opt(&opt,&flag1);

       if(portc.b3==1 && flag2==0 && color[opt]<10){flag2=1; (color[opt])++;}
       if(portc.b3==0){flag2=0;}

       if(portc.b4==1 && flag3==0 && color[opt]>0 ){flag3=1; (color[opt])--;}
       if(portc.b4==0){flag3=0;}
       inttostr(color[opt],txt);
       lcd_out(2,1,txt);
   }
  else// on_off=1
  { lcd_out(1,14,"ON ");
    mx=max_time(color);
    making_color(mx,color,&on_off);
    mixing(color[3],&on_off);
    first_move(&on_off);
    filling(&on_off);
    second_move(&on_off);
    capping(&on_off);
    on_off=0;
  }
 }
}