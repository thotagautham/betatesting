Imports betatesting.DataSetCareTableAdapters
Imports betatesting.WebAdminsTableAdapters
Public Class post_my_service
    Inherits System.Web.UI.Page
    Dim ObjCPIP As New ControlPanelIPStatsTableAdapter
    Dim dscategorysub As New categorysubTableAdapter
    Dim dscatgory As New categoryTableAdapter
    Dim dsarea As New ChecnnaiareaTableAdapter
    Dim dsdata As New ChecnnaidataTableAdapter
    Dim categoryid As String
    Dim astername As String
    Dim catid As String
    Dim areaid As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ddlrequest.DataSource = dscatgory.GetData()
            ddlrequest.DataTextField = "categoryNAME"
            ddlrequest.DataValueField = "categoryID"
            ddlrequest.DataBind()


            ddlarea.DataSource = dsarea.GetData
            ddlarea.DataTextField = "ChecnnaiareaNAME"
            ddlarea.DataValueField = "ChecnnaiareaID"
            ddlarea.DataBind()

            ObjCPIP.Insert(Request.ServerVariables("REMOTE_ADDR"), Now(), Now(), "chennai/post")
        End If

    End Sub

    Protected Sub BtnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnsave.Click
        LblMsg.Text = ""
        If TxtName.Text = "" Then
            LblMsg.Text = "Enter Name"
            Exit Sub
       
        
        ElseIf TxtTelephone.Text = "" Then
            LblMsg.Text = "Enter Mobile Number"
            Exit Sub
        ElseIf TxtComments.Text = "" Then
            LblMsg.Text = "Enter Message"
            Exit Sub
        End If

        If ddlrequest.SelectedIndex = "0" Then
            If Txtother.Text = "" Then
                LblMsg.Text = "Select Category"
                Exit Sub
            Else
                dscatgory.Insert(Txtother.Text, "Y")
                categoryid = "$" & dscatgory.getidbyname(Txtother.Text) & "$"
            End If
        Else
            categoryid = " $" & ddlrequest.SelectedItem.Value & "$ "
        End If



        If txtotherarea.Text = "" Then
           
        Else
            dsarea.Insert(txtotherarea.Text, "Y")
            areaid = "$" & dsarea.getidbyname(Txtother.Text) & "$"
        End If

        areaid = " $" & ddlarea.SelectedItem.Value & "$ "




        dsdata.Insert(TxtName.Text, "Y", TxtTelephone.Text, areaid, categoryid, TxtEmailID.Text, txttwitter.Text, txtfacebook.Text, txtwatsapp.Text, TxtComments.Text)
        Response.Redirect("~/ThankYou.aspx")
    End Sub
End Class