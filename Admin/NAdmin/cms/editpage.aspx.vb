Imports betatesting.cmsTableAdapters
Imports Microsoft.VisualBasic.FileIO.FileSystem

Partial Public Class Admin_NAdmin_cms_editpage
    Inherits Page

    Dim DsPages As New PagesTableAdapter()
    Protected Sub BtnSubmit_Click(ByVal sender As Object, ByVal e As EventArgs) Handles BtnSubmit.Click
        If DDLPages.SelectedValue <> "0" Then
            Dim sortOrder As Integer
            If TxtSortOrder.Text = "" Then
                sortOrder = 0
            Else
                sortOrder = TxtSortOrder.Text
            End If
            If (sectionrow.Visible) Then
                If (Not FileExists(Server.MapPath("~/" & DDLSection.SelectedItem.Value) & "/" & TxtPageName.Text.Replace(" ", "-").Replace("&", "and").ToLower() & ".aspx")) Then
                    CopyFile(Server.MapPath("~/tempcontent.aspx"), Server.MapPath("~/" & DDLSection.SelectedItem.Value) & "/" & TxtPageName.Text.Replace(" ", "-").Replace("&", "and").ToLower() & ".aspx")
                    DeleteFile(Server.MapPath(txtOldPageUrl.Text & ".aspx"))
                End If
                DsPages.Update(TxtContent.Value, "/" & DDLSection.SelectedItem.Value & "/" & TxtPageName.Text.Replace(" ", "-").Replace("&", "and").ToLower(), TxtPageName.Text, DDLSection.SelectedItem.Value, TxtKeywords.Text, TxtTitle.Text, sortOrder, DDLPages.SelectedItem.Value)
            Else
                DsPages.Update(TxtContent.Value, txtOldPageUrl.Text, TxtPageName.Text, DDLSection.SelectedItem.Value, TxtKeywords.Text, TxtTitle.Text, sortOrder, DDLPages.SelectedItem.Value)
            End If

            LblMsg.Text = "Content For Page [" & DDLPages.SelectedItem.Text & "] Saved Successfully"
            ClearControls()
            FillPages()
            DDLPages.SelectedIndex = -1
        End If
    End Sub
    'Protected Sub BtnRemove_Click(ByVal sender As Object, ByVal e As EventArgs)
    '    BtnRemove.OnClientClick = "if (confirm('Are you sure you want to delete this page?') == false) return false;"
    '    If DDLPages.SelectedValue <> "0" Then
    '        doc = New XmlDocument()
    '        doc.Load(Server.MapPath("../../../xmls/pagecontent.xml"))
    '        thenode = doc.FirstChild
    '        thenode = thenode.NextSibling
    '        thenode.RemoveChild(thenode.ChildNodes(DDLPages.SelectedIndex - 1))
    '        doc.Save(Server.MapPath("../../../xmls/pagecontent.xml"))
    '        LblMsg.Text = "Page [" & DDLPages.SelectedItem.Text & "] Removed Successfully"
    '        FillPages()
    '        ClearControls()
    '    End If
    'End Sub
    Protected Sub ClearControls()
        TxtTitle.Text = ""
        TxtContent.Value = ""
        TxtKeywords.Text = ""
        TxtShowHide.Text = ""
        TxtSortOrder.Text = ""
        TxtPageName.Text = ""
        DDLSection.SelectedIndex = -1
        pagenamerow.Visible = False
        sectionrow.Visible = False
        BtnDelete.Visible = False
    End Sub
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
        'Response.Write(thenode.FirstChild.Name)
    End Sub

    Protected Sub DDLPages_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLPages.SelectedIndexChanged
        ClearControls()
        LblMsg.Text = ""
        If DDLPages.SelectedValue <> "0" Then

            Dim DtPage As DataTable = DsPages.GetDataByPageId(DDLPages.SelectedItem.Value.ToLower())
            'Dim DtPages As DataTable = DsPages.GetDataByPageUrl(Request("page"))
            Dim dtrow As DataRow

            If DtPage.Rows.Count > 0 Then
                dtrow = DtPage.Rows(0)

                If Not IsDBNull(dtrow("PageName")) Then
                    TxtPageName.Text = dtrow("PageName")
                End If
                If Not IsDBNull(dtrow("PageContent")) Then
                    TxtContent.Value = dtrow("PageContent")
                End If
                If Not IsDBNull(dtrow("Title")) Then
                    TxtTitle.Text = dtrow("Title")
                End If
                If Not IsDBNull(dtrow("Keywords")) Then
                    TxtKeywords.Text = dtrow("Keywords")
                End If

                If Not IsDBNull(dtrow("SortOrder")) Then
                    TxtSortOrder.Text = dtrow("SortOrder")
                End If
                txtOldPageUrl.Text = dtrow("pageUrl")
                If Not IsDBNull(dtrow("Section")) Then
                    If (dtrow("Section") <> "") Then
                        If (dtrow("Section") <> dtrow("pageUrl")) Then
                            DDLSection.Items.FindByValue(dtrow("Section")).Selected = True
                            sectionrow.Visible = True
                            pagenamerow.Visible = True
                            BtnDelete.Visible = True
                        End If
                    End If
                End If
                'If Not IsDBNull(dtrow("PageId")) Then
                '    txtId.Text = dtrow("PageId")
                'End If

            End If
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "CMS", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If
            FillPages()
        End If
    End Sub

    Private Sub FillPages()
        DDLPages.DataSource = DsPages.GetData()
        DDLPages.DataTextField = "PageName"
        DDLPages.DataValueField = "PageId"
        DDLPages.DataBind()

        DDLPages.Items.Insert(0, "Select Page")
        DDLPages.Items(0).Value = ""
    End Sub

    Protected Sub BtnDelete_Click(sender As Object, e As EventArgs) Handles BtnDelete.Click
        If (DDLPages.SelectedItem.Value <> "0") Then
            DsPages.Delete(DDLPages.SelectedItem.Value)
            DeleteFile(Server.MapPath(txtOldPageUrl.Text & ".aspx"))
            LblMsg.Text = "Page [" & DDLPages.SelectedItem.Text & "] Removed Successfully"
            FillPages()
            ClearControls()
        End If
    End Sub
End Class


