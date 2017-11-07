Imports betatesting.hhcTableAdapters
Imports System.IO
Imports betatesting.DataSetCareTableAdapters
Imports System.Data.SqlClient
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web.UI.WebControls

Public Class manage_therapatic
    Inherits System.Web.UI.Page
    Dim pageArray As Array
    Dim PageUrl As String
    Dim strsql As String
    Dim filetype As String
    Private i As Integer, j As Integer, k As Integer = 0
    Dim dstherapatic As New HtherapaticTableAdapter
    Dim dscountry As New COUNTRYTableAdapter
    Dim dsdivision As New HdivisionTableAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not IsPostBack Then
            lbBranch.DataSource = dsdivision.GetData
            lbBranch.DataTextField = "heterodivisoncode"
            lbBranch.DataValueField = "HdivisionID"
            lbBranch.DataBind()
            GVAddVideo.DataSource = dstherapatic.GetData
            GVAddVideo.DataBind()
        End If
       
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        If BtnSave.Text = "Update" Then

            If dstherapatic.checkotherprimary(txththeterocode.Text, txththetroname.Text, fileid.text) > 0 Then

                lblmsg.Text = "Therapatic Name Or Therapatic code Already Exits"
            Else
                dstherapatic.Update(txtHtherapaticDESC.Text, "Y", txththeterocode.Text, txththetroname.Text, CommonFunctions.GetListBoxSelectedItems(lbBranch), fileid.text)


                lblmsg.Text = "Therapatic" & txththetroname.Text & " Updated Succesfully"
                ClearAll()
            End If


        Else

            If dstherapatic.checkprimary(txththeterocode.Text, txththetroname.Text) > 0 Then

                lblmsg.Text = "Therapatic Name Or Therapatic code Already Exits"
            Else
                dstherapatic.Insert(txtHtherapaticDESC.Text, "Y", txththeterocode.Text, txththetroname.Text, CommonFunctions.GetListBoxSelectedItems(lbBranch))
                lblmsg.Text = "Therapatic" & txththetroname.Text & "added succesfully"
                ClearAll()
            End If

        End If
     
       

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
            Dim Dtaddvideo As DataTable = dstherapatic.GetDataByid(e.CommandArgument)
            Dim dtrow As DataRow

            If Dtaddvideo.Rows.Count > 0 Then
                dtrow = Dtaddvideo.Rows(0)
                SetListBoxSelectedItems(dtrow, lbBranch, "htdivisionid")
              

             

                If Not IsDBNull(dtrow("HtherapaticDESC")) Then
                    txtHtherapaticDESC.Text = dtrow("HtherapaticDESC")
                End If

                If Not IsDBNull(dtrow("htheterocode")) Then
                    txththeterocode.Text = dtrow("htheterocode")
                End If

                If Not IsDBNull(dtrow("hthetroname")) Then
                    txththetroname.Text = dtrow("hthetroname")
                End If
               
                'SetListBoxSelectedItems(dtrow, lbBranch, "Branch")

                fileId.Text = dtrow("HtherapaticID")
               
                btnSave.Text = "Update"

            End If
        ElseIf e.CommandName = "CmdDelete" Then
            dstherapatic.Delete(e.CommandArgument)
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
        GVAddVideo.DataSource = dstherapatic.GetData
        GVAddVideo.DataBind()
    End Sub
    Private Sub ClearAll()
        GVAddVideo.DataSource = dstherapatic.GetData
        GVAddVideo.DataBind()

        txtHtherapaticDESC.Text = ""
        txththeterocode.Text = ""
        txththetroname.Text = ""
        lbBranch.SelectedIndex = -1
    End Sub
End Class