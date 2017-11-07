Imports System.IO
Imports System.Data.SqlClient
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web.UI.WebControls
Imports betatesting.CorporatesTableAdapters
Public Class _default6
    Inherits System.Web.UI.Page
    Dim dscardiac As New HstockistdetailsTableAdapter

    Dim ObjUsers As New HstockistdetailsTableAdapter


    Dim Permissions As String


    Dim i As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub BtnSave_Click(sender As Object, e As EventArgs) Handles BtnSave.Click
        Dim dt As New Data.DataTable
        Dim dr As Data.DataRow
        dt = ObjUsers.GetDataBylogindetails(TxtEmailId.Text, txtpassword.Text, TxtEmailId.Text, TxtEmailId.Text)

        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            Session("HstockistdetailsID") = dr("HstockistdetailsID")
            Session("hsfullname") = dr("hsfullname")
            Session("hslastname") = dr("hslastname")
            Session("hsemailid") = dr("hsemailid")
            Session("hsmobile") = dr("hsmobile")

            HttpContext.Current.Session.Add("hsfullname", dr("hslastname") & dr("HstockistdetailsID"))
            Session.Timeout = 3600

            'FormsAuthentication.Initialize()
            'FormsAuthentication.HashPasswordForStoringInConfigFile(TxtPwd.Text, "sha1")
            Dim ticket As New FormsAuthenticationTicket(1, TxtEmailId.Text, DateTime.Now, DateTime.Now.AddMinutes(180), False, "RegisteredMember")
            Dim hash As String = FormsAuthentication.Encrypt(ticket)
            Dim cookie As New HttpCookie(FormsAuthentication.FormsCookieName, hash)
            Response.Cookies.Add(cookie)
          
            'dscardio.Updateunpaiddatasigninpage("N", "0", "Appointment cancelled", Now(), "1", "0", "0")


            Response.Redirect("~/admin-stockist/Profile/")
        Else
            LblMsg.Text = "Invalid User ID / Password, Please Try Again !!"
            Exit Sub
        End If


    End Sub

End Class