$regfile = "m16def.dat"
$crystal = 11059200
$baud = 9600

Portconfig:



Config Porta = Output
Config Portb = Output
Config Portc = Output
Config Portd = Output

           Out1 Alias Portd.3
           Out2 Alias Portd.4
           Out3 Alias Portd.5
           Out4 Alias Portd.6
           Out5 Alias Portc.2
           Out6 Alias Portc.1
           Out7 Alias Portc.0
           Out8 Alias Portd.7
           Out9 Alias Portc.3
           Out10 Alias Portc.4
           Out11 Alias Portc.5
           Out12 Alias Portc.6
           Out13 Alias Porta.5
           Out14 Alias Porta.6
           Out15 Alias Porta.7
           Out16 Alias Portc.7
           Out17 Alias Porta.4
           Out18 Alias Porta.3
           Out19 Alias Porta.2
           Out20 Alias Porta.1
           Out21 Alias Portb.2
           Out22 Alias Portb.1
           Out23 Alias Portb.0
           Out24 Alias Porta.0
           Out25 Alias Portb.3
           Out26 Alias Portb.4
           Out27 Alias Portb.5
           Out28 Alias Portb.6

           Key Alias Pinb.7 : Config Portb.7 = Input



           Declare Sub Setouts
           Declare Sub Keyorder
           Declare Sub Readouts


           Config Portc = Output

           En Alias Portd.2 : Config Portd.2 = Output
           Rxtx Alias Portb.6 : Config Portb.6 = Output

           Config Portc = Output

Configs:

Enable Interrupts
Enable Urxc
On Urxc Rx


Defines:

Dim Esenario1 As Eram Dword
Dim Esenario2 As Eram Dword
Dim Esenario3 As Eram Dword

Dim Senario1 As Dword
Dim Senario2 As Dword
Dim Senario3 As Dword

If Esenario1 = 4294967295 Then Esenario1 = 0
If Esenario2 = 4294967295 Then Esenario2 = 0
If Esenario3 = 4294967295 Then Esenario3 = 0

Senario1 = Esenario1
Senario2 = Esenario2
Senario3 = Esenario3

Dim Setsenario As Byte



Dim F As Byte
Dim M As Byte
Dim Tblank As Byte
Dim Test As Byte
Dim Wantid As Boolean
Dim Gotid As Boolean

Dim Outs As Dword
Dim Eoutnum(28) As Eram Byte

Dim Eoutid1(28) As Eram Byte
Dim Eoutid2(28) As Eram Byte
Dim Eoutid3(28) As Eram Byte
'Dim Eoutid4 As Eram Byte

Dim Outid1(28) As Byte
Dim Outid2(28) As Byte
Dim Outid3(28) As Byte
'Dim Outid4 As Byte

Dim Eouts(28) As Eram Byte
Dim Idgot As Eram Byte
Dim D As Byte
'Dim Moduleid As Eram Byte

Dim Tempid As Byte

Dim Status As Byte

Dim Efirst As Eram Byte

Dim Togglekey As Boolean

Dim Idwasgot As Boolean
Dim Typ As Byte
Dim Cmd As Byte
Dim Id As Byte
Dim I As Byte
Dim J As Byte
Dim K As Byte
Dim Maxin As Byte
Dim A As Byte
Dim Reply As Byte
Dim Keyids As Byte : Dim Ekeyids As Eram Byte
Dim Counterid As Byte : Counterid = 28
Dim Baseid As Byte

Dim Minid As Byte : Minid = Baseid + 1
Dim Maxid As Byte : Maxid = Counterid + Baseid

Dim Temponid(28) As Byte
Dim Tempontime(28) As Word
Dim Tempon As Boolean
Dim Wantnum As Boolean
Dim Sycid As Boolean
Dim Setid As Byte
Dim Din(5) As Byte
Dim Z As Byte
Dim Onoff As Boolean

