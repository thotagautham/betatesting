Imports betatesting.DataSetCareTableAdapters
Imports System.Data.SqlClient
Partial Class Admin_NAdmin_Doctors_ViewDoctors
    Inherits System.Web.UI.Page
    Dim i, j As Integer
    Dim DsDoctors As New DOCTORSTableAdapter
    Dim DsBranch As New BRANCH1TableAdapter
    Dim DsSpec As New SPECIALIZATIONTableAdapter

    Dim branch As Array

    Dim strsql, DispStr As String
    Dim oracmd As SqlCommand
    Dim connString As String
    Public objConn As SqlConnection
    Dim objdata As SqlDataReader


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "Doctors", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If

            DDLSpecialisation.DataSource = DsSpec.GetAllSPs()
            DDLSpecialisation.DataTextField = "SPECIALIZATIONNAME"
            DDLSpecialisation.DataValueField = "SPECIALIZATIONID"
            DDLSpecialisation.DataBind()

            DDLBranch.DataSource = DsBranch.GetAllData(0)
            DDLBranch.DataTextField = "BRANCHNAME"
            DDLBranch.DataValueField = "BRANCHID"
            DDLBranch.DataBind()

            BuildQuery()

        End If


    End Sub

    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBound
        For i = 0 To GridView1.Rows.Count - 1
            
            Dim CmdActive As LinkButton = CType(GridView1.Rows(i).Cells(10).FindControl("LnkBtnActiveStatus"), LinkButton)

            If GridView1.Rows(i).Cells(9).Text = "Y" Then
                CmdActive.Text = "De Activate"
                CmdActive.OnClientClick = "return confirm('Are You Sure, You Want To De Activate?');"
                GridView1.Rows(i).Cells(9).Text = "Active"
            Else
                CmdActive.Text = "Activate"
                CmdActive.OnClientClick = "return confirm('Are You Sure, You Want To Activate?');"
                GridView1.Rows(i).Cells(9).Text = "De Active"
            End If
            CmdActive.CommandArgument = i

            branch = Split(GridView1.Rows(i).Cells(5).Text.Replace("$", ""), ",")
            For j = 0 To branch.Length - 1
                If j = 0 Then
                    GridView1.Rows(i).Cells(5).Text = DsBranch.GetValueByID(branch(j))
                Else
                    GridView1.Rows(i).Cells(5).Text = GridView1.Rows(i).Cells(5).Text & ", " & DsBranch.GetValueByID(branch(j))
                End If

            Next


            'GridView1.Rows(i).Cells(6).Text = DsSpec.GetValueByID(GridView1.Rows(i).Cells(6).Text)

        Next
    End Sub

    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        BuildQuery()
    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "CmdActive" Then
            If GridView1.Rows(e.CommandArgument).Cells(9).Text = "Active" Then
                DsDoctors.UpdateActiveStatus("N", GridView1.DataKeys(e.CommandArgument).Value)
            Else
                DsDoctors.UpdateActiveStatus("Y", GridView1.DataKeys(e.CommandArgument).Value)
            End If
        ElseIf e.CommandName = "CmdDelete" Then
            DsDoctors.Delete(e.CommandArgument)
        End If
        BuildQuery()
    End Sub

    Protected Sub BtnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSearch.Click
        BuildQuery()
    End Sub
    Private Sub BuildQuery()

        strsql = "select * from Doctors where 1=1"

        If Trim(TxtDoctorName.Text) <> "" Then
            strsql = strsql & " and name like '%" & Trim(TxtDoctorName.Text) & "%'"
        End If

        If DDLBranch.SelectedIndex <> 0 Then
            strsql = strsql & " and BRANCH  Like '%$" & DDLBranch.SelectedValue & "$%'"
        End If

        If DDLSpecialisation.SelectedIndex <> 0 Then
            strsql = strsql & " and SPECIALISATION Like '%$" & DDLSpecialisation.SelectedItem.Value & "$%'"
        End If

        strsql = strsql & " order by name "

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

        GridView1.DataSource = myDataSet
        GridView1.DataBind()

        oracmd = Nothing
        closeConnection()
    End Sub

End Class
