Imports betatesting.CorporatesTableAdapters
Imports System.Data.SqlClient
Public Class _default34
    Inherits System.Web.UI.Page
    Dim dsuser As New HstockistdetailsTableAdapter
    Dim emailid As String
    Dim pwd As String
    Dim CF As New CommonFunctions
    Dim Message, subject, sendto As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

        End If
    End Sub


    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click


        emailid = dsuser.getemailidforgotpwd(TxtEmail.Text, TxtEmail.Text, TxtEmail.Text)


        If dsuser.getcountbyemailid(emailid) > 0 Then

            Dim mail As New CommonFunctions
            Dim pwd = dsuser.getpassword(emailid, emailid, emailid)
            Dim firstname = dsuser.getfirstnamebyemailid(emailid)
            Dim lastname = dsuser.getlastnamebyemailid(emailid)

            Dim mobile = dsuser.getmobilenumbyemailid(emailid)


            Dim sapid = dsuser.getsapidbyemailid(emailid)



            Dim msg = "<html><strong>Dear Customer,</strong><p></p>In response to your request to recover your password, KimsHospitals.com has reset your password." _
                    & "<p>Your New Password is: " & pwd & "</p><p>Click hear to login www.hetro.com/admin-stockist/sign-in/ </p><p>Best Regards,<br>Kims Hospitals.</p></html>"

            mail.SendMail(msg, emailid, "Your Password login in details")
            Panel1.Visible = False
            Label1.Visible = True
            Message = ""
            If TxtEmail.Text <> "" Then
                Message = "<font face='Verdana' size='2'>Dear " & firstname & lastname & ", <br /><br />" & _
                        "<br /><br /></font>" & _
                        " Welcome to KIMS Hospitals Network. Following are the details to access the administrator control panel.<br /><br />" & _
                        "<br />URL '" & System.Configuration.ConfigurationManager.AppSettings("WebsiteURL") & "/cardiac-package/sign-in/'<br />" & _
                        "<br />Email : " & emailid & _
                        "<br />Mobile : " & mobile & _
                        "<br />Sap id : " & sapid & _
                        "<br />Password : " & pwd & _
                        "<br /><br /><font face='Verdana' size='2'>Thanks & Regards,<br />" & _
                        "Website Support Team,<br />" & _
                        "Hetro. </font>"

                subject = "Stockist Password Details -- www.hetro.com"
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
End Class