Dim Timeout As Boolean
Dim Sendok As Boolean
Dim Inok As Boolean
Dim Light As Byte
Dim Learnok As Boolean
Dim Blank As Boolean : Reset Blank
Dim Idblank As Byte

Dim Direct As Byte
Dim Endbit As Byte



Subs:
Declare Sub Clearids
Declare Sub Findorder
Declare Sub Getid
Declare Sub Turnout
Declare Sub Tx


Consts:

Const Stopall = 1
Const Normal = 2
Const Refreshall = 3
Const Resetall = 4

'Const D = 10
Const Allid = 99

Const Relaymodule = 110
Const Pwmmodule = 111

Const Tomaster = 252
Const Tooutput = 232
Const Toinput = 242

Const Readallinput = 1
Const Read1input = 2
Const Learnkey = 3
Const Enablebuz = 4
Const Disablebuz = 5
Const Enablesensor = 6
Const Disablesensor = 7
Const Enableinput = 8
Const Disableinput = 9
Const Readsteps = 10
Const Learnsteps = 11
Const Enablestep = 12
Const Disablestep = 13
Const Readsenario = 14
Const Readremote = 15


Const Keyin = 101
Const Steps = 102
Const Senario = 103
Const Remote = 104
Const Relaymodules = 110


Const Mytyp = 110

Startup:
Reset Inok
Reset En
'If Efirst > 0 Then
 '  Efirst = 0
 '  For I = 1 To 28
  '     Eouts(i) = 0
  ' Next
'End If
J = 0
Wait 3
For I = 1 To 28
    Incr J
    If Eouts(j) > 1 Then Eouts(j) = 0
    If Eouts(j) = 1 Then Outs.j = 1 Else Outs.j = 0
    Call Setouts
    Waitms 500

Next



Main:

     Do
      '(
       If Blank = 1 Then
          Toggle Outs(idblank)
          J = Idblank
          Call Setouts
          Waitms 200
       End If
')
'(
       If Tempon = 1 Then
          For I = 1 To Counterid
              If Temponid(i) = 1 Then
                 Incr Tempontime(i)
                 Wait 1
                 If Tempontime(i) = 120 Then
                    Tempontime(i) = 0
                    Tempon(i) = 0
                    Outs.i = 0
                    J = I
                    Call Setouts
                 End If
              End If
          Next
       End If
')


       If Key = 1 Then
          Waitms 30
          If Key = 1 Then
             Stop Timer0
             M = 0
             Do
               Waitms 50
               Incr M
               If M < 80 Then
                  Tblank = M Mod 10
                  If Tblank = 0 Then Toggle Rxtx
               Else
                  Tblank = M Mod 4
                  If Tblank = 0 Then Toggle Rxtx
               End If
             Loop Until Key = 0
             Reset Rxtx
             If M < 80 Then
                Call Getid
             Else
                 Call Clearids
             End If
             Start Timer0
          End If
       End If

'(

       If Key = 1 Then
          Waitms 50
          If Key = 1 Then
             Stop Timer0
             For I = 1 To 8
                 Toggle Rxtx
                 Waitms 200
             Next I
             Call Getid
             Start Timer0
          End If
          Do
          Loop Until Key = 1
       End If
')
     Loop


Gosub Main


