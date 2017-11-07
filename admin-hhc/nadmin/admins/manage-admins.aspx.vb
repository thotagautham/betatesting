Imports System.Data.SqlClient
Imports betatesting.hhcTableAdapters
Public Class manage_admins1
    Inherits System.Web.UI.Page

    Dim DsAdmins As New hhcAdminLoginsTableAdapter

    Dim i As Integer
    Dim Permissions, Password As String
    Dim Message, subject, sendto As String

    Dim strsql As String
    Dim oracmd As SqlCommand
    Dim connString As String
    Public objConn As SqlConnection

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "Users", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If

            getData("select * from hhcAdminLogins order by hhcAdminLoginsId ")
            LblGridSource.Text = "ViewAll"

        End If
    End Sub
    Private Function GetPermissions() As String
        Permissions = ""

        For i = 0 To CBLSections.Items.Count - 1
            If CBLSections.Items(i).Selected = True Then
                If Permissions = "" Then
                    Permissions = CBLSections.SelectedValue
                Else
                    Permissions = Permissions & "," & CBLSections.SelectedValue
                End If
                CBLSections.Items(i).Selected = False
            End If
        Next

        Return Permissions
    End Function

    Protected Sub BtnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSave.Click
        LblMsg.Text = ""

        If BtnSave.Text = "Update" Then
            If CInt(DsAdmins.GetOtherCount(TxtLoginId.Text, LblOtherAdminID.Text)) > 0 Then
                LblMsg.Text = "Login Id -- [" & TxtLoginId.Text & "] Already Exisits, Try With The Other!"
                LblMsg.ForeColor = Drawing.Color.DarkRed
            Else
                Permissions = GetPermissions()
                DsAdmins.Update(TxtLoginId.Text, LblPassword.Text, TxtName.Text, Permissions, TxtEmailId.Text, LblActiveStatus.Text, LblOtherAdminID.Text)
                LblMsg.Text = "User Details Updated Successfully"
            End If
        Else

            If CInt(DsAdmins.CheckPrimary(TxtLoginId.Text)) > 0 Or TxtLoginId.Text = "globaladmin" Then
                LblMsg.Text = "<br /><br />Login Id -- [" & TxtLoginId.Text & "] Already Exists, Please Try With Other !<br /><br />"
            Else

                Permissions = GetPermissions()

                Password = RandomPassword.Generate(6)
                DsAdmins.Insert(TxtLoginId.Text, Password, TxtName.Text, Permissions, TxtEmailId.Text, "Y")
                LblMsg.Text = "<br /><br />User Added Successfully !<br /><br />Login Id(" & TxtLoginId.Text & ") /  Password (" & Password & ")"

                Message = ""
                If TxtEmailId.Text <> "" Then
                    Message = "<font face='Verdana' size='2'>Dear " & TxtName.Text & ", <br /><br />" &
                            "<br /><br /></font>" &
                            " Welcome to Avana . Following are the details to access the administrator control panel.<br /><br />" &
                            "<br />URL '" & System.Configuration.ConfigurationManager.AppSettings("WebsiteURL") & "admin/'<br />" &
                            "<br />User Name(Login Id) : " & TxtLoginId.Text &
                            "<br />Password : " & Password &
                            "<br /><br /><font face='Verdana' size='2'>Thanks & Regards,<br />" &
                            "Website Support Team,<br />" &
                            "HHC. </font>"

                    subject = "Administrator Control Panel Details -- http://www.mokshamedia.in/"
                    sendto = TxtEmailId.Text

                    Dim CF As New CommonFunctions
                    CF.SendMail(Message, sendto, subject)
                    LblMsg.Text = "<br /><br />User Added Successfully ! Login Details Emailed.<br /><br />"
                End If
            End If
        End If

        ClearAll()
        BindData()
        PnlAddNew.Visible = False
        PnlView.Visible = True
        BtnCancel.Visible = False
        BtnSave.Text = "Save"


    End Sub

    Protected Sub BtnAddNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnAddNew.Click
        PnlAddNew.Visible = True
        PnlView.Visible = False
        ClearAll()
        BtnSave.Text = "Save"
        BtnCancel.Visible = False
    End Sub

    Protected Sub BtnView_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnView.Click
        PnlAddNew.Visible = False
        PnlView.Visible = True
        ClearAll()
    End Sub

    Private Sub BuildQuery()

        strsql = ""
        LblMsg.Text = ""

        If Trim(TxtName_s.Text) <> "" Then
            strsql = strsql & " and Name like '%" & Trim(TxtName_s.Text) & "%' "
        End If

        If Trim(TxtLoginId_s.Text) <> "" Then
            strsql = strsql & " and UserName like '%" & Trim(TxtLoginId_s.Text) & "%' "
        End If

        If Trim(TxtEmailId_s.Text) <> "" Then
            strsql = strsql & " and EmailID like '%" & Trim(TxtEmailId_s.Text) & "%' "
        End If

        If strsql <> "" Then
            strsql = "select * from hhcAdminLogins where 1=1 " & strsql & " order by hhcAdminLoginsId"

            getData(strsql)

            LblGridSource.Text = "Search"
        Else
            LblMsg.Text = "<br /><br />Please Specify Your Search Criteria And Click On Search<br /><br />"
        End If

    End Sub

    Public Sub openConnection()
        connString = ConfigurationManager.ConnectionStrings("kfrcConnString").ConnectionString
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

        GVAdmins.DataSource = myDataSet
        GVAdmins.DataBind()

        oracmd = Nothing
        closeConnection()
    End Sub

    Protected Sub BtnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnCancel.Click
        ClearAll()
        BtnSave.Text = "Save"
        BtnCancel.Visible = False

        LblMsg.Text = ""

        PnlAddNew.Visible = False
        PnlView.Visible = True


    End Sub

    Private Sub ClearAll()
        TxtEmailId.Text = ""
        TxtLoginId.Text = ""
        TxtName.Text = ""

        For i = 0 To CBLSections.Items.Count - 1
            If CBLSections.Items(i).Selected = True Then
                CBLSections.Items(i).Selected = False
            End If
        Next

    End Sub

    Private Sub BindData()
        Select Case LblGridSource.Text
            Case "ViewAll"
                getData("select * from hhcAdminLogins order by hhcAdminLoginsId  ")
                LblGridSource.Text = "ViewAll"
            Case "Search"
                BuildQuery()
        End Select
    End Sub

    Protected Sub GVAdmins_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GVAdmins.DataBound
        For i = 0 To GVAdmins.Rows.Count - 1

            Dim LnkBtnResetPwd As LinkButton = CType(GVAdmins.Rows(i).Cells(4).FindControl("LnkBtnResetPwd"), LinkButton)
            LnkBtnResetPwd.CommandArgument = i

            Dim Lnkbtnactive As LinkButton = CType(GVAdmins.Rows(i).Cells(5).FindControl("Lnkbtnactive"), LinkButton)

            If Lnkbtnactive.Text = "Y" Then
                Lnkbtnactive.Text = "DeActivate"
                Lnkbtnactive.OnClientClick = "return confirm('Are You Sure You Want To DeActivate " & GVAdmins.Rows(i).Cells(1).Text & "')"
            Else
                Lnkbtnactive.Text = "Activate"
                Lnkbtnactive.OnClientClick = "return confirm('Are You Sure You Want To Activate " & GVAdmins.Rows(i).Cells(1).Text & "')"
            End If
            Lnkbtnactive.CommandArgument = i

        Next
    End Sub

    Protected Sub GVAdmins_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GVAdmins.PageIndexChanging
        GVAdmins.PageIndex = e.NewPageIndex
        BindData()
    End Sub

    Protected Sub GVAdmins_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GVAdmins.RowCommand
        If e.CommandName = "CmdEdit" Then
            PnlAddNew.Visible = True
            PnlView.Visible = False

            BtnSave.Text = "Update"
            BtnCancel.Visible = True

            Dim Dt As New Data.DataTable
            Dim dtrow As Data.DataRow
            Dt = DsAdmins.GetAllDataById(GVAdmins.DataKeys(e.CommandArgument).Value)
            If Dt.Rows.Count > 0 Then
                dtrow = Dt.Rows(0)

                TxtEmailId.Text = dtrow("EmailID")
                TxtLoginId.Text = dtrow("UserName")
                TxtName.Text = dtrow("Name")
                Permissions = dtrow("Permissions")
                LblActiveStatus.Text = dtrow("ActiveStatus")
                LblPassword.Text = dtrow("UserPwd")
                LblOtherAdminID.Text = dtrow("hhcAdminLoginsId")

                For i = 0 To CBLSections.Items.Count - 1
                    If Permissions.Contains(CBLSections.Items(i).Value) = True Then
                        CBLSections.Items(i).Selected = True
                    End If
                Next

            End If

        End If

        If e.CommandName = "CmdActive" Then
            Dim Lnkbtnactive As LinkButton = CType(e.CommandSource, LinkButton)
            If Lnkbtnactive.Text = "DeActivate" Then
                DsAdmins.UpdateActiveStatus("N", GVAdmins.DataKeys(e.CommandArgument).Value)
            Else
                DsAdmins.UpdateActiveStatus("Y", GVAdmins.DataKeys(e.CommandArgument).Value)
            End If
            BindData()
        End If

        If e.CommandName = "CmdResetPwd" Then

            Password = RandomPassword.Generate(6)
            DsAdmins.UpdatePassword(Password, GVAdmins.DataKeys(e.CommandArgument).Value)
            LblMsg.Text = "<br /><br />Password Reset Successfully !<br /><br />  Password (" & Password & ")"

            Message = ""
            If GVAdmins.Rows(e.CommandArgument).Cells(3).Text <> "&nbsp;" Then
                Message = "<font face='Verdana' size='2'>Dear " & GVAdmins.Rows(e.CommandArgument).Cells(1).Text & ", <br /><br />" &
                        "<br /><br /></font>" &
                        " You Password has been reset and following are the details to access the administrator control panel.<br /><br />" &
                        "<br />URL '" & System.Configuration.ConfigurationManager.AppSettings("WebsiteURL") & "admin/'<br />" &
                        "<br />User Name(Login Id) : " & GVAdmins.Rows(e.CommandArgument).Cells(0).Text &
                        "<br />Password : " & Password &
                        "<br /><br /><font face='Verdana' size='2'>Thanks & Regards,<br />" &
                        "Website Support Team,<br />" &
                        "Avana. </font>"

                subject = "Administrator Control Panel Details -- www.mokshamedia.in"
                sendto = GVAdmins.Rows(e.CommandArgument).Cells(3).Text

                Dim CF As New CommonFunctions
                CF.SendMail(Message, sendto, subject)
                LblMsg.Text = "<br /><br />Password reset successfully and Login details emailed.<br /><br />"
            End If


        End If
    End Sub

    Protected Sub BtnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSearch.Click
        BuildQuery()
    End Sub

    Protected Sub BtnViewAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnViewAll.Click
        getData("select * from hhcAdminLogins order by hhcAdminLoginsId ")
        LblGridSource.Text = "ViewAll"
        BtnSave.Text = "Save"
        BtnCancel.Visible = False
        ClearAll()

    End Sub
End Class