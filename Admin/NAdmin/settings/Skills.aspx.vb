Imports betatesting.DataSetCareTableAdapters
Partial Class Admin_NAdmin_Settings_Skills
    Inherits System.Web.UI.Page
    Dim DsSkill As New SKILLSTableAdapter
    Dim DsUpdate As New UPDATETIMESTATUSTableAdapter


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "Settings", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If
        End If
    End Sub

    Protected Sub GridView1_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridView1.RowUpdating
        If CInt(DsSkill.GetCountFromOtherIds(e.NewValues.Item(0), e.Keys.Item(0))) > 0 Then
            LblMsg.Text = "Skill Name [" & e.NewValues.Item(0) & "] Already Exists, Try With the Other"
            e.NewValues.Item(0) = e.OldValues.Item(0)
        Else
            DsUpdate.InsertData("Skill Name", User.Identity.Name, e.NewValues.Item(0))
            LblMsg.Text = "Skill Name Updated Successfully"
        End If
        e.NewValues.Item(1) = UCase(e.NewValues.Item(1))
    End Sub
End Class
