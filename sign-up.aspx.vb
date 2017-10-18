Imports System.Data.SqlClient
Imports betatesting.DataSetCareTableAdapters
Public Class _default4
    Inherits System.Web.UI.Page


    Dim DsAdmins As New VENDORSUsersTableAdapter
    Dim i As Integer
    Dim Permissions, Password As String
    Dim Message, subject, sendto As String

    Dim strsql As String
    Dim oracmd As SqlCommand
    Dim connString As String
    Public objConn As SqlConnection

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load





    End Sub


    Protected Sub BtnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSave.Click
        LblMsg.Text = ""
        If (DsAdmins.CheckPrimaryCount(TxtEmailId.Text) > 0) Then
            LblMsg.Text = "<br /><br />Login Id -- [" & TxtEmailId.Text & "] Already Exists, Please Try With Other !<br /><br />"
        Else
            If (txtpassword.Text = txtreenterpassword.Text) Then
                DsAdmins.Insert("", "", "0", "", "", "0", "0", "0", "0", "0", "Y", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", txtfirstname.Text, txtlastname.Text, TxtEmailId.Text, txtpassword.Text, "")
                LblMsg.Text = "<br /><br />User Added Successfully !<br /><br />Login Id(" & TxtEmailId.Text & ") /  Password (" & Password & ")"

                Message = ""
                If TxtEmailId.Text <> "" Then
                    Message = "<font face='Verdana' size='2'>Dear " & txtfirstname.Text & ", <br /><br />" & _
                            "<br /><br /></font>" & _
                            " Welcome to Moksha Media. Following are the details to access the administrator control panel.<br /><br />" & _
                            "<br />URL '" & System.Configuration.ConfigurationManager.AppSettings("WebsiteURL") & "sign-in.aspx'<br />" & _
                            "<br />User Name(Login Id) : " & TxtEmailId.Text & _
                            "<br />Password : " & txtpassword.Text & _
                            "<br /><br /><font face='Verdana' size='2'>Thanks & Regards,<br />" & _
                            "Website Support Team,<br />" & _
                            "Moksha Media. </font>"

                    subject = "Login Details -- http://www.mokshamedia.in/"
                    sendto = TxtEmailId.Text

                    Dim CF As New CommonFunctions
                    CF.SendMail(Message, sendto, subject)
                    LblMsg.Text = "<br /><br />User Added Successfully ! Login Details Emailed.<br /><br />"

                    sendto = System.Configuration.ConfigurationManager.AppSettings("ADDEXPERT")

                    CF.SendMail(Message, sendto, subject)
                    Response.Redirect("~/sign-in.aspx")
                End If
            Else
                LblMsg.Text = "<br /><br />Password should be equal to confirm password<br /><br />"
            End If
        End If
        ClearAll()

    End Sub






    Public Sub openConnection()
        connString = ConfigurationManager.ConnectionStrings("kfrcConnString").ConnectionString
        objConn = New SqlConnection(connString)
        objConn.Open()
    End Sub
    Public Sub closeConnection()
        objConn.Close()
        objConn = Nothing
    End Sub


    Protected Sub BtnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnCancel.Click
        ClearAll()
        BtnSave.Text = "Save"
        BtnCancel.Visible = False

        LblMsg.Text = ""



    End Sub

    Private Sub ClearAll()
        TxtEmailId.Text = ""
        txtlastname.Text = ""
        txtfirstname.Text = ""
        txtlastname.Text = ""
        txtpassword.Text = ""
        txtreenterpassword.Text = ""



    End Sub








End Class