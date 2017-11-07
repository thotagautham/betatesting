
Imports System.IO
Imports System.Data
Imports System.Collections.Generic
Imports DocumentFormat.OpenXml.Packaging
Imports DocumentFormat.OpenXml.Spreadsheet

Imports System.Data.SqlClient
Imports System.Configuration
Imports betatesting.DataSetCareTableAdapters
Imports betatesting.CorporatesTableAdapters
Public Class _default39
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub ImportExcel(sender As Object, e As EventArgs)
        'Save the uploaded Excel file.
        Dim FileName As String = Path.GetFileName(FileUpload1.PostedFile.FileName)
        Dim Extension As String = Path.GetExtension(FileUpload1.PostedFile.FileName)
        Dim FolderPath As String = ConfigurationManager.AppSettings("FolderPath")

        Dim FilePath As String = Server.MapPath(FolderPath + FileName)
        FileUpload1.SaveAs(FilePath)

        'Open the Excel file in Read Mode using OpenXml.
        Using doc As SpreadsheetDocument = SpreadsheetDocument.Open(filePath, False)
            'Read the first Sheets from Excel file.
            Dim sheet As Sheet = doc.WorkbookPart.Workbook.Sheets.GetFirstChild(Of Sheet)()

            'Get the Worksheet instance.
            Dim worksheet As Worksheet = TryCast(doc.WorkbookPart.GetPartById(sheet.Id.Value), WorksheetPart).Worksheet

            'Fetch all the rows present in the Worksheet.
            Dim rows As IEnumerable(Of Row) = worksheet.GetFirstChild(Of SheetData)().Descendants(Of Row)()

            'Create a new DataTable.
            Dim dt As New DataTable()

            'Loop through the Worksheet rows.
            For Each row As Row In rows
                'Use the first row to add columns to DataTable
                If row.RowIndex.Value = 1 Then
                    For Each cell As Cell In row.Descendants(Of Cell)()
                        dt.Columns.Add(GetValue(doc, cell))
                    Next
                Else
                    'Add rows to DataTable.
                    dt.Rows.Add()
                    Dim i As Integer = 0
                    For Each cell As Cell In row.Descendants(Of Cell)()
                        dt.Rows(dt.Rows.Count - 1)(i) = GetValue(doc, cell)
                        i += 1
                    Next
                End If
            Next
            GvBannerImages.DataSource = dt
            GvBannerImages.DataBind()
        End Using
    End Sub

    Private Function GetValue(doc As SpreadsheetDocument, cell As Cell) As String
        Dim value As String = cell.CellValue.InnerText
        If cell.DataType IsNot Nothing AndAlso cell.DataType.Value = CellValues.SharedString Then
            Return doc.WorkbookPart.SharedStringTablePart.SharedStringTable.ChildElements.GetItem(Integer.Parse(value)).InnerText
        End If
        Return value
    End Function



End Class