﻿Imports System.Data
Imports System.Data.OleDb
Imports System.IO
Imports System.Data.SqlClient
Imports System.Configuration
Imports betatesting.DataSetCareTableAdapters
Public Class xltodb
    Inherits System.Web.UI.Page

    Dim dsastro As New ASTROLOGYTableAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub btnUpload_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If FileUpload1.HasFile Then
            Dim FileName As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
            Dim Extension As String = Path.GetExtension(FileUpload1.PostedFile.FileName)
            Dim FolderPath As String = ConfigurationManager.AppSettings("FolderPath")

            Dim FilePath As String = Server.MapPath(FolderPath + FileName)
            FileUpload1.SaveAs(FilePath)
            'GetExcelSheets(FilePath, Extension, "Yes")



            If True Then
                'Instance reference for Excel Application
                Dim objXL As Microsoft.Office.Interop.Excel.Application = Nothing
                'Workbook refrence
                Dim objWB As Microsoft.Office.Interop.Excel.Workbook = Nothing
                Dim ds As New DataSet()
                Try
                    'Instancing Excel using COM services
                    objXL = New Microsoft.Office.Interop.Excel.Application()
                    'Adding WorkBook
                    objWB = objXL.Workbooks.Open(FilePath)

                    For Each objSHT As Microsoft.Office.Interop.Excel.Worksheet In objWB.Worksheets
                        Dim rows As Integer = objSHT.UsedRange.Rows.Count
                        Dim cols As Integer = objSHT.UsedRange.Columns.Count
                        Dim dt As New DataTable()
                        Dim noofrow As Integer = 1

                        'If 1st Row Contains unique Headers for datatable include this part else remove it
                        'Start
                        For c As Integer = 1 To cols
                            Dim colname As String = objSHT.Cells(1, c).Text
                            dt.Columns.Add(colname)
                            noofrow = 2
                        Next
                        'END

                        For r As Integer = noofrow To rows
                            Dim dr As DataRow = dt.NewRow()
                            For c As Integer = 1 To cols
                                dr(c - 1) = objSHT.Cells(r, c).Text
                            Next
                            dt.Rows.Add(dr)



                        Next

                        ds.Tables.Add(dt)

                        GvBannerImages.DataSource = dt
                        GvBannerImages.DataBind()
                    Next

                    'Closing workbook
                    objWB.Close()
                    'Closing excel application

                    objXL.Quit()
                Catch ex As Exception
                    objWB.Saved = True
                    'Closing work book
                    objWB.Close()
                    'Closing excel application
                    'Response.Write("Illegal permission");
                    objXL.Quit()
                End Try
            End If



        End If
    End Sub
    Private Sub GetExcelSheets(ByVal FilePath As String, ByVal Extension As String, ByVal isHDR As String)
        Dim conStr As String = ""
        Select Case Extension
            Case ".xls"
                'Excel 97-03 
                conStr = ConfigurationManager.ConnectionStrings("Excel03ConString").ConnectionString
                Exit Select
            Case ".xlsx"
                'Excel 07 
                conStr = ConfigurationManager.ConnectionStrings("Excel07ConString").ConnectionString
                Exit Select
        End Select

        'Get the Sheets in Excel WorkBoo 
        conStr = String.Format(conStr, FilePath, isHDR)
        Dim connExcel As New OleDbConnection(conStr)
        Dim cmdExcel As New OleDbCommand()
        Dim oda As New OleDbDataAdapter()
        cmdExcel.Connection = connExcel
        connExcel.Open()

        'Bind the Sheets to DropDownList 
        ddlSheets.Items.Clear()
        ddlSheets.Items.Add(New ListItem("--Select Sheet--", ""))
        ddlSheets.DataSource = connExcel.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing)
        ddlSheets.DataTextField = "TABLE_NAME"
        ddlSheets.DataValueField = "TABLE_NAME"
        ddlSheets.DataBind()
        connExcel.Close()
        txtTable.Text = ""
        lblFileName.Text = Path.GetFileName(FilePath)
        Panel2.Visible = True

        Panel1.Visible = False
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim FileName As String = lblFileName.Text
        Dim Extension As String = Path.GetExtension(FileName)
        Dim FolderPath As String = Server.MapPath( _
           ConfigurationManager.AppSettings("FolderPath"))
        Dim CommandText As String = ""
        Select Case Extension
            Case ".xls"
                'Excel 97-03 
                CommandText = "spx_ImportFromExcel03"
                Exit Select
            Case ".xlsx"
                'Excel 07 
                CommandText = "spx_ImportFromExcel07"
                Exit Select
        End Select
        'Read Excel Sheet using Stored Procedure 
        'And import the data into Database Table 
        Dim strConnString As String = ConfigurationManager _
          .ConnectionStrings("conString").ConnectionString
        Dim con As New SqlConnection(strConnString)
        Dim cmd As New SqlCommand()
        cmd.CommandType = CommandType.StoredProcedure
        cmd.CommandText = CommandText
        cmd.Parameters.Add("@SheetName", SqlDbType.VarChar).Value = ddlSheets.SelectedItem.Text
        cmd.Parameters.Add("@FilePath", SqlDbType.VarChar).Value = FolderPath + FileName
        cmd.Parameters.Add("@HDR", SqlDbType.VarChar).Value = rbHDR.SelectedItem.Text
        cmd.Parameters.Add("@TableName", SqlDbType.VarChar).Value = txtTable.Text
        cmd.Connection = con
        Try
            con.Open()
            Dim count As Object = cmd.ExecuteNonQuery()
            lblMessage.ForeColor = System.Drawing.Color.Green
            lblMessage.Text = count.ToString() & " records inserted."
        Catch ex As Exception
            lblMessage.ForeColor = System.Drawing.Color.Red
            lblMessage.Text = ex.Message
        Finally
            con.Close()
            con.Dispose()
            Panel1.Visible = True
            Panel2.Visible = False
        End Try
    End Sub
    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As EventArgs)
        Panel1.Visible = True
        Panel2.Visible = False
    End Sub


End Class