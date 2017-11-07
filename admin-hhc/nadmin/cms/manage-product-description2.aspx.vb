Imports betatesting.hhcTableAdapters
Imports System.IO
Imports betatesting.DataSetCareTableAdapters
Imports System.Data.SqlClient
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web.UI.WebControls
Public Class manage_product_description
    Inherits System.Web.UI.Page
    Dim pageArray As Array
    Dim PageUrl As String
    Dim strsql As String
    Dim filetype As String
    Private j As Integer, k As Integer = 0
    Dim i As Integer
   
    Dim dspdes As New HproductslistdescriptionTableAdapter
    Dim dsdivison As New HdivisionTableAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lbBranch.DataSource = dsdivison.GetData
        lbBranch.DataTextField = "heterodivisoncode"
        lbBranch.DataValueField = "HdivisionID"
        lbBranch.DataBind()
        GVAddVideo.DataSource = dspdes.GetDataByproductid(Request("heteroid"))
        GVAddVideo.DataBind()

    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles BtnSave.Click

        Dim branch As String
        branch = CommonFunctions.GetListBoxSelectedItems(lbBranch)


        dspdes.Insert(TxtHproductslistdescriptionDESC.Text, "Y", Request("heteroid"), txthpdquantityperpack.Text, txthpdquantityperstrip.Text, txthpdratevalidform.Text, txthpdpricetoretailer.Text, txthpdmrp.Text, txthpdstandardrate.Text, txthpdpricetostockist.Text, txthpdbrandname.Text, ddlhdpcategoryname.SelectedItem.Value, branch, txthdpmanfacturename.Text)
        GVAddVideo.DataSource = dspdes.GetDataByproductid(Request("heteroid"))
        GVAddVideo.DataBind()
    End Sub
    Private Function GetListBoxSelectedItems(lb As ListBox) As String
        Dim selectedItems As String
        selectedItems = ""
        For i = 0 To lb.Items.Count - 1
            If lb.Items(i).Selected = True Then
                If (selectedItems = "") Then
                    selectedItems = "$" & lb.Items(i).Value & "$"
                Else
                    selectedItems = selectedItems & ",$" & lb.Items(i).Value & "$"
                End If
            End If
        Next i

        Return selectedItems
    End Function
    Private Function GetListBoxSelectedItemsQry(lb As ListBox, lbtype As String, setstrsql As String) As String

        For i = 0 To lb.Items.Count - 1
            If lb.Items(i).Selected = True Then
                If setstrsql = "" Then
                    setstrsql = setstrsql & " where " & lbtype & " like '%$" & lb.Items(i).Value & "$%'"
                Else
                    setstrsql = setstrsql & " or " & lbtype & " like '%$" & lb.Items(i).Value & "$%'"
                End If
            End If
        Next i

        Return setstrsql
    End Function
    Protected Sub GVAddVideo_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GVAddVideo.RowCommand
        If e.CommandName = "CmdEdit" Then
            ClearAll()
            Dim Dtaddvideo As DataTable = dspdes.GetDataByid(e.CommandArgument)
            Dim dtrow As DataRow

            If Dtaddvideo.Rows.Count > 0 Then
                dtrow = Dtaddvideo.Rows(0)
                SetListBoxSelectedItems(dtrow, lbBranch, "hpddivisionname")


               
               


                If Not IsDBNull(dtrow("HtherapaticDESC")) Then
                    TxtHproductslistdescriptionDESC.Text = dtrow("HtherapaticDESC")
                End If

                If Not IsDBNull(dtrow("hpdquantityperpack")) Then
                    txthpdquantityperpack.Text = dtrow("hpdquantityperpack")
                End If

                If Not IsDBNull(dtrow("hpdquantityperstrip")) Then
                    txthpdquantityperstrip.Text = dtrow("hpdquantityperstrip")
                End If



               
                If Not IsDBNull(dtrow("hpdratevalidform")) Then
                    txthpdratevalidform.Text = dtrow("hpdratevalidform")
                End If

                If Not IsDBNull(dtrow("hpdpricetoretailer")) Then
                    txthpdpricetoretailer.Text = dtrow("hpdpricetoretailer")
                End If

                If Not IsDBNull(dtrow("hpdmrp")) Then
                    txthpdmrp.Text = dtrow("hpdmrp")
                End If



             


                If Not IsDBNull(dtrow("hpdstandardrate")) Then
                    txthpdstandardrate.Text = dtrow("hpdstandardrate")
                End If

                If Not IsDBNull(dtrow("hpdpricetostockist")) Then
                    txthpdpricetostockist.Text = dtrow("hpdpricetostockist")
                End If

                If Not IsDBNull(dtrow("hpdbrandname")) Then
                    txthpdbrandname.Text = dtrow("hpdbrandname")
                End If

                If Not IsDBNull(dtrow("hdpmanfacturename")) Then
                    txthdpmanfacturename.Text = dtrow("hdpmanfacturename")
                End If

                Dim product As String
                If Not IsDBNull(dtrow("hdpcategoryname")) Then


                    product = dtrow("hdpcategoryname")

                    If product = "" Then

                        ddlhdpcategoryname.SelectedIndex = -1
                    Else
                        ddlhdpcategoryname.ClearSelection()
                        ddlhdpcategoryname.Items.FindByValue(dtrow("hdpcategoryname")).Selected = True
                        'ddlhdpcategoryname.Text = "Product no :" & product & "and "
                    End If
                Else
                    ddlhdpcategoryname.SelectedIndex = -1

                End If




                ' SetListBoxSelectedItems(dtrow, lbBranch, "Branch")

                fileId.Text = dtrow("HproductslistdescriptionID")

                btnSave.Text = "Update"

            End If
        ElseIf e.CommandName = "CmdDelete" Then
            dspdes.Delete(e.CommandArgument)
            BindData()
        End If
    End Sub
    Private Sub SetListBoxSelectedItems(dr As DataRow, lb As ListBox, section As String)
        If Not IsDBNull(dr(section)) Then
            pageArray = Split(dr(section).Replace("$", ""), ",")
            For i = 0 To UBound(pageArray)
                If Not lb.Items.FindByValue(pageArray(i)) Is Nothing Then
                    lb.Items.FindByValue(pageArray(i)).Selected = True
                End If
            Next
        End If
    End Sub

    Private Sub binddata()
        GVAddVideo.DataSource = dspdes.GetData
        GVAddVideo.DataBind()
    End Sub
    Private Sub ClearAll()
        GVAddVideo.DataSource = dspdes.GetData
        GVAddVideo.DataBind()

        lbBranch.SelectedIndex = -1

        TxtHproductslistdescriptionDESC.Text = ""
        txthpdquantityperpack.Text = ""
        txthpdquantityperstrip.Text = ""
        txthpdratevalidform.Text = ""
        txthpdpricetoretailer.Text = ""
        txthpdmrp.Text = ""
        txthpdstandardrate.Text = ""
        txthpdpricetostockist.Text = ""
        txthpdbrandname.Text = ""
        ddlhdpcategoryname.SelectedIndex = -1
        txthdpmanfacturename.Text = ""

    End Sub
End Class