Imports betatesting.hhcTableAdapters

Public Class manage_products
    Inherits System.Web.UI.Page

    Dim dsproducts As New HproductslistTableAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            'Dim CF As New CommonFunctions
            'If CF.CheckPermissions(Session("Permissions"), "CMS", Master, Session("Roles")) = False Then
            '    Response.Redirect("~/admin/nadmin/default.aspx")
            'End If
        End If
    End Sub



    Protected Sub BtnSave_Click(sender As Object, e As EventArgs) Handles BtnSave.Click



        If dsproducts.getproductnamecount(txtproducts.Text) > 0 Then

            LblMsg.Text = "Product Name Already Exist"
        Else

            If dsproducts.getsapidcount(txtsapid.Text) > 0 Then

                LblMsg.Text = "Sap Code  Already Exist"
              
            Else



                dsproducts.Insert(txtproducts.Text, txtproductdescription.Text, txtsapid.Text)
                txtproducts.Text = ""
                txtproductdescription.Text = ""
                txtsapid.Text = ""
                LblMsg.Text = txtproducts.Text & "Added Succesfully"
            End If

        End If




    End Sub






    Protected Sub GVCountries_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GVCountries.RowUpdating
        LblMsg.Text = ""

        Dim txtproductname As TextBox = CType(GVCountries.Rows(e.RowIndex).Cells(1).FindControl("txtproductname"), TextBox)
        Dim txtsapid As TextBox = CType(GVCountries.Rows(e.RowIndex).Cells(1).FindControl("txtsapid"), TextBox)

        If CInt(dsproducts.getotherprimary(GVCountries.DataKeys(e.RowIndex).Value, txtproductname.Text, txtsapid.Text)) > 0 Then
            e.Cancel = True
            LblMsg.Text = "City [ " & txtproductname.Text & " ]   or [ " & txtsapid.Text & " ] Already Exists , Please Try Again ! "
        Else
            LblMsg.Text = "Product Updated Successfully"
        End If
    End Sub

End Class