Imports betatesting.hhcTableAdapters
Public Class adminbasepage2
    Inherits System.Web.UI.MasterPage

    Dim DsCPIP As New hhcControlPanelIPStatsTableAdapter
    Dim Permissions As String
    Dim i As Integer
    Protected Sub TreeView1_SelectedNodeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView1.SelectedNodeChanged
        TreeView1.CollapseAll()
        TreeView1.SelectedNode.Expand()
    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Roles") = "" Then
            Response.Redirect("~/admin-hhc/default.aspx", True)
        End If

        If Not IsPostBack Then
            lblname.Text = Session("name")
            If CommonFunctions.CheckLisence(Request.ServerVariables("HTTP_HOST"), Request.ServerVariables("REMOTE_ADDR"), "Admin Control Panel") = False Then
                Response.Redirect("http://www.mokshamedia.co.in/healthcarecounterfeit.html")
            Else
                LblAdminHeader.Visible = True
                LblAdminHeader.Text = "<table bgcolor='#03ABD4'><tr><td><font face='Arial' size='3px' color='#FFFFFF'><strong>HHC ADMINISTRATOR CONTROL PANEL</strong></font></td></tr></table>"
                LblRights.Visible = True
                LblRights.Text = "<table><tr><td bgcolor='#FFFFFF'>All Rights Reserved @ <font class='TreeText'><a href='www.mokshamedia.in' target='_blank' title=' Hospitals'></a></font><br />Designed &amp; Developed by <font class='TreeText'><a href='http://www.mokshamedia.co.in' target='_blank' title='Moksha Media'>MOKSHA MEDIA</a></font></td></tr></table><br /><br />"
            End If

            Permissions = ""

            If Session("Roles") = "OtherAdmin" Then

                Permissions = Session("Permissions")

                If Permissions = "" Then
                    TreeView1.Visible = False
                Else
                    TreeView1.Visible = True
                    If Permissions.Contains("CMS") = False Then
                        TreeView1.Nodes.Remove(TreeView1.FindNode("CMS"))
                    End If
                    If Permissions.Contains("Users") = False Then
                        TreeView1.Nodes.Remove(TreeView1.FindNode("Users"))
                    End If


                End If
            ElseIf Session("Roles") = "admin" Then
                TreeView1.Visible = True
            End If


        End If
    End Sub

    Protected Sub btnlogout_Click(sender As Object, e As EventArgs) Handles btnlogout.Click


        DsCPIP.updatecplogout(Now(), DsCPIP.getcpipldbyloginid(Session("name")))
        FormsAuthentication.SignOut()
        Session.Abandon()

        ' clear authentication cookie
        Dim cookie1 As New HttpCookie(FormsAuthentication.FormsCookieName, "")
        cookie1.Expires = DateTime.Now.AddYears(-1)
        Response.Cookies.Add(cookie1)
        Response.Redirect("~/admin-hhc/default.aspx")


    End Sub

    Protected Sub button1_Click(sender As Object, e As EventArgs) Handles button1.Click
        Response.Redirect("~/admin-hhc/nadmin/default.aspx")
    End Sub

   
    Protected Sub btnchangepassword_Click(sender As Object, e As EventArgs) Handles btnchangepassword.Click
        Response.Redirect("~/admin-hhc/nadmin/change-password.aspx")
    End Sub
End Class