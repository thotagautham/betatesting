Imports betatesting.DataSetCareTableAdapters
Imports betatesting.cmsTableAdapters
Public Class srihamsa
    Inherits System.Web.UI.MasterPage
    Dim captchacode As String
    Dim dsenquiry As New srihamsaASKCARETableAdapter
    Dim message, subject, sendto As String


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then


            If Session("CaptchaImageText") = "" Then
                Session("CaptchaImageText") = GenerateRandomCode()
            End If

        End If
    End Sub
    Private Function GenerateRandomCode() As String
        Dim Random As New Random
        Dim s As String
        s = ""
        Dim i As Integer
        For i = 0 To 6
            s = String.Concat(s, Random.Next(10).ToString())
        Next i
        Return s
    End Function

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        If TxtKeyValue.Text = Session("CaptchaImageText") Then

            dsenquiry.Insert(TxtComments.Text, "General Enquiry", 0, 0, Now(), "", 0, Now(), "1/1/1999", "Received", TxtName.Text, "N/A", "N/A", TxtState.Text, TxtCountry.Text, TxtEmailID.Text, TxtTelephone.Text, "0", "1/1/1999", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", Request.Url.ToString(), Request.ServerVariables("REMOTE_ADDR"), "Web Based Enquiry")

            Page.ClientScript.RegisterStartupScript(Me.GetType(), "EnquiryAlert", "alert('Thanks for your enquiry, we will get back to you as soon as possible.');", True)

            message = "<font face='Verdana' size='2'>Dear " & TxtName.Text & ", <br /><br />" & _
                            "Thanks for visiting our website and giving the following details, we will get back to you as soon as possible.<br /><br /></font>" & _
                            "<TABLE cellSpacing=5 cellPadding=0>" & _
                            "<tr><td><font face='Verdana' size='2'>Telephone #</td><td>:</td><td><font face='Verdana' size='2'>" & TxtTelephone.Text & "</font></td></tr>" & _
                             "<tr><td><font face='Verdana' size='2'>Email Id </td><td>:</td><td><font face='Verdana' size='2'>" & TxtEmailID.Text & "</font></td></tr>" & _
                            "<tr><td><font face='Verdana' size='2'>Telephone #</td><td>:</td><td><font face='Verdana' size='2'>" & TxtTelephone.Text & "</font></td></tr>" & _
                            "<tr><td><font face='Verdana' size='2'>Country</td><td>:</td><td><font face='Verdana' size='2'>" & TxtCountry.Text & "</font></td></tr>" & _
                            "<tr><td><font face='Verdana' size='2'>State</td><td>:</td><td><font face='Verdana' size='2'>" & TxtState.Text & "</font></td></tr>" & _
"<tr><td colspan=3>&nbsp;<br /><br /></td></tr>" & _
                            "<tr><td ><font face='Verdana' size='2'>Question category</font></td><td>:</td><td><font face='Verdana' size='2'>General Enquiry</font></td></tr>" & _
                            "<tr><td colspan=3><font face='Verdana' size='2'>Information Required</font></td></tr>" & _
                            "<tr><td colspan=3><font face='Verdana' size='2'>" & TxtComments.Text & "</font></td></tr></TABLE><br /><br />" & _
                            "<font face='Verdana' size='2'>Thanks & Regards,<br />" & _
                            "Website Support Team,<br />" & _
                            "Sri Hamsa Skin Clinic. </font>"


            subject = "Enquiry -- www.srihamsaskinclinic.com"


            sendto = TxtEmailID.Text

            Dim CF As New CommonFunctions
            CF.SendMail(message, sendto, subject)


            message = "<font face='Verdana' size='2'>Dear Admin, <br /><br />" & _
                            "Following are the enquiry details.<br /><br /></font>" & _
                            "<TABLE cellSpacing=5 cellPadding=0>" & _
                            "<tr><td><font face='Verdana' size='2'>Name</td><td>:</td><td><font face='Verdana' size='2'>" & TxtName.Text & "</font></td></tr>" & _
                            "<tr><td><font face='Verdana' size='2'>Email Id </td><td>:</td><td><font face='Verdana' size='2'>" & TxtEmailID.Text & "</font></td></tr>" & _
                            "<tr><td><font face='Verdana' size='2'>Telephone #</td><td>:</td><td><font face='Verdana' size='2'>" & TxtTelephone.Text & "</font></td></tr>" & _
                            "<tr><td><font face='Verdana' size='2'>Country</td><td>:</td><td><font face='Verdana' size='2'>" & TxtCountry.Text & "</font></td></tr>" & _
                            "<tr><td><font face='Verdana' size='2'>State</td><td>:</td><td><font face='Verdana' size='2'>" & TxtState.Text & "</font></td></tr>" & _
                            "<tr><td colspan=3>&nbsp;<br /><br /></td></tr>" & _
                            "<tr><td ><font face='Verdana' size='2'>Question category</font></td><td>:</td><td><font face='Verdana' size='2'>General Enquiry</font></td></tr>" & _
                            "<tr><td colspan=3><font face='Verdana' size='2'>Information Required</font></td></tr>" & _
                            "<tr><td colspan=3><font face='Verdana' size='2'>" & TxtComments.Text & "</font></td></tr></TABLE><br /><br />" & _
                            "<font face='Verdana' size='2'>Thanks & Regards,<br />" & _
                            "Website Support Team,<br />" & _
                            "Sri Hamsa Skin Clinic. </font>"

            sendto = System.Configuration.ConfigurationManager.AppSettings("AskEmailID")

            CF.SendMail(message, sendto, subject)


            Response.Redirect("~/Thank-you/")


        Else

            TxtKeyValue.Text = ""

            lblmsg.Text = "Enter Correct Captcha Code"

            captchacode = Session("CaptchaImageText")

            captchacode = captchacode - 11111

            Session("CaptchaImageText") = captchacode
            Exit Sub
        End If
    End Sub

    Protected Sub btnreset_Click(sender As Object, e As EventArgs) Handles btnreset.Click
        'TxtName.Text = "Enter Name"
        'TxtEmailID.Text = "Enter Email"
        'TxtState.Text = "Enter State"
        'TxtTelephone.Text = "Enter Phone Number"
        'TxtCountry.Text = "Enter Country"
        'TxtComments.Text = "Enter Message"
        TxtKeyValue.Text = ""


        captchacode = Session("CaptchaImageText")

        captchacode = captchacode - 11111

        Session("CaptchaImageText") = captchacode
    End Sub

    Protected Sub ImgBtnSendEnquiry_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnSendEnquiry.Click
        captchacode = Session("CaptchaImageText")

        captchacode = captchacode - 11111

        Session("CaptchaImageText") = captchacode
    End Sub
End Class