Imports betatesting.DataSetCareTableAdapters
Imports betatesting.WebAdminsTableAdapters
Imports betatesting.newseventsTableAdapters

Public Class clicnidefault
    Inherits System.Web.UI.Page
    Dim DsIdentity As New CurrentIdentity

    Dim ObjUsers As New USERSTableAdapter
    Dim ObjCPIP As New ControlPanelIPStatsTableAdapter
    Dim DsUsers As New clinicUsersTableAdapter
    Dim Permissions As String

    Dim i As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

          
        End If

    

    End Sub

    Protected Sub BtnSave_Click(sender As Object, e As EventArgs) Handles BtnSave.Click


        If TxtEmailId.Text = "" Then
            LblMsg.Text = "Enter email id"
            Exit Sub
        Else
            If txtpassword.Text = "" Then
                LblMsg.Text = "Enter password"
            End If
        End If


        Dim dt As New Data.DataTable
        Dim dr As Data.DataRow
        dt = DsUsers.GetDataByidpwd(TxtEmailId.Text, txtpassword.Text)

        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            Session("UserId") = dr("clinicUsersid")

            HttpContext.Current.Session.Add("UserName", dr("Firstname") & dr("Lastname"))
            Session.Timeout = 3600

            'FormsAuthentication.Initialize()
            'FormsAuthentication.HashPasswordForStoringInConfigFile(TxtPwd.Text, "sha1")
            Dim ticket As New FormsAuthenticationTicket(1, TxtEmailId.Text, DateTime.Now, DateTime.Now.AddMinutes(180), False, "RegisteredMember")
            Dim hash As String = FormsAuthentication.Encrypt(ticket)
            Dim cookie As New HttpCookie(FormsAuthentication.FormsCookieName, hash)
            Response.Cookies.Add(cookie)
            ObjCPIP.Insert(Request.ServerVariables("REMOTE_ADDR"), Now(), Now(), TxtEmailId.Text)

            Session("LoginId") = CStr(DsIdentity.GetCurrentIdentityByTableName("ControlPanelIPStats"))
            Response.Redirect("~/receptionist/Profile/")
        Else
            LblMsg.Text = "Invalid User ID / Password, Please Try Again !!"
            Exit Sub
        End If


    End Sub
End Class