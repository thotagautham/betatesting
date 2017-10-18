Imports betatesting.DataSetCareTableAdapters

Partial Class Admin_NAdmin_Miscellaneous_ManageNews
    Inherits System.Web.UI.Page
    Dim DsNews As New NewsTableAdapter

    Protected Sub BtnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnSave.Click
        If Val(DsNews.GetTitleCount(TxtNewsTitle.Text, EventDate.Text)) > 0 Then
            LblMsg.Text = "News  -- [" & TxtNewsTitle.Text & "] Already Exisits, Try With The Other!"
            LblMsg.ForeColor = Drawing.Color.DarkRed
        Else
            If NewsPDF.HasFile Then
                If NewsPDF.PostedFile.ContentType <> "application/pdf" And NewsPDF.PostedFile.ContentType <> "application/msword" Then
                    LblMsg.Text = "Files of type[" & NewsPDF.PostedFile.ContentType & "] are not allowed, Only PDF's/ Word Documents are allowed"
                ElseIf NewsPDF.PostedFile.ContentLength > "1048576" Then
                    LblMsg.Text = "Document size should not exceed 1 MB"
                Else
                    DsNews.InsertData(TxtNewsTitle.Text, TxtNewsDesc.Text, TxtNewsTitle.Text & "_" & Replace(EventDate.Text, "/", "") & "." & Right(NewsPDF.PostedFile.FileName, 3), EventDate.Text)
                    NewsPDF.PostedFile.SaveAs(Server.MapPath("NewsPDFs") & "/" & TxtNewsTitle.Text & "_" & Replace(EventDate.Text, "/", "") & "." & Right(NewsPDF.PostedFile.FileName, 3))
                    LblMsg.Text = "News -- [" & TxtNewsTitle.Text & "] Added Successfully "
                End If
            Else
                LblMsg.Text = "Upload PDF And Try Again !"
            End If
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
