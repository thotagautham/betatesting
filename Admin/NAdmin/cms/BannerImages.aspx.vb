Imports betatesting.cmsTableAdapters
Imports betatesting.HeaderBannerTableAdapters

Public Class BannerImages
    Inherits Page
    Dim dsBannerImages As New BannerImagesTableAdapter
    Dim pageArray As Array

    Dim DsPages As New PagesTableAdapter()

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            lbPages.DataSource = DsPages.GetData()
            lbPages.DataTextField = "PageName"
            lbPages.DataValueField = "PageUrl"
            lbPages.DataBind()

            lbPages.Items.Insert(0, "All Pages")
            lbPages.Items(0).Value = "0"
            BindData()
        End If
    End Sub
    Private Sub BindData()
        GvBannerImages.DataSource = dsBannerImages.GetData()
        GvBannerImages.DataBind()
    End Sub
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim pageUrl As String
        Dim fileNamee As String
        fileNamee = filename.Text

        If FuImage.HasFile Then
            If FuImage.PostedFile.ContentType <> "image/jpeg" And FuImage.PostedFile.ContentType <> "image/pjpeg" And FuImage.PostedFile.ContentType <> "image/gif" Then
                LblMsg.Text = "Files of type[" & FuImage.PostedFile.ContentType & "] are not allowed, Only Images are allowed"
            ElseIf FuImage.PostedFile.ContentLength > "1048576" Then
                LblMsg.Text = "Image size should not exceed 1MB"
            Else
                FuImage.PostedFile.SaveAs(Server.MapPath("~/BannerImages") & "/" & FuImage.PostedFile.FileName)
                fileNamee = FuImage.PostedFile.FileName
            End If
       End If
        Dim sortOrder = 0
        If txtSortOrder.Text <> "" Then
            sortOrder = txtSortOrder.Text
        End If
        pageUrl = GetListBoxSelectedItems(lbPages)
        If (btnSave.Text = "Update") Then
            dsBannerImages.Update(pageUrl, fileNamee, txtAlternateText.Text, sortOrder, txtDescription.Text, "", "", "", "", "", fileId.Text)
            btnSave.Text = "Save"
        Else
            dsBannerImages.Insert(pageUrl, fileNamee, txtAlternateText.Text, sortOrder, txtDescription.Text, "", "", "", "", "")
        End If

        ClearAll()
        BindData()
    End Sub
    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        ClearAll()
    End Sub

    Private Sub ClearAll()
        txtAlternateText.Text = ""
        txtSortOrder.Text = ""
        txtDescription.Text = ""
        filename.Text = ""
        fileId.Text = ""
        btnSave.Text = "Save"
        lbPages.SelectedIndex = -1
        RFVImage.Enabled = True
    End Sub

    Private Function GetListBoxSelectedItems(lb As ListBox) As String
        Dim selectedItems As String
        selectedItems = ""
        For i = 0 To lb.Items.Count - 1
            If lb.Items(i).Selected = True Then
                If (selectedItems = "") Then
                    selectedItems = "$" & lb.Items(i).Value & "$"
                Else
                    selectedItems = selectedItems & ",$" & lb.Items(i).Value & "$"
                End If
            End If
        Next i

        Return selectedItems
    End Function

    Protected Sub GvBannerImages_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GvBannerImages.RowCommand
        If e.CommandName = "CmdEdit" Then
            Dim DtImages As DataTable = dsBannerImages.GetDataById(e.CommandArgument)
            Dim dtrow As DataRow

            If DtImages.Rows.Count > 0 Then
                dtrow = DtImages.Rows(0)
                If Not IsDBNull(dtrow("PageUrl")) Then
                    pageArray = Split(dtrow("PageUrl").Replace("$", ""), ",")
                    For i = 0 To UBound(pageArray)
                        If Not lbPages.Items.FindByValue(pageArray(i)) Is Nothing Then
                            lbPages.Items.FindByValue(pageArray(i)).Selected = True
                        End If
                    Next
                End If
                txtAlternateText.Text = dtrow("AlternateText")
                txtSortOrder.Text = dtrow("SortOrder")
                txtDescription.Text = dtrow("Description")
                filename.Text = dtrow("ImagePath")
                fileId.Text = dtrow("Id")
                RFVImage.Enabled = False
                btnSave.Text = "Update"
            End If
        ElseIf e.CommandName = "CmdDelete" Then
            dsBannerImages.Delete(e.CommandArgument)
            BindData()
        End If
    End Sub

    Protected Sub GvBannerImages_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GvBannerImages.PageIndexChanging
        GvBannerImages.PageIndex = e.NewPageIndex
        BindData()
    End Sub
End Class