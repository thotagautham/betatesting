Imports betatesting.newseventsTableAdapters
Imports KimsHospitals.OurHospitalsTableAdapters
Imports System.IO
Partial Class Admin_NAdmin_NewsnEvents_NewsPapers
    Inherits System.Web.UI.Page

    Dim DsNewsPapers As New NewsPapersTableAdapter
    Dim DsOHPrintMedia As New OHPrintMediaTableAdapter

    Dim LogoName As String
    Dim i As Integer
    Dim ImageUrl As String
    Dim FileName As String


    Protected Sub BtnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSave.Click
        LblMsg.Text = ""
        If CInt(DsNewsPapers.CheckPrimary(TxtNewsPaperName.Text)) > 0 Then
            LblMsg.Text = "News Paper [" & TxtNewsPaperName.Text & "] Already Exists, Please Try With The Other !"
        Else
            If FULogo.HasFile Then
                If FULogo.PostedFile.ContentType <> "image/jpeg" And FULogo.PostedFile.ContentType <> "image/pjpeg" And FULogo.PostedFile.ContentType <> "image/gif" Then
                    LblMsg.Text = "Files Of Type [" & FULogo.PostedFile.ContentType & "] Not Allowed"
                Else
                    LogoName = Replace(TxtNewsPaperName.Text, " ", "")
                    LogoName = Replace(LogoName, "&", "") & "." & Right(FULogo.PostedFile.FileName, 3)

                    FULogo.PostedFile.SaveAs(Server.MapPath("~/MediaFiles/newspaperlogo") & "/" & LogoName)

                    DsNewsPapers.Insert(TxtNewsPaperName.Text, LogoName, "Y")

                    LblMsg.Text = "News Paper Name Added Successfully "

                    GridView1.DataBind()

                End If
            Else
                LblMsg.Text = "Select Any Logo And Try Again !"
            End If
        End If
    End Sub

    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBound
        For i = 0 To GridView1.Rows.Count - 1

            Dim CmdActive As LinkButton = CType(GridView1.Rows(i).Cells(4).FindControl("LnkBtnActiveStatus"), LinkButton)

            If GridView1.Rows(i).Cells(3).Text = "Y" Then
                CmdActive.Text = "De Activate"
                CmdActive.OnClientClick = "return confirm('Are You Sure, You Want To De Activate?');"
                GridView1.Rows(i).Cells(3).Text = "Active"
            Else
                CmdActive.Text = "Activate"
                CmdActive.OnClientClick = "return confirm('Are You Sure, You Want To Activate?');"
                GridView1.Rows(i).Cells(3).Text = "De Active"
            End If
            CmdActive.CommandArgument = i

            Dim LblLogo As Label = CType(GridView1.Rows(i).Cells(2).FindControl("LblLogo"), Label)
            If Not (LblLogo) Is Nothing Then
                ImageUrl = "javascript:window.open('/MediaFiles/newspaperlogo/" & LblLogo.Text & "','NewsImage','status=0,toolbar=0,menubar=0,location=0,scrollbars=0,resizable=0,width=400,height=200'); window.close();"
                LblLogo.Text = "<a href="" " & ImageUrl & " "" target='_blank'>Click To View</a>"
            End If

        Next
    End Sub

    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        GridView1.PageIndex = e.NewPageIndex
        GridView1.DataBind()

    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "CmdActive" Then
            If GridView1.Rows(e.CommandArgument).Cells(3).Text = "Active" Then
                DsNewsPapers.UpdateActiveStatus("N", GridView1.DataKeys(e.CommandArgument).Value)
            Else
                DsNewsPapers.UpdateActiveStatus("Y", GridView1.DataKeys(e.CommandArgument).Value)
            End If
            GridView1.DataBind()

        End If
    End Sub

    Protected Sub GridView1_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridView1.RowUpdating
        If CInt(DsNewsPapers.CheckOtherPrimary(e.NewValues(0), e.Keys(0))) > 0 Then
            LblMsg.Text = "News Paper [ " & e.NewValues(0) & " ] Already Exisits, Try With The Other !"
            e.Cancel = True
        Else
            DsNewsPapers.UpdateNewsPaperName(e.NewValues(0), e.Keys(0))
            DsOHPrintMedia.UpdateNewsPaperName(e.NewValues(0), e.OldValues(0))
            LblMsg.Text = "News Paper Name Updated Successfully"

            Dim FULogoo As FileUpload = CType(GridView1.Rows(e.RowIndex).Cells(2).FindControl("FULogo"), FileUpload)
            If FULogoo.HasFile Then
                If FULogoo.PostedFile.ContentType <> "image/jpeg" And FULogoo.PostedFile.ContentType <> "image/pjpeg" And FULogoo.PostedFile.ContentType <> "image/gif" Then
                    LblMsg.Text = "Files Of Type [" & FULogoo.PostedFile.ContentType & "] Not Allowed"
                Else

                    FileName = DsNewsPapers.GetNewsPaperLogoById(e.Keys(0))

                    Try
                        Dim TheFile As New FileInfo(Server.MapPath("~/MediaFiles/newspaperlogo") & "/" & FileName)
                        If TheFile.Exists Then
                            File.Delete(Server.MapPath("~/MediaFiles/newspaperlogos") & "/" & FileName)
                        Else
                            Throw New FileNotFoundException()
                        End If
                    Catch ex As FileNotFoundException
                        LblMsg.Text = ex.Message
                    Catch ex As Exception
                        LblMsg.Text = ex.Message
                    End Try

                    LogoName = Replace(e.NewValues(0), " ", "")
                    LogoName = Replace(LogoName, "&", "") & "." & Right(FULogoo.PostedFile.FileName, 3)

                    FULogoo.PostedFile.SaveAs(Server.MapPath("~/MediaFiles/newspaperlogo") & "/" & LogoName)

                    DsNewsPapers.UpdateNewsPaperLogo(LogoName, e.Keys(0))

                    DsOHPrintMedia.UpdateNewsPaperLogo(LogoName, FileName)
                End If
            End If
            GridView1.DataBind()

        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "Media", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If
        End If
    End Sub
End Class
