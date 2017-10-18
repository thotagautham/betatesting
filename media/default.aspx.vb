Imports System.Data.SqlClient
Imports betatesting.DataSetCareTableAdapters
Imports betatesting.cmsTableAdapters
Public Class _default
    Inherits System.Web.UI.Page

    Dim DsSpecialities As New SPECIALITIESTableAdapter
    Dim DsSpec As New SPECIALIZATIONTableAdapter

    Dim DsBranch As New BRANCH1TableAdapter
    Dim branchDepts As New getDeptsByBranchTableAdapter
    Dim i As Integer
    Dim spArr, deptArr, institutesArr, qualArr, branchArr As Array
    Dim strsql, strCondition, strJoin As String
    Dim oracmd As SqlCommand
    Dim connString As String
    Public objConn As SqlConnection
    Dim objdata As SqlDataReader

    Protected Sub BtnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSearch.Click
        BuildQuery()
    End Sub
    Private Sub BuildQuery()

        strsql = "select * from KfrcOHPrintMedia where OHPrintMediaID >0 "


        If DDLBranches.SelectedIndex <> 0 Then
            strsql = strsql & " and BranchID like '%$" & DDLBranches.SelectedValue & "$%'"
        End If

        If DDLSpecialisation.SelectedIndex > 0 Then
            strsql = strsql & " and Specialisation like '%$" & DDLSpecialisation.SelectedValue & "$%'"
        Else
            If DDLDepts.SelectedIndex > 0 Then
                strsql = strsql & " and DepartmentId like '%$" & DDLDepts.SelectedValue & "$%'"
            End If
        End If

        strsql = strsql & " order by NewsDate desc"

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

        'Label1.Text = strsql
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

        RptDoctors.DataSource = myDataSet
        RptDoctors.DataBind()

        oracmd = Nothing
        closeConnection()
    End Sub

    'Protected Sub GVDoctors_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVDoctors.DataBound
    '    For i = 0 To GVDoctors.Rows.Count - 1
    '        'Dim hlink As HyperLink = CType(GVDoctors.Rows(i).Cells(5).FindControl("Hyperlink1"), HyperLink)
    '        'hlink.NavigateUrl = "javascript:window.open('doctortimings.aspx?doctorid=" & GVDoctors.DataKeys(i).Value & "&branchid=" & GVDoctors.Rows(i).Cells(3).Text & "','DoctorTimings','status=0,toolbar=0,menubar=0,location=0,scrollbars=0,resizable=0,width=400,height=200'); window.close();"
    '        'GVDoctors.Rows(i).Cells(2).Text = DsSpec.GetValueByID(GVDoctors.Rows(i).Cells(2).Text)
    '        'GVDoctors.Rows(i).Cells(3).Text = DsBranch.GetValueByID(GVDoctors.Rows(i).Cells(3).Text)
    '        If GVDoctors.Rows(i).Cells(2).Text <> "N/A" Then
    '            GVDoctors.Rows(i).Cells(2).Text = "<a href='#'" & "onclick='window.open(""/doctorprofiles/" & GVDoctors.Rows(i).Cells(0).Text.Replace(" ", "_") & ".html"",""DoctorProfile"",""status=0,toolbar=0,menubar=0,location=0,scrollbars=0,resizable=0,width=400,height=200"")' title='Click Here To View [" & GVDoctors.Rows(i).Cells(0).Text & "]'s profile'>Click To View Profile</a>"
    '        End If
    '    Next
    'End Sub

    'Protected Sub GVDoctors_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVDoctors.PageIndexChanging
    '    RptDoctors.PageIndex = e.NewPageIndex
    '    BuildQuery()
    'End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            DDLBranches.DataSource = DsBranch.GetActiveBranches()
            DDLBranches.DataTextField = "BRANCHNAME"
            DDLBranches.DataValueField = "BRANCHID"
            DDLBranches.DataBind()

         

            BindSpecialitiesDepts()


            strsql = "select * from OHPrintMedia"



          

            strsql = strsql & " order by NewsDate desc "

            getData(strsql)

        End If
    End Sub

    Protected Sub DDLBranches_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLBranches.SelectedIndexChanged
        BindSpecialitiesDepts()
        BuildQuery()
    End Sub

    Private Sub BindSpecialitiesDepts()
        DDLSpecialisation.Items.Clear()

        If DDLBranches.SelectedIndex > 0 Then
            DDLSpecialisation.DataSource = DsSpecialities.GetAllDataByBranchId(DDLBranches.SelectedItem.Value)
            DDLDepts.DataSource = branchDepts.GetAllData(DDLBranches.SelectedItem.Value)
        Else
            DDLSpecialisation.DataSource = DsSpec.GetAllSpecialitiesExcludingDepts
            DDLDepts.DataSource = DsSpec.GetActiveDept
        End If

        DDLSpecialisation.DataValueField = "SPECIALIZATIONID"
        DDLSpecialisation.DataTextField = "SPECIALIZATIONNAME"
        DDLSpecialisation.DataBind()

        DDLSpecialisation.Items.Insert(0, "Select Any Speciality")
        DDLSpecialisation.Items(0).Value = "0"

        DDLDepts.Items.Clear()
        DDLDepts.DataValueField = "SPECIALIZATIONID"
        DDLDepts.DataTextField = "SPECIALIZATIONNAME"
        DDLDepts.DataBind()

        DDLDepts.Items.Insert(0, "Select Any Department")
        DDLDepts.Items(0).Value = "0"
    End Sub
    Protected Sub DDLDepts_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DDLDepts.SelectedIndexChanged
        If DDLDepts.SelectedIndex > 0 Then
            If DDLBranches.SelectedIndex > 0 Then
                DDLSpecialisation.DataSource = DsSpecialities.GetActiveDataByBranchDept(DDLBranches.SelectedItem.Value, DDLDepts.SelectedItem.Value)
            Else
                DDLSpecialisation.DataSource = DsSpec.GetActiveDataByDeptID(DDLDepts.SelectedItem.Value)
            End If
        Else
            DDLSpecialisation.DataSource = DsSpecialities.GetAllDataByBranchId(DDLBranches.SelectedItem.Value)
        End If
        DDLSpecialisation.DataValueField = "SPECIALIZATIONID"
        DDLSpecialisation.DataTextField = "SPECIALIZATIONNAME"
        DDLSpecialisation.DataBind()

        DDLSpecialisation.Items.Insert(0, "Select Specialisation")
        DDLSpecialisation.Items(0).Value = "0"

        BuildQuery()

    End Sub


    Protected Sub DDLSpecialisation_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles DDLSpecialisation.SelectedIndexChanged
        BuildQuery()
    End Sub

    Protected Sub rptdoctors_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles RptDoctors.ItemDataBound
        Dim lblDepartment As Label = CType(e.Item.FindControl("LblDepartment"), Label)
        Dim lblSpeciality As Label = CType(e.Item.FindControl("LblSpeciality"), Label)
        Dim lblBranch As Label = CType(e.Item.FindControl("LblBranch"), Label)

        If Not lblBranch Is Nothing Then
            If lblBranch.Text <> "" Then
                branchArr = Split(lblBranch.Text.Replace("$", ""), ",")
                lblBranch.Text = ""
                For i = 0 To UBound(branchArr)
                    If i = 0 Then
                        lblBranch.Text = DsBranch.GetValueByID(branchArr(i))
                    Else
                        lblBranch.Text = lblBranch.Text & ", " & DsBranch.GetValueByID(branchArr(i))
                    End If
                Next
            End If
        End If

        If Not lblSpeciality Is Nothing Then
            If lblSpeciality.Text <> "" Then
                spArr = Split(lblSpeciality.Text.Replace("$", ""), ",")
                lblSpeciality.Text = ""
                For i = 0 To UBound(spArr)
                    If i = 0 Then
                        lblSpeciality.Text = DsSpec.GetValueByID(spArr(i))
                    Else
                        lblSpeciality.Text = lblSpeciality.Text & ", " & DsSpec.GetValueByID(spArr(i))
                    End If
                Next
                If lblSpeciality.Text <> "" Then
                    lblSpeciality.Text = lblSpeciality.Text + "<br />"
                End If
            End If
        End If

        If Not lblDepartment Is Nothing Then
            If lblDepartment.Text <> "" Then
                deptArr = Split(lblDepartment.Text.Replace("$", ""), ",")
                lblDepartment.Text = ""
                For i = 0 To UBound(deptArr)
                    If i = 0 Then
                        lblDepartment.Text = DsSpec.GetValueByID(deptArr(i))
                    Else
                        lblDepartment.Text = lblDepartment.Text & ", " & DsSpec.GetValueByID(deptArr(i))
                    End If
                Next
                If lblDepartment.Text <> "" Then
                    lblDepartment.Text = lblDepartment.Text + "<br />"
                End If
            End If
        End If
    End Sub

End Class