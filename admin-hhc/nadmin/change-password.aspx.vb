Imports betatesting.hhcTableAdapters
Public Class change_password2
    Inherits System.Web.UI.Page
    Dim dsusers As New hhcAdminLoginsTableAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

        End If

    End Sub

    Protected Sub BtnSave_Click(sender As Object, e As EventArgs) Handles BtnSave.Click
        If CInt(dsusers.CheckOtherAdminIdPassword(Session("OtherAdminID"), TxtOldPassword.Text)) > 0 Then
            dsusers.Updatepassword(TxtNewPassword.Text, Session("OtherAdminID"))
            LblMsg.Text = "<br /><br />Password Changed Successfully !<br /><br />"
        Else
            LblMsg.Text = "<br /><br />Invalid Password !, Please Try With The Other !<br /><br />"
        End If

        TxtConfirmPassword.Text = ""
        TxtNewPassword.Text = ""
        TxtOldPassword.Text = ""
    End Sub
End Class