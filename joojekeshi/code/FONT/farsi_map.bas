Function Farsi(byval S As String * 20) As String * 20

       Local Bf_chr As String * 1 , Nx_chr As String * 1 , Cur_chr As String * 1
       Local Str_len As Byte , Index As Byte , I As Byte , Type_chr As Byte
       Farsi = ""

       Str_len = Len(s)
       For I = Str_len To 1 Step -1
         Bf_chr = ""
         Nx_chr = ""
         Cur_chr = ""

                  Index = I - 1
                  If Index = 0 Then
                  Bf_chr = " "
                  Else
                  Bf_chr = Mid(s , Index , 1)
                  End If
                  Index = I + 1
                  Nx_chr = Mid(s , Index , 1)

            If Bf_chr = " " Or Bf_chr = "�" Or Bf_chr = "�" Or Bf_chr = "�" Or Bf_chr = "�" Or Bf_chr = "�" Or Bf_chr = "�" Or Bf_chr = "�" Or Bf_chr = "�" Then
                  If Nx_chr = " " Or Nx_chr = Chr(0) Then
                   Type_chr = 3
                   Else
                   Type_chr = 0
                  End If
            Else
                   If Nx_chr = " " Or Nx_chr = Chr(0) Then
                   Type_chr = 2
                   Else
                   Type_chr = 1
                  End If

            End If

            Cur_chr = Mid(s , I , 1)
         Select Case Cur_chr
         Case "�" :
                   Select Case Type_chr
                   'Case 1 : Cur_chr = Chr(173)
                   Case 1 :
                   If Bf_chr = "�" Then
                   Cur_chr = Chr(162)
                   Decr I
                   Else
                   Cur_chr = Chr(173)
                   End If
                   End Select
         Case "�" :
                   Select Case Type_chr
                   Case 0 To 1 : Cur_chr = Chr(128)
                   End Select
         Case "�" :                                         'pe
                   Select Case Type_chr
                   Case 0 To 1 : Cur_chr = Chr(131)
                   End Select

         Case "�" :
                   Select Case Type_chr
                   Case 0 To 1 : Cur_chr = Chr(132)
                   End Select
         Case "�" :
                   Select Case Type_chr
                   Case 0 To 1 : Cur_chr = Chr(133)
                   End Select
         Case "�" :
                   Select Case Type_chr
                   Case 0 To 1 : Cur_chr = Chr(134)
                   End Select

         Case "�" :                                         'che
                   Select Case Type_chr
                   Case 0 To 1 : Cur_chr = Chr(135)
                   End Select
         Case "�" :
                   Select Case Type_chr
                   Case 0 To 1 : Cur_chr = Chr(136)
                   End Select
         Case "�" :
                   Select Case Type_chr
                   Case 0 To 1 : Cur_chr = Chr(137)
                   End Select

         Case "�" :
                   Select Case Type_chr
                   Case 0 To 1 : Cur_chr = Chr(138)
                   End Select
         Case "�" :
                   Select Case Type_chr
                   Case 0 To 1 : Cur_chr = Chr(139)
                   End Select
         Case "�" :
                   Select Case Type_chr
                   Case 0 : Cur_chr = Chr(147)
                   Case 1 : Cur_chr = Chr(146)
                   Case 2 : Cur_chr = Chr(145)
                   End Select

         Case "�" :
                   Select Case Type_chr
                   Case 0 : Cur_chr = Chr(153)
                   Case 1 : Cur_chr = Chr(149)
                   Case 2 : Cur_chr = Chr(148)
                   End Select
         Case "�" :
                   Select Case Type_chr
                   Case 0 To 1 : Cur_chr = Chr(157)
                   End Select
         Case "�" :
                   Select Case Type_chr
                   Case 0 To 1 : Cur_chr = Chr(158)
                   End Select

         Case "�" :                                         'kaf
                   Select Case Type_chr
                   Case 0 To 1 : Cur_chr = Chr(160)
                   End Select
         Case "�" :                                         'gaf
                   Select Case Type_chr
                   Case 0 To 1 : Cur_chr = Chr(184)
                   End Select
         Case "�" :
                   Select Case Type_chr
                   Case 0 To 1 : Cur_chr = Chr(163)
                   End Select

         Case "�" :
                   Select Case Type_chr
                   Case 0 To 1 : Cur_chr = Chr(164)
                   End Select
         Case "�" :
                   Select Case Type_chr
                   Case 0 To 1 : Cur_chr = Chr(166)
                   End Select
         Case "�" :
                   Select Case Type_chr
                   Case 0 : Cur_chr = Chr(170)
                   Case 1 : Cur_chr = Chr(167)
                   'Case 2 : Cur_chr = Chr(240)
                   End Select
         Case "�" :
                   Select Case Type_chr
                   Case 0 To 1 : Cur_chr = Chr(168)
                   Case 2 : Cur_chr = Chr(172)
                   End Select
         Case "�" :
                   Select Case Type_chr
                   Case 0 To 1 : Cur_chr = Chr(185)
                  ' Case 2 : Cur_chr = Chr(172)
                   End Select

         Case "0" : Cur_chr = Chr(174)
         Case "1" : Cur_chr = Chr(175)
         Case "2" : Cur_chr = Chr(176)
         Case "3" : Cur_chr = Chr(177)
         Case "4" : Cur_chr = Chr(178)
         Case "5" : Cur_chr = Chr(179)
         Case "6" : Cur_chr = Chr(180)
         Case "7" : Cur_chr = Chr(181)
         Case "8" : Cur_chr = Chr(182)
         Case "9" : Cur_chr = Chr(183)

         End Select
         Farsi = Farsi + Cur_chr
        Next


      End Function