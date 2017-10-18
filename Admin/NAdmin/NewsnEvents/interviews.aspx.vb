Imports betatesting.DataSetCareTableAdapters
Imports KimsHospitals.DoctorsTableAdapters
Imports betatesting.newseventsTableAdapters
Imports System.Data.SqlClient
Imports System.IO

Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web.UI.WebControls

Public Class interviews
    Inherits System.Web.UI.Page
    Dim dsaddvideo As New Doctor
    Dim DsInstitutes As New InstitutesTableAdapter
    Dim DsSp As New SPECIALIZATIONTableAdapter
    Dim DsBranch As New BRANCH1TableAdapter
    Dim DsNewsPaper As New NewsPapersTableAdapter
    Dim DSDoctor As New DOCTORSTableAdapter
    Dim pageArray As Array
    Dim PageUrl As String
    Dim strsql As String
    Dim oracmd As SqlCommand
    Dim connString As String
    Dim videotittle As String
    Dim videovideoname As String
    Dim videodescription As String
    Dim videopatientname As String
    Dim videoiframurl As String
    Dim videotarget As String
    Dim videoalternatetext As String
    Dim videosortorder As String
    Private i As Integer, j As Integer, k As Integer = 0

    Public objConn As SqlConnection


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "Doctors", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If

            GVAddVideo.DataSource = dsaddvideo.GetData()
            GVAddVideo.DataBind()

            ''Fill Department

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



            lbdoctor.DataSource = DSDoctor.GetAllData()
            lbdoctor.DataTextField = "NAME"
            lbdoctor.DataValueField = "DOCTORID"
            lbdoctor.DataBind()

            lbdoctor.Items.Insert(0, "Select A Doctor")
            lbdoctor.Items(0).Value = 0




            'Fill newspaper

            DDLNewsPapers.DataSource = DsNewsPaper.GetAllData()
            DDLNewsPapers.DataTextField = "NewsPaperName"
            DDLNewsPapers.DataValueField = "NewsPaperId"
            DDLNewsPapers.DataBind()

            DDLNewsPapers.Items.Insert(0, " ")
            DDLNewsPapers.Items(0).Value = 0



            'Fill Branch
            lbBranch.DataSource = DsBranch.GetActiveBranches()
            lbBranch.DataTextField = "BRANCHNAME"
            lbBranch.DataValueField = "BRANCHID"
            lbBranch.DataBind()

            lbBranch.Items.Insert(0, "All Branches")
            lbBranch.Items(0).Value = 0
            BindData()
        End If
    End Sub
    Private Sub BindData()
        GVAddVideo.DataSource = dsaddvideo.GetData()
        GVAddVideo.DataBind()
    End Sub



    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click




        If (btnSave.Text = "Update") Then
            dsaddvideo.UpdateData(txtTitle.Text, txtVideoName.Text, TxtDate.Text, CommonFunctions.GetListBoxSelectedItems(lbBranch), CommonFunctions.GetListBoxSelectedItems(lbSpecialty), txtsize.Text, CommonFunctions.GetListBoxSelectedItems(lbDepartment), CommonFunctions.GetListBoxSelectedItems(lbdoctor), CommonFunctions.GetListBoxSelectedItems(lbInstitute), txtpatientname.Text, txtDescription.Text, sortOrder, txtnavagationpathurl.Text, txtAlternateText.Text, txtiframeurl.Text, fileId.Text)
            btnSave.Text = "Save"
        ElseIf (TxtDate.Text <> "") Then
            dsaddvideo.Insertdata(txtTitle.Text, txtVideoName.Text, TxtDate.Text, CommonFunctions.GetListBoxSelectedItems(lbBranch), CommonFunctions.GetListBoxSelectedItems(lbSpecialty), txtsize.Text, CommonFunctions.GetListBoxSelectedItems(lbDepartment), CommonFunctions.GetListBoxSelectedItems(lbdoctor), CommonFunctions.GetListBoxSelectedItems(lbInstitute), txtpatientname.Text, txtDescription.Text, sortOrder, txtnavagationpathurl.Text, txtAlternateText.Text, txtiframeurl.Text)
            LblMsg.Text = "Video Added Successfully "

        Else
            LblMsg.Text = "Please select Date "

        End If
        ClearAll()
        BindData()
    End Sub
    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        ClearAll()
    End Sub
    Private Sub ClearAll()
        txtTitle.Text = ""
        txtVideoName.Text = ""
        txtDescription.Text = ""
        txtpatientname.Text = ""
        txtiframeurl.Text = ""
        txtnavagationpathurl.Text = ""
        txtAlternateText.Text = ""
        'txtPostedByDoctorID.Text = ""
        TxtDate.Text = ""
        txtsize.Text = ""
        txtSortOrder.Text = ""
        lbBranch.SelectedIndex = -1
        lbInstitute.SelectedIndex = -1
        lbDepartment.SelectedIndex = -1
        lbSpecialty.SelectedIndex = -1
        lbdoctor.SelectedIndex = -1
        LblSearchStr.Text = ""

        btnSave.Text = "Save"
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
    Protected Sub GVAddVideo_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GVAddVideo.PageIndexChanging
        GVAddVideo.PageIndex = e.NewPageIndex
        If LblSearchStr.Text = "" Then
            BindData()
        Else
            getData(LblSearchStr.Text)
        End If
    End Sub
    Protected Sub GVAddVideo_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GVAddVideo.RowCommand
        If e.CommandName = "CmdEdit" Then
            ClearAll()
            Dim Dtaddvideo As DataTable = dsaddvideo.getalldatabydoctorvideoid(e.CommandArgument)
            Dim dtrow As DataRow

            If Dtaddvideo.Rows.Count > 0 Then
                dtrow = Dtaddvideo.Rows(0)
                SetListBoxSelectedItems(dtrow, lbBranch, "Branch")
                SetListBoxSelectedItems(dtrow, lbSpecialty, "Specialisation")
                SetListBoxSelectedItems(dtrow, lbDepartment, "DEPARTMENT")
                SetListBoxSelectedItems(dtrow, lbInstitute, "Institutes")
                SetListBoxSelectedItems(dtrow, lbdoctor, "Doctors")


                txtTitle.Text = dtrow("Title")
                txtVideoName.Text = dtrow("VideoName")
                txtSortOrder.Text = dtrow("sortorder")
                txtDescription.Text = dtrow("description")
                txtpatientname.Text = dtrow("Patient")
                txtiframeurl.Text = dtrow("iframeurl")
                txtnavagationpathurl.Text = dtrow("target")
                'txtPostedByDoctorID.Text = dtrow("PostedByDoctorID")
                TxtDate.Text = dtrow("PostedDate")
                txtsize.Text = dtrow("AccessLimit")
                txtAlternateText.Text = dtrow("alternatetext")
                fileId.Text = dtrow("DoctorVideoID")

                btnSave.Text = "Update"

            End If
        ElseIf e.CommandName = "CmdDelete" Then
            dsaddvideo.Delete(e.CommandArgument)
            BindData()
        End If
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
        Dim strsql1 = "select distinct * from Doctors_Videos"
        strsql = ""
        If (lbSpecialty.GetSelectedIndices.Count > 0) Then
            strsql = GetListBoxSelectedItemsQry(lbSpecialty, "Specialisation", strsql)
        End If

        If (lbDepartment.GetSelectedIndices.Count > 0) Then
            strsql = GetListBoxSelectedItemsQry(lbDepartment, "DEPARTMENT", strsql)
        End If

        If (lbInstitute.GetSelectedIndices.Count > 0) Then
            strsql = GetListBoxSelectedItemsQry(lbInstitute, "Institutes", strsql)
        End If

        If (lbBranch.GetSelectedIndices.Count > 0) Then
            strsql = GetListBoxSelectedItemsQry(lbBranch, "Branch", strsql)
        End If
        If (lbdoctor.GetSelectedIndices.Count > 0) Then
            strsql = GetListBoxSelectedItemsQry(lbdoctor, "Doctors", strsql)
        End If

        If (txtTitle.Text <> "") Then
            If strsql = "" Then
                strsql = " where Lower(Title) like '%" & txtTitle.Text.ToLower() & "%'"
            Else
                strsql = strsql & " or Lower(Title) like '%" + txtTitle.Text.ToLower() & "%'"
            End If
        End If

        If (txtVideoName.Text <> "") Then
            If strsql = "" Then
                strsql = " where Lower(VideoName) like '%" & txtVideoName.Text.ToLower() & "%'"
            Else
                strsql = strsql & " or Lower(VideoName) like '%" + txtVideoName.Text.ToLower() & "%'"
            End If
        End If

        If (txtDescription.Text <> "") Then
            If strsql = "" Then
                strsql = " where Lower(description) like '%" & txtDescription.Text.ToLower() & "%'"
            Else
                strsql = strsql & " or Lower(description) like '%" + txtDescription.Text.ToLower() & "%'"
            End If
        End If

        If (txtpatientname.Text <> "") Then
            If strsql = "" Then
                strsql = " where Lower(Patient) like '%" & txtpatientname.Text.ToLower() & "%'"
            Else
                strsql = strsql & " or Lower(Patient) like '%" + txtpatientname.Text.ToLower() & "%'"
            End If
        End If

        If (txtiframeurl.Text <> "") Then
            If strsql = "" Then
                strsql = " where Lower(iframeurl) like '%" & txtiframeurl.Text.ToLower() & "%'"
            Else
                strsql = strsql & " or Lower(iframeurl) like '%" + txtiframeurl.Text.ToLower() & "%'"
            End If
        End If

        If (txtnavagationpathurl.Text <> "") Then
            If strsql = "" Then
                strsql = " where Lower(target) like '%" & txtnavagationpathurl.Text.ToLower() & "%'"
            Else
                strsql = strsql & " or Lower(target) like '%" + txtnavagationpathurl.Text.ToLower() & "%'"
            End If
        End If

        If (txtAlternateText.Text <> "") Then
            If strsql = "" Then
                strsql = " where Lower(alternatetext) like '%" & txtAlternateText.Text.ToLower() & "%'"
            Else
                strsql = strsql & " or Lower(alternatetext) like '%" + txtAlternateText.Text.ToLower() & "%'"
            End If
        End If

        If (txtSortOrder.Text <> "") Then
            If strsql = "" Then
                strsql = " where Lower(sortorder) like '%" & txtSortOrder.Text.ToLower() & "%'"
            Else
                strsql = strsql & " or Lower(sortorder) like '%" + txtSortOrder.Text.ToLower() & "%'"
            End If
        End If


        'If (txtPostedByDoctorID.Text <> "") Then
        '    If strsql = "" Then
        '        strsql = " where Lower(PostedByDoctorID) like '%" & txtPostedByDoctorID.Text.ToLower() & "%'"
        '    Else
        '        strsql = strsql & " or Lower(PostedByDoctorID) like '%" + txtPostedByDoctorID.Text.ToLower() & "%'"
        '    End If
        'End If

        If (TxtDate.Text <> "") Then
            If strsql = "" Then
                strsql = " where NewsDate = '" & TxtDate.Text & "'"
            Else
                strsql = strsql & " or NewsDate = '" & TxtDate.Text & "'"
            End If
        End If

        If (txtsize.Text <> "") Then
            If strsql = "" Then
                strsql = " where Lower(AccessLimit) like '%" & txtsize.Text.ToLower() & "%'"
            Else
                strsql = strsql & " or Lower(AccessLimit) like '%" + txtsize.Text.ToLower() & "%'"
            End If
        End If

        strsql = strsql1 & strsql & " order by sortorder "
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
            GVAddVideo.DataSource = myDataSet
            GVAddVideo.DataBind()
            count = 1
        End If
        oracmd = Nothing
        closeConnection()
    End Sub
    Protected Sub GVAddVideo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVAddVideo.SelectedIndexChanged

    End Sub
End Class