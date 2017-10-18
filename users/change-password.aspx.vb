Imports betatesting.DataSetCareTableAdapters
Public Class change_password
    Inherits System.Web.UI.Page
    Dim DsAdmins As New VENDORSUsersTableAdapter
    Protected Sub BtnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSave.Click
        If CInt(DsAdmins.checkidpasswordlogin(Session("UserId"), TxtOldPassword.Text)) > 0 Then
            DsAdmins.Updatepassword(TxtNewPassword.Text, Session("UserId"))
            LblMsg.Text = "<br /><br />Password Changed Successfully !<br /><br />"
        Else
            LblMsg.Text = "<br /><br />Invalid Password !, Please Try With The Other !<br /><br />"
        End If

        TxtConfirmPassword.Text = ""
        TxtNewPassword.Text = ""
        TxtOldPassword.Text = ""
    End Sub

    Private Sub change_password_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If IsNothing(Session("UserId")) Then
                Response.Redirect("~/default.aspx", True)
            End If
        End If
    End Sub
End Class