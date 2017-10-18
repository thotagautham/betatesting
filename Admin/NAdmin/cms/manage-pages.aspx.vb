Imports betatesting.DataSetCareTableAdapters
Imports betatesting.DoctorsTableAdapters
Imports System.Data.SqlClient
Imports System.IO

Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web.UI.WebControls
Imports betatesting.cmsTableAdapters
Public Class manage_pages
    Inherits System.Web.UI.Page
    Dim dsaddvideo As New kfrckimsPagesTableAdapter

    Dim pageArray As Array
    Dim PageUrl As String
    Dim strsql As String
    Dim filetype As String
    Dim dsinterview As New kfrckimsPagesTableAdapter

    Dim oracmd As SqlCommand
    Dim connString As String
    Dim pdfname As String

    Private i As Integer, j As Integer, k As Integer = 0

    Public objConn As SqlConnection


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim CF As New CommonFunctions
            'If CF.CheckPermissions(Session("Permissions"), "Doctors", Master, Session("Roles")) = False Then
            '    Response.Redirect("~/admin/nadmin/default.aspx")
            'End If

            GVAddVideo.DataSource = dsaddvideo.GetData()
            GVAddVideo.DataBind()

            ''Fill Department


            BindData()
        End If
    End Sub
    Private Sub BindData()
        GVAddVideo.DataSource = dsaddvideo.GetData()
        GVAddVideo.DataBind()
    End Sub



    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        If CInt(dsaddvideo.checkprimarycount(txtpageurl.Text)) > 0 Then
            LblMsg.Text = "Page With Url [ " & txtpageurl.Text & " ] Already Exists"
            Exit Sub

        End If
        If (btnSave.Text = "Update") Then

            dsaddvideo.Update(txtpageurl.Text, txtpageurl.Text, txtpageurl.Text, txtpagetittle.Text, txtmetatags.Text, txtkeywords.Text, txtpagedes.Text, txtbodylefttop.Value, txtbodyrighttop.Value, txtbodycenter.Value, txtbodybottom.Value, fileId.Text)
            btnSave.Text = "Save"
        Else


            dsaddvideo.Insert(txtpageurl.Text, txtpageurl.Text, txtpageurl.Text, txtpagetittle.Text, txtmetatags.Text, txtkeywords.Text, txtpagedes.Text, txtbodylefttop.Value, txtbodyrighttop.Value, txtbodycenter.Value, txtbodybottom.Value)
            LblMsg.Text = "Page Added Successfully "


        End If
        ClearAll()
        BindData()
    End Sub
    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        ClearAll()
    End Sub
    Private Sub ClearAll()


        btnSave.Text = "Save"
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
    Protected Sub GVAddVideo_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GVAddVideo.PageIndexChanging
        GVAddVideo.PageIndex = e.NewPageIndex
        If LblSearchStr.Text = "" Then
            BindData()
        Else
            getData(LblSearchStr.Text)
        End If
    End Sub
    Protected Sub GVAddVideo_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GVAddVideo.RowCommand
        If e.CommandName = "CmdEdit" Then
            ClearAll()
            Dim Dtaddvideo As DataTable = dsinterview.GetDataByid(e.CommandArgument)
            Dim dtrow As DataRow

            If Dtaddvideo.Rows.Count > 0 Then
                dtrow = Dtaddvideo.Rows(0)

                txtpageurl.Text = dtrow("PageUrl")


                txtpagetittle.Text = dtrow("pagetittle")
                txtmetatags.Text = dtrow("pagemetatags")

                txtkeywords.Text = dtrow("pagekeywords")
                txtpagedes.Text = dtrow("pagedescription")
                txtbodylefttop.Value = dtrow("contenttopleft")
                If (txtbodyrighttop.Value <> "") Then
                    txtbodyrighttop.Value = dtrow("contenttopright")

                End If

                If (txtbodycenter.Value <> "") Then
                    txtbodycenter.Value = dtrow("contentcenter")

                End If

                If (txtbodybottom.Value <> "") Then
                    txtbodybottom.Value = dtrow("contentdown")

                End If



                fileId.Text = dtrow("kimsPageId")


                btnSave.Text = "Update"

            End If
        ElseIf e.CommandName = "CmdDelete" Then
            dsaddvideo.Delete(e.CommandArgument)
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



    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        BuildQuery()
    End Sub

    Private Sub BuildQuery()
        Dim strsql1 = "select distinct * from kimsPages"
        strsql = ""


        strsql = strsql1 & strsql & " order by kimsPageId "
        LblSearchStr.Text = strsql
        getData(strsql)
    End Sub
    Public Sub openConnection()
        connString = ConfigurationManager.ConnectionStrings("MSSQLConnString").ConnectionString
        objConn = New SqlConnection(connString)
        objConn.Open()
    End Sub
    Public Sub closeConnection()
        objConn.Close()
        objConn = Nothing
    End Sub
    Private Sub getData(ByVal strsql As String)
        Dim count As Integer
        LblSearchStr.Text = strsql
        openConnection()
        oracmd = New SqlCommand(strsql, objConn)

        'create a new DataAdapter
        Dim myAdapter As New SqlDataAdapter

        'Assign the command to the Adapter so it knows what command to send when Fill() is called
        myAdapter.SelectCommand = oracmd

        'Create a DataSet object - any other constructors?
        Dim myDataSet As New Data.DataSet

        'Use the DataAdapter to fill the DataSet
        myAdapter.Fill(myDataSet)
        count = 0

        If myDataSet.Tables(0).Rows.Count > 0 Then
            GVAddVideo.DataSource = myDataSet
            GVAddVideo.DataBind()
            count = 1
        End If
        oracmd = Nothing
        closeConnection()
    End Sub
    Protected Sub GVAddVideo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVAddVideo.SelectedIndexChanged

    End Sub
End Class