Imports betatesting.avanaTableAdapters
Imports System.Data.SqlClient
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web.UI.WebControls
Imports System.IO
Public Class manage_images
    Inherits System.Web.UI.Page
    Dim dscatolog As New avanacatlogTableAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

         
        End If
    End Sub

End Class