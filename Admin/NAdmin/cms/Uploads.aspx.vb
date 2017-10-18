Imports betatesting.cmsTableAdapters
Imports System.IO
Partial Class admin_LoginPages_Uploads
    Inherits System.Web.UI.Page
    Dim DsFileNames As New UploadFileNamesTableAdapter
    Dim DsFileTypes As New FileTypesTableAdapter

    Dim FileName As String
    Dim FilePath As String
    Dim FileType As String
    Dim i As Integer

    Protected Sub BtnUpload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnUpload.Click

        If Not UploadFiles(FileUpload1) Then
            Exit Sub
        End If
        If Not UploadFiles(FileUpload2) Then
            Exit Sub
        End If
        If Not UploadFiles(FileUpload3) Then
            Exit Sub
        End If
        If Not UploadFiles(FileUpload4) Then
            Exit Sub
        End If
        If Not UploadFiles(FileUpload5) Then
            Exit Sub
        End If

        LblMsg.Text = "Files Uploaded Successfully !"

        DDLImageTypes.Items.Clear()
        DDLImageTypes.Items.Add("-- View All --")
        DDLImageTypes.Items(0).Value = 0
        DDLImageTypes.DataSource = DsFileTypes.GetAllDataBySection(DDLSection.SelectedValue)
        DDLImageTypes.DataTextField = "FileType"
        DDLImageTypes.DataValueField = "FileType"
        DDLImageTypes.DataBind()

        DDLImageTypes.SelectedIndex = -1

    End Sub

    Private Function UploadFiles(ByRef UploadCtl As FileUpload) As Boolean
        If UploadCtl.HasFile Then

            If UploadCtl.PostedFile.ContentLength > "2097152" Then
                LblMsg.Text = "File [ " & System.IO.Path.GetFileName(UploadCtl.PostedFile.FileName) & " ] size should not exceed 2 MB"
                Return False
            Else
                FilePath = ""
                Select Case CStr(UploadCtl.PostedFile.ContentType)
                    Case "image/jpeg", "image/pjpeg", "image/gif"
                        FilePath = "/uploads/" & DDLSection.SelectedValue & "/images"
                    Case "application/pdf"
                        FilePath = "/uploads/" & DDLSection.SelectedValue & "/pdfs"
                    Case "application/msword"
                        FilePath = "/uploads/" & DDLSection.SelectedValue & "/docs"
                    Case "text/html"
                        FilePath = "/uploads/" & DDLSection.SelectedValue & "/htmls"
                    Case Else
                        LblMsg.Text = "Files of type[" & UploadCtl.PostedFile.ContentType & "] are not allowed"
                        Return False
                End Select

                If FilePath <> "" Then

                    FileName = Replace(System.IO.Path.GetFileName(UploadCtl.PostedFile.FileName), " ", "")
                    FileName = Replace(FileName, "&", "")

                    If CInt(DsFileNames.CheckFileNameBySection(FileName, DDLSection.SelectedValue)) > 0 Then
                        If RBLFileReplace.SelectedValue = "Yes" Then
                            UploadCtl.PostedFile.SaveAs(Server.MapPath("../../.." & FilePath) & "/" & FileName)
                            'LblMsg.Text = "File Already Exists With The Same Name And It Is Replaced Now."
                        Else
                            LblMsg.Text = "File Already Exists With The Same Name [ " & System.IO.Path.GetFileName(UploadCtl.PostedFile.FileName) & " ], Please Select Any Other File And Try Again ! "
                            Return False
                        End If
                    Else
                        UploadCtl.PostedFile.SaveAs(Server.MapPath("../../.." & FilePath) & "/" & FileName)
                        DsFileNames.Insert(FileName, UploadCtl.PostedFile.ContentType, FilePath & "/" & FileName, DDLSection.SelectedValue, Now().Date, User.Identity.Name)
                        'LblMsg.Text = "File Uploaded Successfully"
                    End If

                    GridView1.DataSource = DsFileNames.GetAllDataByFileTypeAndSection(UploadCtl.PostedFile.ContentType, DDLSection.SelectedValue)
                    GridView1.DataBind()



                End If

            End If
        End If
        Return True
    End Function

    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBound
        For i = 0 To GridView1.Rows.Count - 1
            GridView1.Rows(i).Cells(0).Text = "<a href='" & GridView1.Rows(i).Cells(2).Text & "' target='_blank' title='Click Here To View File'>Click To View</a>"
        Next
    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "CmdDelete" Then
            
            FileName = DsFileNames.GetFilePathById(e.CommandArgument)

            Try
                Dim TheFile As New FileInfo(Server.MapPath("../../.." & FileName))

                If TheFile.Exists Then
                    TheFile.Delete()
                    DsFileNames.Delete(e.CommandArgument)
                    LblMsg.Text = "File Deleted Successfully"
                    FillData("Delete")
                Else
                    Throw New FileNotFoundException()
                End If
            Catch ex As FileNotFoundException
                LblMsg.Text = ex.Message
            Catch ex As Exception
                LblMsg.Text = ex.Message
            End Try
        End If
    End Sub

    Protected Sub DDLImageTypes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLImageTypes.SelectedIndexChanged
        If DDLImageTypes.SelectedIndex > 0 Then
            GridView1.DataSource = DsFileNames.GetAllDataByFileTypeAndSection(DDLImageTypes.SelectedValue, DDLSection.SelectedValue)
            GridView1.DataBind()
        Else
            If DDLSection.SelectedIndex > 0 Then
                GridView1.DataSource = DsFileNames.GetAllDataBySection(DDLSection.SelectedValue)
                GridView1.DataBind()
            End If
        End If

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "CMS", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If

            GridView1.DataSource = DsFileNames.GetAllData
            GridView1.DataBind()
        End If

    End Sub

    Protected Sub DDLSection_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLSection.SelectedIndexChanged

        FillData("Section Changed")

    End Sub

    Protected Sub FillData(ByVal Choice As String)
        If Choice = "Delete" Then
            FileType = DDLImageTypes.SelectedValue
        End If

        DDLImageTypes.Items.Clear()
        DDLImageTypes.Items.Add("-- View All --")
        DDLImageTypes.Items(0).Value = 0

        If DDLSection.SelectedIndex > 0 Then
            GridView1.DataSource = DsFileNames.GetAllDataBySection(DDLSection.SelectedValue)
            GridView1.DataBind()
            DDLImageTypes.DataSource = DsFileTypes.GetAllDataBySection(DDLSection.SelectedValue)
            DDLImageTypes.DataTextField = "FileType"
            DDLImageTypes.DataValueField = "FileType"
            DDLImageTypes.DataBind()

            If Choice = "Delete" Then
                If Not (DDLImageTypes.Items.FindByValue(FileType)) Is Nothing Then
                    DDLImageTypes.Items.FindByValue(FileType).Selected = True
                End If
            End If

        Else
            GridView1.DataSource = DsFileNames.GetAllData
            GridView1.DataBind()
        End If
    End Sub
End Class
