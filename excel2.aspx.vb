Imports System.IO
Imports System.Data
Imports System.Data.OleDb
Imports System.Data.SqlClient
Imports System.Configuration
Public Class excel2
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub Upload(sender As Object, e As EventArgs)
        'Upload and save the file
        Dim excelPath As String = Server.MapPath("~/Files/") + Path.GetFileName(FileUpload1.PostedFile.FileName)
        FileUpload1.SaveAs(excelPath)

        Dim connString As String = ""
        Dim extension As String = Path.GetExtension(FileUpload1.PostedFile.FileName)
        Select Case extension
            Case ".xls"
                'Excel 97-03
                connString = ConfigurationManager.ConnectionStrings("Excel03ConString").ConnectionString
                Exit Select
            Case ".xlsx"
                'Excel 07 or higher
                connString = ConfigurationManager.ConnectionStrings("Excel07+ConString").ConnectionString
                Exit Select

        End Select
        Dim isHDR As String
        connString = String.Format(connString, excelPath, isHDR)

        connString = String.Format(connString, excelPath)
        Using excel_con As New OleDbConnection(connString)
            excel_con.Open()
            Dim sheet1 As String = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, Nothing).Rows(0)("TABLE_NAME").ToString()
            Dim dtExcelData As New DataTable()

            '[OPTIONAL]: It is recommended as otherwise the data will be considered as String by default.
            dtExcelData.Columns.AddRange(New DataColumn(2) {New DataColumn("Id", GetType(Integer)), _
                                                            New DataColumn("Name", GetType(String)), _
                                                            New DataColumn("Salary", GetType(Decimal))})

            Using oda As New OleDbDataAdapter((Convert.ToString("SELECT * FROM [") & sheet1) + "]", excel_con)
                oda.Fill(dtExcelData)
            End Using
            excel_con.Close()

            Dim conString As String = ConfigurationManager.ConnectionStrings("constr").ConnectionString
            Using con As New SqlConnection(conString)
                Using sqlBulkCopy As New SqlBulkCopy(con)
                    'Set the database table name
                    sqlBulkCopy.DestinationTableName = "dbo.tblPersons"

                    '[OPTIONAL]: Map the Excel columns with that of the database table
                    sqlBulkCopy.ColumnMappings.Add("Id", "PersonId")
                    sqlBulkCopy.ColumnMappings.Add("Name", "Name")
                    sqlBulkCopy.ColumnMappings.Add("Salary", "Salary")
                    con.Open()
                    sqlBulkCopy.WriteToServer(dtExcelData)
                    con.Close()
                End Using
            End Using
        End Using
    End Sub

End Class