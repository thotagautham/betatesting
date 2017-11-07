Imports betatesting.CorporatesTableAdapters
Imports System.Data.SqlClient
Public Class _default33
    Inherits System.Web.UI.Page
    Dim DsAdmins As New HstockistdetailsTableAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If IsNothing(Session("HstockistdetailsID")) Then
                Response.Redirect("~/admin-stockist/sign-in/", True)
            End If
        End If
    End Sub

    Protected Sub BtnSave_Click(sender As Object, e As EventArgs) Handles BtnSave.Click
        If TxtNewPassword.Text = TxtConfirmPassword.Text Then

            If CInt(DsAdmins.getcountbyidpwd(Session("HstockistdetailsID"), TxtOldPassword.Text)) > 0 Then
                DsAdmins.updatepassword(TxtNewPassword.Text, Session("HstockistdetailsID"))
                lblmsg.Text = "<br /><br />Password Changed Successfully !<br /><br />"
            Else
                lblmsg.Text = "<br /><br />Invalid Password !, Please Try With The Other !<br /><br />"
            End If
        Else
            lblmsg.Text = " <br /><br />Password is not equal !, Please re enter password correctly !<br /><br />"
        End If
        TxtConfirmPassword.Text = ""
        TxtNewPassword.Text = ""
        TxtOldPassword.Text = ""
    End Sub
End Class