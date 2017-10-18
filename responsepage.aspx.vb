Imports DotNetIntegrationKit
Public Class responsepage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim strPGResponse As String = Page.Request.Form("msg")
        LBL_DisplayResult.Text = strPGResponse
    End Sub

End Class