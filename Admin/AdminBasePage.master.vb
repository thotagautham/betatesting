Imports betatesting.DataSetCareTableAdapters

Partial Class AdminBasePage
    Inherits System.Web.UI.MasterPage
    Dim DsCPIP As New ControlPanelIPStatsTableAdapter
    Dim Permissions As String
    Dim i As Integer
    Protected Sub TreeView1_SelectedNodeChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles TreeView1.SelectedNodeChanged
        TreeView1.CollapseAll()
        TreeView1.SelectedNode.Expand()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("Roles") = "" Then
            Response.Redirect("~/admin/default.aspx", True)
        End If

        If Not IsPostBack Then

            If CommonFunctions.CheckLisence(Request.ServerVariables("HTTP_HOST"), Request.ServerVariables("REMOTE_ADDR"), "Admin Control Panel") = False Then
                Response.Redirect("http://www.mokshamedia.co.in/healthcarecounterfeit.html")
            Else
                LblAdminHeader.Visible = True
                LblAdminHeader.Text = "<table bgcolor='#03ABD4'><tr><td><font face='Arial' size='3px' color='#FFFFFF'><strong>Moksha Media ADMINISTRATOR CONTROL PANEL</strong></font></td></tr></table>"
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

                    If Permissions.Contains("DRUG") = False Then
                        TreeView1.Nodes.Remove(TreeView1.FindNode("DRUG"))
                    End If
                    If Permissions.Contains("WGC-BIOGENESIS") = False Then
                        TreeView1.Nodes.Remove(TreeView1.FindNode("WGC-BIOGENESIS"))
                    End If
                    If Permissions.Contains("UTOPIA-SILVER-STONE") = False Then
                        TreeView1.Nodes.Remove(TreeView1.FindNode("UTOPIA-SILVER-STONE"))
                    End If
                    If Permissions.Contains("GENETICS-GENOMICS-MEDICINE") = False Then
                        TreeView1.Nodes.Remove(TreeView1.FindNode("GENETICS-GENOMICS-MEDICINE"))
                    End If
                    If Permissions.Contains("GCS") = False Then
                        TreeView1.Nodes.Remove(TreeView1.FindNode("GCS"))
                    End If

                    If Permissions.Contains("GERIATRICS") = False Then
                        TreeView1.Nodes.Remove(TreeView1.FindNode("GERIATRICS"))
                    End If
                    If Permissions.Contains("GYNACOLOGY") = False Then
                        TreeView1.Nodes.Remove(TreeView1.FindNode("GYNACOLOGY"))
                    End If
                    If Permissions.Contains("HEALTHCARECONSORIUM") = False Then
                        TreeView1.Nodes.Remove(TreeView1.FindNode("HEALTHCARECONSORIUM"))
                    End If
                    If Permissions.Contains("INNOVATION") = False Then
                        TreeView1.Nodes.Remove(TreeView1.FindNode("INNOVATION"))
                    End If

                    If Permissions.Contains("VEDIC") = False Then
                        TreeView1.Nodes.Remove(TreeView1.FindNode("VEDIC"))
                    End If
                    If Permissions.Contains("WCW") = False Then
                        TreeView1.Nodes.Remove(TreeView1.FindNode("WCW"))
                    End If



                    If Permissions.Contains("Users") = False Then
                        TreeView1.Nodes.Remove(TreeView1.FindNode("Users"))
                    End If

                    If Permissions.Contains("RETIERMENT-HOMES") = False Then
                        TreeView1.Nodes.Remove(TreeView1.FindNode("RETIERMENT-HOMES"))
                    End If

                    If Permissions.Contains("EPISTEMO-GLOBAL") = False Then
                        TreeView1.Nodes.Remove(TreeView1.FindNode("EPISTEMO-GLOBAL"))
                    End If

                    If Permissions.Contains("CARE") = False Then
                        TreeView1.Nodes.Remove(TreeView1.FindNode("CARE"))
                    End If

                    If Permissions.Contains("Moksha") = False Then
                        TreeView1.Nodes.Remove(TreeView1.FindNode("Moksha"))
                    End If




                End If
            ElseIf Session("Roles") = "admin" Then
                TreeView1.Visible = True
            End If


        End If
    End Sub

    Protected Sub ImgBtnLogOut_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImgBtnLogOut.Click
        DsCPIP.UpdateCPLogout(Now(), DsCPIP.GetCpIpIdbyLoginid(HttpContext.Current.User.Identity.Name))
        FormsAuthentication.SignOut()
        Session.Abandon()

        ' clear authentication cookie
        Dim cookie1 As New HttpCookie(FormsAuthentication.FormsCookieName, "")
        cookie1.Expires = DateTime.Now.AddYears(-1)
        Response.Cookies.Add(cookie1)
        Response.Redirect("~/admin/default.aspx")
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Response.Redirect("~/admin/nadmin/default.aspx")
    End Sub
End Class

