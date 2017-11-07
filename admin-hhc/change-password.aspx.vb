Imports betatesting.hhcTableAdapters
Public Class change_password
    Inherits System.Web.UI.Page
    Dim DsAdmins As New hhcAdminLoginsTableAdapter
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub BtnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSave.Click
        If CInt(DsAdmins.CheckOtherAdminIdPassword(Session("OtherAdminID"), TxtOldPassword.Text)) > 0 Then
            DsAdmins.UpdatePassword(TxtNewPassword.Text, Session("OtherAdminID"))
            LblMsg.Text = "<br /><br />Password Changed Successfully !<br /><br />"
        Else
            LblMsg.Text = "<br /><br />Invalid Password !, Please Try With The Other !<br /><br />"
        End If

        TxtConfirmPassword.Text = ""
        TxtNewPassword.Text = ""
        TxtOldPassword.Text = ""
    End Sub
End Class
