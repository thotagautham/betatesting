Imports betatesting.hhcTableAdapters
Public Class manage_vendor_products
    Inherits System.Web.UI.Page
    Dim dsvendorprodcuts As New HvproductslistTableAdapter
    Dim dsprodcuts As New HproductslistTableAdapter
    Dim dsstockits As New HstockistdetailsnewTableAdapter
    Dim stockist, product As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            ddlproducts.DataSource = dsprodcuts.GetData
            ddlproducts.DataTextField = "HproductslistNAME"
            ddlproducts.DataValueField = "HproductslistID"
            ddlproducts.DataBind()
            ddlstockist.DataSource = dsstockits.GetData
            ddlstockist.DataTextField = "hssapcustomerid"
            ddlstockist.DataValueField = "HstockistdetailsID"
            ddlstockist.DataBind()
            GVPrintNews.DataSource = dsvendorprodcuts.GetData
            GVPrintNews.DataBind()

           
        End If
    End Sub
    Protected Sub BtnSave_Click(sender As Object, e As EventArgs) Handles BtnSave.Click
        'If IsNothing(Session("HstockistdetailsID")) Then
        '    Response.Redirect("~/admin-stockist/sign-in/", True)
        'End If

        If BtnSave.Text = "Update" Then
            If dsvendorprodcuts.getotherprimary(txtproductname.Text, txtcompanycode.Text, ddlstockist.SelectedItem.Value, fileId.Text) > 0 Then

                LblMsg.Text = "Vendor Product :" & txtproductname.Text & "or vendor Product Code" & txtcompanycode.Text & "already added for Stockist" & ddlstockist.SelectedItem.Text
            Else
                dsvendorprodcuts.Update(txtproductname.Text, txtproductdescription.Text, txtcompanycode.Text, ddlproducts.SelectedItem.Value, stockist, fileId.Text)
                BtnSave.Text = "Save"
                ddlstockist.Visible = True
            End If
            
        Else

            If dsvendorprodcuts.getprimarycount(txtproductname.Text, txtcompanycode.Text, ddlstockist.SelectedItem.Value) > 0 Then

                LblMsg.Text = "Vendor Product :" & txtproductname.Text & "or vendor Product Code" & txtcompanycode.Text & "already added for Stockist" & ddlstockist.SelectedItem.Text
            Else
                dsvendorprodcuts.Insert(txtproductname.Text, txtproductdescription.Text, txtcompanycode.Text, ddlproducts.SelectedItem.Value, ddlstockist.SelectedItem.Value)
            End If

        End If
        ClearAll()
        GVPrintNews.DataSource = dsvendorprodcuts.GetData
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





                If Not IsDBNull(dtrow("Hproductslistcompanyid")) Then


                    product = dtrow("Hproductslistcompanyid")

                    If product = "" Then

                        ddlproducts.SelectedIndex = -1
                    Else
                        ddlproducts.ClearSelection()
                        ddlproducts.Items.FindByValue(dtrow("Hproductslistcompanyid")).Selected = True
                        LblMsg.Text = "Product no :" & product & "and "
                    End If
                Else
                    ddlproducts.SelectedIndex = -1

                End If
                'ddlproducts.SelectedItem.Value = dtrow("Hproductslistcompanyid")
                'ddlstockist.SelectedItem.Value = dtrow("hvstockistid")


                If Not IsDBNull(dtrow("hvstockistid")) Then


                    stockist = dtrow("hvstockistid")

                    If stockist = "" Then

                        ddlstockist.SelectedIndex = -1
                    Else
                        ddlstockist.ClearSelection()
                        ddlstockist.Items.FindByValue(dtrow("hvstockistid")).Selected = True
                        LblMsg.Text = LblMsg.Text & "Stockist no :" & stockist & "Edit in Process"
                    End If
                Else
                    ddlstockist.SelectedIndex = -1

                End If

                ddlstockist.Visible = False



                btnsave.Text = "Update"

                'ViewState("imageurl") = dtrow("ImageURL")
                fileId.Text = dtrow("HvproductslistID")


            End If
        ElseIf e.CommandName = "CmdDelete" Then
            dsvendorprodcuts.Delete(e.CommandArgument)
            LblMsg.Text = "Catlog Image Deleted Successfully"
        End If

        GVPrintNews.DataSource = dsvendorprodcuts.GetData
        GVPrintNews.DataBind()
    End Sub
End Class