Sub Getid
    K = 0
    Reset En
    Set Rxtx
    Wait 3
    Reset Rxtx
    Set Wantid
       Do
         If Cmd = 180 Or Cmd = 181 And Id > 0 And Id < 100 Then
                          Reset Gotid
                          If Outid1(k) > 100 Or Outid1(k) = 0 Then
                             Outid1(k) = Id
                             Set Gotid
                          Else
                              If Outid2(k) > 100 Or Outid2(k) = 0 Then
                                 If Outid1(k) <> Id Then
                                    Outid2(k) = Id
                                    Set Gotid
                                 End If
                              Else
                                  If Outid3(k) > 100 Or Outid3(k) = 0 Then
                                     If Outid1(k) <> Id And Outid2(k) <> Id Then
                                        Outid3(k) = Id
                                        Set Gotid
                                     End If
                                  End If
                              End If
                          End If
                          If Gotid = 1 Then
                             For I = 1 To 8
                                 Select Case K
                                         Case 1
                                              Toggle Out1
                                         Case 2
                                              Toggle Out2
                                         Case 3
                                              Toggle Out3
                                         Case 4
                                              Toggle Out4
                                         Case 5
                                              Toggle Out5
                                         Case 6
                                              Toggle Out6
                                         Case 7
                                              Toggle Out7
                                         Case 8
                                              Toggle Out8
                                         Case 9
                                              Toggle Out9
                                         Case 10
                                              Toggle Out10
                                         Case 11
                                              Toggle Out11
                                         Case 12
                                              Toggle Out12
                                         Case 13
                                              Toggle Out13
                                         Case 14
                                              Toggle Out14
                                         Case 15
                                              Toggle Out15
                                         Case 16
                                              Toggle Out16
                                         Case 17
                                              Toggle Out17
                                         Case 18
                                              Toggle Out18
                                         Case 19
                                              Toggle Out19
                                         Case 20
                                              Toggle Out20
                                         Case 21
                                              Toggle Out21
                                         Case 22
                                              Toggle Out22
                                         Case 23
                                              Toggle Out23
                                         Case 24
                                              Toggle Out24
                                         Case 25
                                              Toggle Out25
                                         Case 26
                                              Toggle Out26
                                         Case 27
                                              Toggle Out27
                                         Case 28
                                              Toggle Out28


                                 End Select

                                 Waitms 250

                             Next
                             For I = 1 To 28
                                 Eoutid1(i) = Outid1(i)
                                 Waitms 4
                                 Eoutid2(i) = Outid2(i)
                                 Waitms 4
                                 Eoutid3(i) = Outid3(i)
                                 Waitms 4
                             Next
                          End If
                          Cmd = 0
                          Id = 0
         End If
       If Key = 1 Then
          Waitms 30
          If Key = 1 Then
             M = 0
             Do
               Waitms 50
               Incr M
               If M < 80 Then
                  Tblank = M Mod 10
                  If Tblank = 0 Then Toggle Rxtx
               Else
                  Tblank = M Mod 4
                  If Tblank = 0 Then Toggle Rxtx
               End If
             Loop Until Key = 0
             Reset Rxtx
             If M < 80 Then
                Call Turnout
             Else
                  Exit Do
             End If
             Start Timer0
          End If
       End If
       Loop

       For I = 1 To 4
          Toggle Rxtx
          Waitms 500
       Next
       Status = Stopall
       Call Keyorder
       Reset Wantid
       Return
End Sub

Sub Clearids
                    For I = 1 To Counterid
                        Eoutid1(i) = 0
                        Waitms 4
                        Eoutid2(i) = 0
                        Waitms 4
                        Eoutid3(i) = 0
                        Waitms 4
                        Eoutnum(i) = 0
                        Waitms 4
                        Eouts(i) = 0
                        Waitms 4
                        Idgot = 0
                        Waitms 150
                        Toggle Rxtx
                    Next
                    Reset Rxtx
                Porta = 0
                Portb = 0
                Portc = 0
                Portd = 0

End Sub

Sub Tx
    If Direct = Tomaster Then
       Endbit = 230
    Elseif Direct = Toinput Then
       Endbit = 220
    End If
    Set En
    Waitms 1
    Printbin Direct ; Typ ; Cmd ; Id ; Endbit
    Waitms 30
    Reset En
End Sub


Sub Keyorder

    Select Case Status
           Case Stopall
                 For J = 1 To 28
                    Outs.j = 0
                    Call Setouts
                    Waitms 200
                Next


           Case Normal

                For J = 1 To 28
                    If Eouts(j) = 1 Then Outs.j = 1 Else Outs.j = 0

                    Call Setouts
                Next

           Case Refreshall
                For J = 1 To 28
                    Outs.j = 1
                    Call Setouts
                    Waitms 200
                Next

           Case Resetall
                Porta = 0
                Portb = 0
                Portc = 0
                Portd = 0

    End Select

