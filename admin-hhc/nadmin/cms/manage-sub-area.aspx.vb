Imports betatesting.DataSetCareTableAdapters
Imports betatesting.CorporatesTableAdapters
Public Class manage_sub_area
    Inherits System.Web.UI.Page

    Dim dssubcity As New subareaCITY2TableAdapter
    Dim DsCity As New CITYTableAdapter
    Dim DsCountryCities As New CITIESBYCOUNTRYTableAdapter
    Dim DsState As New STATETableAdapter
    Dim DsCountry As New COUNTRYTableAdapter
    Dim i As Integer

    Protected Sub BtnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSave.Click

        If BtnSave.Text = "Update" Then

            dssubcity.updatedata(TxtsubCity.Text, ddlcity.SelectedItem.Value, fileId.Text)
            BtnSave.Text = "Save"
            TxtsubCity.Text = ""
        Else
            If CInt(dssubcity.checkprimary(TxtsubCity.Text, ddlcity.SelectedItem.Value)) > 0 Then
                LblMsg.Text = "City [" & TxtsubCity.Text & "] Already Exists, Please Try With The Other !"
            Else
                dssubcity.Insert(TxtsubCity.Text, ddlcity.SelectedValue, "Y")
                LblMsg.Text = "City [" & TxtsubCity.Text & "] Added Successfully"
                TxtsubCity.Text = ""
            End If
        End If
        gvcity.DataSource = dssubcity.getalldata(ddlcity.SelectedItem.Value)
        gvcity.DataBind()
       
    End Sub

    Protected Sub GVCity_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVCity.DataBound
        For i = 0 To GVCity.Rows.Count - 1
            Dim LblState As Label = CType(GVCity.Rows(i).Cells(2).FindControl("LblState"), Label)
            If (Not (LblState) Is Nothing) Then
                LblState.Text = DsCity.GetValueByID(CInt(LblState.Text))
            End If

            If gvcity.Rows(i).Cells(2).Text = "" Then
            Else

                gvcity.Rows(i).Cells(2).Text = DsCity.GetValueByID(gvcity.Rows(i).Cells(2).Text)
            End If

            'Dim DDlStatee As DropDownList = CType(GVCity.Rows(i).Cells(2).FindControl("DDlState"), DropDownList)
            'If (Not (DDlStatee) Is Nothing) Then
            '    DDlStatee.SelectedIndex = -1
            '    DDlStatee.Items.FindByValue(DDLState.SelectedValue).Selected = True
            'End If

            Dim CmdActive As LinkButton = CType(GVCity.Rows(i).Cells(4).FindControl("LnkBtnActiveStatus"), LinkButton)

            If GVCity.Rows(i).Cells(3).Text = "Y" Then
                CmdActive.Text = "De Activate"
                CmdActive.OnClientClick = "return confirm('Are You Sure, You Want To De Activate?');"
                GVCity.Rows(i).Cells(3).Text = "Active"
            Else
                CmdActive.Text = "Activate"
                CmdActive.OnClientClick = "return confirm('Are You Sure, You Want To Activate?');"
                GVCity.Rows(i).Cells(3).Text = "De Active"
            End If
            CmdActive.CommandArgument = i
        Next
    End Sub

    Protected Sub GVCity_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVCity.PageIndexChanging
        GVCity.PageIndex = e.NewPageIndex
        BindData()

    End Sub

    Protected Sub GVCity_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles GVCity.RowCancelingEdit
        GVCity.EditIndex = -1
        BindData()
    End Sub

    Protected Sub GVCity_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVCity.RowCommand
        If e.CommandName = "CmdActive" Then
            If GVCity.Rows(e.CommandArgument).Cells(3).Text = "Active" Then
                dssubcity.UpdateActiveStatus("N", GVCity.DataKeys(e.CommandArgument).Value)
            Else
                dssubcity.UpdateActiveStatus("Y", GVCity.DataKeys(e.CommandArgument).Value)
            End If





        End If

        If e.CommandName = "CmdEdit" Then

            Dim DtImages As DataTable = dssubcity.Getalldatabysbuareacityid(e.CommandArgument)
            Dim dtrow As DataRow

            If DtImages.Rows.Count > 0 Then
                dtrow = DtImages.Rows(0)

                TxtsubCity.Text = dtrow("subareaCITYNAME")

                BtnSave.Text = "Update"
                fileId.Text = dtrow("subareaCITYID")
           
            End If
        ElseIf e.CommandName = "CmdDelete" Then
            dssubcity.DeleteQuery(e.CommandArgument)
            BindData()
        End If
        gvcity.DataSource = dssubcity.getalldata(ddlcity.SelectedItem.Value)
        gvcity.DataBind()
    End Sub

    Protected Sub GVCity_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GVCity.RowEditing
        GVCity.EditIndex = e.NewEditIndex
        BindData()
    End Sub

    Protected Sub DDLCountry_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLCountry.SelectedIndexChanged
        'GVCity.DataSource = DsCountryCities.GetAllData(DDLCountry.SelectedValue)
        'GVCity.DataBind()

        LblMsg.Text = ""

        DDLState.DataSource = DsState.GetAllData(DDLCountry.SelectedValue)
        DDLState.Items.Clear()

        DDLState.Items.Add("-- Select Any State --")
        DDLState.Items(0).Value = ""

        DDLState.DataTextField = "STATENAME"
        DDLState.DataValueField = "STATEID"
        DDLState.DataBind()
    End Sub

    Protected Sub DDLState_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLState.SelectedIndexChanged

        LblMsg.Text = ""

        ddlcity.DataSource = DsCity.GetAllData(DDLState.SelectedItem.Value)
        ddlcity.Items.Clear()

        ddlcity.Items.Add("-- Select Any City --")
        ddlcity.Items(0).Value = ""

        ddlcity.DataTextField = "CITYNAME"
        ddlcity.DataValueField = "CITYID"
        ddlcity.DataBind()

    End Sub

    Protected Sub BindData()
        If DDLState.SelectedIndex > 0 Then
            GVCity.DataSource = dssubcity.GetAllData(DDLState.SelectedValue)
            GVCity.DataBind()

       
        End If
    End Sub


    Protected Sub LnkBtnUpdate_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        Dim LnkBtn As LinkButton = TryCast(sender, LinkButton)
        Dim GVRow As GridViewRow = DirectCast(LnkBtn.Parent.Parent, GridViewRow)

        Dim rowIndex As Integer = GVRow.RowIndex


        Dim TxtCityy As TextBox = CType(GVCity.Rows(rowIndex).Cells(1).FindControl("TxtCity"), TextBox)
        Dim DDlStateee As DropDownList = CType(GVCity.Rows(rowIndex).Cells(1).FindControl("DDLState"), DropDownList)

        If CInt(dssubcity.CheckOtherPrimary(TxtCityy.Text, DDlStateee.SelectedValue, GVCity.DataKeys(rowIndex).Value)) > 0 Then
            LblMsg.Text = "City [ " & TxtCityy.Text & " ] Already Exists , Please Try Again ! "
        Else
            dssubcity.UpdateData(TxtCityy.Text, DDlStateee.SelectedValue, GVCity.DataKeys(rowIndex).Value)
            LblMsg.Text = "City Updated Successfully"
        End If

        GVCity.EditIndex = -1
        BindData()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "CMS", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If
        End If
    End Sub

    Protected Sub ddlcity_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlcity.SelectedIndexChanged



        If BtnSave.Text = "Update" Then
        Else
            LblMsg.Text = ""

            gvcity.DataSource = dssubcity.getalldata(ddlcity.SelectedItem.Value)
            gvcity.DataBind()
        End If

       
    End Sub
End Class