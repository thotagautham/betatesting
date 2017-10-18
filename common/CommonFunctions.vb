Imports Microsoft.VisualBasic

Public Class CommonFunctions
    Dim Permissions As String
    Public Function SendMail(ByVal Message As String, ByVal SendTo As String, ByVal Subject As String) As Boolean
        'create the mail message
        Dim mail As New Net.Mail.MailMessage()
        'set the addresses
       mail.From = New Net.Mail.MailAddress("clinicians@carehospitals.com")
        mail.To.Add(SendTo)
        If SendTo = "clinicians@carehospitals.com" Then

            mail.Bcc.Add("mokshamedia007@gmail.com")
            mail.Bcc.Add("info@mokshamedia.co.in")
            mail.Bcc.Add("clinicians@carehospitals.com")
            mail.Bcc.Add("careiwm@mokshamedia.co.in")
            mail.Bcc.Add("thotagautham@gmail.com")

        End If
        'set the content
        mail.Subject = Subject
        mail.Body = Message
        mail.IsBodyHtml = True
        'send the message
        Dim smtp As New Net.Mail.SmtpClient(System.Configuration.ConfigurationManager.AppSettings("SMTP"))
        smtp.Send(mail)
        Return True

    End Function

    Public Function CheckPermissions(ByVal Permissions As String, ByVal Section As String, ByRef BasePageMaster As MasterPage, ByVal Roles As String) As Boolean

        Dim tv As TreeView = CType(BasePageMaster.FindControl("TreeView1"), TreeView)
        tv.Visible = True
        tv.FindNode(Section).Expand()

        If Permissions = "" Then
            tv.Visible = False
        End If

        If Roles = "OtherAdmin" Then
            If Permissions.Contains(Section) = False Then
                Return False
            Else
                Return True
            End If
        Else
            Return True
        End If
    End Function


    Public Shared Function CheckLisence(ByVal Host As String, ByVal IpAddress As String, ByVal Section As String) As Boolean
        'If Host.Contains("carehospital") = False Then
        If Host.ToLower().Contains("ixwebhosting") = False And Host.ToLower().Contains("localhost") = False And Host.ToLower().Contains("net4.com") = False And Host.ToLower().Contains("mokshamedia") = False And Host.ToLower().Contains("jmsr") = False And Host.ToLower().Contains("net4.in") = False Then
            Dim Message As String
            Message = "Dear Admin,<br /><br />This is to intimate that the software [Ehealth Care]is illegaly used by <br />Website URL : " & Host & "<br />Accessed From IP ADDRESS : " & IpAddress & "<br />  Please take necessary actions !<br / ><br />Thanks & Regards, <br />Web Support Team,<br />Moksha Media."
            Dim CF As New CommonFunctions
            CF.SendMail(Message, "shiva@mokshamedia.co.in", Section & " Of Mokshamedia Used Illegally")
            Return False
        Else
            Return True
        End If
    End Function
    Public Shared Function GetListBoxSelectedItems(lb As ListBox) As String
        Dim selectedItems As String
        selectedItems = ""
        For i = 0 To lb.Items.Count - 1
            If lb.Items(i).Selected = True Then
                If (selectedItems = "") Then
                    selectedItems = "$" & lb.Items(i).Value & "$"
                Else
                    selectedItems = selectedItems & ",$" & lb.Items(i).Value & "$"
                End If
            End If
        Next i

        Return selectedItems
    End Function
End Class
