Imports betatesting.DataSetCareTableAdapters
Imports betatesting.OurHospitalsTableAdapters
Imports System.Data.SqlClient
Imports System.IO
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web.UI.WebControls
Public Class _default3
    Inherits System.Web.UI.Page


    Dim dsvendorspecilisation As New VENDORSPECIALIZATIONTableAdapter
    Dim dsvendortype As New VENDORTYPESTableAdapter
    Dim pageArray As Array
    Dim PageUrl As String
    Dim strsql As String
    Dim oracmd As SqlCommand
    Dim connString As String
    Dim fui
    Private i As Integer, j As Integer, k As Integer = 0


    Public objConn As SqlConnection

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            GVVENDORTYPES.DataSource = dsvendorspecilisation.GetData()
            GVVENDORTYPES.DataBind()


            Lbvendortypes.DataSource = dsvendortype.GetActiveVendorTypes()
            Lbvendortypes.DataTextField = "VENDORTYPENAME"
            Lbvendortypes.DataValueField = "VENDORTYPEID"
            Lbvendortypes.DataBind()

            Lbvendortypes.Items.Insert(0, "All vendor Types")
            Lbvendortypes.Items(0).Value = 0
            BindData()
            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "Vendors", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If
            

        End If

    End Sub
    Private Sub BindData()
        GVVENDORTYPES.DataSource = dsvendorspecilisation.GetData()
        GVVENDORTYPES.DataBind()
    End Sub



    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click





        If (btnSave.Text = "Update") Then
            dsvendorspecilisation.Update(txtname.Text, txtdescription.Text, txtprocedures.Text, "Y", GetListBoxSelectedItems(Lbvendortypes), fileId.Text)
            btnSave.Text = "Save"
        ElseIf (txtname.Text <> "") Then
            dsvendorspecilisation.Insert(txtname.Text, txtdescription.Text, txtprocedures.Text, "Y", GetListBoxSelectedItems(Lbvendortypes))
            LblMsg.Text = "Vendor Type Added Successfully "

        Else
            LblMsg.Text = "Please Enter Name "

        End If
       

        ClearAll()
        BindData()
    End Sub
    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        ClearAll()
    End Sub
    Private Sub ClearAll()
        txtdescription.Text = ""

        txtprocedures.Text = ""
        txtname.Text = ""


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
    Protected Sub GVAddVideo_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GVVENDORTYPES.PageIndexChanging
        GVVENDORTYPES.PageIndex = e.NewPageIndex
        If LblSearchStr.Text = "" Then
            BindData()
        Else
            getData(LblSearchStr.Text)
        End If
    End Sub
    Protected Sub GVAddVideo_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles GVVENDORTYPES.RowCommand
        If e.CommandName = "CmdEdit" Then
            ClearAll()
            Dim Dtvendortypes As DataTable = dsvendorspecilisation.GetDataById(e.CommandArgument)
            Dim dtrow As DataRow

            If Dtvendortypes.Rows.Count > 0 Then
                dtrow = Dtvendortypes.Rows(0)

                SetListBoxSelectedItems(dtrow, Lbvendortypes, "Vendortype")
                txtdescription.Text = dtrow("SPECIALIZATIONDESC")

                txtprocedures.Text = dtrow("Procedures")
                txtname.Text = dtrow("SPECIALIZATIONNAME")

                fileId.Text = dtrow("SPECIALIZATIONID")

                btnSave.Text = "Update"

            End If
        ElseIf e.CommandName = "CmdDelete" Then
            dsvendorspecilisation.Delete(e.CommandArgument)
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
        Dim strsql1 = "select distinct * from VENDORSPECIALIZATION "
        strsql = ""


        If (txtname.Text <> "") Then
            If strsql = "" Then
                strsql = " where Lower(SPECIALIZATIONNAME) like '%" & txtname.Text.ToLower() & "%'"
            Else
                strsql = strsql & " or Lower(SPECIALIZATIONNAME) like '%" + txtname.Text.ToLower() & "%'"
            End If
        End If
        If (Lbvendortypes.GetSelectedIndices.Count > 0) Then
            strsql = GetListBoxSelectedItemsQry(Lbvendortypes, "Vendortype", strsql)
        End If


        strsql = strsql1 & strsql & " order by SPECIALIZATIONID "
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
            GVVENDORTYPES.DataSource = myDataSet
            GVVENDORTYPES.DataBind()
            count = 1
        End If
        oracmd = Nothing
        closeConnection()
    End Sub
    Protected Sub GVAddVideo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GVVENDORTYPES.SelectedIndexChanged

    End Sub
End Class

