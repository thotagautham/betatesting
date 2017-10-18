Imports betatesting.DataSetCareTableAdapters

Public Class expertsteam
    Inherits System.Web.UI.UserControl

    Dim DsDoctors As New VENDORSUsersTableAdapter
    Dim DsBranch As New VENDORTYPESTableAdapter
    Dim spArr, deptArr, institutesArr, qualArr, branchArr As Array
    Dim DsSpec As New VENDORSPECIALIZATIONTableAdapter
    Dim DsSpecialities As New VENDORSPECIALIZATIONTableAdapter



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim id() As String
            Dim HospitalId As String

            id = Split(Request.Url.ToString(), "/")
            HospitalId = id(id.Length - 2)
            HospitalId = DsBranch.GetIdByAlteredName(HospitalId)
            LblHospitalId.Text = HospitalId

            RptTeam.DataSource = DsDoctors.GetActiveExpertsListByVendorTypeId(HospitalId)
            RptTeam.DataBind()

            If (RptTeam.Items.Count = 0) Then
                RptTeam.Visible = False

                DDLSpecialisation.Visible = False
            Else
                RptTeam.Visible = True
                
                DDLSpecialisation.Visible = True
                BindSpecialitiesDepts(HospitalId)
            End If

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

        
    End Sub

   

    Protected Sub DDLSpecialisation_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDLSpecialisation.SelectedIndexChanged
        BindDoctors(DDLSpecialisation.SelectedItem.Value)

    End Sub

    Private Sub BindDoctors(specialisationId As Integer)

        RptTeam.DataSource = DsDoctors.GetActiveDataByBranchDept(LblHospitalId.Text, specialisationId)


        RptTeam.DataBind()

    End Sub

    Private Sub BindSpecialitiesDepts(branchId As Integer)
        DDLSpecialisation.Items.Clear()

        DDLSpecialisation.DataSource = DsSpecialities.GetSpecilisationListByexpertType(branchId)


        DDLSpecialisation.DataValueField = "SPECIALIZATIONID"
        DDLSpecialisation.DataTextField = "SPECIALIZATIONNAME"
        DDLSpecialisation.DataBind()

        DDLSpecialisation.Items.Insert(0, "SELECT ANY SPECIALIZATION")
        DDLSpecialisation.Items(0).Value = "0"
        DDLSpecialisation.Items.FindByValue(0).Selected = True
       
    End Sub


End Class
