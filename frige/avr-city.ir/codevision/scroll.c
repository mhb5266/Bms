#include <mega16.h>
#include <tm1637.h>

//PORTD=0x12;
//PORTC=0x15;
//PORTB=0x18;
//PORTA=0x1b;

#asm
 .equ __tm1637_port=0X1b; //PORTA
 .equ __clk_bit=0;
 .equ __dio_bit=1;
#endasm


void main(void)
{
tm1637_init();
tm1637_scrolldelay(400);

while (1)
      {
      tm1637_scroll("    ----HELLO----    ");
      }
}