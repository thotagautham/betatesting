Imports System.data
Imports System.Data.SqlClient
Imports betatesting.hhcTableAdapters
Imports betatesting.DataSetCareTableAdapters
Public Class states
    Inherits System.Web.UI.Page

    Dim dsstates As New STATETableAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        GetSelectedRecord()
        BindGrid()
    End Sub

    Private Sub BindGrid()
        GridView1.DataSource = dsstates.GetData
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

                        txtContactsSearch.Text = ViewState("SelectedContact")
                        rb.Checked = False
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
                        txtContactsSearch.Text = ViewState("SelectedContact")

                        rb.Checked = False

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

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        BindGrid()
        SetSelectedRecord()
    End Sub



    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand


        If e.CommandName = "cmdradio" Then
            SetSelectedRecord()
        End If

    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub

    Protected Sub RadioButton1_CheckedChanged(sender As Object, e As EventArgs)
        SetSelectedRecord()
    End Sub




    <System.Web.Script.Services.ScriptMethod(), _
  System.Web.Services.WebMethod()> _
    Public Shared Function SearchCustomers(ByVal prefixText As String, ByVal count As Integer) As List(Of String)
        Dim conn As SqlConnection = New SqlConnection
        conn.ConnectionString = ConfigurationManager _
         .ConnectionStrings("ConnString").ConnectionString
        Dim cmd As SqlCommand = New SqlCommand
        cmd.CommandText = "select STATENAME from state where" & _
        " statename like @SearchText + '%'"
        cmd.Parameters.AddWithValue("@SearchText", prefixText)
        cmd.Connection = conn
        conn.Open()
        Dim customers As List(Of String) = New List(Of String)
        Dim sdr As SqlDataReader = cmd.ExecuteReader
        While sdr.Read
            customers.Add(sdr("statename").ToString)
        End While
        conn.Close()
        Return customers
    End Function
End Class
