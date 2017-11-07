Imports betatesting.DataSetCareTableAdapters
Public Class manage_country1
    Inherits System.Web.UI.Page

    Dim DsCountries As New COUNTRYTableAdapter
    Dim i As Integer


    Protected Sub GVCountries_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVCountries.DataBound
        For i = 0 To GVCountries.Rows.Count - 1
            Dim CmdActive As LinkButton = CType(GVCountries.Rows(i).Cells(3).FindControl("LnkBtnActiveStatus"), LinkButton)

            If GVCountries.Rows(i).Cells(2).Text = "Y" Then
                CmdActive.Text = "De Activate"
                CmdActive.OnClientClick = "return confirm('Are You Sure, You Want To De Activate?');"
                GVCountries.Rows(i).Cells(2).Text = "Active"
            Else
                CmdActive.Text = "Activate"
                CmdActive.OnClientClick = "return confirm('Are You Sure, You Want To Activate?');"
                GVCountries.Rows(i).Cells(2).Text = "De Active"
            End If
            CmdActive.CommandArgument = i

        Next
    End Sub

    Protected Sub GVCountries_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVCountries.RowCommand
        If e.CommandName = "CmdActive" Then
            If GVCountries.Rows(e.CommandArgument).Cells(2).Text = "Active" Then
                DsCountries.UpdateActiveStatus("N", GVCountries.DataKeys(e.CommandArgument).Value)
            Else
                DsCountries.UpdateActiveStatus("Y", GVCountries.DataKeys(e.CommandArgument).Value)
            End If
            GVCountries.DataBind()

        End If

    End Sub

    Protected Sub BtnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSave.Click
        If CInt(DsCountries.CheckPrimary(TxtCountry.Text)) > 0 Then
            LblMsg.Text = "Country [ " & TxtCountry.Text & " ] Already Exists, Please Try Again !"
        Else

            DsCountries.Insert(TxtCountry.Text, "Y")
            LblMsg.Text = "Country [ " & TxtCountry.Text & " ] Added Successfully"
            GVCountries.DataBind()
            TxtCountry.Text = ""
        End If

    End Sub


    Protected Sub GVCountries_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GVCountries.RowUpdating
        LblMsg.Text = ""

        Dim TxtCountryy As TextBox = CType(GVCountries.Rows(e.RowIndex).Cells(1).FindControl("TxtCountry"), TextBox)
        If CInt(DsCountries.GetCountFromOtherIDs(TxtCountryy.Text, GVCountries.DataKeys(e.RowIndex).Value)) > 0 Then
            e.Cancel = True
            LblMsg.Text = "Country [ " & TxtCountryy.Text & " ] Already Exists , Please Try Again ! "
        Else
            LblMsg.Text = "Country Updated Successfully"
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        
        If Not IsPostBack Then

            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "CMS", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If
        End If
    End Sub
End Class