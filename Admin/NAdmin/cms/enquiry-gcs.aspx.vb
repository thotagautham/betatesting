Imports betatesting.AppointmentsTableAdapters
Public Class gcs_enquiry
    Inherits System.Web.UI.Page

    Dim gcsaskcare As New GCSASKCARETableAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        GvBannerImages.DataSource = gcsaskcare.GetData
        GvBannerImages.DataBind()

    End Sub

   Protected Sub GvBannerImages_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GvBannerImages.SelectedIndexChanged

    End Sub

    Protected Sub GvBannerImages_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GvBannerImages.PageIndexChanging
        GvBannerImages.PageIndex = e.NewPageIndex
        
    End Sub
End Class