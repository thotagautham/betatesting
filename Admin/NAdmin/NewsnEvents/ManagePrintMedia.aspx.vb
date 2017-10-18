Imports betatesting.newseventsTableAdapters
Imports betatesting.DataSetCareTableAdapters
Imports System.Data.SqlClient

Partial Class Admin_NAdmin_NewsnEvents_ManagePrintMedia
    Inherits System.Web.UI.Page

    Dim DsOhPrintMedia As New news_printmediatableadapter
    Dim DsIdentity As New CurrentIdentity
    Dim DsNewspaper As New NewsPapersTableAdapter
    Dim DsBranch As New BRANCH1TableAdapter
    Dim DsSpecs As New SPECIALIZATIONTableAdapter

    Dim NewsImageName As String
    Dim PdfName As String
    Dim PageNumber As String
    Dim Language As String
    Dim NewsPaperLogo As String

    Dim i As Integer

    Dim strsql, DispStr As String
    Dim oracmd As SqlCommand
    Dim connString As String
    Public objConn As SqlConnection
    Dim objdata As SqlDataReader

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
                LblImage.Text = "<a href="" " & NewsImageName & " "" target='_blank'>Click To View</a>"
            End If

            Dim LblBranch As Label = CType(GVPrintNews.Rows(i).Cells(8).FindControl("LblBranch"), Label)
            If Not (LblBranch) Is Nothing Then
                If LblBranch.Text = "99" Then
                    LblBranch.Text = "CARE Clinics"
                Else
                    LblBranch.Text = DsBranch.GetValueByID(LblBranch.Text)
                End If
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
        BindData()
    End Sub

    Protected Sub GVPrintNews_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles GVPrintNews.RowCancelingEdit
        GVPrintNews.EditIndex = -1
        BindData()
    End Sub

    Protected Sub GVPrintNews_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVPrintNews.RowCommand
        If e.CommandName = "CmdDelete" Then
            DsOhPrintMedia.Delete(e.CommandArgument)
            LblMsg.Text = "News Deleted Successfully"
            BindData()
        End If
    End Sub

    Protected Sub GVPrintNews_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GVPrintNews.RowEditing
        GVPrintNews.EditIndex = e.NewEditIndex
        BindData()
    End Sub

    

    Protected Sub GVPrintNews_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GVPrintNews.RowUpdating
        LblMsg.Text = ""
        Dim TxtTitleee As TextBox = CType(GVPrintNews.Rows(e.RowIndex).Cells(1).FindControl("TxtTitle"), TextBox)
        If DsOhPrintMedia.CheckOtherPrimary(TxtTitleee.Text, GVPrintNews.DataKeys(e.RowIndex).Value) Then
            LblMsg.Text = "News With Title [" & TxtTitleee.Text & "] already exisits !"
            e.Cancel = True
        Else

            Dim LblImagee As Label = CType(GVPrintNews.Rows(e.RowIndex).Cells(3).FindControl("LblImagee"), Label)

            NewsImageName = LblImagee.Text
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

            Dim LblPdff As Label = CType(GVPrintNews.Rows(e.RowIndex).Cells(10).FindControl("LblPdff"), Label)
            PdfName = LblPdff.Text
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

            Dim TxtDatee As TextBox = CType(GVPrintNews.Rows(e.RowIndex).Cells(2).FindControl("TxtDate"), TextBox)
            Dim TxtEditionn As TextBox = CType(GVPrintNews.Rows(e.RowIndex).Cells(5).FindControl("TxtEdition"), TextBox)
            Dim TxtPageNumberr As TextBox = CType(GVPrintNews.Rows(e.RowIndex).Cells(6).FindControl("TxtPageNumber"), TextBox)
            Dim TxtLanguagee As TextBox = CType(GVPrintNews.Rows(e.RowIndex).Cells(7).FindControl("TxtLanguage"), TextBox)
            Dim DDlBranchh As DropDownList = CType(GVPrintNews.Rows(e.RowIndex).Cells(8).FindControl("DDlBranch"), DropDownList)
            Dim DDlSpec As DropDownList = CType(GVPrintNews.Rows(e.RowIndex).Cells(9).FindControl("DDLSpecialisation"), DropDownList)

            DsOhPrintMedia.UpdateData(TxtTitleee.Text, TxtDatee.Text, DDLNewsPaper.SelectedItem.Text, TxtEditionn.Text, TxtPageNumberr.Text, TxtLanguagee.Text, DDlBranchh.SelectedValue, DDlSpec.SelectedValue, NewsImageName, PdfName, GVPrintNews.DataKeys(e.RowIndex).Value)
            GVPrintNews.EditIndex = -1
            BindData()

        End If
    End Sub

    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        

        If Not IsPostBack Then
            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "Media", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If

            BindData()
        End If
    End Sub

    Private Sub BindData()
        'GVPrintNews.DataSource = DsOhPrintMedia.GetAllData()
        'GVPrintNews.DataBind()


        strsql = "select * from ohprintmedia where 1=1"
        If Trim(TxtTitle.Text) <> "" Then
            strsql = strsql & " and title like '%" & Trim(TxtTitle.Text) & "%'"
        End If

        If Trim(TxtDate.Text) <> "" Then
            strsql = strsql & " and newsdate='" & Trim(TxtDate.Text) & "'"
        End If

        If DDLNewsPaper.SelectedIndex <> 0 Then
            strsql = strsql & " and NewsPaperName='" & DDLNewsPaper.SelectedItem.Text & "'"
        End If

        If DDLEdition.SelectedIndex <> 0 Then
            strsql = strsql & " and Edition='" & DDLEdition.SelectedItem.Text & "'"
        End If

        If DDLLanguage.SelectedIndex <> 0 Then
            strsql = strsql & " and Language='" & DDLLanguage.SelectedItem.Text & "'"
        End If

        If DDLPrintBranch.SelectedIndex <> 0 Then
            strsql = strsql & " and branchid=" & DDLPrintBranch.SelectedValue
        End If

        If DDLPrintSpec.SelectedIndex <> 0 Then
            strsql = strsql & " and Specialisation=" & DDLPrintSpec.SelectedValue
        End If

        strsql = strsql & " order by newsdate desc "

        getData(strsql, "Print")
    End Sub

    Protected Sub BtnPrintGo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnPrintGo.Click
        BindData()
    End Sub

    Public Sub openConnection()
        connString = ConfigurationManager.ConnectionStrings("MSSQLConnString").ConnectionString
        objConn = New SqlConnection(connString)
        objConn.Open()
    End Sub
    Public Sub closeConnection()
        objConn.Close()
        objConn = Nothing
    End Sub
    Private Sub getData(ByVal strsql As String, ByVal GridSrc As String)
        openConnection()
        oracmd = New SqlCommand(strsql, objConn)

        'create a new DataAdapter
        Dim myAdapter As New SqlDataAdapter

        'Assign the command to the Adapter so it knows what command to send when Fill() is called
        myAdapter.SelectCommand = oracmd

        'Create a DataSet object - any other constructors?
        Dim myDataSet As New Data.DataSet

        'Use the DataAdapter to fill the DataSet
        myAdapter.Fill(myDataSet)

        GVPrintNews.DataSource = myDataSet
        GVPrintNews.DataBind()

        oracmd = Nothing
        closeConnection()
    End Sub
End Class
