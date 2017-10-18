Imports betatesting.DataSetCareTableAdapters
Imports betatesting.WebAdminsTableAdapters
Imports betatesting.newseventsTableAdapters
Imports betatesting.AppointmentsTableAdapters
Imports betatesting.cmsTableAdapters
Imports System.Data.SqlClient
Imports System.IO
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web.UI.WebControls
Public Class career
    Inherits System.Web.UI.UserControl
   
    Dim ObjCPIP As New ControlPanelIPStatsTableAdapter
    Dim dsuser As New carecareersTableAdapter
    Dim DsIdentity As New CurrentIdentity
    Dim ThumbnailImageName As String
    Dim reportname As String
    Dim message, subject, sendto, ResumePath As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        If Not IsPostBack Then



        End If
    End Sub









    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click





        If TxtName.Text = "" Then
            LblMsg.Text = "Enter Name"
            Exit Sub
        ElseIf TxtEmailID.Text = "" Then
            LblMsg.Text = "Enter Email Id"
            Exit Sub
        ElseIf TxtTelephone.Text = "" Then
            LblMsg.Text = "Enter Mobile Number"
            Exit Sub
        ElseIf (Not FUNewsImage.HasFile) Then
            LblMsg.Text = "Upload Resume !"
        ElseIf ddlpost.SelectedItem.Value = "0" Then
            LblMsg.Text = "Choose Post "
            Exit Sub

        End If




        ThumbnailImageName = ""
        If FUNewsImage.HasFile Then
            If FUNewsImage.PostedFile.ContentType <> "application/pdf" And FUNewsImage.PostedFile.ContentType <> "application/msword" And FUNewsImage.PostedFile.ContentType <> "application/txt" And FUNewsImage.PostedFile.ContentType <> "application/vnd.openxmlformats-officedocument.wordprocessingml.document" Then

                LblMsg.Text = "Files Of Type [" & FUNewsImage.PostedFile.ContentType & "] Not Allowed"
                Exit Sub
            Else
                ThumbnailImageName = CStr(DsIdentity.GetCurrentIdentityByTableName("VENDORSUsers") + 1) & Path.GetExtension(FUNewsImage.PostedFile.FileName)
                FUNewsImage.PostedFile.SaveAs(Server.MapPath("~/careers/resumes") & "/" & ThumbnailImageName)
                reportname = "<a href='" & System.Configuration.ConfigurationManager.AppSettings("WebsiteURL") & "/careers/resumes/" & ThumbnailImageName & "'>Click Here to see the resume</a><br />"
            End If

        End If


        If (btnSave.Text = "Update") Then


        Else
            If (Not FUNewsImage.HasFile) Then
                LblMsg.Text = "Upload Resume !"
                Exit Sub
            Else

                dsuser.Insert("0", "0", "0", "0", txtlinkedin.Text, "0", "0", "0", "0", TxtTelephone.Text, "Y", ThumbnailImageName, "", "", "", "", "", "", "", "", "", "", "", "", txtlastname.Text, txtqualification.Text, TxtName.Text, Now(), TxtEmailID.Text, ddlpost.SelectedItem.Value, ddlpost.SelectedItem.Text)



            End If

            Page.ClientScript.RegisterStartupScript(Me.GetType(), "ResumeAlert", "alert('Thanks for your interest in Care Hospitals, we will get back to you as soon as possible.');", True)


            message = "<font face='Verdana' size='2'>Dear Applicant, <br /><br />" & _
                                "We thank you for your interest to associate with the CARE Group of Hospitals. We have received your resume.<br /></font>" & _
                                "We will revert to you at the earliest after screening your profile against our requirement.<br /><br /></font>" & _
                                "Preliminary interaction will be done once your profile is shortlisted for further action.<br /><br /></font>" & _
                                "We appreciate you for choosing CARE Hospitals.<br /><br /></font>" & _
                                 "Below are the details.<br /><br /></font>" & _
                                "<TABLE cellSpacing=5 cellPadding=0>" & _
                                "<tr><td><font face='Verdana' size='2'>First Name</td><td>:</td><td><font face='Verdana' size='2'>" & TxtName.Text & "</font></td></tr>" & _
                                 "<tr><td><font face='Verdana' size='2'>Last Name</td><td>:</td><td><font face='Verdana' size='2'>" & txtlastname.Text & "</font></td></tr>" & _
                                "<tr><td><font face='Verdana' size='2'>Mobile Number</td><td>:</td><td><font face='Verdana' size='2'>" & TxtTelephone.Text & "</font></td></tr>" & _
                                "<tr><td><font face='Verdana' size='2'>linkedin url</td><td>:</td><td><font face='Verdana' size='2'>" & txtlinkedin.Text & "</font></td></tr>" & _
                                "<tr><td><font face='Verdana' size='2'>Post Applied For </td><td>:</td><td><font face='Verdana' size='2'>" & ddlpost.SelectedItem.Text & "</font></td></tr>" & _
                                "<tr><td><font face='Verdana' size='2'>Qualification </td><td>:</td><td><font face='Verdana' size='2'>" & txtqualification.Text & "</font></td></tr>" & _
                                "<tr><td><font face='Verdana' size='2'>E-mail ID</td><td>:</td><td><font face='Verdana' size='2'>" & TxtEmailID.Text & "</font></td></tr></TABLE><br /><br />" & reportname & ResumePath & _
                                "<font face='Verdana' size='2'>Regards,<br />" & _
                                 "<font face='Verdana' size='2'> ____________<br />" & _
                                  "<font face='Verdana' size='2'>Talent Acquisition Team , CARE Hospitals <br />" & _
                                   "<font face='Verdana' size='2'>Corporate HR<br />" & _
             "<font face='Verdana' size='2'>Hyderabad -500034 <br />" & _
             "<font face='Verdana' size='2'>Ph: 040-39116000; Ext: 16064/67 <br />" & _
             "<font face='Verdana' size='2'>Email : clinicians@carehospitals.com <br />"














            subject = "application"
            sendto = TxtEmailID.Text

            Dim CF As New CommonFunctions
            CF.SendMail(message, sendto, subject)


            message = "<font face='Verdana' size='2'>Dear Admin, <br /><br />" & _
                                "Below are the details.<br /><br /></font>" & _
                                "<TABLE cellSpacing=5 cellPadding=0>" & _
                                 "<tr><td><font face='Verdana' size='2'>First Name</td><td>:</td><td><font face='Verdana' size='2'>" & TxtName.Text & "</font></td></tr>" & _
                                 "<tr><td><font face='Verdana' size='2'>Last Name</td><td>:</td><td><font face='Verdana' size='2'>" & txtlastname.Text & "</font></td></tr>" & _
                                "<tr><td><font face='Verdana' size='2'>Mobile Number</td><td>:</td><td><font face='Verdana' size='2'>" & TxtTelephone.Text & "</font></td></tr>" & _
                                "<tr><td><font face='Verdana' size='2'>linkedin url</td><td>:</td><td><font face='Verdana' size='2'>" & txtlinkedin.Text & "</font></td></tr>" & _
                                "<tr><td><font face='Verdana' size='2'>Post Applied For </td><td>:</td><td><font face='Verdana' size='2'>" & ddlpost.SelectedItem.Text & "</font></td></tr>" & _
                                "<tr><td><font face='Verdana' size='2'>Qualification </td><td>:</td><td><font face='Verdana' size='2'>" & txtqualification.Text & "</font></td></tr>" & _
                                "<tr><td><font face='Verdana' size='2'>E-mail ID</td><td>:</td><td><font face='Verdana' size='2'>" & TxtEmailID.Text & "</font></td></tr></TABLE><br /><br />" & ResumePath & _
                                "<font face='Verdana' size='2'>Thanks & Regards,<br />" & _
                                "Website Support Team,<br />" & reportname & _
                                "Care Hospitals. </font>"


            subject = "Job application"


            sendto = System.Configuration.ConfigurationManager.AppSettings("jobapplication")

            CF.SendMail(message, sendto, subject)

            Response.Redirect("~/careers/thank-you/")
        End If






    End Sub

    Protected Sub btncancell_Click(sender As Object, e As EventArgs) Handles btncancell.Click

        TxtName.Text = ""
        TxtEmailID.Text = ""
        TxtTelephone.Text = ""

        txtlinkedin.Text = ""

    End Sub

End Class