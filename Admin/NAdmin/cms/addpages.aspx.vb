Imports System
Imports betatesting.cmsTableAdapters
Imports Microsoft.VisualBasic.FileIO.FileSystem
Partial Public Class Admin_NAdmin_AboutUs_addpages
    Inherits Page
    Dim DsPages As New PagesTableAdapter()
    Protected Sub BtnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs)
        If DDLSection.SelectedIndex > 0 Then
            If (DsPages.CheckPrimary(TxtPageName.Text) = 0) Then
                Dim sortOrder As Integer
                If TxtSortOrder.Text = "" Then
                    sortOrder = 0
                Else
                    sortOrder = TxtSortOrder.Text
                End If
                If (Not FileExists(Server.MapPath("~/" & DDLSection.SelectedItem.Value) & "/" & TxtPageName.Text.Replace(" ", "-").Replace("&", "and").ToLower() & ".aspx")) Then
                    CopyFile(Server.MapPath("~/tempcontent.aspx"), Server.MapPath("~/" & DDLSection.SelectedItem.Value) & "/" & TxtPageName.Text.Replace(" ", "-").Replace("&", "and").ToLower() & ".aspx")
                End If
                DsPages.Insert(TxtContent.Value, "/" & DDLSection.SelectedItem.Value & "/" & TxtPageName.Text.Replace(" ", "-").Replace("&", "and").ToLower(), TxtPageName.Text, DDLSection.SelectedItem.Value, TxtKeywords.Text, TxtTitle.Text, sortOrder)
                LblMsg.Text = "Content Of Page [" & TxtPageName.Text & "] Added Successfully" '<br/> The URL Of this page is '/content.aspx?section=" & DDLSection.SelectedValue & "&id=" & CStr(thenode.ChildNodes.Count - 1) & "'"
                clear()
            Else
                LblMsg.Text = "Page already exists! try with any other page name"
            End If
        Else
            LblMsg.Text = "Page already exists! try with any other page name"
        End If
    End Sub

    Protected Sub clear()
        TxtPageName.Text = ""
        TxtTitle.Text = ""
        TxtContent.Value = ""
        TxtKeywords.Text = ""
    End Sub
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "CMS", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If
        End If
    End Sub
End Class