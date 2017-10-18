Imports betatesting.AppointmentsTableAdapters
Public Class abstract_innovation
    Inherits System.Web.UI.Page
    Dim askcare As New innocationabstractTableAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        GvBannerImages.DataSource = askcare.GetData
        GvBannerImages.DataBind()

    End Sub

    Protected Sub GvBannerImages_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GvBannerImages.SelectedIndexChanged

    End Sub

    Protected Sub GvBannerImages_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GvBannerImages.PageIndexChanging
        GvBannerImages.PageIndex = e.NewPageIndex

    End Sub
End Class