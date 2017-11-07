Imports betatesting.avanaTableAdapters
Public Class manage_colour
    Inherits System.Web.UI.Page
    Dim dscolour As New ColoursTableAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub BtnSave_Click(sender As Object, e As EventArgs) Handles BtnSave.Click
        dscolour.Insert(txtcolours.Text)
    End Sub
End Class