Imports betatesting.DataSetCareTableAdapters

Partial Class Admin_NAdmin_Miscellaneous_ViewEvents
    Inherits System.Web.UI.Page
    Dim DsMon As New MonTableAdapter
    Dim DsEvents As New EVENTSTableAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "Media", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If


            Session("uid") = "20"
            'DisplayYear(Year(Now))
            DisplayMonth(Year(Now), Month(Now))
            lblyear.Text = MonthName(Month(Now)) & "  " & Year(Now)
            LblYr.Text = Year(Now)
            LblMonth.Text = Month(Now)

            Dim i As Integer
            i = CInt(Month(Date.Today))
            'Dim cal As Calendar = CType(DataList1.Items(i - 1).FindControl("calmon"), Calendar)
            Dim cal As Calendar = CType(DataList1.Items(0).FindControl("calmon"), Calendar)
            cal.TodaysDate = Date.Today

        End If

    End Sub

    Protected Sub caldayrender(ByVal sender As Object, ByVal e As DayRenderEventArgs)
        If e.Day.IsOtherMonth Then
            e.Cell.Text = "&nbsp;"
            Exit Sub
        End If

        If e.Day.IsToday Then
            e.Cell.BackColor = System.Drawing.Color.FromArgb(182, 212, 244)
            e.Cell.ForeColor = System.Drawing.Color.Black
            e.Cell.ToolTip = "Today"
        End If

        If e.Day.Date.DayOfWeek = DayOfWeek.Sunday Then
            e.Cell.Text = e.Day.DayNumberText
            e.Cell.ForeColor = System.Drawing.Color.LightGray
            e.Cell.BackColor = System.Drawing.Color.Maroon
            Exit Sub
        End If


        ' To highlight the Events 
        'Dim ds2 As DataSet
        'strsql = "Select shy_id,shy_reason from AmantraApplicationsDB.DBO.SRQ_holiday where shy_date='" & e.Day.Date & "' and shy_sta_id=1"
        'ds2 = ExecuteDataset(ObjCon, strsql)

        Dim DtEvent As New Data.DataTable
        Dim dtrow As Data.DataRow
        'DtEvent = DsEvents.GetAllEventsDataByDate(e.Day.Date.Day & "/" & Left(MonthName(e.Day.Date.Month), 3) & "/" & Year(e.Day.Date))
        DtEvent = DsEvents.GetAllEventsDataByDate(e.Day.Date)

        If DtEvent.Rows.Count > 0 Then
            dtrow = DtEvent.Rows(0)
            'e.Cell.Text = e.Day.DayNumberText
            e.Cell.Text = "<a href=""#"" onmouseup=DisplayMessage('" & dtrow("eventid") & "') >" & e.Day.DayNumberText & "</a>"
            e.Cell.ToolTip = dtrow("eventtitle")
            'e.Cell.BackColor = System.Drawing.Color.Red
            e.Cell.BackColor = System.Drawing.Color.LimeGreen
            e.Cell.ForeColor = System.Drawing.Color.Black
        End If

        'If ds2.Tables(0).Rows.Count = 0 Then
        'Else
        '    e.Cell.Text = e.Day.DayNumberText
        '    e.Cell.ToolTip = ds2.Tables(0).Rows(0).Item(1)
        '    e.Cell.BackColor = System.Drawing.Color.Red
        '    e.Cell.ForeColor = System.Drawing.Color.Black
        'End If
        'ds2.Dispose()

    End Sub


    Private Sub DisplayYear(ByVal Yr As Integer)
        'strsql = "Select (convert(nvarchar,rtrim(mon_name))+ '/1/' + convert(nvarchar," & Yr & ")) mon_name from amantraApplicationsDB.DBO.mon"
        'Dim Ds As New DataSet
        'Dim da As New SqlDataAdapter(strsql, ObjCon)

        'da.Fill(Ds)
        DataList1.DataSource = DsMon.GetAllMonthsData(Yr, "9")
        DataList1.DataBind()
    End Sub
    Private Sub DisplayMonth(ByVal Yr As Integer, ByVal Monthh As Integer)
        'strsql = "Select (convert(nvarchar,rtrim(mon_name))+ '/1/' + convert(nvarchar," & Yr & ")) mon_name from amantraApplicationsDB.DBO.mon"
        'Dim Ds As New DataSet
        'Dim da As New SqlDataAdapter(strsql, ObjCon)

        'da.Fill(Ds)
        DataList1.DataSource = DsMon.GetAllMonthsData(Yr, Monthh)
        DataList1.DataBind()
    End Sub

    Protected Sub imgBtnPrevious_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnPrevious.Click
        'lblyear.Text = CInt(lblyear.Text) - 1
        'DisplayYear(CInt(lblyear.Text))
        If CInt(LblMonth.Text) = 1 Then
            LblYr.Text = CInt(LblYr.Text) - 1
            LblMonth.Text = 12
        Else
            LblMonth.Text = CInt(LblMonth.Text) - 1
        End If

        lblyear.Text = MonthName(CInt(LblMonth.Text)) & "  " & CInt(LblYr.Text)
        DisplayMonth(CInt(LblYr.Text), CInt(LblMonth.Text))
    End Sub

    Protected Sub imgBtnNext_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles imgBtnNext.Click
        'If CInt(lblyear.Text) = Year(Now) + 1 Then
        '    Dim strScript As String
        '    strScript = "<script language='javascript'>alert('Cannot View Beyond " & lblyear.Text & ".')</script>"
        '    'Page.RegisterStartupScript("strScript", strScript)
        '    Return
        'End If
        'lblyear.Text = CInt(lblyear.Text) + 1
        'DisplayYear(CInt(lblyear.Text))


        If CInt(LblMonth.Text) = 12 Then
            LblYr.Text = CInt(LblYr.Text) + 1
            LblMonth.Text = 1
        Else
            LblMonth.Text = CInt(LblMonth.Text) + 1
        End If

        lblyear.Text = MonthName(CInt(LblMonth.Text)) & "  " & CInt(LblYr.Text)
        DisplayMonth(CInt(LblYr.Text), CInt(LblMonth.Text))
    End Sub
End Class
