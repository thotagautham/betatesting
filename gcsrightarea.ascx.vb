Imports betatesting.DataSetCareTableAdapters
Public Class gcsrightare
    Inherits System.Web.UI.UserControl

    Dim DsAC As New DataSetCareTableAdapters.GCSASKCARETableAdapter


    Dim message, subject, sendto As String
    Dim DsSpecialities As New VENDORTYPESTableAdapter
    Dim DsState As New STATETableAdapter
    Dim DsCountry As New COUNTRYTableAdapter

    Dim i As Integer

    Protected Sub ImgBtnSendEnquiry_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImgBtnSendEnquiry.Click

        If TxtName.Text = "" Then
            LblMsg.Text = "Enter Name"
            Exit Sub
        ElseIf TxtEmailID.Text = "" Then
            LblMsg.Text = "Enter Email Id"
            Exit Sub
        ElseIf TxtTelephone.Text = "" Then
            LblMsg.Text = "Enter Mobile Number"
            Exit Sub
        ElseIf TxtComments.Text = "" Then
            LblMsg.Text = "Enter Message"
            Exit Sub
        End If
        DsAC.Insert(TxtComments.Text, "General Enquiry", 0, 0, "1/1/1999", "", 0, Now(), "1/1/1999", "Received", TxtName.Text, "N/A", "N/A", "0", "0", TxtEmailID.Text, TxtTelephone.Text, "0", "1/1/1999", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "Global Cancer Summit Enquiry")

        Page.ClientScript.RegisterStartupScript(Me.GetType(), "EnquiryAlert", "alert('Thanks for your enquiry, we will get back to you as soon as possible.');", True)

        message = "<font face='Verdana' size='2'>Dear " & TxtName.Text & ", <br /><br />" & _
                        "Thanks for visiting our website and giving the following details, we will get back to you as soon as possible.<br /><br /></font>" & _
                        "<TABLE cellSpacing=5 cellPadding=0>" & _
                        "<tr><td><font face='Verdana' size='2'>Name</td><td>:</td><td><font face='Verdana' size='2'>" & TxtName.Text & "</font></td></tr>" & _
                        "<tr><td><font face='Verdana' size='2'>Email Id </td><td>:</td><td><font face='Verdana' size='2'>" & TxtEmailID.Text & "</font></td></tr>" & _
                     "<tr><td><font face='Verdana' size='2'>Telephone #</td><td>:</td><td><font face='Verdana' size='2'>" & TxtTelephone.Text & "</font></td></tr>" & _
                         "<tr><td colspan=3>&nbsp;<br /><br /></td></tr>" & _
                        "<tr><td ><font face='Verdana' size='2'>Question category</font></td><td>:</td><td><font face='Verdana' size='2'>General Enquiry</font></td></tr>" & _
                        "<tr><td colspan=3><font face='Verdana' size='2'>Information Required</font></td></tr>" & _
                        "<tr><td colspan=3><font face='Verdana' size='2'>" & TxtComments.Text & "</font></td></tr></TABLE><br /><br />" & _
                        "<font face='Verdana' size='2'>Thanks & Regards,<br />" & _
                        "Website Support Team,<br />" & _
                        "Global Cancer Summit. </font>"

        subject = "Enquiry -- www.globalcancersummit.com"
        sendto = TxtEmailID.Text

        Dim CF As New CommonFunctions
        CF.SendMail(message, sendto, subject)


        message = "<font face='Verdana' size='2'>Dear Admin, <br /><br />" & _
                        "Following are the enquiry details.<br /><br /></font>" & _
                        "<TABLE cellSpacing=5 cellPadding=0>" & _
                        "<tr><td><font face='Verdana' size='2'>Name</td><td>:</td><td><font face='Verdana' size='2'>" & TxtName.Text & "</font></td></tr>" & _
                        "<tr><td><font face='Verdana' size='2'>Email Id </td><td>:</td><td><font face='Verdana' size='2'>" & TxtEmailID.Text & "</font></td></tr>" & _
                        "<tr><td><font face='Verdana' size='2'>Telephone #</td><td>:</td><td><font face='Verdana' size='2'>" & TxtTelephone.Text & "</font></td></tr>" & _
                        "<tr><td colspan=3>&nbsp;<br /><br /></td></tr>" & _
                        "<tr><td ><font face='Verdana' size='2'>Question category</font></td><td>:</td><td><font face='Verdana' size='2'>General Enquiry</font></td></tr>" & _
                        "<tr><td colspan=3><font face='Verdana' size='2'>Information Required</font></td></tr>" & _
                        "<tr><td colspan=3><font face='Verdana' size='2'>" & TxtComments.Text & "</font></td></tr></TABLE><br /><br />" & _
                        "<font face='Verdana' size='2'>Thanks & Regards,<br />" & _
                        "Website Support Team,<br />" & _
                        "Global Cancer Summit. </font>"
        subject = "Enquiry -- www.globalcancersummit.com"
        sendto = System.Configuration.ConfigurationManager.AppSettings("VedicAgraharamAskEmailID")

        CF.SendMail(message, sendto, subject)

        'TxtEmailID.Text = "Type Email"
        'TxtTelephone.Text = "Type Telephone"
        'TxtComments.Text = "Type Message"
        'TxtName.Text = "Type Name"
        'DDLEnquiry_Country.SelectedIndex = -1
        'DDLState.SelectedIndex = -1
        'DDLEnquiry_Specialities.SelectedIndex = -1

        'RFVState.Enabled = False

        Response.Redirect("~/Thank-You/")

    End Sub













End Class