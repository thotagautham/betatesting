Imports betatesting.DataSetCareTableAdapters
Imports betatesting.WebAdminsTableAdapters
Public Class header
    Inherits System.Web.UI.UserControl
    Dim ObjCPIP As New ControlPanelIPStatsTableAdapter
    Private Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub


    Protected Sub ImgBtnLogOut_Click(sender As Object, e As ImageClickEventArgs) Handles ImgBtnLogOut.Click
        ObjCPIP.UpdateCPLogout(Now(), ObjCPIP.GetCpIpIdbyLoginid(HttpContext.Current.User.Identity.Name))
        FormsAuthentication.SignOut()
        Session.Abandon()

        ' clear authentication cookie
        Dim cookie1 As New HttpCookie(FormsAuthentication.FormsCookieName, "")
        cookie1.Expires = DateTime.Now.AddYears(-1)
        Response.Cookies.Add(cookie1)
        Response.Redirect("~/default.aspx")
    End Sub
End Class
