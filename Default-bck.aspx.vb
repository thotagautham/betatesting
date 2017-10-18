Imports betatesting.DataSetCareTableAdapters
Imports betatesting.WebAdminsTableAdapters
Public Class _Default
    Inherits System.Web.UI.Page
    Dim ObjCPIP As New ControlPanelIPStatsTableAdapter
    Dim dscategorysub As New categorysubTableAdapter
    Dim dscatgory As New categoryTableAdapter
    Dim catid As String
    Private Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            ddlrequest.DataSource = dscatgory.GetData()
            ddlrequest.DataTextField = "categoryNAME"
            ddlrequest.DataValueField = "categoryID"
            ddlrequest.DataBind()

            ObjCPIP.Insert(Request.ServerVariables("REMOTE_ADDR"), Now(), Now(), "chennai/default")
        End If

    End Sub

    
    

    
    
    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        If (ddlRequest.SelectedIndex > 0) Then

            catid = ddlRequest.SelectedItem.Text



            Response.Redirect("~/service.aspx?" & "id=" & catid)
        Else
            LblMsg.Text = "select category"
        End If
    End Sub
End Class
