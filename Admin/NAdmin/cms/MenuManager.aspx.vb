Imports System
Imports System.Collections 
Imports System.Configuration 
Imports System.Data 
Imports System.Web 
Imports System.Web.Security 
Imports System.Web.UI 
Imports System.Web.UI.HtmlControls 
Imports System.Web.UI.WebControls 
Imports System.Web.UI.WebControls.WebParts 
Imports System.Xml 

Partial Public Class Admin_NAdmin_cms_MenuManager
    Inherits System.Web.UI.Page
    Private thenode As XmlNode
    Private doc As XmlDocument
    Private child As XmlNode, prenode As XmlNode, selnode As XmlNode, nextnode As XmlNode
    Private list As XmlNodeList
    Private Li As ListItem
    Private i As Integer = 0, j As Integer
    Private TempStorage As String
    Dim Permissions As String

    
    Protected Sub FillPages()
        doc = New XmlDocument()
        doc.Load(Server.MapPath("../../../xmls/" & DDLSection.SelectedValue & ".xml"))
        thenode = doc.FirstChild
        thenode = thenode.NextSibling

        LBPages.Items.Clear()

        While i < thenode.ChildNodes.Count
            child = thenode.ChildNodes(i)
            Li = New ListItem()
            Li.Text = child.ChildNodes(0).InnerText
            Li.Value = child.Name
            LBPages.Items.Add(Li)
            i += 1
        End While


    End Sub
    Protected Sub Delete_Click(ByVal sender As Object, ByVal e As EventArgs)
        If LBPages.SelectedIndex < 0 Then
            LblMsg.Text = "Select Any Page And Try Again"
        Else
            doc = New XmlDocument()
            doc.Load(Server.MapPath("../../../xmls/" & DDLSection.SelectedValue & ".xml"))
            thenode = doc.FirstChild
            thenode = thenode.NextSibling
            thenode.RemoveChild(thenode.ChildNodes(LBPages.SelectedIndex))
            doc.Save(Server.MapPath("../../../xmls/" & DDLSection.SelectedValue & ".xml"))
            FillPages()
        End If
    End Sub
    Protected Sub btnmoveup_Click(ByVal sender As Object, ByVal e As EventArgs)
        If LBPages.SelectedIndex > 0 Then
            doc = New XmlDocument()
            doc.Load(Server.MapPath("../../../xmls/" & DDLSection.SelectedValue & ".xml"))
            thenode = doc.FirstChild
            thenode = thenode.NextSibling
            prenode = thenode.ChildNodes(LBPages.SelectedIndex - 1)
            selnode = thenode.ChildNodes(LBPages.SelectedIndex)

            Dim root As XmlNode
            root = doc.DocumentElement

            root.ReplaceChild(selnode, prenode)
            root.InsertAfter(prenode, thenode.ChildNodes(LBPages.SelectedIndex - 1))
            'root.ReplaceChild(prenode, selnode); 

            doc.Save(Server.MapPath("../../../xmls/" & DDLSection.SelectedValue & ".xml"))
            FillPages()
        Else
            If LBPages.SelectedIndex <> 0 Then
                LblMsg.Text = "Select Any Page And Try Again"
            End If
        End If

    End Sub
    Protected Sub btnmovedown_Click(ByVal sender As Object, ByVal e As EventArgs) Handles btnmovedown.Click
        If LBPages.SelectedIndex < 0 Then
            LblMsg.Text = "Select Any Page And Try Again"
        Else
            If LBPages.SelectedIndex < LBPages.Items.Count - 1 Then
                doc = New XmlDocument()
                doc.Load(Server.MapPath("../../../xmls/" & DDLSection.SelectedValue & ".xml"))
                thenode = doc.FirstChild
                thenode = thenode.NextSibling
                nextnode = thenode.ChildNodes(LBPages.SelectedIndex + 1)
                selnode = thenode.ChildNodes(LBPages.SelectedIndex)

                Dim root As XmlNode
                root = doc.DocumentElement

                root.ReplaceChild(nextnode, selnode)
                root.InsertAfter(selnode, thenode.ChildNodes(LBPages.SelectedIndex))
                'root.ReplaceChild(prenode, selnode); 

                doc.Save(Server.MapPath("../../../xmls/" & DDLSection.SelectedValue & ".xml"))
                FillPages()
            End If
        End If
    End Sub
    Protected Sub BtnShow_Click(ByVal sender As Object, ByVal e As EventArgs)
        If LBPages.SelectedIndex < 0 Then
            LblMsg.Text = "Select Any Page And Try Again"
        Else
            showhide("Y")
        End If
    End Sub

    Protected Sub showhide(ByVal SH As String)
        doc = New XmlDocument()
        doc.Load(Server.MapPath("../../../xmls/" & DDLSection.SelectedValue & ".xml"))
        thenode = doc.FirstChild
        thenode = thenode.NextSibling
        selnode = thenode.ChildNodes(LBPages.SelectedIndex)
        selnode.ChildNodes(4).InnerText = SH
        doc.Save(Server.MapPath("../../../xmls/" & DDLSection.SelectedValue & ".xml"))
    End Sub

    Protected Sub BtnHide_Click(ByVal sender As Object, ByVal e As EventArgs)
        If LBPages.SelectedIndex < 0 Then
            LblMsg.Text = "Select Any Page And Try Again"
        Else
            showhide("N")
        End If
    End Sub

    Protected Sub BtnShowURL_Click(ByVal sender As Object, ByVal e As EventArgs)
        If LBPages.SelectedIndex < 0 Then
            LblMsg.Text = "Select Any Page And Try Again"
        Else
            LblMsg.Text = "URL Of the selected page [ <b>" & LBPages.SelectedItem.Text & "</b> ] --> '" & System.Configuration.ConfigurationManager.AppSettings("WebsiteURL") & "content.aspx?section=" & DDLSection.SelectedValue & "&id=" & LBPages.SelectedIndex.ToString() & "'"
        End If
    End Sub

    Protected Sub DDLSection_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLSection.SelectedIndexChanged
        If DDLSection.SelectedIndex > 0 Then
            FillPages()
        Else
            LBPages.Items.Clear()
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "CMS", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If
        End If
    End Sub
End Class
