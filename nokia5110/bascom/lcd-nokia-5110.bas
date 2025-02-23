$regfile = "m16adef.dat"
$crystal = 8000000
$baud = 9600
$hwstack = 32
$swstack = 40
$framesize = 40

$include "FONT/farsi_func.bas"
$lib "glcd-Nokia5110.lib"

'1.RST
'2.CE-------CS1
'3.DC  -----A0
'4.DIN -----Si
'5.CLK -----SCLK
'6.VCC------3.3V
'7.BL ------3.3V
'8.GND
Config Graphlcd = 128x64sed , Rst = Portc.1 , Cs1 = Portc.0 , _
A0 = Portc.2 , Si = Portc.3 , Sclk = Portc.4
' Rst & Cs1 is optional
Const Contrast_lcd = 72
'Contrast 0 to 127, if not defined - 72
'Const Negative_lcd = 1       'Inverting screen
'Const Rotate_lcd = 1          'Rotate screen to 180�
Initlcd
Cls
Do
  Dim Text As String * 20
  Text = Farsi( "����")
  Lcdat 1 , 9 , Text , 1
  Wait 2
  Cls
  Setfont Font6x8
  Lcdat 1 , 9 , Farsi( " �� ��� ���") , 1
  Lcdat 2 , 32 , Farsi( "����") + " hi" , 0
  Lcdat 3 , 7 , Text , 1
  Lcdat 4 , 2 , Farsi( "���� ���� 8*6") , 0

  Wait 2
  Cls

  Setfont Font12x16dig

  Lcdat 1 , 1 , "23:59"

  Setfont Font6x8

  Lcd ":00"

  Wait 2
  Cls

  Showpic 0 , 0 , Pic
  Wait 3
  Cls
Loop
End


Pic:
$bgf "image/graph.bgf"

$include "FONT/farsi_map.bas"


 ' $include "FONT/font5x5.font"
 ' $include "FONT/font5x12.font"
  $include "FONT/font6x8.font"                              ' ����� ���� �����
 ' $include "FONT/font6x10.font"
 ' $include "FONT/font7x11TT.font"
 ' $include "FONT/font7x12.font"
 ' $include "FONT/font8x8.font"    ' ����� ���� �����
 ' $include "FONT/font8x12.font"
 ' $include "FONT/font8x13TT.font"
 ' $include "FONT/font8x14TT.font"
 ' $include "FONT/font10x16TT.font"
 ' $include "FONT/my12_16.font"
  $include "FONT/font12x16dig.font"                         '��� ���� ����� ����
 ' $include "FONT/font16x16.font"