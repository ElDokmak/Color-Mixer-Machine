void interrupt()
 {
  if(intcon.b2==1)
   {
    portd.b0=~portd.b0;
    intcon.b2=0;
   }
 }
void main() {
trisd=0;
portd=0;
 option_reg.b5=0;
 option_reg.b3=0;
 option_reg.b2=1;
 option_reg.b1=1;
 option_reg.b0=1;
 intcon.b7=1;
 intcon.b6=1;
 intcon.b5=1;
 intcon.b2=0;
 tmr0=61;
 while(1){}
 
}