Imports betatesting.DataSetCareTableAdapters
Imports betatesting.WebAdminsTableAdapters

Partial Class Admin_Default
    Inherits System.Web.UI.Page
    Dim ObjUsers As New USERSTableAdapter
    Dim ObjCPIP As New ControlPanelIPStatsTableAdapter
    Dim DsOtherAdmins As New OtherAdminLoginsTableAdapter
   Dim Permissions As String

    Dim i As Integer

    Dim userrole As String
    Dim OtherAdminID As Integer

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If TxtLoginID.Text = "mokshauser" Then
            userrole = ObjUsers.GetRoleByUserName(TxtLoginID.Text, TxtPwd.Text)
        Else
            userrole = "OtherAdmin"
            OtherAdminID = DsOtherAdmins.GetIdByUserNamePwd(TxtLoginID.Text, TxtPwd.Text)

            If OtherAdminID = 0 Then
                LblMsg.Text = "Invalid User ID / Password, Please Try Again !!"
                Exit Sub
            Else

                Dim dt As New Data.DataTable
                Dim dr As Data.DataRow
                dt = DsOtherAdmins.GetAllDataById(OtherAdminID)

                If dt.Rows.Count > 0 Then
                    dr = dt.Rows(0)
                    Session("OtherAdminID") = OtherAdminID
                    Permissions = dr("Permissions")
                    Session("Permissions") = Permissions
                    HttpContext.Current.Session.Add("Branch", dr("Branch"))
                Else
                    LblMsg.Text = "Invalid User ID / Password, Please Try Again !!"
                    Exit Sub
                End If
            End If
        End If


        Session.Timeout = 3600
        Session("Roles") = userrole
        If userrole <> "" Then
            'FormsAuthentication.Initialize()
            'FormsAuthentication.HashPasswordForStoringInConfigFile(TxtPwd.Text, "sha1")
            Dim ticket As New FormsAuthenticationTicket(1, TxtLoginID.Text, DateTime.Now, DateTime.Now.AddMinutes(180), False, userrole)
            Dim hash As String = FormsAuthentication.Encrypt(ticket)
            Dim cookie As New HttpCookie(FormsAuthentication.FormsCookieName, hash)
            Response.Cookies.Add(cookie)
            'If userrole = "admin" Then
            '    ObjCPIP.Insert(Request.ServerVariables("REMOTE_ADDR"), Now(), Now(), TxtLoginID.Text)
            '    Response.Redirect("NAdmin/default.aspx")
            'ElseIf userrole = "gadmin" Then
            '    ObjCPIP.Insert(Request.ServerVariables("REMOTE_ADDR"), Now(), Now(), TxtLoginID.Text)
            '    Response.Redirect("GAdmin/default.aspx")
            'End If

            ObjCPIP.Insert(Request.ServerVariables("REMOTE_ADDR"), Now(), Now(), TxtLoginID.Text)
            Response.Redirect("NAdmin/default.aspx")

        Else
            LblMsg.Text = "Invalid User ID / Password, Please Try Again !!"
        End If
    End Sub
End Class
