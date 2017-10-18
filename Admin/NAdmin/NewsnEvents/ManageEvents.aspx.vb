Imports betatesting.DataSetCareTableAdapters

Partial Class Admin_Miscellaneous_ManageEvents
    Inherits System.Web.UI.Page

    Dim DsEvent As New EVENTSTableAdapter
    Dim DsSpec As New SPECIALIZATIONTableAdapter
    Dim DsBranch As New BRANCH1TableAdapter
    Shared EventId As Integer
    Shared PdfName As String

    Dim i As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "Media", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If
        End If
    End Sub

    Protected Sub AddEvent_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddEvent.Click
        LblMsg.Text = ""

        If AddEvent.Text = "Save" Then
            If Val(DsEvent.GetPrimaryCount(EventTitle.Text, ddlEventGroup.SelectedValue)) > 0 Then
                LblMsg.Text = "Event  -- [" & EventTitle.Text & "] Already Exisits, Try With The Other!"
                LblMsg.ForeColor = Drawing.Color.DarkRed
            Else
                PdfName = "N/A"
                If EventPDF.HasFile Then
                    If EventPDF.PostedFile.ContentType <> "application/pdf" Then
                        LblMsg.Text = "Files of type[" & EventPDF.PostedFile.ContentType & "] are not allowed, Only PDFs are allowed"
                    ElseIf EventPDF.PostedFile.ContentLength > "2097152" Then
                        LblMsg.Text = "PDF size should not exceed 2 MB"
                    Else
                        If ddlEventGroup.SelectedValue = "Doctors" Then
                            EventPDF.PostedFile.SaveAs(Server.MapPath("~/EventPDFs") & "/" & ddlEventGroup.SelectedValue & "_" & EventTitle.Text & "." & Right(EventPDF.PostedFile.FileName, 3))
                        Else
                            EventPDF.PostedFile.SaveAs(Server.MapPath("~/OurHospitals/Events") & "/" & ddlEventGroup.SelectedValue & "_" & EventTitle.Text & "." & Right(EventPDF.PostedFile.FileName, 3))
                        End If
                        PdfName = ddlEventGroup.SelectedValue & "_" & EventTitle.Text & "." & Right(EventPDF.PostedFile.FileName, 3)
                    End If
                End If

                    If LblMsg.Text = "" Then
                        LblMsg.Text = "Event -- [" & EventTitle.Text & "] Added Successfully"
                        DsEvent.Insert(EventTitle.Text, EventDate.Text, ddlEventGroup.SelectedValue, EventDesc.Value, "Y", TxtEndDate.Text, TxtVenue.Text, DDLBranch.SelectedItem.Value, DDLSpec.SelectedItem.Value, PdfName)
                        ClearControls()
                        GridView1.DataBind()
                    End If

                End If
        ElseIf AddEvent.Text = "UpDate" Then
            If Val(DsEvent.GetCountFromOtherIDs(EventTitle.Text, EventId)) > 0 Then
                LblMsg.Text = "Event  -- [" & EventTitle.Text & "] Already Exisits, Try With The Other!"
                LblMsg.ForeColor = Drawing.Color.DarkRed
            Else
                PdfName = DsEvent.GetEventDocByEventId(EventId)
                If EventPDF.HasFile Then
                    If EventPDF.PostedFile.ContentType <> "application/pdf" Then
                        LblMsg.Text = "Files of type[" & EventPDF.PostedFile.ContentType & "] are not allowed, Only PDFs are allowed"
                    ElseIf EventPDF.PostedFile.ContentLength > "2097152" Then
                        LblMsg.Text = "PDF size should not exceed 2 MB"
                    Else
                        If ddlEventGroup.SelectedValue = "Doctors" Then
                            EventPDF.PostedFile.SaveAs(Server.MapPath("~/EventPDFs") & "/" & ddlEventGroup.SelectedValue & "_" & EventTitle.Text & "." & Right(EventPDF.PostedFile.FileName, 3))
                        Else
                            EventPDF.PostedFile.SaveAs(Server.MapPath("~/OurHospitals/Events") & "/" & ddlEventGroup.SelectedValue & "_" & EventTitle.Text & "." & Right(EventPDF.PostedFile.FileName, 3))
                        End If
                        PdfName = ddlEventGroup.SelectedValue & "_" & EventTitle.Text & "." & Right(EventPDF.PostedFile.FileName, 3)
                    End If
                End If

                DsEvent.Update(EventTitle.Text, EventDate.Text, ddlEventGroup.SelectedValue, EventDesc.Value, "Y", TxtEndDate.Text, TxtVenue.Text, DDLBranch.SelectedItem.Value, DDLSpec.SelectedItem.Value, PdfName, EventId)
                ClearControls()
                GridView1.DataBind()

            End If
        End If
    End Sub
    Private Sub ClearControls()
        TxtEndDate.Text = ""
        TxtVenue.Text = ""
        EventTitle.Text = ""
        EventDate.Text = ""
        EventDesc.Value = ""
        ddlEventGroup.SelectedIndex = 0
        DDLBranch.SelectedIndex = 0
        DDLSpec.SelectedIndex = 0
        BtnCancel.Visible = False
        AddEvent.Text = "Save"
    End Sub
    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBound
        For i = 0 To GridView1.Rows.Count - 1
            GridView1.Rows(i).Cells(3).Text = DsSpec.GetValueByID(CInt(GridView1.Rows(i).Cells(3).Text))
            GridView1.Rows(i).Cells(4).Text = CDate(GridView1.Rows(i).Cells(4).Text)
            GridView1.Rows(i).Cells(5).Text = CDate(GridView1.Rows(i).Cells(5).Text)
            GridView1.Rows(i).Cells(7).Text = DsBranch.GetValueByID(GridView1.Rows(i).Cells(7).Text)
            If GridView1.Rows(i).Cells(10).Text = "&nbsp;" Then
                GridView1.Rows(i).Cells(10).Text = "N/A"
            Else
                If GridView1.Rows(i).Cells(10).Text <> "N/A" Then
                    If GridView1.Rows(i).Cells(8).Text = "Doctors" Then
                        GridView1.Rows(i).Cells(10).Text = "<a href='../../../EventPDFs/" & GridView1.Rows(i).Cells(10).Text & "' target='_blank'>View</a>"
                    Else
                        GridView1.Rows(i).Cells(10).Text = "<a href='../../../OurHospitals/Events/" & GridView1.Rows(i).Cells(10).Text & "' target='_blank'>View</a>"
                    End If
                End If
            End If

            Dim LnkBtnActivate As LinkButton = CType(GridView1.Rows(i).FindControl("LnkBtnActivate"), LinkButton)
            Dim LnkBtnDeActivate As LinkButton = CType(GridView1.Rows(i).FindControl("LnkBtnDeActivate"), LinkButton)

            If GridView1.Rows(i).Cells(9).Text = "Y" Then
                LnkBtnActivate.Visible = False
                LnkBtnDeActivate.Visible = True
            Else
                LnkBtnActivate.Visible = True
                LnkBtnDeActivate.Visible = False
            End If

        Next
    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "CmdEdit" Then
            TxtEndDate.Text = GridView1.Rows(e.CommandArgument).Cells(5).Text
            TxtVenue.Text = GridView1.Rows(e.CommandArgument).Cells(6).Text
            EventTitle.Text = GridView1.Rows(e.CommandArgument).Cells(2).Text
            EventDate.Text = GridView1.Rows(e.CommandArgument).Cells(4).Text
            EventDesc.Value = DsEvent.GetEventDescByID(GridView1.DataKeys(e.CommandArgument).Value)
            ddlEventGroup.SelectedIndex = -1
            ddlEventGroup.Items.FindByText(GridView1.Rows(e.CommandArgument).Cells(8).Text).Selected = True
            DDLBranch.SelectedIndex = -1
            DDLBranch.Items.FindByText(GridView1.Rows(e.CommandArgument).Cells(7).Text).Selected = True
            DDLSpec.SelectedIndex = -1
            DDLSpec.Items.FindByText(GridView1.Rows(e.CommandArgument).Cells(3).Text).Selected = True
            AddEvent.Text = "UpDate"
            BtnCancel.Visible = True
            EventId = GridView1.DataKeys(e.CommandArgument).Value
        End If
    End Sub

    Protected Sub BtnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnCancel.Click
        ClearControls()
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim LnkBtn As LinkButton = DirectCast(sender, LinkButton)
        Dim Grow As GridViewRow = DirectCast(LnkBtn.Parent.Parent, GridViewRow)
        DsEvent.UpdateActiveStatus("Y", GridView1.DataKeys(Grow.RowIndex).Value)
        GridView1.DataBind()

    End Sub

    Protected Sub LnkBtnDeActivate_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim LnkBtn As LinkButton = DirectCast(sender, LinkButton)
        Dim Grow As GridViewRow = DirectCast(LnkBtn.Parent.Parent, GridViewRow)
        DsEvent.UpdateActiveStatus("N", GridView1.DataKeys(Grow.RowIndex).Value)
        GridView1.DataBind()
    End Sub
End Class
