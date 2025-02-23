#include <mega32a.h>

#include <ds1307.h>
#include <glcd.h>
#include <font5x7.h>
#include <mhbfont.c>
#include "arial.h" 
#include "Image\pic.h"  
#include "FONT\Font.h"  
#include "FONT\font\AF8x8.h"         
//#include "FONT\font\AF9x10.h" 
//#include "FONT\font\AF9x11.h"
//#include "FONT\font\AF12x16.h"

//#include "FONT\font\f5x7.h"
//#include "FONT\font\f9x14.h" 
//#include "FONT\font\f10x20.h"
 
#include <defines.c>
#define mhb 0xa3
#define ant 0xa3
#define ant1 0x99
#define ant2 0xa4
#define ant3 0xa8
#define ant4 0xaa
#define bat 0xac
#define bat1 0xad
#define bat2 0xaf
#define bat3 0xb2
#define like 0x88
#define unlike 0x89
#define alarm 0x8b
#define speaker 0x8f
#define music 0x91
#define plugin 0x92
#define temp 0x93
#define hum 0x94
#define lock 0xa6
#define unlock 0xa7

// Declare your global variables here
unsigned char str[20];
unsigned char i=0;

void main(void)
{
// Declare your local variables here
// Variable used to store graphic display
// controller initialization data
GLCDINIT_t glcd_init_data;

// Input/Output Ports initialization
// Port A initialization
// Function: Bit7=In Bit6=In Bit5=In Bit4=In Bit3=In Bit2=In Bit1=In Bit0=In 
DDRA=(0<<DDA7) | (0<<DDA6) | (0<<DDA5) | (0<<DDA4) | (0<<DDA3) | (0<<DDA2) | (0<<DDA1) | (0<<DDA0);
// State: Bit7=T Bit6=T Bit5=T Bit4=T Bit3=T Bit2=T Bit1=T Bit0=T 
PORTA=(0<<PORTA7) | (0<<PORTA6) | (0<<PORTA5) | (0<<PORTA4) | (0<<PORTA3) | (0<<PORTA2) | (0<<PORTA1) | (0<<PORTA0);

// Port B initialization
// Function: Bit7=In Bit6=In Bit5=In Bit4=In Bit3=In Bit2=In Bit1=In Bit0=In 
DDRB=(0<<DDB7) | (0<<DDB6) | (0<<DDB5) | (0<<DDB4) | (0<<DDB3) | (0<<DDB2) | (0<<DDB1) | (0<<DDB0);
// State: Bit7=T Bit6=T Bit5=T Bit4=T Bit3=T Bit2=T Bit1=T Bit0=T 
PORTB=(0<<PORTB7) | (0<<PORTB6) | (0<<PORTB5) | (0<<PORTB4) | (0<<PORTB3) | (0<<PORTB2) | (0<<PORTB1) | (0<<PORTB0);

// Port C initialization
// Function: Bit7=In Bit6=In Bit5=In Bit4=In Bit3=In Bit2=In Bit1=In Bit0=In 
DDRC=(0<<DDC7) | (0<<DDC6) | (0<<DDC5) | (0<<DDC4) | (0<<DDC3) | (0<<DDC2) | (0<<DDC1) | (0<<DDC0);
// State: Bit7=T Bit6=T Bit5=T Bit4=T Bit3=T Bit2=T Bit1=T Bit0=T 
PORTC=(0<<PORTC7) | (0<<PORTC6) | (0<<PORTC5) | (0<<PORTC4) | (0<<PORTC3) | (0<<PORTC2) | (0<<PORTC1) | (0<<PORTC0);

// Port D initialization
// Function: Bit7=In Bit6=In Bit5=In Bit4=In Bit3=In Bit2=In Bit1=In Bit0=In 
DDRD=(0<<DDD7) | (0<<DDD6) | (0<<DDD5) | (0<<DDD4) | (0<<DDD3) | (0<<DDD2) | (0<<DDD1) | (0<<DDD0);
// State: Bit7=T Bit6=T Bit5=T Bit4=T Bit3=T Bit2=T Bit1=T Bit0=T 
PORTD=(0<<PORTD7) | (0<<PORTD6) | (0<<PORTD5) | (0<<PORTD4) | (0<<PORTD3) | (0<<PORTD2) | (0<<PORTD1) | (0<<PORTD0);

// Timer/Counter 0 initialization
// Clock source: System Clock
// Clock value: Timer 0 Stopped
// Mode: Normal top=0xFF
// OC0 output: Disconnected
TCCR0=(0<<WGM00) | (0<<COM01) | (0<<COM00) | (0<<WGM01) | (0<<CS02) | (0<<CS01) | (0<<CS00);
TCNT0=0x00;
OCR0=0x00;

// Timer/Counter 1 initialization
// Clock source: System Clock
// Clock value: Timer1 Stopped
// Mode: Normal top=0xFFFF
// OC1A output: Disconnected
// OC1B output: Disconnected
// Noise Canceler: Off
// Input Capture on Falling Edge
// Timer1 Overflow Interrupt: Off
// Input Capture Interrupt: Off
// Compare A Match Interrupt: Off
// Compare B Match Interrupt: Off
TCCR1A=(0<<COM1A1) | (0<<COM1A0) | (0<<COM1B1) | (0<<COM1B0) | (0<<WGM11) | (0<<WGM10);
TCCR1B=(0<<ICNC1) | (0<<ICES1) | (0<<WGM13) | (0<<WGM12) | (0<<CS12) | (0<<CS11) | (0<<CS10);
TCNT1H=0x00;
TCNT1L=0x00;
ICR1H=0x00;
ICR1L=0x00;
OCR1AH=0x00;
OCR1AL=0x00;
OCR1BH=0x00;
OCR1BL=0x00;

// Timer/Counter 2 initialization
// Clock source: System Clock
// Clock value: Timer2 Stopped
// Mode: Normal top=0xFF
// OC2 output: Disconnected
ASSR=0<<AS2;
TCCR2=(0<<PWM2) | (0<<COM21) | (0<<COM20) | (0<<CTC2) | (0<<CS22) | (0<<CS21) | (0<<CS20);
TCNT2=0x00;
OCR2=0x00;

// Timer(s)/Counter(s) Interrupt(s) initialization
TIMSK=(0<<OCIE2) | (0<<TOIE2) | (0<<TICIE1) | (0<<OCIE1A) | (0<<OCIE1B) | (0<<TOIE1) | (0<<OCIE0) | (0<<TOIE0);

// External Interrupt(s) initialization
// INT0: Off
// INT1: Off
// INT2: Off
MCUCR=(0<<ISC11) | (0<<ISC10) | (0<<ISC01) | (0<<ISC00);
MCUCSR=(0<<ISC2);

// USART initialization
// USART disabled
UCSRB=(0<<RXCIE) | (0<<TXCIE) | (0<<UDRIE) | (0<<RXEN) | (0<<TXEN) | (0<<UCSZ2) | (0<<RXB8) | (0<<TXB8);

// Analog Comparator initialization
// Analog Comparator: Off
// The Analog Comparator's positive input is
// connected to the AIN0 pin
// The Analog Comparator's negative input is
// connected to the AIN1 pin
ACSR=(1<<ACD) | (0<<ACBG) | (0<<ACO) | (0<<ACI) | (0<<ACIE) | (0<<ACIC) | (0<<ACIS1) | (0<<ACIS0);
SFIOR=(0<<ACME);

// ADC initialization
// ADC disabled
ADCSRA=(0<<ADEN) | (0<<ADSC) | (0<<ADATE) | (0<<ADIF) | (0<<ADIE) | (0<<ADPS2) | (0<<ADPS1) | (0<<ADPS0);

// SPI initialization
// SPI disabled
SPCR=(0<<SPIE) | (0<<SPE) | (0<<DORD) | (0<<MSTR) | (0<<CPOL) | (0<<CPHA) | (0<<SPR1) | (0<<SPR0);

// TWI initialization
// TWI disabled
TWCR=(0<<TWEA) | (0<<TWSTA) | (0<<TWSTO) | (0<<TWEN) | (0<<TWIE);

// Graphic Display Controller initialization
// The ST7920 connections are specified in the
// Project|Configure|C Compiler|Libraries|Graphic Display menu:
// E - PORTA Bit 0
// R /W - PORTA Bit 1
// RS - PORTA Bit 2
// /RST - PORTA Bit 3
// DB4 - PORTA Bit 4
// DB5 - PORTA Bit 5
// DB6 - PORTA Bit 6
// DB7 - PORTA Bit 7
// Specify the current font for displaying text
glcd_init_data.font=font5x7;
// No function is used for reading
// image data from external memory
glcd_init_data.readxmem=NULL;
// No function is used for writing
// image data to external memory
glcd_init_data.writexmem=NULL;

glcd_init(&glcd_init_data);
glcd_clear();         
LcdFont(AF8x8);      
SetLetter(E_LETTER);  

SetLine(0,0);
PutChar(ant);
SetLine(0,1);
PutChar(ant4);
SetLine(0,3);
PutChar(bat2);
SetLine(0,4);
PutChar(alarm);
SetLine(0,5);
PutChar(speaker);
SetLine(0,6);
PutChar(music);
SetLine(0,7);
PutChar(plugin);
SetLine(0,8);
PutChar(temp);
SetLine(0,9);
PutChar(hum);
SetLine(0,10);
PutChar(lock);
SetLine(0,11);
PutChar(unlock);
SetLine(0,12);
PutChar(like);
SetLine(0,13);
PutChar(unlike);

/*LcdFont(mhbfont); 
delay_ms(2000);
glcd_clear();
delay_ms(2000);
glcd_setfont(mhbfont);
SetLine(0,0);
PutChar(mhb);
delay_ms(2000);
glcd_clear();
*/

SetLine(1,0);
Puts("hello world!");
SetLine(2,0);
Puts("test 12345");


delay_ms(2000);
glcd_clear();

SetLetter(P_LETTER); 
SetLine(0,0);
Puts("�� ��� ���");
DrawStringAt(1,0,"����",BLACK,WHITE);
DrawStringAt(2,0,"���� ��� �����",BLACK,WHITE);
DrawStringAt(3,0,"����� �������",BLACK,WHITE);
DrawStringAt(4,0,"������",BLACK,WHITE);
 
delay_ms(2000);
glcd_clear();

glcd_putimagef(0,0, truck, 1);

delay_ms(2000);
glcd_clear();

while (1)
      { 
 
      for(i=0;i<=10;i++){
        lcd_gotoxy(0,0);
        glcd_setfont(arial);
        glcd_outtextxyf(0,32,"Emtechnic.ir"); 
        sprintf(str,"value=%d ",i); 
        glcd_setcolor(0); 
        glcd_setbkcolor(1);       
       glcd_outtextxy(0,48,str); 
       glcd_setcolor(1); 
       glcd_setbkcolor(0);        
       delay_ms(250);   
       
      rtc_get_time(&_hour,&_min,&_sec);
      sprintf(strsec,"%02d:%02d:%02d",_hour,_min,_sec);


      lcd_gotoxy(0,1);
      lcd_puts(strsec); 
      rtc_get_date(&_wday,&_day,&_month,&_year);
      _wday--;
      sh_year=_year+1400;
      sprintf(strsec,"%4d/%02d/%02d",sh_year,_month,_day);
      //switch(_wday){
       //case(1):_weekday="SAT";
       //case(2):_weekday="SUN";
       //case(3):_weekday="MON";
       //case(4):_weekday="TUE";
       //case(5):_weekday="WED";
       //case(6):_weekday="THU";
       //case(7):_weekday="FRI"; 
       //default:_weekday="___"; 
      //}     
     
      lcd_gotoxy(0,0);
      lcd_puts(strsec); 
      //_weekday[]="s";     
      //if (_sec==2) a^;
      //glcd_display(a);
      
      strcpy(strsec,_weekday[_wday]);
      lcd_gotoxy(11,0);
      lcd_puts(strsec);       
      /*lcd_gotoxy(0,0); 
      lcd_puts("11");                     
      glcd_rectangle(0, 0, 18, 18);
      delay_ms(2000);                   
      glcd_clear();
      delay_ms(750);
      //glcd_setcolor(0);
      //glcd_setbkcolor(1);
      delay_ms(2000);   
      glcd_setfont(she);
      delay_ms(2000);      
      glcd_outtext("!");
      //lcd_puts("!");
      //glcd_setcolor(1);
      //glcd_setbkcolor(0);
      //lcd_puts("!");
      delay_ms(500);
      glcd_clear();
      
    
      glcd_rectangle(30, 30, 45, 45); 
      glcd_setfont(she);
      glcd_setcolor(0);
      glcd_setbkcolor(1);
      glcd_outtextxy(33, 33, "!"); 
      delay_ms(2000);   
      glcd_setcolor(1);
      glcd_setbkcolor(0);
      glcd_cleartext();   
      delay_ms(2000);   
      rtc_get_time(_hour,_min,_sec);
      sprintf(strsec,"%d",_sec);
      lcd_gotoxy(0,0); 
      lcd_puts(strsec);
      delay_ms(2000);
      glcd_clear();
    
*/
  // Place your code here
      //lcd_clear(); 
      //delay_ms(500);          
      
      /*
      a=w1_init();
      if (a>0) {
      lcd_gotoxy(0,0);
      lcd_puts("HI Ehsan"); 
      lcd_gotoxy(0,1);       
        temp=ds18b20_temperature(0);
        sprintf(buffer,"Temp=%2.1f%`C",temp,223);
        lcd_puts(buffer);
      }   
      delay_ms(500);
      lcd_clear();
      lcd_gotoxy(0,0);
      glcd_putimagef(0,0,bfreeze,0);
      delay_ms(2000);
      glcd_putimagef(0,0,bfreeze,3);
      delay_ms(2000);      
      lcd_clear();*/       
      }  
      }
}


