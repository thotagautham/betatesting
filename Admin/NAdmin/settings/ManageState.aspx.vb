Imports betatesting.DataSetCareTableAdapters
Partial Class Admin_NAdmin_Settings_ManageState
    Inherits System.Web.UI.Page
    Dim DsState As New STATETableAdapter
    Dim DsCountry As New COUNTRYTableAdapter
    Dim i As Integer

    Protected Sub BtnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSave.Click
        If CInt(DsState.CheckPrimary(TxtState.Text, DDLCountry.SelectedValue)) > 0 Then
            LblMsg.Text = "State [ " & TxtState.Text & " ] Already Exists In Country [ " & DDLCountry.SelectedItem.Text & " ], Please Try With Any Other !"
        Else
            DsState.Insert(TxtState.Text, DDLCountry.SelectedValue, "Y")
            LblMsg.Text = "State Added Successfully !"
            GVState.DataBind()
        End If
    End Sub

    Protected Sub GVState_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVState.DataBound
        For i = 0 To GVState.Rows.Count - 1
            Dim LblCountry As Label = CType(GVState.Rows(i).Cells(2).FindControl("LblCountry"), Label)
            If (Not (LblCountry) Is Nothing) Then
                LblCountry.Text = DsCountry.GetValueByID(CInt(LblCountry.Text))
            End If

            Dim CmdActive As LinkButton = CType(GVState.Rows(i).Cells(4).FindControl("LnkBtnActiveStatus"), LinkButton)

            If GVState.Rows(i).Cells(3).Text = "Y" Then
                CmdActive.Text = "De Activate"
                CmdActive.OnClientClick = "return confirm('Are You Sure, You Want To De Activate?');"
                GVState.Rows(i).Cells(3).Text = "Active"
            Else
                CmdActive.Text = "Activate"
                CmdActive.OnClientClick = "return confirm('Are You Sure, You Want To Activate?');"
                GVState.Rows(i).Cells(3).Text = "De Active"
            End If
            CmdActive.CommandArgument = i
        Next
    End Sub


    Protected Sub GVState_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVState.RowCommand
        If e.CommandName = "CmdActive" Then
            If GVState.Rows(e.CommandArgument).Cells(3).Text = "Active" Then
                DsState.UpdateActiveStatus("N", GVState.DataKeys(e.CommandArgument).Value)
            Else
                DsState.UpdateActiveStatus("Y", GVState.DataKeys(e.CommandArgument).Value)
            End If
            GVState.DataBind()
        End If
    End Sub

    Protected Sub GVState_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GVState.RowUpdating
        LblMsg.Text = ""

        Dim TxtStatee As TextBox = CType(GVState.Rows(e.RowIndex).Cells(1).FindControl("TxtState"), TextBox)
        Dim DDLCountryyy As DropDownList = CType(GVState.Rows(e.RowIndex).Cells(1).FindControl("DDLCountry"), DropDownList)

        If CInt(DsState.CheckOtherPrimary(TxtStatee.Text, DDLCountryyy.SelectedValue, GVState.DataKeys(e.RowIndex).Value)) > 0 Then
            e.Cancel = True
            LblMsg.Text = "State [ " & TxtStatee.Text & " ] Already Exists , Please Try Again ! "
        Else
            LblMsg.Text = "State Updated Successfully"
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "Settings", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If
        End If
    End Sub
End Class
