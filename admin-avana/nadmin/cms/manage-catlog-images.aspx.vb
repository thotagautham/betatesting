Imports betatesting.avanaTableAdapters
Imports betatesting.DataSetCareTableAdapters
Imports betatesting.HeaderBannerTableAdapters
Imports System.Data.SqlClient
Imports System.IO
Imports betatesting.newseventsTableAdapters
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web.UI.WebControls
Public Class manage_catlog_images
    Inherits System.Web.UI.Page
    Dim dscatlog As New avanacatlogimagesTableAdapter
    Dim ThumbnailImageName As String
    Dim DsIdentity As New CurrentIdentity


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not IsPostBack Then

            catlogimages.Visible = False


            buildquery()
        End If
       


    End Sub

    Private Sub buildquery()
        GVPrintNews.DataSource = dscatlog.GetDataBycatlogid(Request("ID"))
        GVPrintNews.DataBind()
    End Sub

    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click



        ThumbnailImageName = "no_img.jpg"
       


        If btnsave.Text = "Update" Then
            If FUNewsImage.HasFile Then
                If FUNewsImage.PostedFile.ContentType <> "image/jpeg" And FUNewsImage.PostedFile.ContentType <> "image/pjpeg" And FUNewsImage.PostedFile.ContentType <> "image/gif" Then
                    LblMsg.Text = "Files Of Type [" & FUNewsImage.PostedFile.ContentType & "] Not Allowed"
                    Exit Sub

                ElseIf FUNewsImage.PostedFile.ContentLength > "31457280" Then
                    Page.ClientScript.RegisterStartupScript(Me.GetType(), "EnquiryAlert", "alert('Report File size should not exceed 30 MB');", True)
                    Exit Sub
                ElseIf btnsave.Text = "Update" Then

                    If FUNewsImage.HasFile Then
                        ThumbnailImageName = CStr(ViewState("avanacatlogimages")) & "." & Path.GetExtension(FUNewsImage.PostedFile.FileName)
                        FUNewsImage.PostedFile.SaveAs(Server.MapPath("~/files/avana/images") & "/" & ThumbnailImageName)
                    Else
                        ThumbnailImageName = ViewState("imageurl")
                    End If


                    dscatlog.Update(Request("ID"), txttitle.Text, txtlongdescriptiontext.Text, txtsortorder.Text, ThumbnailImageName, fileId.Text)
                    btnsave.Text = "Add New"

                    catlogimages.Visible = False
                    buildquery()
                    ClearAll()

                End If
            Else
                LblMsg.Text = "Upload An Image"
            End If



          

        ElseIf btnsave.Text = "Add New" Then

            btnsave.Text = "Save"

            catlogimages.Visible = True

            ClearAll()

        ElseIf btnsave.Text = "Save" Then


            If FUNewsImage.HasFile Then
                If FUNewsImage.PostedFile.ContentType <> "image/jpeg" And FUNewsImage.PostedFile.ContentType <> "image/pjpeg" And FUNewsImage.PostedFile.ContentType <> "image/gif" Then
                    LblMsg.Text = "Files Of Type [" & FUNewsImage.PostedFile.ContentType & "] Not Allowed"
                    Exit Sub

                ElseIf FUNewsImage.PostedFile.ContentLength > "31457280" Then
                    Page.ClientScript.RegisterStartupScript(Me.GetType(), "EnquiryAlert", "alert('Report File size should not exceed 30 MB');", True)
                    Exit Sub
                ElseIf btnsave.Text = "Save" Then

                    ThumbnailImageName = CStr(DsIdentity.GetCurrentIdentityByTableName("avanacatlogimages") + 1) & Path.GetExtension(FUNewsImage.PostedFile.FileName)
                    FUNewsImage.PostedFile.SaveAs(Server.MapPath("~/files/avana/images") & "/" & ThumbnailImageName)

                    dscatlog.Insert(Request("ID"), txttitle.Text, txtlongdescriptiontext.Text, txtsortorder.Text, ThumbnailImageName)

                    btnsave.Text = "Add New"

                    catlogimages.Visible = False
                    '
                    buildquery()
                    ClearAll()

                End If
            Else
                LblMsg.Text = "Upload An Image"
            End If






            End If






    End Sub


    Private Sub ClearAll()
        txttitle.Text = ""
        txtlongdescriptiontext.Text = ""
        txtsortorder.Text = ""



    End Sub

    Protected Sub GVPrintNews_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVPrintNews.PageIndexChanging
        GVPrintNews.PageIndex = e.NewPageIndex

        GVPrintNews.DataSource = dscatlog.GetData
        GVPrintNews.DataBind()
    End Sub

    Protected Sub GVPrintNews_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVPrintNews.RowCommand
        If e.CommandName = "CmdEdit" Then
            ClearAll()
            Dim DtImages As DataTable = dscatlog.GetDataByid(e.CommandArgument)
            Dim dtrow As DataRow

            If DtImages.Rows.Count > 0 Then
                dtrow = DtImages.Rows(0)


                txtsortorder.Text = dtrow("name")
                txtlongdescriptiontext.Text = dtrow("longdescription")
                txtsortorder.Text = dtrow("shortdescription")
               
                btnsave.Text = "Update"

                ViewState("imageurl") = dtrow("ImageURL")
                fileId.Text = dtrow("avanacatlogimagesID")
                catlogimages.Visible = True

            End If
        ElseIf e.CommandName = "CmdDelete" Then
            dscatlog.Delete(e.CommandArgument)
            LblMsg.Text = "Catlog Image Deleted Successfully"
        End If

        GVPrintNews.DataSource = dscatlog.GetData
        GVPrintNews.DataBind()
    End Sub
End Class