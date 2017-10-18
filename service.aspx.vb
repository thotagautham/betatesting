Imports betatesting.DataSetCareTableAdapters
Imports betatesting.WebAdminsTableAdapters
Imports System.Data.SqlClient
Public Class service
    Inherits System.Web.UI.Page
    Dim dssub As New categorysubTableAdapter
    Dim ObjCPIP As New ControlPanelIPStatsTableAdapter
    Dim dscatreee As New categoryTableAdapter
    Dim dsarea As New ChecnnaiareaTableAdapter
    Dim dsdata As New ChecnnaidataTableAdapter
    Dim catrid As String
    Dim dscarea As String
    Dim dscareaid As String
    Dim strsql As String
    Dim oracmd As SqlCommand
    Dim connString As String
    Public objConn As SqlConnection
    Dim spArr, deptArr, doctorArr, institutesArr, qualArr, firstbranchArr, brancharr, SecondBranchTimmingsArr As Array

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then


            LblMsg.Text = (Request("id"))

            catrid = dscatreee.getidbyname(Request("id"))

            repimage.DataSource = dsdata.GetDataBycategory(catrid)
            repimage.DataBind()



            ddlarea.DataSource = dsarea.GetData
            ddlarea.DataTextField = "ChecnnaiareaNAME"
            ddlarea.DataValueField = "ChecnnaiareaID"
            ddlarea.DataBind()

            ObjCPIP.Insert(Request.ServerVariables("REMOTE_ADDR"), Now(), Now(), "chennai/service")
        End If
    End Sub
    'Private Sub BuildQuery()
    '    'strsql = "select distinct *,(case navigationpathurl when '' then 'none' else 'inline' end) as displayhref,  (case navigationpathurl when '' then 'inline' else 'none' end) as displayimage from BannerImages where REPLACE(Lower(pageurl),'www.','') like '%$" + Request.Url.ToString().ToLower().Replace("www.", "") + "$%'"
    '    strsql = "select distinct * from Checnnaidata"
    '    Dim serviceid() As String
    '    If (Request.Url.ToString().ToLower().Contains("service")) Then


    '        Dim category As String
    '        category = dscatreee.getidbyname(Request("id"))

    '        If (category <> "") Then
    '            strsql = strsql + " where category like '%$" + category + "$%'  or category like '%$0$%' "
    '        End If
    '    End If

    '    getData(strsql)

    'End Sub
    'Public Sub openConnection()
    '    connString = ConfigurationManager.ConnectionStrings("MSSQLConnString").ConnectionString
    '    objConn = New SqlConnection(connString)
    '    objConn.Open()
    'End Sub
    'Public Sub closeConnection()
    '    objConn.Close()
    '    objConn = Nothing
    'End Sub
    'Private Function getData(ByVal strsql As String)
    '    Dim count As Integer
    '    'Label1.Text = strsql
    '    openConnection()
    '    oracmd = New SqlCommand(strsql, objConn)

    '    'create a new DataAdapter
    '    Dim myAdapter As New SqlDataAdapter

    '    'Assign the command to the Adapter so it knows what command to send when Fill() is called
    '    myAdapter.SelectCommand = oracmd

    '    'Create a DataSet object - any other constructors?
    '    Dim myDataSet As New Data.DataSet

    '    'Use the DataAdapter to fill the DataSet
    '    myAdapter.Fill(myDataSet)
    '    count = 0

    '    If myDataSet.Tables(0).Rows.Count > 0 Then
    '        repimage.DataSource = myDataSet
    '        repimage.DataBind()
    '    End If
    '    oracmd = Nothing
    '    closeConnection()
    'End Function
   
   

    
   
    Protected Sub ddlarea_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlarea.SelectedIndexChanged

        If ddlarea.SelectedIndex = "0" Then
            catrid = dscatreee.getidbyname(Request("id"))

            repimage.DataSource = dsdata.GetDataBycategory(catrid)
            repimage.DataBind()
        Else
            BindDoctors(ddlarea.SelectedItem.Value)
        End If


    End Sub

    Private Sub BindDoctors(specialisationId As Integer)
        catrid = dscatreee.getidbyname(Request("id"))
        dscareaid = dsarea.getidbyname(ddlarea.SelectedItem.Text)
        repimage.DataSource = dsdata.GetDataByarea(dscareaid, 0, catrid)
        repimage.DataBind()
    End Sub
   
   
    Protected Sub repimage_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles repimage.ItemDataBound

        Dim lblarea As Label = CType(e.Item.FindControl("lblarea"), Label)
        If Not lblarea Is Nothing Then
            If lblarea.Text = "" Then

            ElseIf lblarea.Text <> "" Then
                brancharr = Split(lblarea.Text.Replace("$", ""), ",")
                lblarea.Text = ""
                For i = 0 To UBound(brancharr)
                    If i = 0 Then
                        lblarea.Text = dsarea.getvaluebyid(brancharr(i))
                    Else
                        lblarea.Text = lblarea.Text & ", " & dsarea.GetValueByID(brancharr(i))
                    End If
                Next
            End If
        End If
    End Sub
End Class