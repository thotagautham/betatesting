Imports betatesting.DataSetCareTableAdapters
Imports System.Data.SqlClient
Imports System.IO
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web.UI.WebControls
Public Class upload
    Inherits System.Web.UI.Page
    Dim dsaddvideo As New SPECIALIZATIONTableAdapter
    Dim dsvideo As New SPECIALIZATIONTableAdapter
    Dim ThumbnailImageName As String
    Dim DsInstitutes As New SPECIALIZATIONTableAdapter
    Dim DsSp As New SPECIALIZATIONTableAdapter
    Dim DsBranch As New SPECIALIZATIONTableAdapter
    Dim DSDoctor As New DOCTORSTableAdapter
    Dim pageArray As Array
    Dim PageUrl As String
    Dim strsql As String
    Dim filetype As String

    Dim DsIdentity As New SPECIALIZATIONTableAdapter
    Dim oracmd As SqlCommand
    Dim connString As String
    Dim pdfname As String
    Dim videotittle As String
    Dim videovideoname As String
    Dim videodescription As String
    Dim videopatientname As String
    Dim videoiframurl As String
    Dim videotarget As String
    Dim videoalternatetext As String
    Dim videosortorder As String
    Private i As Integer, j As Integer, k As Integer = 0

    Public objConn As SqlConnection


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

        End If

    End Sub
   

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click


      
        ThumbnailImageName =
        filetype = "video"

        If FUNewsImage.HasFile Then
            If FUNewsImage.PostedFile.ContentType <> "image/jpeg" And FUNewsImage.PostedFile.ContentType <> "image/pjpeg" And FUNewsImage.PostedFile.ContentType <> "image/gif" Then

                Exit Sub
            ElseIf btnSave.Text = "Save" Then
                ThumbnailImageName = pdfname & Path.GetExtension(FUNewsImage.PostedFile.FileName)
                FUNewsImage.PostedFile.SaveAs(Server.MapPath("~/testimonials") & "/" & ThumbnailImageName)
                filetype = "image"
            Else
                If btnSave.Text = "Update" Then
                    If FUNewsImage.PostedFile.ContentType <> "image/jpeg" And FUNewsImage.PostedFile.ContentType <> "image/pjpeg" And FUNewsImage.PostedFile.ContentType <> "image/gif" Then

                        filetype = "image"
                    Else
                        ThumbnailImageName = CStr(ViewState("ophid")) & Path.GetExtension(FUNewsImage.PostedFile.FileName)
                        FUNewsImage.PostedFile.SaveAs(Server.MapPath("~/testimonials") & "/" & ThumbnailImageName)
                        filetype = "image"
                    End If
                End If

            End If
        End If


      
    End Sub
  
End Class


