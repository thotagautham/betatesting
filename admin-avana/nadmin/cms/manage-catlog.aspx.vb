Imports betatesting.avanaTableAdapters
Imports System.Data.SqlClient
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web.UI.WebControls
Imports System.IO
Imports betatesting.DataSetCareTableAdapters
Imports betatesting.HeaderBannerTableAdapters
Imports betatesting.newseventsTableAdapters

Public Class manage_catlog
    Inherits System.Web.UI.Page
    Dim dscolour As New ColoursTableAdapter
    Dim dscatolog As New avanacatlogTableAdapter
    Dim DsIdentity As New CurrentIdentity
    Dim ThumbnailImageName As String
    Dim ThumbnailImageName1 As String
    Dim ThumbnailImageName2 As String
    Dim ThumbnailImageName3 As String
    Dim ThumbnailImageName4 As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            ddlcolour.DataSource = dscolour.GetData
            ddlcolour.DataValueField = "ColourID"
            ddlcolour.DataTextField = "colourname"
            ddlcolour.DataBind()
            ddlcolour.Items.Add("-- Select Any Colour --")
            ddlcolour.Items(0).Value = ""
            buildquery()
            CATLOG.Visible = False
           
        End If
    End Sub

    Private Sub buildquery()
        GVPrintNews.DataSource = dscatolog.GetData
        GVPrintNews.DataBind()
    End Sub

    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click



        ThumbnailImageName = "no_img.jpg"
        ThumbnailImageName1 = "no_img.jpg"
        ThumbnailImageName2 = "no_img.jpg"
        ThumbnailImageName3 = "no_img.jpg"
        ThumbnailImageName4 = "no_img.jpg"


        If FUNewsImage.HasFile Then
            If FUNewsImage.PostedFile.ContentType <> "image/jpeg" And FUNewsImage.PostedFile.ContentType <> "image/pjpeg" And FUNewsImage.PostedFile.ContentType <> "image/gif" Then
                LblMsg.Text = "Files Of Type [" & FUNewsImage.PostedFile.ContentType & "] Not Allowed"
                Exit Sub

            ElseIf FUNewsImage.PostedFile.ContentLength > "31457280" Then
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "EnquiryAlert", "alert('Report File size should not exceed 30 MB');", True)
                Exit Sub
            ElseIf btnsave.Text = "Save" Then

                ThumbnailImageName = CStr(DsIdentity.GetCurrentIdentityByTableName("avanacatlog") + 1) & "_1" & Path.GetExtension(FUNewsImage.PostedFile.FileName)
                FUNewsImage.PostedFile.SaveAs(Server.MapPath("~/files/avana/images") & "/" & ThumbnailImageName)
            ElseIf btnsave.Text = "Update" Then
                If FUNewsImage.HasFile Then
                    ThumbnailImageName = CStr(ViewState("avanacatlog")) & "-1" & Path.GetExtension(FUNewsImage.PostedFile.FileName)
                    FUNewsImage.PostedFile.SaveAs(Server.MapPath("~/files/avana/images") & "/" & ThumbnailImageName)
                Else
                    ThumbnailImageName = ViewState("imageurl1")
                End If

            End If
       

        End If
        If FUNewsImage1.HasFile Then
            If FUNewsImage1.PostedFile.ContentType <> "image/jpeg" And FUNewsImage1.PostedFile.ContentType <> "image/pjpeg" And FUNewsImage1.PostedFile.ContentType <> "image/gif" Then
                LblMsg.Text = "Files Of Type [" & FUNewsImage1.PostedFile.ContentType & "] Not Allowed"
                Exit Sub

            ElseIf FUNewsImage1.PostedFile.ContentLength > "31457280" Then
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "EnquiryAlert", "alert('Report File size should not exceed 30 MB');", True)
                Exit Sub
            ElseIf btnsave.Text = "Save" Then

                ThumbnailImageName1 = CStr(DsIdentity.GetCurrentIdentityByTableName("avanacatlog") + 1) & "_2" & Path.GetExtension(FUNewsImage1.PostedFile.FileName)
                FUNewsImage1.PostedFile.SaveAs(Server.MapPath("~/files/avana/images") & "/" & ThumbnailImageName1)
            ElseIf btnsave.Text = "Update" Then
                If FUNewsImage1.HasFile Then
                    ThumbnailImageName1 = CStr(ViewState("avanacatlog")) & "-1" & Path.GetExtension(FUNewsImage1.PostedFile.FileName)
                    FUNewsImage1.PostedFile.SaveAs(Server.MapPath("~/files/avana/images") & "/" & ThumbnailImageName1)
                Else
                    ThumbnailImageName1 = ViewState("imageurl2")
                End If

            End If
        
        End If


        If FUNewsImage2.HasFile Then
            If FUNewsImage2.PostedFile.ContentType <> "image/jpeg" And FUNewsImage2.PostedFile.ContentType <> "image/pjpeg" And FUNewsImage2.PostedFile.ContentType <> "image/gif" Then
                LblMsg.Text = "Files Of Type [" & FUNewsImage2.PostedFile.ContentType & "] Not Allowed"
                Exit Sub

            ElseIf FUNewsImage2.PostedFile.ContentLength > "31457280" Then
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "EnquiryAlert", "alert('Report File size should not exceed 30 MB');", True)
                Exit Sub
            ElseIf btnsave.Text = "Save" Then

                ThumbnailImageName2 = CStr(DsIdentity.GetCurrentIdentityByTableName("avanacatlog") + 1) & "_3" & Path.GetExtension(FUNewsImage2.PostedFile.FileName)
                FUNewsImage2.PostedFile.SaveAs(Server.MapPath("~/files/avana/images") & "/" & ThumbnailImageName2)
            ElseIf btnsave.Text = "Update" Then
                If FUNewsImage2.HasFile Then
                    ThumbnailImageName2 = CStr(ViewState("avanacatlog")) & "-1" & Path.GetExtension(FUNewsImage2.PostedFile.FileName)
                    FUNewsImage2.PostedFile.SaveAs(Server.MapPath("~/files/avana/images") & "/" & ThumbnailImageName2)
                Else
                    ThumbnailImageName2 = ViewState("imageurl3")
                End If

            End If
       
        End If


        If FUNewsImage3.HasFile Then
            If FUNewsImage3.PostedFile.ContentType <> "image/jpeg" And FUNewsImage3.PostedFile.ContentType <> "image/pjpeg" And FUNewsImage3.PostedFile.ContentType <> "image/gif" Then
                LblMsg.Text = "Files Of Type [" & FUNewsImage3.PostedFile.ContentType & "] Not Allowed"
                Exit Sub

            ElseIf FUNewsImage3.PostedFile.ContentLength > "31457280" Then
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "EnquiryAlert", "alert('Report File size should not exceed 30 MB');", True)
                Exit Sub
            ElseIf btnsave.Text = "Save" Then

                ThumbnailImageName3 = CStr(DsIdentity.GetCurrentIdentityByTableName("avanacatlog") + 1) & "_4" & Path.GetExtension(FUNewsImage3.PostedFile.FileName)
                FUNewsImage3.PostedFile.SaveAs(Server.MapPath("~/files/avana/images") & "/" & ThumbnailImageName3)
            ElseIf btnsave.Text = "Update" Then
                If FUNewsImage3.HasFile Then
                    ThumbnailImageName3 = CStr(ViewState("avanacatlog")) & "-1" & Path.GetExtension(FUNewsImage3.PostedFile.FileName)
                    FUNewsImage3.PostedFile.SaveAs(Server.MapPath("~/files/avana/images") & "/" & ThumbnailImageName3)
                Else
                    ThumbnailImageName3 = ViewState("imageurl4")
                End If

            End If

        End If


        If FUNewsImage4.HasFile Then
            If FUNewsImage4.PostedFile.ContentType <> "image/jpeg" And FUNewsImage4.PostedFile.ContentType <> "image/pjpeg" And FUNewsImage4.PostedFile.ContentType <> "image/gif" Then
                LblMsg.Text = "Files Of Type [" & FUNewsImage4.PostedFile.ContentType & "] Not Allowed"
                Exit Sub

            ElseIf FUNewsImage4.PostedFile.ContentLength > "31457280" Then
                Page.ClientScript.RegisterStartupScript(Me.GetType(), "EnquiryAlert", "alert('Report File size should not exceed 30 MB');", True)
                Exit Sub
            ElseIf btnsave.Text = "Save" Then

                ThumbnailImageName4 = CStr(DsIdentity.GetCurrentIdentityByTableName("avanacatlog") + 1) & "_5" & Path.GetExtension(FUNewsImage4.PostedFile.FileName)
                FUNewsImage4.PostedFile.SaveAs(Server.MapPath("~/files/avana/images") & "/" & ThumbnailImageName4)
            ElseIf btnsave.Text = "Update" Then
                If FUNewsImage4.HasFile Then
                    ThumbnailImageName4 = CStr(ViewState("avanacatlog")) & "-1" & Path.GetExtension(FUNewsImage4.PostedFile.FileName)
                    FUNewsImage4.PostedFile.SaveAs(Server.MapPath("~/files/avana/images") & "/" & ThumbnailImageName4)
                Else
                    ThumbnailImageName4 = ViewState("imageurl5")
                End If

            End If

        End If


        If btnsave.Text = "Update" Then
           



            dscatolog.Update(txtname.Text, txtlongdescriptiontext.Value, txtshortdescriptiontext.Value, txtsku.Text, ddlcolour.SelectedItem.Value, txtweight.Text, txtmaerial.Value, txtmeasurments.Value, txtcare.Value, txtshipping.Text, txtprice.Text, txtnote.Value, ThumbnailImageName, ThumbnailImageName1, ThumbnailImageName2, ThumbnailImageName3, ThumbnailImageName4, fileId.Text)
            btnsave.Text = "Add New"

            CATLOG.Visible = False
            buildquery()
            ClearAll()

        ElseIf btnsave.Text = "Add New" Then

            btnsave.Text = "Save"

            CATLOG.Visible = True

            ClearAll()

        ElseIf btnsave.Text = "Save" Then


          

            dscatolog.Insert(txtname.Text, txtlongdescriptiontext.Value, txtshortdescriptiontext.Value, txtsku.Text, ddlcolour.SelectedItem.Value, txtweight.Text, txtmaerial.Value, txtmeasurments.Value, txtcare.Value, txtshipping.Text, txtprice.Text, txtnote.Value, ThumbnailImageName, ThumbnailImageName1, ThumbnailImageName2, ThumbnailImageName3, ThumbnailImageName4)

            btnsave.Text = "Add New"

            CATLOG.Visible = False
            '
            buildquery()
            ClearAll()
          
        End If






    End Sub


    Private Sub ClearAll()
        txtname.Text = ""
        txtlongdescriptiontext.Value = ""
        txtshortdescriptiontext.Value = ""
        txtsku.Text = ""
        ddlcolour.SelectedItem.Value = ""
        txtweight.Text = ""
        txtmaerial.Value = ""
        txtmeasurments.Value = ""
        txtcare.Value = ""
        txtshipping.Text = ""

        txtprice.Text = ""
        txtnote.Value = ""


    End Sub

    Protected Sub GVPrintNews_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVPrintNews.PageIndexChanging
        GVPrintNews.PageIndex = e.NewPageIndex
        
        GVPrintNews.DataSource = dscatolog.GetData
        GVPrintNews.DataBind()
    End Sub

    Protected Sub GVPrintNews_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVPrintNews.RowCommand
        If e.CommandName = "CmdEdit" Then
            ClearAll()
            Dim DtImages As DataTable = dscatolog.GetDataById(e.CommandArgument)
            Dim dtrow As DataRow

            If DtImages.Rows.Count > 0 Then
                dtrow = DtImages.Rows(0)


                txtname.Text = dtrow("name")
                txtlongdescriptiontext.Value = dtrow("longdescription")
                txtshortdescriptiontext.Value = dtrow("shortdescription")
                txtsku.Text = dtrow("sku")
                ddlcolour.SelectedItem.Value = dtrow("colour")
                txtweight.Text = dtrow("weight")
                txtmaerial.Value = dtrow("material")
                txtmeasurments.Value = dtrow("measurments")
                txtcare.Value = dtrow("care")
                txtshipping.Text = dtrow("shippinginfo")

                txtprice.Text = dtrow("price")
                txtnote.Value = dtrow("notes")
                btnsave.Text = "Update"
                ViewState("imageurl") = dtrow("image1")
                ViewState("imageurl1") = dtrow("image2")
                ViewState("imageurl2") = dtrow("image3")
                ViewState("imageurl3") = dtrow("image4")
                ViewState("imageurl4") = dtrow("image5")
                fileId.Text = dtrow("avanacatlogID")
                CATLOG.Visible = True
               

            End If
        ElseIf e.CommandName = "CmdDelete" Then
            dscatolog.Delete(e.CommandArgument)
            LblMsg.Text = "Catlog Deleted Successfully"
        End If

        GVPrintNews.DataSource = dscatolog.GetData
        GVPrintNews.DataBind()
    End Sub
End Class