End Sub

Sub Setouts

        If Status = Normal Then
           If Outs.j = 1 Then Eouts(j) = 1 Else Eouts(j) = 0
        End If
        Select Case J
               Case 1
                    Out1 = Outs.1
               Case 2
                    Out2 = Outs.2
               Case 3
                    Out3 = Outs.3
               Case 4
                    Out4 = Outs.4
               Case 5
                    Out5 = Outs.5
               Case 6
                    Out6 = Outs.6
               Case 7
                    Out7 = Outs.7
               Case 8
                    Out8 = Outs.8
               Case 9
                    Out9 = Outs.9
               Case 10
                    Out10 = Outs.10
               Case 11
                    Out11 = Outs.11
               Case 12
                    Out12 = Outs.12
               Case 13
                    Out13 = Outs.13
               Case 14
                    Out14 = Outs.14
               Case 15
                    Out15 = Outs.15
               Case 16
                    Out16 = Outs.16
               Case 17
                    Out17 = Outs.17
               Case 18
                    Out18 = Outs.18
               Case 19
                    Out19 = Outs.19
               Case 20
                    Out20 = Outs.20
               Case 21
                    Out21 = Outs.21
               Case 22
                    Out22 = Outs.22
               Case 23
                    Out23 = Outs.23
               Case 24
                    Out24 = Outs.24
               Case 25
                    Out25 = Outs.25
               Case 26
                    Out26 = Outs.26
               Case 27
                    Out27 = Outs.27
               Case 28
                    Out28 = Outs.28
        End Select


End Sub

Sub Turnout

           Incr K
                                Reset Out1
                                Reset Out2
                                Reset Out3
                                Reset Out4
                                Reset Out5
                                Reset Out6
                                Reset Out7
                                Reset Out8
                                Reset Out9
                                Reset Out10
                                Reset Out11
                                Reset Out12
                                Reset Out13
                                Reset Out14
                                Reset Out15
                                Reset Out16
                                Reset Out17
                                Reset Out18
                                Reset Out19
                                Reset Out20
                                Reset Out21
                                Reset Out22
                                Reset Out23
                                Reset Out24
                                Reset Out25
                                Reset Out26
                                Reset Out27
                                Reset Out28

                                If K > 28 Then K = 1
                                Select Case K
                                         Case 1
                                              Set Out1
                                         Case 2
                                              Set Out2
                                         Case 3
                                              Set Out3
                                         Case 4
                                              Set Out4
                                         Case 5
                                              Set Out5
                                         Case 6
                                              Set Out6
                                         Case 7
                                              Set Out7
                                         Case 8
                                              Set Out8
                                         Case 9
                                              Set Out9
                                         Case 10
                                              Set Out10
                                         Case 11
                                              Set Out11
                                         Case 12
                                              Set Out12
                                         Case 13
                                              Set Out13
                                         Case 14
                                              Set Out14
                                         Case 15
                                              Set Out15
                                         Case 16
                                              Set Out16
                                         Case 17
                                              Set Out17
                                         Case 18
                                              Set Out18
                                         Case 19
                                              Set Out19
                                         Case 20
                                              Set Out20
                                         Case 21
                                              Set Out21
                                         Case 22
                                              Set Out22
                                         Case 23
                                              Set Out23
                                         Case 24
                                              Set Out24
                                         Case 25
                                              Set Out25
                                         Case 26
                                              Set Out26
                                         Case 27
                                              Set Out27
                                         Case 28
                                              Set Out28

                                End Select
End Sub

