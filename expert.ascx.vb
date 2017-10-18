Imports betatesting.DataSetCareTableAdapters
Public Class expert
    Inherits System.Web.UI.UserControl

    Dim DsDoctors As New VENDORSUsersTableAdapter
    Dim spArr, deptArr, institutesArr, qualArr, branchArr As Array
    Dim DsSpec As New VENDORTYPESTableAdapter
    Dim DsBranch As New VENDORSPECIALIZATIONTableAdapter
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim id() As String
            Dim specialityId As String

            id = Split(Request.Url.ToString(), "/")

            specialityId = id(id.Length - 1)
            If specialityId = "Specialties" Then
                specialityId = id(id.Length - 1).Replace(".aspx", "")
            End If

            specialityId = DsSpec.GetIdByAlteredName(specialityId)
            If (DsSpec.GetIdByAlteredName(specialityId)) Then
                RptTeam.DataSource = DsDoctors.GetActiveExpertListBySpecilisation(specialityId)
                'RptTeam.DataSource = DsDoctors.GetActiveDataByBranchDept(specialityId, 6)
                RptTeam.DataBind()
            Else
                ''RptTeam.DataSource = DsDoctors.GetActiveDoctorsListBySpecialisation(specialityId)
                'RptTeam.DataSource = DsDoctors.GetActiveDoctorsListByBranchSpecialisation(specialityId, 6)
                'RptTeam.DataBind()
            End If

            If (RptTeam.Items.Count = 0) Then
                RptTeam.Visible = False
            Else
                RptTeam.Visible = True
            End If

            LblDeptId.Text = specialityId
            DDLBRanch.DataSource = DsBranch.GetActiveVendorTypes()
            DDLBRanch.DataTextField = "SPECIALIZATIONNAME"
            DDLBRanch.DataValueField = "SPECIALIZATIONID"
            DDLBRanch.DataBind()

            DDLBRanch.Items.Insert(0, "All SPECILIZATIONS")
            DDLBRanch.Items(0).Value = "0"
            DDLBRanch.Items.FindByValue(6).Selected = True

        End If
    End Sub

    Protected Sub RptTeam_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles RptTeam.ItemDataBound

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

      

    Protected Sub DDLBRanch_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDLBRanch.SelectedIndexChanged
        If (DsSpec.GetIsDepartment(LblDeptId.Text)) Then
            If DDLBRanch.SelectedIndex > 0 Then
                RptTeam.DataSource = DsDoctors.GetActiveDataByBranchDept(LblDeptId.Text, DDLBRanch.SelectedItem.Value)
                RptTeam.DataBind()
            Else
                RptTeam.DataSource = DsDoctors.GetActiveDoctorsListByDepartment(LblDeptId.Text)
                RptTeam.DataBind()
            End If
        Else
            If DDLBRanch.SelectedIndex > 0 Then
                RptTeam.DataSource = DsDoctors.GetActiveDoctorsListByBranchSpecialisation(LblDeptId.Text, DDLBRanch.SelectedItem.Value)
                RptTeam.DataBind()
            Else
                RptTeam.DataSource = DsDoctors.GetActiveDoctorsListBySpecialisation(LblDeptId.Text)
                RptTeam.DataBind()
            End If
        End If

    End Sub
End Class
