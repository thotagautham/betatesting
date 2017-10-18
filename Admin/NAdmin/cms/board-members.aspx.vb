Imports System.Data.SqlClient
Imports betatesting.DataSetCareTableAdapters
Imports betatesting.newseventsTableAdapters
Imports System.Data

Imports System.Configuration
Imports System.Web.UI.HtmlControls
Public Class board_members
    Inherits System.Web.UI.Page
    Dim i, j As Integer
    Dim DsDoctors As New DOCTORSTableAdapter

    Dim DsSpec As New SPECIALIZATIONTableAdapter
    Dim dsmediastatus As New mediaTableAdapter
    Dim dspatentstatus As New videoTableAdapter

    Dim dsmedia As New mediaTableAdapter
    
    Dim branch As Array
   
    Dim strsql, DispStr As String
    Dim oracmd As SqlCommand
    Dim connString As String
    Public objConn As SqlConnection
    Dim objdata As SqlDataReader




    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim CF As New CommonFunctions
            'If CF.CheckPermissions(Session("Permissions"), "Doctors", Master, Session("Roles")) = False Then
            '    Response.Redirect("~/admin/nadmin/default.aspx")
            'End If

            DDLSpecialisation.DataSource = DsSpec.GetAllSPs()
            DDLSpecialisation.DataTextField = "SPECIALIZATIONNAME"
            DDLSpecialisation.DataValueField = "SPECIALIZATIONID"
            DDLSpecialisation.DataBind()

          

            BuildQuery()

        End If


    End Sub

    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBound
        For i = 0 To GridView1.Rows.Count - 1

            Dim CmdActive As LinkButton = CType(GridView1.Rows(i).Cells(33).FindControl("LnkBtnActiveStatus"), LinkButton)

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
            If GridView1.Rows(i).Cells(10).Text = "no_img.jpg" Then
                GridView1.Rows(i).Cells(10).Text = "Not Available"
            Else
                GridView1.Rows(i).Cells(10).Text = "Available"
            End If
            If Not GridView1.Rows(i).Cells(11).Text = "&nbsp;" Then
                GridView1.Rows(i).Cells(11).Text = "Y"
            Else
                GridView1.Rows(i).Cells(11).Text = "N"
            End If
            If GridView1.Rows(i).Cells(12).Text = "&nbsp;" Then
                GridView1.Rows(i).Cells(12).Text = "N"
            Else
                GridView1.Rows(i).Cells(12).Text = "Y"
            End If

            If GridView1.Rows(i).Cells(13).Text = "&nbsp;" Then
                GridView1.Rows(i).Cells(13).Text = "N"
            Else
                GridView1.Rows(i).Cells(13).Text = "Y"
            End If

            If GridView1.Rows(i).Cells(14).Text = "&nbsp;" Then
                GridView1.Rows(i).Cells(14).Text = "N"
            Else
                GridView1.Rows(i).Cells(14).Text = "Y"
            End If


            If GridView1.Rows(i).Cells(15).Text = "&nbsp;" Then
                GridView1.Rows(i).Cells(15).Text = "N"
            Else
                GridView1.Rows(i).Cells(15).Text = "Y"
            End If


            If GridView1.Rows(i).Cells(16).Text = "&nbsp;" Then
                GridView1.Rows(i).Cells(16).Text = "N"
            Else
                GridView1.Rows(i).Cells(16).Text = "Y"
            End If


            If GridView1.Rows(i).Cells(17).Text = "&nbsp;" Then
                GridView1.Rows(i).Cells(17).Text = "N"
            Else
                GridView1.Rows(i).Cells(17).Text = "Y"
            End If


            If GridView1.Rows(i).Cells(18).Text = "&nbsp;" Then
                GridView1.Rows(i).Cells(18).Text = "N"
            Else
                GridView1.Rows(i).Cells(18).Text = "Y"
            End If


            If GridView1.Rows(i).Cells(19).Text = "&nbsp;" Then
                GridView1.Rows(i).Cells(19).Text = "N"
            Else
                GridView1.Rows(i).Cells(19).Text = "Y"
            End If


            If GridView1.Rows(i).Cells(20).Text = "&nbsp;" Then
                GridView1.Rows(i).Cells(20).Text = "N"
            Else
                GridView1.Rows(i).Cells(20).Text = "Y"
            End If


            If GridView1.Rows(i).Cells(21).Text = "&nbsp;" Then
                GridView1.Rows(i).Cells(21).Text = "N"
            Else
                GridView1.Rows(i).Cells(21).Text = "Y"
            End If


            If GridView1.Rows(i).Cells(22).Text = "&nbsp;" Then
                GridView1.Rows(i).Cells(22).Text = "N"
            Else
                GridView1.Rows(i).Cells(22).Text = "Y"
            End If


            If GridView1.Rows(i).Cells(23).Text = "&nbsp;" Then
                GridView1.Rows(i).Cells(23).Text = "N"
            Else
                GridView1.Rows(i).Cells(23).Text = "Y"
            End If


            If GridView1.Rows(i).Cells(24).Text = "&nbsp;" Then
                GridView1.Rows(i).Cells(24).Text = "N"
            Else
                GridView1.Rows(i).Cells(24).Text = "Y"
            End If
            If GridView1.Rows(i).Cells(25).Text = "&nbsp;" Then
                GridView1.Rows(i).Cells(25).Text = "N"
            Else
                GridView1.Rows(i).Cells(25).Text = "Y"
            End If

            If GridView1.Rows(i).Cells(26).Text = "" Then

            Else
                Dim dsmedia As String
                Dim dsmediacount As String
                dsmedia = GridView1.Rows(i).Cells(26).Text

                dsmediacount = dsmediastatus.getcountofmediabydoctorid(dsmedia)

                If dsmediacount = "0" Then
                    GridView1.Rows(i).Cells(26).Text = "N"
                Else
                    GridView1.Rows(i).Cells(26).Text = "Y"

                End If
            End If

            If GridView1.Rows(i).Cells(27).Text = "" Then

            Else
                Dim dspatientexp As String
                Dim dspatientcount As String
                dspatientexp = GridView1.Rows(i).Cells(27).Text

                dspatientcount = dspatientstatus.getcountofvideobydoctorid(dspatientexp)

                If dspatientcount = "0" Then
                    GridView1.Rows(i).Cells(27).Text = "N"
                Else
                    GridView1.Rows(i).Cells(27).Text = "Y"

                End If
            End If

            If GridView1.Rows(i).Cells(28).Text = "" Then

            Else
                Dim dsinterview As String
                Dim dsinterviewcount As String
                dsinterview = GridView1.Rows(i).Cells(28).Text

                dsinterviewcount = dsinterviewstatus.getcountofvideobydoctorid(dsinterview)

                If dsinterviewcount = "0" Then
                    GridView1.Rows(i).Cells(28).Text = "N"
                Else
                    GridView1.Rows(i).Cells(28).Text = "Y"

                End If
            End If


            If GridView1.Rows(i).Cells(29).Text = "" Then

            Else
                Dim dsblog As String
                Dim dsblogcount As String
                dsblog = GridView1.Rows(i).Cells(29).Text

                dsblogcount = dsblogstatus.getcountbydoctorid(dsblog)

                If dsblogcount = "0" Then
                    GridView1.Rows(i).Cells(29).Text = "N"
                Else
                    GridView1.Rows(i).Cells(29).Text = "Y"

                End If
            End If


            If GridView1.Rows(i).Cells(30).Text = "" Then

            Else
                Dim dsblogeventshare As String
                Dim dsblogeventsharecount As String
                dsblogeventshare = GridView1.Rows(i).Cells(31).Text

                dsblogeventsharecount = dsblogeventsharestatus.getcountofmediabydoctorid(dsblogeventshare)

                If dsblogeventsharecount = "0" Then
                    GridView1.Rows(i).Cells(30).Text = "N"
                Else
                    GridView1.Rows(i).Cells(30).Text = "Y"

                End If
            End If


            If GridView1.Rows(i).Cells(31).Text = "" Then

            Else
                Dim dsevent As String
                Dim dseventcount As String
                dsevent = GridView1.Rows(i).Cells(31).Text

                dseventcount = dseventstatus.getcountofmediabydoctorid(dsevent)

                If dseventcount = "0" Then
                    GridView1.Rows(i).Cells(31).Text = "N"
                Else
                    GridView1.Rows(i).Cells(31).Text = "Y"

                End If
            End If



            'branch = Split(GridView1.Rows(i).Cells(5).Text.Replace("$", ""), ",")
            'For j = 0 To branch.Length - 1
            '    If j = 0 Then
            '        GridView1.Rows(i).Cells(5).Text = DsBranch.GetValueByID(branch(j))
            '    Else
            '        GridView1.Rows(i).Cells(5).Text = GridView1.Rows(i).Cells(5).Text & ", " & DsBranch.GetValueByID(branch(j))
            '    End If

            'Next


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
        connString = ConfigurationManager.ConnectionStrings("kfrcMSSQLConnString").ConnectionString
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