Sub Readouts
    Outs.1 = Out1
    Outs.2 = Out2
    Outs.3 = Out3
    Outs.4 = Out4
    Outs.5 = Out5
    Outs.6 = Out6
    Outs.7 = Out7
    Outs.8 = Out8
    Outs.9 = Out9
    Outs.10 = Out10
    Outs.11 = Out11
    Outs.12 = Out12
    Outs.13 = Out13
    Outs.14 = Out14
    Outs.15 = Out15
    Outs.16 = Out16
    Outs.17 = Out17
    Outs.18 = Out18
    Outs.19 = Out19
    Outs.20 = Out20
    Outs.21 = Out21
    Outs.22 = Out22
    Outs.23 = Out23
    Outs.24 = Out24
    Outs.25 = Out25
    Outs.26 = Out26
    Outs.27 = Out27
    Outs.28 = Out28
End Sub

Sub Findorder


        Select Case Cmd
               Case 151
                If Wantid = 1 Then
                                Call Turnout
                End If
               Case 158
                    Call Clearids
               Case 159
                    If Id >= Minid And Id <= Maxid Then
                       For I = 1 To Counterid
                           If Eoutid1(i) = Id Then
                              Set Tempon
                              If Outs.i = 0 Then Temponid(i) = 1
                              Outs.i = 1
                              J = I
                              Call Setouts
                           End If
                       Next
                    End If
               Case 160

               Case 180

                           If Id > 0 And Id < 100 Then
                           For I = 1 To Counterid
                               'If Eoutsnum(i) = Id Then
                               If Eoutid1(i) = Id Or Eoutid2(i) = Id Or Eoutid3(i) = Id Then
                                  Tempon(id) = 0
                                  J = I
                                  Status = Normal
                                  If Outs.j = 1 Then Outs.j = 0 Else Outs.j = 1
                                  Call Setouts
                               End If
                           Next
                           End If
               Case 181

                           If Id > 0 And Id < 100 Then
                           For I = 1 To Counterid
                               'If Eoutsnum(i) = Id Then
                               If Eoutid1(i) = Id Or Eoutid2(i) = Id Or Eoutid3(i) = Id Then
                                  Tempon(id) = 0
                                  J = I
                                  Status = Normal
                                  Outs.j = 0
                                  Call Setouts
                               End If
                           Next
                           End If
               Case 182
                           If Id > 0 And Id < 100 Then
                           For I = 1 To Counterid
                               'If Eoutsnum(i) = Id Then
                               If Eoutid1(i) = Id Or Eoutid2(i) = Id Or Eoutid3(i) = Id Then
                                  Tempon(id) = 0
                                  J = I
                                  Status = Normal
                                  Outs.j = 1
                                  Call Setouts
                               End If
                           Next
                           End If


               Case 183
                       Set Blank
                       Idblank = Id

               Case 200

                    If Id = 1 Then
                       Readouts
                       For I = 0 To 28

                       Next
                    End If
                    If Id = 2 Then

                    End If
                    If Id = 3 Then

                    End If
                    If Id = 4 Then

                    End If

               Case 201


        End Select


End Sub

Rx:


      Incr F
      Inputbin Maxin
      If F = 5 And Maxin = 210 Then Set Inok
      If Maxin = 232 Then F = 1
      Din(f) = Maxin
      If Inok = 1 Then
        Typ = Din(2)
        If Typ = Keyin Or Typ = Remote Or Typ = Relaymodules Then
           Typ = Din(2) : Cmd = Din(3) : Id = Din(4)
           Toggle Rxtx
           Call Findorder
        End If
        F = 0
        Reset Inok
      End If

Return

'(

Rx:
      Incr F
      Inputbin Maxin

      If F = 5 And Maxin = 210 Then Set Inok
      If Maxin = 232 Then F = 1

      Din(f) = Maxin

      If Inok = 1 Then
        Typ = Din(2)
        If Typ = Keyin Or Typ = Remote Or Typ = Relaymodules Then
           Toggle Rxtx
           Typ = Din(2) : Cmd = Din(3) : Id = Din(4)
           Call Findorder
        End If
        F = 0
        Reset Inok
      End If
Return

')

End