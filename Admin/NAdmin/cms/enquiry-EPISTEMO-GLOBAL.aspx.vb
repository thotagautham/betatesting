﻿Imports betatesting.AppointmentsTableAdapters
Public Class epistemo_enquiry
    Inherits System.Web.UI.Page
    Dim askcare As New epistemoASKCARETableAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        GvBannerImages.DataSource = askcare.GetData
        GvBannerImages.DataBind()

    End Sub

    Protected Sub GvBannerImages_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GvBannerImages.SelectedIndexChanged

    End Sub

    Protected Sub GvBannerImages_PageIndexChanging(sender As Object, e As GridViewPageEventArgs) Handles GvBannerImages.PageIndexChanging
        GvBannerImages.PageIndex = e.NewPageIndex

    End Sub



    Protected Sub GvBannerImages_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GvBannerImages.DataBound





        For i = 0 To GvBannerImages.Rows.Count - 1

            Dim assigneddate As Date

            If GvBannerImages.Rows(i).Cells(5).Text = "" Then


            Else
                assigneddate = GvBannerImages.Rows(i).Cells(5).Text

                assigneddate = assigneddate.AddMinutes(750)
                GvBannerImages.Rows(i).Cells(5).Text = assigneddate
            End If









        Next
    End Sub
End Class