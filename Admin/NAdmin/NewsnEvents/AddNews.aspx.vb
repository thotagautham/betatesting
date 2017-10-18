Imports betatesting.newseventsTableAdapters
Imports betatesting.DataSetCareTableAdapters
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Collections
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Xml
Imports System.IO
Partial Class Admin_NAdmin_NewsnEvents_AddNews
    Inherits System.Web.UI.Page
    Dim DsOhPrintMedia As New News_PrintMediaTableAdapter
    Dim DsIdentity As New CurrentIdentity
    Dim DsNewspaper As New NewsPapersTableAdapter
    Dim DsBranch As New BRANCH1TableAdapter
    Dim DsSpecs As New SPECIALIZATIONTableAdapter

    Dim NewsImageName As String
    Dim PdfName As String
    Dim PageNumber As String
    Dim Language As String
    Dim NewsPaperLogo As String

    Private thenode As XmlNode
    Private doc As XmlDocument
    Private newnode As XmlNode
    ' XmlNodeList list; 
    Private i As Integer, j As Integer, k As Integer = 0
    'XmlNode child; 

    Protected Sub BtnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSave.Click
        LblMsg.Text = ""
        If CInt(DsOhPrintMedia.CheckPrimary(TxtTitle.Text)) > 0 Then
            LblMsg.Text = "News With Title [ " & TxtTitle.Text & " ] Already Exists"
        Else
            If Not FUNewsImage.HasFile Then
                LblMsg.Text = "Upload Any News Image And Try Again !"
            Else
                If FUNewsImage.PostedFile.ContentType <> "image/jpeg" And FUNewsImage.PostedFile.ContentType <> "image/pjpeg" And FUNewsImage.PostedFile.ContentType <> "image/gif" Then
                    LblMsg.Text = "Files Of Type [" & FUNewsImage.PostedFile.ContentType & "] Not Allowed"
                Else

                    PdfName = "N/A"
                    If FUPDF.HasFile Then
                        If FUPDF.PostedFile.ContentType <> "application/pdf" Then
                            LblMsg.Text = "Only PDF's are allowed to upload"
                            Exit Sub
                        Else
                            PdfName = CStr(DsIdentity.GetCurrentIdentityByTableName("OHPrintMedia") + 1) & "." & Right(FUPDF.PostedFile.FileName, 3)
                            FUPDF.PostedFile.SaveAs(Server.MapPath("../../../ourhospitals/news/print") & "/" & PdfName)
                        End If
                    End If

                    NewsImageName = CStr(DsIdentity.GetCurrentIdentityByTableName("OHPrintMedia") + 1) & "." & Right(FUNewsImage.PostedFile.FileName, 3)

                    FUNewsImage.PostedFile.SaveAs(Server.MapPath("../../../ourhospitals/news/print") & "/" & NewsImageName)

                    PageNumber = "N/A"
                    If IsNumeric(TxtPageNumber.Text) Then
                        PageNumber = TxtPageNumber.Text
                    End If

                    Language = "N/A"

                    If Trim(TxtLanguage.Text) <> "" Then
                        Language = TxtLanguage.Text
                    End If

                    'DsOhPrintMedia.Insert(TxtTitle.Text, TxtDate.Text, NewsImageName, DDLNewsPapers.SelectedItem.Text, DsNewspaper.GetNewsPaperLogoById(DDLNewsPapers.SelectedValue), TxtEdition.Text, PageNumber, Language, DDLBranch.SelectedValue, DDLSpecialisation.SelectedValue, PdfName)

                    LblMsg.Text = "News Added Successfully "

                    GVPrintNews.DataBind()

                    TxtTitle.Text = ""
                    TxtDate.Text = ""
                    TxtEdition.Text = ""
                    TxtLanguage.Text = ""
                    TxtPageNumber.Text = ""
                    DDLBranch.SelectedIndex = -1
                    DDLNewsPapers.SelectedIndex = -1
                    DDLSpecialisation.SelectedIndex = -1

                End If
            End If
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "Media", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If
        End If
    End Sub

    Protected Sub GVPrintNews_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVPrintNews.DataBound
        For i = 0 To GVPrintNews.Rows.Count - 1
            Dim LblDate As Label = CType(GVPrintNews.Rows(i).Cells(2).FindControl("LblDate"), Label)
            If Not (LblDate) Is Nothing Then
                LblDate.Text = FormatDateTime(LblDate.Text, DateFormat.ShortDate)
            End If

            Dim TxtDatee As TextBox = CType(GVPrintNews.Rows(i).Cells(2).FindControl("TxtDate"), TextBox)
            If Not (TxtDatee) Is Nothing Then
                TxtDatee.Text = FormatDateTime(TxtDatee.Text, DateFormat.ShortDate)
            End If

            Dim LblImage As Label = CType(GVPrintNews.Rows(i).Cells(3).FindControl("LblImage"), Label)
            If Not (LblImage) Is Nothing Then
                NewsImageName = "../../../ourhospitals/news/print/" & LblImage.Text
                LblImage.Text = "<a href='" & NewsImageName & "' target='_blank'>Click To View</a>"
            End If

            Dim LblBranch As Label = CType(GVPrintNews.Rows(i).Cells(8).FindControl("LblBranch"), Label)
            If Not (LblBranch) Is Nothing Then
                LblBranch.Text = DsBranch.GetValueByID(LblBranch.Text)
            End If

            Dim LblSpecialisation As Label = CType(GVPrintNews.Rows(i).Cells(9).FindControl("LblSpecialisation"), Label)
            If Not (LblSpecialisation) Is Nothing Then
                LblSpecialisation.Text = DsSpecs.GetValueByID(LblSpecialisation.Text)
            End If

            Dim LblPdf As Label = CType(GVPrintNews.Rows(i).Cells(10).FindControl("LblPdf"), Label)
            If Not (LblPdf) Is Nothing Then
                If LblPdf.Text <> "N/A" Then
                    LblPdf.Text = "<a href='../../../ourhospitals/news/print/" & LblPdf.Text & "' target='_blank'>Click To View</a>"
                End If
            End If

        Next
    End Sub

    Protected Sub GVPrintNews_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVPrintNews.PageIndexChanging
        GVPrintNews.PageIndex = e.NewPageIndex
        GVPrintNews.DataBind()
    End Sub

    Protected Sub GVPrintNews_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVPrintNews.RowCommand
        If e.CommandName = "CmdDelete" Then
            DsOhPrintMedia.Delete(e.CommandArgument)
            LblMsg.Text = "News Deleted Successfully"
            GVPrintNews.DataBind()
        End If
    End Sub

    Protected Sub GVPrintNews_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GVPrintNews.RowUpdating
        LblMsg.Text = ""
        Dim TxtTitleee As TextBox = CType(GVPrintNews.Rows(e.RowIndex).Cells(1).FindControl("TxtTitle"), TextBox)
        If DsOhPrintMedia.CheckOtherPrimary(TxtTitleee.Text, GVPrintNews.DataKeys(e.RowIndex).Value) Then
            LblMsg.Text = "News With Title [" & TxtTitleee.Text & "] already exisits !"
            e.Cancel = True
        Else

            NewsImageName = GVPrintNews.DataKeyNames(1)
            Dim FUEditNewsImage As FileUpload = CType(GVPrintNews.Rows(e.RowIndex).Cells(3).FindControl("FUNewsImage"), FileUpload)
            If FUEditNewsImage.HasFile Then
                If FUEditNewsImage.PostedFile.ContentType <> "image/jpeg" And FUEditNewsImage.PostedFile.ContentType <> "image/pjpeg" And FUEditNewsImage.PostedFile.ContentType <> "image/gif" Then
                    LblMsg.Text = "Files Of Type [" & FUEditNewsImage.PostedFile.ContentType & "] Not Allowed"
                    e.Cancel = True
                Else
                    NewsImageName = GVPrintNews.DataKeys(e.RowIndex).Value & "." & Right(FUEditNewsImage.PostedFile.FileName, 3)

                    FUEditNewsImage.PostedFile.SaveAs(Server.MapPath("../../../ourhospitals/news/print") & "/" & NewsImageName)

                End If
            End If

            PdfName = GVPrintNews.DataKeyNames(2)
            Dim FUEditPDf As FileUpload = CType(GVPrintNews.Rows(e.RowIndex).Cells(10).FindControl("FUPdf"), FileUpload)
            If FUEditPDf.HasFile Then
                If FUEditPDf.PostedFile.ContentType <> "application/pdf" Then
                    LblMsg.Text = "Only PDF's are allowed to upload"
                    e.Cancel = True
                Else
                    PdfName = GVPrintNews.DataKeys(e.RowIndex).Value & "." & Right(FUEditPDf.PostedFile.FileName, 3)
                    FUEditPDf.PostedFile.SaveAs(Server.MapPath("../../../ourhospitals/news/print") & "/" & PdfName)
                End If
            End If

            Dim DDLNewsPaper As DropDownList = CType(GVPrintNews.Rows(e.RowIndex).Cells(4).FindControl("DDLNewsPaper"), DropDownList)
            NewsPaperLogo = DsNewspaper.GetNewsPaperLogoByName(DDLNewsPaper.SelectedValue)
        End If
    End Sub
End Class
