Imports betatesting.DataSetCareTableAdapters
Public Class srihamsa_appointment
    Inherits System.Web.UI.UserControl
    Dim dsappointment As New srihamsaAPPOINTMENTSTableAdapter
    Dim message, subject, sendto As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

        End If

    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        dsappointment.Insert(AppointmentDate.Text, "0", "Appointment", "0", TxtName.Text, TxtEmailID.Text, TxtTelephone.Text, "0", TxtState.Text, TxtCountry.Text, TxtComments.Text)

        message = "<font face='Verdana' size='2'>Dear " & TxtName.Text & ", <br /><br />" & _
                         "Thanks for visiting our website and requesting for an appointment with the below details, we will get back to you as soon as possible .<br /><br /></font>" & _
                         "<TABLE cellSpacing=5 cellPadding=0>" & _
                          "<tr><td><font face='Verdana' size='2'>Name</td><td>:</td><td><font face='Verdana' size='2'>" & TxtName.Text & "</font></td></tr>" & _
                          "<tr><td><font face='Verdana' size='2'>Appointment Date</td><td>:</td><td><font face='Verdana' size='2'>" & AppointmentDate.Text & "</font></td></tr>" & _
                          "<tr><td><font face='Verdana' size='2'>Mobile #</td><td>:</td><td><font face='Verdana' size='2'>" & TxtTelephone.Text & "</font></td></tr>" & _
                           "<tr><td><font face='Verdana' size='2'>State #</td><td>:</td><td><font face='Verdana' size='2'>" & TxtState.Text & "</font></td></tr>" & _
                            "<tr><td><font face='Verdana' size='2'>Country #</td><td>:</td><td><font face='Verdana' size='2'>" & TxtCountry.Text & "</font></td></tr>" & _
                             "<tr><td><font face='Verdana' size='2'>Email #</td><td>:</td><td><font face='Verdana' size='2'>" & AppointmentDate.Text & "</font></td></tr>" & _
                          "<tr><td colspan=3>&nbsp;<br /><br /></td></tr>" & _
                          "<tr><td colspan=3><font face='Verdana' size='2'>Remarks</font></td></tr>" & _
                          "<tr><td colspan=3><font face='Verdana' size='2'>" & TxtComments.Text & "</font></td></tr></TABLE><br /><br />" & _
                          "<font face='Verdana' size='2'>Thanks & Regards,<br />" & _
                          "Website Support Team,<br />" & _
                          "Sri Hamsa Skin Clinic. </font>"





        subject = "Appointment Request Details:: www.srihamsaskinclinic.com"
        sendto = TxtEmailID.Text

        Dim CF As New CommonFunctions
        CF.SendMail(message, sendto, subject)

        message = "<font face='Verdana' size='2'>Dear Admin, <br /><br />" & _
                       "Below are the details of Appointment request.<br /><br /></font>" & _
                        "<TABLE cellSpacing=5 cellPadding=0>" & _
                          "<tr><td><font face='Verdana' size='2'>Name</td><td>:</td><td><font face='Verdana' size='2'>" & TxtName.Text & "</font></td></tr>" & _
                          "<tr><td><font face='Verdana' size='2'>Appointment Date</td><td>:</td><td><font face='Verdana' size='2'>" & AppointmentDate.Text & "</font></td></tr>" & _
                          "<tr><td><font face='Verdana' size='2'>Mobile #</td><td>:</td><td><font face='Verdana' size='2'>" & TxtTelephone.Text & "</font></td></tr>" & _
                           "<tr><td><font face='Verdana' size='2'>State #</td><td>:</td><td><font face='Verdana' size='2'>" & TxtState.Text & "</font></td></tr>" & _
                            "<tr><td><font face='Verdana' size='2'>Country #</td><td>:</td><td><font face='Verdana' size='2'>" & TxtCountry.Text & "</font></td></tr>" & _
                             "<tr><td><font face='Verdana' size='2'>Email #</td><td>:</td><td><font face='Verdana' size='2'>" & AppointmentDate.Text & "</font></td></tr>" & _
                          "<tr><td colspan=3>&nbsp;<br /><br /></td></tr>" & _
                          "<tr><td colspan=3><font face='Verdana' size='2'>Remarks</font></td></tr>" & _
                          "<tr><td colspan=3><font face='Verdana' size='2'>" & TxtComments.Text & "</font></td></tr></TABLE><br /><br />" & _
                          "<font face='Verdana' size='2'>Thanks & Regards,<br />" & _
                          "Website Support Team,<br />" & _
                          "Sri Hamsa Skin Clinic. </font>"

        subject = "Appointment Request Details:: www.srihamsaskinclinic.com"
        sendto = ConfigurationManager.AppSettings("AppointmentsEmailID")

        CF.SendMail(message, sendto, subject)

      
        Response.Redirect("~/Appointment-ThankYou.aspx")
    End Sub
End Class