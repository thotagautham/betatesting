Imports System
Imports System.Collections
Imports System.ComponentModel
Imports System.Data
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Web
Imports System.Web.SessionState
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.HtmlControls
Public Class jpegimage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim ci As CaptchaImage = New CaptchaImage(Me.Session("CaptchaImageText").ToString, 200, 50, "Century Schoolbook")
        Me.Response.Clear()
        Me.Response.ContentType = "image/jpeg"
        ci.image.Save(Me.Response.OutputStream, ImageFormat.Jpeg)
        ci.Dispose()
    End Sub

    Protected Overloads Overrides Sub OnInit(ByVal e As EventArgs)
        InitializeComponent()
        MyBase.OnInit(e)
    End Sub
    Private Sub InitializeComponent()
        AddHandler Me.Load, AddressOf Me.Page_Load
    End Sub

    Private Function GenerateRandomCode() As String
        Dim Random As New Random
        Dim s As String
        s = ""
        Dim i As Integer
        For i = 0 To 6
            s = String.Concat(s, Random.Next(10).ToString())
        Next i
        Return s
    End Function
End Class