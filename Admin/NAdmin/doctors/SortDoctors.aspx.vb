Imports betatesting.DataSetCareTableAdapters
Public Class SortDoctors
    Inherits System.Web.UI.Page
    Dim DsDept As New DEPARTMENTTableAdapter
    Dim DsInstitutes As New InstitutesTableAdapter
    Dim DsSp As New SPECIALIZATIONTableAdapter
    Dim DsBranch As New BRANCH1TableAdapter
    Dim DsDoctors As New DOCTORSTableAdapter
    Dim DsSortorder As New DoctorsSortOrderTableAdapter
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "Doctors", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If

            'Fill Department

            DdlDepartment.DataSource = DsSp.GetActiveDept()
            DdlDepartment.DataTextField = "SPECIALIZATIONNAME"
            DdlDepartment.DataValueField = "SPECIALIZATIONID"
            DdlDepartment.DataBind()

            DdlDepartment.Items.Insert(0, "-- Select Department --")
            DdlDepartment.Items(0).Value = "0"

            'Fill Specialities

            DdlSpeciality.DataSource = DsSp.GetOnlyActiveSpecialitiesExcludingDepts
            DdlSpeciality.DataTextField = "SPECIALIZATIONNAME"
            DdlSpeciality.DataValueField = "SPECIALIZATIONID"
            DdlSpeciality.DataBind()

            DdlSpeciality.Items.Insert(0, "-- Select Specialisation --")
            DdlSpeciality.Items(0).Value = "0"

            'Fill Institutes

            DdlInstitute.DataSource = DsInstitutes.GetAllData
            DdlInstitute.DataTextField = "InstituteNAME"
            DdlInstitute.DataValueField = "InstituteID"
            DdlInstitute.DataBind()

            DdlInstitute.Items.Insert(0, "-- Select Institute --")
            DdlInstitute.Items(0).Value = "0"

            DdlBranch.DataSource = DsBranch.GetAllData(0)
            DdlBranch.DataTextField = "BranchName"
            DdlBranch.DataValueField = "BranchId"
            DdlBranch.DataBind()

            DdlBranch.Items.Insert(0, "-- Select Branch --")
            DdlBranch.Items(0).Value = "0"

        End If
    End Sub

    Protected Sub DdlBranch_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DdlBranch.SelectedIndexChanged
        BindData(GVBranchDoctors, DsDoctors.GetActiveDataByBranch(Convert.ToInt32(DdlBranch.SelectedItem.Value)))
    End Sub

    Protected Sub DdlSpeciality_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DdlSpeciality.SelectedIndexChanged
        BindData(GVSpecilisationDoctors, DsDoctors.GetActiveDoctorsListBySpecialisation(DdlSpeciality.SelectedItem.Value))
    End Sub

    Protected Sub DdlDepartment_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DdlDepartment.SelectedIndexChanged
        BindData(GVDeptDoctors, DsDoctors.GetActiveDoctorsListByDepartment(DdlDepartment.SelectedItem.Value))
    End Sub

    Protected Sub DdlInstitute_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DdlInstitute.SelectedIndexChanged
        BindData(GVInstituteDoctors, DsDoctors.GetActiveDoctorsListByInstitute(DdlInstitute.SelectedItem.Value))
    End Sub

    Protected Sub GVBranchDoctors_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GVBranchDoctors.PageIndexChanging
        DdlActions(GVBranchDoctors, DsDoctors.GetActiveDataByBranch(DdlBranch.SelectedItem.Value), e.NewPageIndex, "PageChanging")
    End Sub

    Protected Sub GVInstituteDoctors_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GVInstituteDoctors.PageIndexChanging
        DdlActions(GVInstituteDoctors, DsDoctors.GetActiveDoctorsListByInstitute(DdlInstitute.SelectedItem.Value), e.NewPageIndex, "PageChanging")
    End Sub

    Protected Sub GVDeptDoctors_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GVDeptDoctors.PageIndexChanging
        DdlActions(GVDeptDoctors, DsDoctors.GetActiveDoctorsListByDepartment(DdlDepartment.SelectedItem.Value), e.NewPageIndex, "PageChanging")
    End Sub

    Protected Sub GVSpecilisationDoctors_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GVSpecilisationDoctors.PageIndexChanging
        DdlActions(GVSpecilisationDoctors, DsDoctors.GetActiveDoctorsListBySpecialisation(DdlSpeciality.SelectedItem.Value), e.NewPageIndex, "PageChanging")
    End Sub
    
    Protected Sub GVBranchDoctors_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GVBranchDoctors.RowEditing
        DdlActions(GVBranchDoctors, DsDoctors.GetActiveDataByBranch(DdlBranch.SelectedItem.Value), e.NewEditIndex, "RowEditing")
    End Sub

    Protected Sub GVBranchDoctors_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles GVBranchDoctors.RowCancelingEdit
        DdlActions(GVBranchDoctors, DsDoctors.GetActiveDataByBranch(DdlBranch.SelectedItem.Value), -1, "RowCancelingEdit")
    End Sub

    Protected Sub GVBranchDoctors_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GVBranchDoctors.RowUpdating
        Dim dt = DsSortorder.GetSortOrdeBySection("Branch", DdlBranch.SelectedItem.Value, GVBranchDoctors.DataKeys(e.RowIndex).Value)
        Dim ddl As DropDownList = CType(GVBranchDoctors.Rows(e.RowIndex).Cells(0).FindControl("DdlBranchOrder"), DropDownList)
        If dt.Rows.Count > 0 Then
            Dim dtrow = dt.Rows(0)
            DsSortorder.UpdateSortOrder(ddl.SelectedItem.Value, dtrow("SortorderId"))
        Else
            DsSortorder.Insert("Branch", DdlBranch.SelectedItem.Value, ddl.SelectedItem.Value, GVBranchDoctors.DataKeys(e.RowIndex).Value)
        End If
        GVBranchDoctors.EditIndex = -1
        BindData(GVBranchDoctors, DsDoctors.GetActiveDataByBranch(DdlBranch.SelectedItem.Value))

    End Sub

    Protected Sub GVBranchDoctors_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GVBranchDoctors.RowDataBound
        DdlRowBound(CType(e.Row.Cells(0).FindControl("DdlBranchOrder"), DropDownList), DsDoctors.GetTotalDoctorsByBranch(DdlBranch.SelectedItem.Value), CType(e.Row.Cells(0).FindControl("lblSortorder"), Label))
    End Sub

    Private Sub DdlRowBound(ddl As DropDownList, totalDoctors As Integer, lblSortorder As Label)
        If (Not IsNothing(ddl)) Then
            For i = 0 To totalDoctors
                ddl.Items.Insert(i, i)
            Next

            If lblSortorder.Text <> "" Then
                ddl.Items.FindByValue(lblSortorder.Text).Selected = True
            End If
        End If
    End Sub

    Private Sub BindData(gv As GridView, dt As DataTable)
        gv.DataSource = dt
        gv.DataBind()
    End Sub

    Private Sub DdlActions(gv As GridView, dt As DataTable, index As Integer, action As String)
        Select Case action
            Case "PageChanging"
                gv.PageIndex = index
            Case "RowCancelingEdit"
                gv.EditIndex = index
            Case "RowEditing"
                gv.EditIndex = index
        End Select
        BindData(gv, dt)
    End Sub

    Protected Sub GVInstituteDoctors_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles GVInstituteDoctors.RowCancelingEdit
        DdlActions(GVInstituteDoctors, DsDoctors.GetActiveDoctorsListByInstitute(DdlInstitute.SelectedItem.Value), -1, "RowCancelingEdit")
    End Sub

    Protected Sub GVInstituteDoctors_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GVInstituteDoctors.RowDataBound
        DdlRowBound(CType(e.Row.Cells(0).FindControl("DdlInstituteOrder"), DropDownList), DsDoctors.GetTotalDoctorsByInstitute(DdlInstitute.SelectedItem.Value), CType(e.Row.Cells(0).FindControl("lblSortorder"), Label))
    End Sub

    Protected Sub GVInstituteDoctors_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GVInstituteDoctors.RowEditing
        DdlActions(GVInstituteDoctors, DsDoctors.GetActiveDoctorsListByInstitute(DdlInstitute.SelectedItem.Value), e.NewEditIndex, "RowEditing")
    End Sub

    Protected Sub GVInstituteDoctors_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GVInstituteDoctors.RowUpdating
        Dim dt = DsSortorder.GetSortOrdeBySection("Institute", DdlInstitute.SelectedItem.Value, GVInstituteDoctors.DataKeys(e.RowIndex).Value)
        Dim ddl As DropDownList = CType(GVInstituteDoctors.Rows(e.RowIndex).Cells(0).FindControl("DdlInstituteOrder"), DropDownList)
        If dt.Rows.Count > 0 Then
            Dim dtrow = dt.Rows(0)
            DsSortorder.UpdateSortOrder(ddl.SelectedItem.Value, dtrow("SortorderId"))
        Else
            DsSortorder.Insert("Institute", DdlInstitute.SelectedItem.Value, ddl.SelectedItem.Value, GVInstituteDoctors.DataKeys(e.RowIndex).Value)
        End If
        GVInstituteDoctors.EditIndex = -1
        BindData(GVInstituteDoctors, DsDoctors.GetActiveDoctorsListByInstitute(DdlInstitute.SelectedItem.Value))
    End Sub

    Protected Sub GVDeptDoctors_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles GVDeptDoctors.RowCancelingEdit
        DdlActions(GVDeptDoctors, DsDoctors.GetActiveDoctorsListByDepartment(DdlDepartment.SelectedItem.Value), -1, "RowCancelingEdit")
    End Sub

    Protected Sub GVDeptDoctors_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GVDeptDoctors.RowDataBound
        DdlRowBound(CType(e.Row.Cells(0).FindControl("DdlDeptOrder"), DropDownList), DsDoctors.GetTotalDoctorsByDepartment(DdlDepartment.SelectedItem.Value), CType(e.Row.Cells(0).FindControl("lblSortorder"), Label))
    End Sub

    Protected Sub GVDeptDoctors_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GVDeptDoctors.RowEditing
        DdlActions(GVDeptDoctors, DsDoctors.GetActiveDoctorsListByDepartment(DdlDepartment.SelectedItem.Value), e.NewEditIndex, "RowEditing")
    End Sub

    Protected Sub GVDeptDoctors_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GVDeptDoctors.RowUpdating
        Dim dt = DsSortorder.GetSortOrdeBySection("Department", DdlDepartment.SelectedItem.Value, GVDeptDoctors.DataKeys(e.RowIndex).Value)
        Dim ddl As DropDownList = CType(GVDeptDoctors.Rows(e.RowIndex).Cells(0).FindControl("DdlDeptOrder"), DropDownList)
        If dt.Rows.Count > 0 Then
            Dim dtrow = dt.Rows(0)
            DsSortorder.UpdateSortOrder(ddl.SelectedItem.Value, dtrow("SortorderId"))
        Else
            DsSortorder.Insert("Department", DdlDepartment.SelectedItem.Value, ddl.SelectedItem.Value, GVDeptDoctors.DataKeys(e.RowIndex).Value)
        End If
        GVDeptDoctors.EditIndex = -1
        BindData(GVDeptDoctors, DsDoctors.GetActiveDoctorsListByDepartment(DdlDepartment.SelectedItem.Value))
    End Sub

    Protected Sub GVSpecilisationDoctors_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs) Handles GVSpecilisationDoctors.RowCancelingEdit
        DdlActions(GVSpecilisationDoctors, DsDoctors.GetActiveDoctorsListBySpecialisation(DdlSpeciality.SelectedItem.Value), -1, "RowCancelingEdit")
    End Sub

    Protected Sub GVSpecilisationDoctors_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles GVSpecilisationDoctors.RowDataBound
        DdlRowBound(CType(e.Row.Cells(0).FindControl("DdlSpecilisationOrder"), DropDownList), DsDoctors.GetTotalDoctorsBySpecialisation(DdlSpeciality.SelectedItem.Value), CType(e.Row.Cells(0).FindControl("lblSortorder"), Label))
    End Sub

    Protected Sub GVSpecilisationDoctors_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles GVSpecilisationDoctors.RowEditing
        DdlActions(GVSpecilisationDoctors, DsDoctors.GetActiveDoctorsListBySpecialisation(DdlSpeciality.SelectedItem.Value), e.NewEditIndex, "RowEditing")
    End Sub

    Protected Sub GVSpecilisationDoctors_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles GVSpecilisationDoctors.RowUpdating
        Dim dt = DsSortorder.GetSortOrdeBySection("Specialisation", DdlSpeciality.SelectedItem.Value, GVSpecilisationDoctors.DataKeys(e.RowIndex).Value)
        Dim ddl As DropDownList = CType(GVSpecilisationDoctors.Rows(e.RowIndex).Cells(0).FindControl("DdlSpecilisationOrder"), DropDownList)
        If dt.Rows.Count > 0 Then
            Dim dtrow = dt.Rows(0)
            DsSortorder.UpdateSortOrder(ddl.SelectedItem.Value, dtrow("SortorderId"))
        Else
            DsSortorder.Insert("Specialisation", DdlSpeciality.SelectedItem.Value, ddl.SelectedItem.Value, GVSpecilisationDoctors.DataKeys(e.RowIndex).Value)
        End If
        GVSpecilisationDoctors.EditIndex = -1
        BindData(GVSpecilisationDoctors, DsDoctors.GetActiveDoctorsListBySpecialisation(DdlSpeciality.SelectedItem.Value))
    End Sub
End Class