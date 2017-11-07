Imports betatesting.hhcTableAdapters
Imports System.Data.SqlClient
Public Class _default4
    Inherits System.Web.UI.Page

    Dim i As Integer
    Dim Permissions, Password As String
    Dim Message, subject, sendto As String
    Dim dsadmins As New HstockistdetailsnewTableAdapter
    Dim strsql As String
    Dim oracmd As SqlCommand
    Dim connString As String
    Public objConn As SqlConnection
    Dim dsregister As New HstockistdetailsnewTableAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

        End If

    End Sub

    Protected Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click


        If (dsadmins.getcountbyemailid(txtEmailId.Text) > 0) Then
            LblMsg.Text = "<br /><br /> Email Login Id -- [" & txtEmailId.Text & "] Already Exists, Please Try With Other !<br /><br />"
        Else

            Permissions = GetPermissions()

            Password = RandomPassword.Generate(6)
         
            dsadmins.Insert(txtfirstname.Text, txtlastname.Text, txtEmailId.Text, txtmobilenumber.Text, Password, "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "")
            lblmsg.Text = "<br /><br />User Added Successfully !<br /><br />Login Id(" & txtEmailId.Text & ") /  "

            'Dim mobilenumber As String

            'mobilenumber = 91 & txtmobilenumber.Text
            'Dim obj As New SmsReseller
            'If obj.CheckLogin("info@mokshamedia.co.in", "12345678") = "OK" Then
            '    obj.User = "info@mokshamedia.co.in" 'username
            '    obj.Pass = "12345678" 'password
            '    obj.Sender_id = "KIMSWB" 'senderid'senderid
            '    obj.MSISDN = mobilenumber ' mobilenumber
            '    obj.Message = "Your Password For Cardiac Package Login " & Password 'message
            '    obj.MsgType = SmsReseller.MessageType.Msg_Text 'messagetype
            '    obj.SendSingle()


            '    ' method to send SMS
            'End If

            Message = ""
            If txtEmailId.Text <> "" Then
                Message = "<font face='Verdana' size='2'>Dear " & txtfirstname.Text & ", <br /><br />" & _
                        "<br /><br /></font>" & _
                        " Welcome to KIMS Hospitals Network. Following are the details to access the administrator control panel.<br /><br />" & _
                        "<br />URL '" & System.Configuration.ConfigurationManager.AppSettings("WebsiteURL") & "cardiac-package/sign-in/'<br />" & _
                        "<br />User Name(Login Id) : " & txtEmailId.Text & _
                        "<br />Password : " & Password & _
                        "<br /><br /><font face='Verdana' size='2'>Thanks & Regards,<br />" & _
                        "Website Support Team,<br />" & _
                        "KIMS Hospitals. </font>"

                subject = "cardiac Package Login Details -- www.KimsHospitals.com"
                sendto = txtEmailId.Text


                Dim CF As New CommonFunctions
                CF.SendMail(Message, sendto, subject)
                LblMsg.Text = "<br /><br />User Added Successfully ! Login Details Emailed.<br /><br />"

                Response.Redirect("~/admin-stockist/sign-in/")
            End If
        End If







    End Sub

    Protected Sub BtnCancel_Click(sender As Object, e As EventArgs) Handles BtnCancel.Click

    End Sub



    Private Function GetPermissions() As String
        Permissions = ""



        Return Permissions
    End Function
End Class