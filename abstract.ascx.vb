Imports betatesting.DataSetCareTableAdapters
Imports betatesting.WebAdminsTableAdapters
Imports betatesting.newseventsTableAdapters
Imports System.Data.SqlClient
Imports System.IO
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web.UI.WebControls
Public Class abstract
    Inherits System.Web.UI.UserControl
    Dim dsspec As New VENDORSPECIALIZATIONTableAdapter
    Dim dsbranch As New VENDORTYPESTableAdapter
    Dim ObjCPIP As New ControlPanelIPStatsTableAdapter
    Dim dsuser As New innocationabstractTableAdapter
    Dim DsIdentity As New CurrentIdentity
    Dim ThumbnailImageName As String
    Dim reportname As String
    Dim Permissions, Password As String
    Dim message, subject, sendto, ResumePath As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        If Not IsPostBack Then


        End If
    End Sub

    'Private Function GetPermissions() As String
    '    Permissions = ""

    '    For i = 0 To CBLSections.Items.Count - 1
    '        If CBLSections.Items(i).Selected = True Then
    '            If Permissions = "" Then
    '                Permissions = CBLSections.SelectedValue
    '            Else
    '                Permissions = Permissions & "," & CBLSections.SelectedValue
    '            End If
    '            CBLSections.Items(i).Selected = False
    '        End If
    '    Next

    '    Return Permissions
    'End Function




    'Protected Sub btncancel_Click(sender As Object, e As ImageClickEventArgs) Handles btncancel.Click
    '    TxtName.Text = ""
    '    TxtEmailID.Text = ""
    '    TxtTelephone.Text = ""
    '    DDLBranches.SelectedIndex = -1
    'End Sub




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
            LblMsg.Text = "Upload Abstract !"
            Exit Sub
        End If




        ThumbnailImageName = ""
        If FUNewsImage.HasFile Then
            If FUNewsImage.PostedFile.ContentType <> "application/pdf" And FUNewsImage.PostedFile.ContentType <> "application/msword" And FUNewsImage.PostedFile.ContentType <> "application/txt" And FUNewsImage.PostedFile.ContentType <> "application/vnd.openxmlformats-officedocument.wordprocessingml.document" Then

                LblMsg.Text = "Files Of Type [" & FUNewsImage.PostedFile.ContentType & "] Not Allowed"
                Exit Sub
            Else
                ThumbnailImageName = CStr(DsIdentity.GetCurrentIdentityByTableName("innocationabstract") + 1) & Path.GetExtension(FUNewsImage.PostedFile.FileName)
                FUNewsImage.PostedFile.SaveAs(Server.MapPath("~/abstract") & "/" & ThumbnailImageName)
                reportname = "<a href='" & System.Configuration.ConfigurationManager.AppSettings("WebsiteURL") & "/abstract/" & ThumbnailImageName & "'>Click Here to see the abstract</a><br />"
            End If

        End If


        If (btnSave.Text = "Update") Then


        Else
            If (Not FUNewsImage.HasFile) Then
                LblMsg.Text = "Upload Resume !"
                Exit Sub
            Else

                dsuser.Insert(txtlinkedin.Text, "General Enquiry", 0, 0, "1/1/1999", "", 0, Now(), "1/1/1999", "Received", TxtName.Text, "N/A", "N/A", txtcountry.Text, txtstate.Text, TxtEmailID.Text, TxtTelephone.Text, TxtName.Text, "1/1/1999", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", Permissions, ThumbnailImageName, "Web Based Enquiry")



            End If

            Page.ClientScript.RegisterStartupScript(Me.GetType(), "ResumeAlert", "alert('Thanks for your interest in Care Hospitals, we will get back to you as soon as possible.');", True)


            message = "<font face='Verdana' size='2'>Dear , <br /><br />" & _
                                "Below are the details.<br /><br /></font>" & _
                                "<TABLE cellSpacing=5 cellPadding=0>" & _
                                "<tr><td><font face='Verdana' size='2'>First Name</td><td>:</td><td><font face='Verdana' size='2'>" & TxtName.Text & "</font></td></tr>" & _
                                "<tr><td><font face='Verdana' size='2'>Country </td><td>:</td><td><font face='Verdana' size='2'>" & txtcountry.Text & "</font></td></tr>" & _
                                "<tr><td><font face='Verdana' size='2'>State</td><td>:</td><td><font face='Verdana' size='2'>" & txtstate.Text & "</font></td></tr>" & _
                                "<tr><td><font face='Verdana' size='2'>Email </td><td>:</td><td><font face='Verdana' size='2'>" & TxtEmailID.Text & "</font></td></tr>" & _
"<tr><td><font face='Verdana' size='2'>Mode of Presentation </td><td>:</td><td><font face='Verdana' size='2'>" & Permissions & "</font></td></tr>" & _
 "<tr><td><font face='Verdana' size='2'>Mobile Number </td><td>:</td><td><font face='Verdana' size='2'>" & TxtTelephone.Text & "</font></td></tr>" & _
                                "<tr><td><font face='Verdana' size='2'>Address</td><td>:</td><td><font face='Verdana' size='2'>" & txtlinkedin.Text & "</font></td></tr></TABLE><br /><br />" & ResumePath & _
                                "<font face='Verdana' size='2'>Thanks & Regards,<br />" & _
                                "Website Support Team,<br />" & reportname & _
                                "Innovation in Healthcare Summit-2016. </font>"




            subject = "Abstract - - Innovation in Healthcare Summit-2016"
            sendto = TxtEmailID.Text

            Dim CF As New CommonFunctions
            CF.SendMail(message, sendto, subject)


            message = "<font face='Verdana' size='2'>Dear , <br /><br />" & _
                                "Below are the details.<br /><br /></font>" & _
                                "<TABLE cellSpacing=5 cellPadding=0>" & _
                                "<tr><td><font face='Verdana' size='2'>First Name</td><td>:</td><td><font face='Verdana' size='2'>" & TxtName.Text & "</font></td></tr>" & _
                                "<tr><td><font face='Verdana' size='2'>Country </td><td>:</td><td><font face='Verdana' size='2'>" & txtcountry.Text & "</font></td></tr>" & _
                                "<tr><td><font face='Verdana' size='2'>State</td><td>:</td><td><font face='Verdana' size='2'>" & txtstate.Text & "</font></td></tr>" & _
                                "<tr><td><font face='Verdana' size='2'>Email </td><td>:</td><td><font face='Verdana' size='2'>" & TxtEmailID.Text & "</font></td></tr>" & _
"<tr><td><font face='Verdana' size='2'>Mode of Presentation </td><td>:</td><td><font face='Verdana' size='2'>" & Permissions & "</font></td></tr>" & _
 "<tr><td><font face='Verdana' size='2'>Mobile Number </td><td>:</td><td><font face='Verdana' size='2'>" & TxtTelephone.Text & "</font></td></tr>" & _
                                "<tr><td><font face='Verdana' size='2'>Address</td><td>:</td><td><font face='Verdana' size='2'>" & txtlinkedin.Text & "</font></td></tr></TABLE><br /><br />" & ResumePath & _
                                "<font face='Verdana' size='2'>Thanks & Regards,<br />" & _
                                "Website Support Team,<br />" & reportname & _
                                " Innovation in Healthcare Summit-2016 </font>"


            subject = "Abstract  -  Innovation in Healthcare Summit-2016"


            sendto = System.Configuration.ConfigurationManager.AppSettings("abstract")

            CF.SendMail(message, sendto, subject)

            Response.Redirect("/abstracts-thank-you/")
        End If






    End Sub

    Protected Sub btncancell_Click(sender As Object, e As EventArgs) Handles btncancell.Click

        TxtName.Text = ""
        TxtEmailID.Text = ""
        TxtTelephone.Text = ""

        txtlinkedin.Text = ""

    End Sub

End Class