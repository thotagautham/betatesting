Imports System.IO
Imports betatesting.DataSetCareTableAdapters
Imports betatesting.newseventsTableAdapters
Imports System.Data.SqlClient
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web.UI.WebControls


Public Class Newsdetails

    Inherits System.Web.UI.Page
    Dim DsInstitutes As New InstitutesTableAdapter
    Dim DsIdentity As New CurrentIdentity
    Dim DsSp As New SPECIALIZATIONTableAdapter
    Dim DsSpecs As New SPECIALIZATIONTableAdapter
    Dim DsBranch As New BRANCH1TableAdapter
    Dim DSDoctor As New DOCTORSTableAdapter
    Dim DSNewsChannels As New newschannelsTableAdapter
    Dim DsOhPrintMedia As New OHPrintMedia_newsTableAdapter
    Dim DsNewsPaper As New NewsPapersTableAdapter
    Dim ThumbnailImageName As String
    Dim Navigaytionurl As String
    Dim UploadFile As String
    Dim pageArray As Array
    Dim PageUrl As String
    Dim PageNumber As String
    Dim Language As String
    Dim pdfname As String
    Private i As Integer, j As Integer, k As Integer = 0
    Dim strsql As String

    Dim oracmd As SqlCommand
    Dim connString As String
    Public objConn As SqlConnection

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then


            lbDepartment.DataSource = DsSp.GetActiveDept()
            lbDepartment.DataTextField = "SPECIALIZATIONNAME"
            lbDepartment.DataValueField = "SPECIALIZATIONID"
            lbDepartment.DataBind()

            lbDepartment.Items.Insert(0, "All Departments")
            lbDepartment.Items(0).Value = 0

            'Fill Specialities

            lbSpecialty.DataSource = DsSp.GetOnlyActiveSpecialitiesExcludingDepts() 'GetAllActiveData()
            lbSpecialty.DataTextField = "SPECIALIZATIONNAME"
            lbSpecialty.DataValueField = "SPECIALIZATIONID"
            lbSpecialty.DataBind()

            lbSpecialty.Items.Insert(0, "All Specialities")
            lbSpecialty.Items(0).Value = 0

            'Fill Institutes

            lbInstitute.DataSource = DsInstitutes.GetActiveData()
            lbInstitute.DataTextField = "InstituteNAME"
            lbInstitute.DataValueField = "InstituteID"
            lbInstitute.DataBind()

            lbInstitute.Items.Insert(0, "All Institutes")
            lbInstitute.Items(0).Value = 0

            'Fill Branch
            lbBranch.DataSource = DsBranch.GetActiveBranches()
            lbBranch.DataTextField = "BRANCHNAME"
            lbBranch.DataValueField = "BRANCHID"
            lbBranch.DataBind()

            lbBranch.Items.Insert(0, "All Branches")
            lbBranch.Items(0).Value = 0


            'Fill Doctor
            lbdoctor.DataSource = DSDoctor.GetAllData()
            lbdoctor.DataTextField = "NAME"
            lbdoctor.DataValueField = "DOCTORID"
            lbdoctor.DataBind()

            lbdoctor.Items.Insert(0, "All Doctors")
            lbdoctor.Items(0).Value = 0


            'Fill newspaper

            DDLNewsPapers.DataSource = DsNewsPaper.GetAllData()
            DDLNewsPapers.DataTextField = "NewsPaperName"
            DDLNewsPapers.DataValueField = "NewsPaperId"
            DDLNewsPapers.DataBind()

            DDLNewsPapers.Items.Insert(0, " ")
            DDLNewsPapers.Items(0).Value = 0


            'Fill newschannel

            DDLNewsChannel.DataSource = DSNewsChannels.GetAllData()
            DDLNewsChannel.DataTextField = "Channelname"
            DDLNewsChannel.DataValueField = "Id"
            DDLNewsChannel.DataBind()

            DDLNewsChannel.Items.Insert(0, " ")
            DDLNewsChannel.Items(0).Value = 0
            BindData()

        End If

    End Sub

    Private Sub BindData()
        GVPrintNews.DataSource = DsOhPrintMedia.GetAllData()
        GVPrintNews.DataBind()
    End Sub

    Private Sub ClearAll()
        txtnavagationpathurl.Text = ""
        lbBranch.SelectedIndex = -1
        lbInstitute.SelectedIndex = -1
        lbDepartment.SelectedIndex = -1
        lbSpecialty.SelectedIndex = -1
        filename.Text = ""
        fileId.Text = ""
        Hlfile.Text = ""
        Hlfile.NavigateUrl = ""

        TxtTitle.Text = ""
        TxtDate.Text = ""
        TxtEdition.Text = ""
        TxtLanguage.Text = ""
        TxtPageNumber.Text = ""
        lbBranch.SelectedIndex = -1
        lbInstitute.SelectedIndex = -1
        lbSpecialty.SelectedIndex = -1
        lbDepartment.SelectedIndex = -1
        lbdoctor.SelectedIndex = -1
        DDLNewsChannel.SelectedIndex = -1
        DDLNewsPapers.SelectedIndex = -1
        btnSave.Text = "Save"
        RFVImage.Enabled = True
    End Sub

    Protected Sub BtnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        LblMsg.Text = ""
        If btnSave.Text = "Save" Then
            If CInt(DsOhPrintMedia.CheckPrimary(TxtTitle.Text)) > 0 Then
                LblMsg.Text = "News With Title [ " & TxtTitle.Text & " ] Already Exists"
                Exit Sub
            Else
                If (Not FUNewsImage.HasFile) Then
                    LblMsg.Text = "Upload Any News Image And Try Again !"
                    Exit Sub
                End If
            End If
        End If
        ThumbnailImageName = ""
        If FUNewsImage.HasFile Then
            If FUNewsImage.PostedFile.ContentType <> "image/jpeg" And FUNewsImage.PostedFile.ContentType <> "image/pjpeg" And FUNewsImage.PostedFile.ContentType <> "image/gif" Then
                LblMsg.Text = "Files Of Type [" & FUNewsImage.PostedFile.ContentType & "] Not Allowed"
                Exit Sub
            ElseIf btnSave.Text = "Save" Then
                ThumbnailImageName = CStr(DsIdentity.GetCurrentIdentityByTableName("OHPrintMedia") + 1) & Path.GetExtension(FUNewsImage.PostedFile.FileName)
                FUNewsImage.PostedFile.SaveAs(Server.MapPath("~/MediaFiles/thumbnail") & "/" & ThumbnailImageName)
            Else
                If btnSave.Text = "Update" Then
                    If FUNewsImage.PostedFile.ContentType <> "image/jpeg" And FUNewsImage.PostedFile.ContentType <> "image/pjpeg" And FUNewsImage.PostedFile.ContentType <> "image/gif" Then
                        LblMsg.Text = "Files Of Type [" & FUNewsImage.PostedFile.ContentType & "] Not Allowed"

                    Else
                        ThumbnailImageName = CStr(ViewState("ophid")) & Path.GetExtension(FUNewsImage.PostedFile.FileName)
                        FUNewsImage.PostedFile.SaveAs(Server.MapPath("~/MediaFiles/thumbnail") & "/" & ThumbnailImageName)
                    End If
                End If

                End If
        End If
        pdfname = txtnavagationpathurl.Text
        If FUDocument.HasFile Then
            If FUDocument.PostedFile.ContentType <> "application/pdf" And FUNewsImage.PostedFile.ContentType <> "image/jpeg" And FUNewsImage.PostedFile.ContentType <> "image/pjpeg" And FUNewsImage.PostedFile.ContentType <> "image/gif" Then
                LblMsg.Text = "Files Of Type [" & FUDocument.PostedFile.ContentType & "] Not Allowed"
                Exit Sub
            Else
                If (btnSave.Text = "Update") Then
                    pdfname = fileId.Text & "." & Path.GetExtension(FUDocument.PostedFile.FileName)
                Else
                    pdfname = CStr(DsIdentity.GetCurrentIdentityByTableName("OHPrintMedia") + 1) & Path.GetExtension(FUDocument.PostedFile.FileName)
                End If
                FUDocument.PostedFile.SaveAs(Server.MapPath("~/MediaFiles/mediauploads") & "/" & pdfname)
                pdfname = ConfigurationManager.AppSettings("WebsiteURL") & "MediaFiles/mediauploads/" & pdfname
            End If
        End If

        
        PageNumber = "N/A"
        If IsNumeric(TxtPageNumber.Text) Then
            PageNumber = TxtPageNumber.Text
        End If

        Language = "N/A"

        If Trim(TxtLanguage.Text) <> "" Then
            Language = TxtLanguage.Text
        End If
        If (btnSave.Text = "Update") Then
            If CInt(DsOhPrintMedia.CheckOtherPrimary(TxtTitle.Text, fileId.Text)) > 0 Then
                LblMsg.Text = "News With Title [ " & TxtTitle.Text & " ] Already Exists"
                Exit Sub
            Else
                If (Not FUNewsImage.HasFile) Then

                    DsOhPrintMedia.Update(TxtTitle.Text, TxtDate.Text, ViewState("imageurl"), DDLNewsPapers.SelectedItem.Text, DsNewsPaper.GetNewsPaperLogoById(DDLNewsPapers.SelectedValue), TxtEdition.Text, PageNumber, Language, CommonFunctions.GetListBoxSelectedItems(lbBranch), CommonFunctions.GetListBoxSelectedItems(lbSpecialty), pdfname, ThumbnailImageName, DDLNewsPapers.SelectedItem.Value, DDLNewsChannel.SelectedItem.Value, CommonFunctions.GetListBoxSelectedItems(lbDepartment), CommonFunctions.GetListBoxSelectedItems(lbInstitute), CommonFunctions.GetListBoxSelectedItems(lbdoctor), DDLNewsChannel.SelectedItem.Text, DSNewsChannels.GetNewsChannelsLogoById(DDLNewsChannel.SelectedValue), txtpagetittle.Text, txtkeywords.Text, txtmetatags.Text, txtpagedescription.Text, fileId.Text)
                    btnSave.Text = "Save"
                Else
                    DsOhPrintMedia.Update(TxtTitle.Text, TxtDate.Text, ThumbnailImageName, DDLNewsPapers.SelectedItem.Text, DsNewsPaper.GetNewsPaperLogoById(DDLNewsPapers.SelectedValue), TxtEdition.Text, PageNumber, Language, CommonFunctions.GetListBoxSelectedItems(lbBranch), CommonFunctions.GetListBoxSelectedItems(lbSpecialty), pdfname, ThumbnailImageName, DDLNewsPapers.SelectedItem.Value, DDLNewsChannel.SelectedItem.Value, CommonFunctions.GetListBoxSelectedItems(lbDepartment), CommonFunctions.GetListBoxSelectedItems(lbInstitute), CommonFunctions.GetListBoxSelectedItems(lbdoctor), DDLNewsChannel.SelectedItem.Text, DSNewsChannels.GetNewsChannelsLogoById(DDLNewsChannel.SelectedValue), txtpagetittle.Text, txtkeywords.Text, txtmetatags.Text, txtpagedescription.Text, fileId.Text)
                    btnSave.Text = "Save"
                End If
                End If
        Else
            DsOhPrintMedia.Insert(TxtTitle.Text, TxtDate.Text, ThumbnailImageName, DDLNewsPapers.SelectedItem.Text, DsNewsPaper.GetNewsPaperLogoById(DDLNewsPapers.SelectedValue), TxtEdition.Text, PageNumber, Language, CommonFunctions.GetListBoxSelectedItems(lbBranch), CommonFunctions.GetListBoxSelectedItems(lbSpecialty), pdfname, ThumbnailImageName, DDLNewsPapers.SelectedItem.Value, DDLNewsChannel.SelectedItem.Value, CommonFunctions.GetListBoxSelectedItems(lbDepartment), CommonFunctions.GetListBoxSelectedItems(lbInstitute), CommonFunctions.GetListBoxSelectedItems(lbdoctor), DDLNewsChannel.SelectedItem.Text, DSNewsChannels.GetNewsChannelsLogoById(DDLNewsChannel.SelectedValue), txtpagetittle.Text, txtkeywords.Text, txtmetatags.Text, txtpagedescription.Text)

                LblMsg.Text = "News Added Successfully "
        End If

        BindData()

        ClearAll()

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
                ThumbnailImageName = "../../../MediaFiles/thumbnail/" & LblImage.Text
                LblImage.Text = "<a href='" & ThumbnailImageName & "' target='_blank'>Click To View</a>"
            End If

            Dim LblNavigationURL As Label = CType(GVPrintNews.Rows(i).Cells(8).FindControl("LblNavigationURL"), Label)
            If Not (LblNavigationURL) Is Nothing Then
                If LblNavigationURL.Text <> "N/A" Then
                    LblNavigationURL.Text = "<a href='" & LblNavigationURL.Text & "' target='_blank'>Click To View</a>"
                End If
            End If

        Next
    End Sub

    Protected Sub GVPrintNews_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVPrintNews.PageIndexChanging
        GVPrintNews.PageIndex = e.NewPageIndex
        If LblSearchStr.Text = "" Then
            BindData()
        Else
            getData(LblSearchStr.Text)
        End If

    End Sub

    Protected Sub GVPrintNews_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVPrintNews.RowCommand
        If e.CommandName = "CmdEdit" Then
            ClearAll()
            Dim DtImages As DataTable = DsOhPrintMedia.GetDataById(e.CommandArgument)
            Dim dtrow As DataRow

            If DtImages.Rows.Count > 0 Then
                dtrow = DtImages.Rows(0)
                SetListBoxSelectedItems(dtrow, lbBranch, "BranchID")
                SetListBoxSelectedItems(dtrow, lbSpecialty, "Specialisation")
                SetListBoxSelectedItems(dtrow, lbDepartment, "DepartmentId")
                SetListBoxSelectedItems(dtrow, lbInstitute, "InstituteId")
                SetListBoxSelectedItems(dtrow, lbdoctor, "DoctorId")
                txtnavagationpathurl.Text = dtrow("PDFName")
                If (txtnavagationpathurl.Text <> "") Then
                    Hlfile.NavigateUrl = dtrow("PDFName")
                    Hlfile.Text = "View Document"
                End If
                ' Hlfile.NavigateUrl = "~/MediaFiles/thumbnail" & "/" & dtrow("ImageURL")
                ViewState("imageurl") = dtrow("ImageURL")
                TxtTitle.Text = dtrow("Title")
                TxtDate.Text = dtrow("NewsDate")
                TxtEdition.Text = dtrow("Edition")
                TxtLanguage.Text = dtrow("Language")
                TxtPageNumber.Text = dtrow("PageNumber")
                fileId.Text = dtrow("OHPrintMediaID")
                filename.Text = dtrow("ImageURL")
                ViewState("ophid") = dtrow("OHPrintMediaID")
                DDLNewsChannel.SelectedIndex = -1
                DDLNewsPapers.SelectedIndex = -1
                If Not IsDBNull(dtrow("NewsChannelId")) Then
                    DDLNewsChannel.Items.FindByValue(dtrow("NewsChannelId")).Selected = True
                End If

                If Not IsDBNull(dtrow("NewsPaperId")) Then
                    DDLNewsPapers.Items.FindByValue(dtrow("NewsPaperId")).Selected = True
                End If

                RFVImage.Enabled = False
                btnSave.Text = "Update"

            End If
        ElseIf e.CommandName = "CmdDelete" Then
            DsOhPrintMedia.Delete(e.CommandArgument)
            LblMsg.Text = "News Deleted Successfully"
        End If

        BindData()
    End Sub

    Protected Sub GVPrintNews_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GVPrintNews.RowUpdating
        LblMsg.Text = ""
        Dim TxtTitleee As TextBox = CType(GVPrintNews.Rows(e.RowIndex).Cells(1).FindControl("TxtTitle"), TextBox)
        If DsOhPrintMedia.CheckOtherPrimary(TxtTitleee.Text, GVPrintNews.DataKeys(e.RowIndex).Value) Then
            LblMsg.Text = "News With Title [" & TxtTitleee.Text & "] already exisits !"
            e.Cancel = True
        Else

            ThumbnailImageName = GVPrintNews.DataKeyNames(1)
            Dim FUEditNewsImage As FileUpload = CType(GVPrintNews.Rows(e.RowIndex).Cells(3).FindControl("FUNewsImage"), FileUpload)
            If FUEditNewsImage.HasFile Then
                If FUEditNewsImage.PostedFile.ContentType <> "image/jpeg" And FUEditNewsImage.PostedFile.ContentType <> "image/pjpeg" And FUEditNewsImage.PostedFile.ContentType <> "image/gif" Then
                    LblMsg.Text = "Files Of Type [" & FUEditNewsImage.PostedFile.ContentType & "] Not Allowed"
                    e.Cancel = True
                Else
                    ThumbnailImageName = GVPrintNews.DataKeys(e.RowIndex).Value & "." & Right(FUEditNewsImage.PostedFile.FileName, 3)

                    FUEditNewsImage.PostedFile.SaveAs(Server.MapPath("~/MediaFiles/thumbnail") & "/" & ThumbnailImageName)

                End If
            End If

            pdfname = GVPrintNews.DataKeyNames(2)
            Dim FUEditPDf As FileUpload = CType(GVPrintNews.Rows(e.RowIndex).Cells(10).FindControl("FUPdf"), FileUpload)
            If FUEditPDf.HasFile Then
                If FUEditPDf.PostedFile.ContentType <> "application/pdf" Then
                    LblMsg.Text = "Only PDF's are allowed to upload"
                    e.Cancel = True
                Else
                    pdfname = GVPrintNews.DataKeys(e.RowIndex).Value & "." & Right(FUEditPDf.PostedFile.FileName, 3)
                    FUEditPDf.PostedFile.SaveAs(Server.MapPath("~/MediaFiles/mediauploads") & "/" & pdfname)
                End If
            End If

        End If
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        ClearAll()
    End Sub

    Private Function GetListBoxSelectedItemsQry(lb As ListBox, lbtype As String, setstrsql As String) As String

        For i = 0 To lb.Items.Count - 1
            If lb.Items(i).Selected = True Then
                If setstrsql = "" Then
                    setstrsql = setstrsql & " where " & lbtype & " like '%$" & lb.Items(i).Value & "$%'"
                Else
                    setstrsql = setstrsql & " or " & lbtype & " like '%$" & lb.Items(i).Value & "$%'"
                End If
            End If
        Next i

        Return setstrsql
    End Function

    Private Sub BuildQuery2()
        Dim strsql1 = "select distinct * from OHPrintMedia"
        strsql = ""
        If (lbSpecialty.GetSelectedIndices.Count > 0) Then
            strsql = GetListBoxSelectedItemsQry(lbSpecialty, "Specialisation", strsql)
        End If

        If (lbDepartment.GetSelectedIndices.Count > 0) Then
            strsql = GetListBoxSelectedItemsQry(lbDepartment, "DepartmentId", strsql)
        End If

        If (lbInstitute.GetSelectedIndices.Count > 0) Then
            strsql = GetListBoxSelectedItemsQry(lbInstitute, "InstituteId", strsql)
        End If

        If (lbBranch.GetSelectedIndices.Count > 0) Then
            strsql = GetListBoxSelectedItemsQry(lbBranch, "BranchID", strsql)
        End If

        If (lbdoctor.GetSelectedIndices.Count > 0) Then
            strsql = GetListBoxSelectedItemsQry(lbdoctor, "DoctorId", strsql)
        End If

        If (TxtTitle.Text <> "") Then
            If strsql = "" Then
                strsql = " where Lower(Title) like '%" & TxtTitle.Text.ToLower() & "%'"
            Else
                strsql = strsql & " or Lower(Title) like '%" & TxtTitle.Text.ToLower() & "%'"
            End If
        End If

        If (TxtDate.Text <> "") Then
            If strsql = "" Then
                strsql = " where NewsDate = '" & TxtDate.Text & "'"
            Else
                strsql = strsql & " or NewsDate = '" & TxtDate.Text & "'"
            End If
        End If

        If (TxtEdition.Text <> "") Then
            If strsql = "" Then
                strsql = " where Edition like '%" & TxtEdition.Text.ToLower() & "%'"
            Else
                strsql = strsql & " or Edition like '%" & TxtEdition.Text.ToLower() & "%'"
            End If
        End If

        If (TxtPageNumber.Text <> "") Then
            If strsql = "" Then
                strsql = " where PageNumber = " & TxtPageNumber.Text
            Else
                strsql = strsql & " or PageNumber = " & TxtPageNumber.Text
            End If
        End If

        If (DDLNewsPapers.SelectedIndex > 0) Then
            If strsql = "" Then
                strsql = " where NewsPaperId = " & DDLNewsPapers.SelectedItem.Value
            Else
                strsql = strsql & " or NewsPaperId = " & DDLNewsPapers.SelectedItem.Value
            End If
        End If

        If (DDLNewsChannel.SelectedIndex > 0) Then
            If strsql = "" Then
                strsql = " where NewsChannelId = " & DDLNewsChannel.SelectedItem.Value
            Else
                strsql = strsql & " or NewsChannelId = " & DDLNewsChannel.SelectedItem.Value
            End If
        End If

        If (TxtLanguage.Text <> "") Then
            If strsql = "" Then
                strsql = " where Lower(Language) = '" & TxtLanguage.Text.ToLower() & "'"
            Else
                strsql = strsql & " or Lower(Language) = '" & TxtLanguage.Text.ToLower() & "'"
            End If
        End If

        strsql = strsql1 & strsql
        LblSearchStr.Text = strsql
        getData(strsql)

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
    Private Sub getData(ByVal strsql As String)
        Dim count As Integer
        LblSearchStr.Text = strsql
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
        count = 0

        If myDataSet.Tables(0).Rows.Count > 0 Then
            GVPrintNews.DataSource = myDataSet
            GVPrintNews.DataBind()
            count = 1
        End If
        oracmd = Nothing
        closeConnection()
    End Sub

    
    Private Sub SetListBoxSelectedItems(dr As DataRow, lb As ListBox, section As String)
        If Not IsDBNull(dr(section)) Then
            pageArray = Split(dr(section).Replace("$", ""), ",")
            For i = 0 To UBound(pageArray)
                If Not lb.Items.FindByValue(pageArray(i)) Is Nothing Then
                    lb.Items.FindByValue(pageArray(i)).Selected = True
                End If
            Next
        End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        BuildQuery()
    End Sub

    
    Private Sub BuildQuery()
        Dim strsql1 = "select distinct * from OHPrintMedia "
        strsql = ""
        If (lbSpecialty.GetSelectedIndices.Count > 0) Then
            strsql = GetListBoxSelectedItemsQry(lbSpecialty, "Specialisation", strsql)
        End If

        If (lbDepartment.GetSelectedIndices.Count > 0) Then
            strsql = GetListBoxSelectedItemsQry(lbDepartment, "DepartmentId", strsql)
        End If

        If (lbInstitute.GetSelectedIndices.Count > 0) Then
            strsql = GetListBoxSelectedItemsQry(lbInstitute, "InstituteId", strsql)
        End If

        If (lbBranch.GetSelectedIndices.Count > 0) Then
            strsql = GetListBoxSelectedItemsQry(lbBranch, "BranchID", strsql)
        End If

        If (lbdoctor.GetSelectedIndices.Count > 0) Then
            strsql = GetListBoxSelectedItemsQry(lbdoctor, "DoctorId", strsql)
        End If


        If (txtnavagationpathurl.Text <> "") Then
            If strsql = "" Then
                strsql = " where Lower(PDFName) like '%" & txtnavagationpathurl.Text.ToLower() & "%'"
            Else
                strsql = strsql & " or Lower(PDFName) like '%" + txtnavagationpathurl.Text.ToLower() & "%'"
            End If
        End If

        If (TxtTitle.Text <> "") Then
            If strsql = "" Then
                strsql = " where Lower(Title) like '%" & TxtTitle.Text.ToLower() & "%'"
            Else
                strsql = strsql & " or Lower(Title) like '%" + TxtTitle.Text.ToLower() & "%'"
            End If
        End If
        strsql = strsql1 & strsql & " order by NewsDate desc "
        LblSearchStr.Text = strsql
        getData(strsql)

    End Sub
End Class