Imports betatesting.DataSetCareTableAdapters
Imports betatesting.WebAdminsTableAdapters
Public Class event_active
    Inherits System.Web.UI.Page
    Dim dsdata As New ChecnnaidataliveTableAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            gvprofile.DataSource = dsdata.GetData(("Y"))
            gvprofile.DataBind()
        End If
    End Sub
    Protected Sub gvprofile_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvprofile.DataBound
        For i = 0 To gvprofile.Rows.Count - 1

            Dim CmdActive As LinkButton = CType(gvprofile.Rows(i).Cells(4).FindControl("LnkBtnActiveStatus"), LinkButton)

            If gvprofile.Rows(i).Cells(4).Text = "Y" Then
                CmdActive.Text = "De Activate"
                CmdActive.OnClientClick = "return confirm('Are You Sure, You Want To De Activate?');"
                gvprofile.Rows(i).Cells(4).Text = "Active"
            Else
                CmdActive.Text = "Activate"
                CmdActive.OnClientClick = "return confirm('Are You Sure, You Want To Activate?');"
                gvprofile.Rows(i).Cells(4).Text = "De Active"
            End If
            CmdActive.CommandArgument = i
        Next
    End Sub
    Protected Sub gvprofile_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvprofile.RowCommand
        If e.CommandName = "CmdActive" Then

            If gvprofile.Rows(e.CommandArgument).Cells(5).Text = "Active" Then
                dsdata.UpdateQuery("Y", gvprofile.DataKeys(e.CommandArgument).Value)
            Else
                dsdata.UpdateQuery("N", gvprofile.DataKeys(e.CommandArgument).Value)
            End If

        End If
        BuildQuery()
       

    End Sub

    Private Sub BuildQuery()

        gvprofile.DataSource = dsdata.GetData(("Y"))
        gvprofile.DataBind()
    End Sub
End Class