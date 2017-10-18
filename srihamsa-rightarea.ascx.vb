Imports betatesting.DataSetCareTableAdapters
Public Class srihamsa_rightarea
    Inherits System.Web.UI.UserControl
    Dim dsenquiry As New srihamsaASKCARETableAdapter
    Dim message, subject, sendto As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

        End If
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
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
                        "KIMS Hospitals. </font>"
      

        subject = "Enquiry -- www.srihamsaskinclinic.com"

        'subject = "Enquiry -- www.KimsHospitals.com"
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
                        "KIMS Hospitals. </font>"

        sendto = System.Configuration.ConfigurationManager.AppSettings("AskEmailID")

        CF.SendMail(message, sendto, subject)


        Response.Redirect("~/Thank-you/")
    End Sub
End Class