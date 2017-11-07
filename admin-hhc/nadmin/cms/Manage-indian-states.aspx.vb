Imports System.data
Imports System.Data.SqlClient
Imports betatesting.hhcTableAdapters
Imports betatesting.DataSetCareTableAdapters
Public Class Manage_indian_states
    Inherits System.Web.UI.Page
    Dim dsstates As New STATETableAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        GetSelectedRecord()
        BindGrid()
    End Sub

    Private Sub BindGrid()
        GridView1.DataSource = dsstates.GetAllData("1")
        GridView1.DataBind()
    End Sub

    Private Sub GetSelectedRecord()
        For i As Integer = 0 To GridView1.Rows.Count - 1
            Dim rb As RadioButton = DirectCast(GridView1.Rows(i).Cells(0) _
             .FindControl("RadioButton1"), RadioButton)
            If rb IsNot Nothing Then
                If rb.Checked Then
                    Dim hf As HiddenField = DirectCast(GridView1.Rows(i).Cells(0) _
                     .FindControl("HiddenField1"), HiddenField)
                    If hf IsNot Nothing Then
                        ViewState("SelectedContact") = hf.Value
                    End If

                    Exit For
                End If
            End If
        Next
    End Sub
    Private Sub SetSelectedRecord()
        For i As Integer = 0 To GridView1.Rows.Count - 1
            Dim rb As RadioButton = DirectCast(GridView1.Rows(i) _
                    .Cells(0).FindControl("RadioButton1"), RadioButton)
            If rb IsNot Nothing Then
                Dim hf As HiddenField = DirectCast(GridView1.Rows(i) _
                    .Cells(0).FindControl("HiddenField1"), HiddenField)
                If hf IsNot Nothing And ViewState("SelectedContact") IsNot Nothing Then
                    If hf.Value.Equals(ViewState("SelectedContact").ToString()) Then
                        rb.Checked = True
                        Exit For
                    End If
                End If
            End If
        Next
    End Sub
    Protected Sub OnPaging(ByVal sender As Object, ByVal e As GridViewPageEventArgs)
        GridView1.PageIndex = e.NewPageIndex
        GridView1.DataBind()
        SetSelectedRecord()
    End Sub
End Class
