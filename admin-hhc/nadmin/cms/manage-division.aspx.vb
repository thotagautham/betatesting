Imports betatesting.hhcTableAdapters
Public Class manage_division
    Inherits System.Web.UI.Page
    Dim dsdivison As New HdivisionTableAdapter
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub BtnSave_Click(sender As Object, e As EventArgs) Handles BtnSave.Click

        If dsdivison.checkprimary(txtdivisioncode.Text, txtdivisionname.Text) > 0 Then
            LblMsg.Text = "Divison code or division name already exits"
        Else
            dsdivison.Insert(txtdivisiondescripton.Text, txtdivisioncode.Text, txtdivisionname.Text, "Y")
            txtdivisiondescripton.Text = ""
            txtdivisioncode.Text = ""
            txtdivisionname.Text = ""
            LblMsg.Text = "Division added succesfully"

        End If

    End Sub


    Protected Sub GVCountries_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GVCountries.RowUpdating
        LblMsg.Text = ""

        Dim txtdivisioncode As TextBox = CType(GVCountries.Rows(e.RowIndex).Cells(1).FindControl("txtdivisioncode"), TextBox)
        Dim txtdivisionname As TextBox = CType(GVCountries.Rows(e.RowIndex).Cells(1).FindControl("txtdivisionname"), TextBox)

        If CInt(dsdivison.checkotheprimary(txtdivisioncode.Text, txtdivisionname.Text, GVCountries.DataKeys(e.RowIndex).Value)) > 0 Then
            e.Cancel = True
            LblMsg.Text = "Divison [ " & txtdivisioncode.Text & " ]   or [ " & txtdivisionname.Text & " ] Already Exists , Please Try Again ! "
        Else
            LblMsg.Text = "Division Updated Successfully"

        End If
    End Sub
End Class