Imports betatesting.hhcTableAdapters
Public Class _Default35
    Inherits System.Web.UI.Page
    Dim dsvendorprodcuts As New HvproductslistTableAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            LblMsg.Text = Session("HstockistdetailsID")

            GVPrintNews.DataSource = dsvendorprodcuts.GetDataByhvstockistid(Session("HstockistdetailsID"))
            GVPrintNews.DataBind()

            If IsNothing(Session("HstockistdetailsID")) Then
                Response.Redirect("~/admin-stockist/sign-in/", True)
            End If
        End If
    End Sub

    Protected Sub BtnSave_Click(sender As Object, e As EventArgs) Handles BtnSave.Click
        If IsNothing(Session("HstockistdetailsID")) Then
            Response.Redirect("~/admin-stockist/sign-in/", True)
        End If

        If BtnSave.Text = "Update" Then
            dsvendorprodcuts.updatestockistproductdata(txtproductname.Text, txtproductdescription.Text, txtcompanycode.Text, fileId.Text)
        Else
            dsvendorprodcuts.Insert(txtproductname.Text, txtproductdescription.Text, txtcompanycode.Text, "Need To Be Updated", Session("HstockistdetailsID"))
        End If
        ClearAll()
        GVPrintNews.DataSource = dsvendorprodcuts.GetDataByhvstockistid(Session("HstockistdetailsID"))
        GVPrintNews.DataBind()
    End Sub


    Private Sub ClearAll()
        txtproductname.Text = ""
        txtproductdescription.Text = ""
        txtcompanycode.Text = ""



    End Sub

    Protected Sub GVPrintNews_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVPrintNews.PageIndexChanging
        GVPrintNews.PageIndex = e.NewPageIndex

        GVPrintNews.DataSource = dsvendorprodcuts.GetDataByhvstockistid(Session("HstockistdetailsID"))
        GVPrintNews.DataBind()
    End Sub

    Protected Sub GVPrintNews_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVPrintNews.RowCommand
        If e.CommandName = "CmdEdit" Then
            ClearAll()
            Dim DtImages As DataTable = dsvendorprodcuts.GetDataByid(e.CommandArgument)
            Dim dtrow As DataRow

            If DtImages.Rows.Count > 0 Then
                dtrow = DtImages.Rows(0)


                txtproductname.Text = dtrow("HvproductslistNAME")
                txtproductdescription.Text = dtrow("HvproductslistDESC")
                txtcompanycode.Text = dtrow("Hvproductslistcompanyid")

                btnsave.Text = "Update"

                'ViewState("imageurl") = dtrow("ImageURL")
                fileId.Text = dtrow("HvproductslistID")


            End If
        ElseIf e.CommandName = "CmdDelete" Then
            dsvendorprodcuts.Delete(e.CommandArgument)
            LblMsg.Text = " Deleted Successfully"
        End If

        GVPrintNews.DataSource = dsvendorprodcuts.GetDataByhvstockistid(Session("HstockistdetailsID"))
        GVPrintNews.DataBind()
    End Sub
End Class
