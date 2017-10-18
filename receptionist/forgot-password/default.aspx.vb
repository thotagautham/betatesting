Imports betatesting.DataSetCareTableAdapters
Imports betatesting.WebAdminsTableAdapters
Public Class _default3
    Inherits System.Web.UI.Page
    Dim dsuser As New clinicUsersTableAdapter
    Dim CF As New CommonFunctions
    Dim Message, subject, sendto As String
    Protected Sub ImgSubmit_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImgSubmit.Click
        If dsuser.CheckPrimaryCount(TxtEmail.Text) > 0 Then
            Dim mail As New CommonFunctions
            Dim pwd = dsuser.getpasswordbyemailid(TxtEmail.Text)
            Dim firstname = dsuser.gerfirstnamebyemailid(TxtEmail.Text)
            Dim lastname = dsuser.Getlastnamebyemailid(TxtEmail.Text)
            'Dim msg = "<html><strong>Dear Customer,</strong><p></p>In response to your request to recover your password, KimsHospitals.com has reset your password." _
            '        & "<p>Your New Password is: " & pwd & "</p><p>Click hear to login www.kimshospitals.com/privilege-card/sign-in/ </p><p>Best Regards,<br>Kims Hospitals.</p></html>"

            'mail.SendMail(msg, TxtEmail.Text, "Your Privilege card login in details")
            'Panel1.Visible = False
            'Label1.Visible = True
            Message = ""
            If TxtEmail.Text <> "" Then
                Message = "<font face='Verdana' size='2'>Dear " & firstname & "<br/>" & lastname & ", <br /><br />" & _
                        "<br /><br /></font>" & _
                        " Welcome to KIMS Hospitals Network. Following are the details to access the administrator control panel.<br /><br />" & _
                        "<br />URL '" & System.Configuration.ConfigurationManager.AppSettings("WebsiteURL") & "/receptionist/sign-in/'<br />" & _
                        "<br />User Name(Login Id) : " & TxtEmail.Text & _
                        "<br />Password : " & pwd & _
                        "<br /><br /><font face='Verdana' size='2'>Thanks & Regards,<br />" & _
                        "Website Support Team,<br />" & _
                        "KIMS Hospitals. </font>"

                subject = "Receptionist Password Details -- www.Mokshamedia.co.in"
                sendto = TxtEmail.Text

                Dim CF As New CommonFunctions
                CF.SendMail(Message, sendto, subject)
                Panel1.Visible = False
                Label1.Visible = True
            End If
        Else
            Panel1.Visible = False
            Label1.Visible = True
            Label1.Text = "The E-Mail Address  [" & TxtEmail.Text & "]  Doesn't Exist"
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

        End If

    End Sub

End Class