
Imports System.IO
Imports System.Data
Imports System.Collections.Generic
Imports DocumentFormat.OpenXml.Packaging
Imports DocumentFormat.OpenXml.Spreadsheet

Imports System.Data.SqlClient
Imports System.Configuration
Imports betatesting.DataSetCareTableAdapters
Imports betatesting.CorporatesTableAdapters
Public Class _new
    Inherits System.Web.UI.Page

    Dim dscountry As New COUNTRYTableAdapter

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





    Protected Sub GvBannerImages_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GvBannerImages.DataBound





        For i = 0 To GvBannerImages.Rows.Count - 1

            Dim assigneddate As String

            If GvBannerImages.Rows(i).Cells(1).Text = "" Then


            Else
                assigneddate = GvBannerImages.Rows(i).Cells(1).Text

                Dim countryname As String

                countryname = dscountry.GetValueByID(assigneddate)

                'assigneddate = assigneddate.AddMinutes(750)
                'GvBannerImages.Rows(i).Cells(3).Text = assigneddate
            End If

            'If GvBannerImages.Rows(i).Cells(4).Text = "" Then


            'Else
            '    receiveddate = GvBannerImages.Rows(i).Cells(4).Text

            '    receiveddate = receiveddate.AddMinutes(750)

            '    GvBannerImages.Rows(i).Cells(4).Text = receiveddate
            'End If

            'If dsconversation.getenquirycount(GvBannerImages.Rows(i).Cells(7).Text) = "0" Then

            '    GvBannerImages.Rows(i).Cells(7).Text = "Appointment Not Yet Fixed"
            'Else



            '    GvBannerImages.Rows(i).Cells(7).Text = dskimsenquiryconversation.getrecentappointmentdate(GvBannerImages.Rows(i).Cells(7).Text)
            'End If



            'If GvBannerImages.Rows(i).Cells(10).Text = "1" Then

            '    GvBannerImages.Rows(i).Cells(10).Text = "Kims Kondapur"
            'ElseIf GvBannerImages.Rows(i).Cells(10).Text = "6" Then

            '    GvBannerImages.Rows(i).Cells(10).Text = "Kims Secunderabad"

            'End If


            'Dim dscurrentmessage As String
            'Dim dscurrentconverstion As New ENQUIRYCONVERSATION9TableAdapter

            'dscurrentmessage = GvBannerImages.Rows(i).Cells(15).Text
            'dscurrentmessage = dscurrentconverstion.getrecentenquirymessage(dscurrentmessage)


            'If dscurrentmessage <> "" Then

            '    GvBannerImages.Rows(i).Cells(15).Text = dscurrentmessage
            'Else

            '    GvBannerImages.Rows(i).Cells(15).Text = "Not Yet Attended"

            'End If



            'If GvBannerImages.Rows(i).Cells(10).Text <> "" Then


            '    If GvBannerImages.Rows(i).Cells(10).Text = "6" Then

            '        GvBannerImages.Rows(i).Cells(10).Text = "Kims Secunderabad"

            '    End If


            '    If GvBannerImages.Rows(i).Cells(10).Text = "1" Then

            '        GvBannerImages.Rows(i).Cells(10).Text = "Kims Kondapur"

            '    End If

            'End If




            ''Dim lblDepartment As Label = CType(e.Item.FindControl("LblDepartment"), Label)
            ''Dim lblSpeciality As Label = CType(e.Item.FindControl("LblSpeciality"), Label)


            'Dim spArr, deptArr, institutesArr, qualArr, firstbranchArr, brancharr, doctorArr, SecondBranchTimmingsArr As Array


            'Dim spec, dept As String


            'spec = GvBannerImages.Rows(i).Cells(21).Text

            'If Not spec Is Nothing Then
            '    If spec <> "&nbsp;" Then
            '        spArr = Split(spec.Replace("$", ""), ",")
            '        spec = ""
            '        For k = 0 To UBound(spArr)
            '            If k = 0 Then
            '                spec = DsSpec.GetValueByID(spArr(k))
            '            Else
            '                spec = spec & ", " & DsSpec.GetValueByID(spArr(k))
            '            End If
            '        Next
            '        If spec <> "" Then
            '            spec = spec + "<br />"
            '            GvBannerImages.Rows(i).Cells(21).Text = spec
            '        End If
            '    End If
            'End If


            'dept = GvBannerImages.Rows(i).Cells(20).Text

            'If Not dept Is Nothing Then
            '    If dept <> "&nbsp;" Then
            '        deptArr = Split(dept.Replace("$", ""), ",")
            '        dept = ""
            '        For s = 0 To UBound(deptArr)
            '            If s = 0 Then
            '                dept = DsSpec.GetValueByID(deptArr(s))
            '            Else
            '                dept = dept & ", " & DsSpec.GetValueByID(deptArr(s))
            '            End If
            '        Next
            '        If dept <> "" Then
            '            dept = dept + "<br />"

            '            GvBannerImages.Rows(i).Cells(20).Text = dept
            '        End If
            '    End If
            'End If


            'If GvBannerImages.Rows(i).Cells(23).Text = "1" Then

            '    GvBannerImages.Rows(i).Cells(23).Text = "YES IP"

            'ElseIf GvBannerImages.Rows(i).Cells(23).Text = "2" Then

            '    GvBannerImages.Rows(i).Cells(23).Text = "YES OP"

            'ElseIf GvBannerImages.Rows(i).Cells(23).Text = "3" Then

            '    GvBannerImages.Rows(i).Cells(23).Text = "NO"
            'Else

            '    GvBannerImages.Rows(i).Cells(23).Text = "-"

            'End If

            'If GvBannerImages.Rows(i).Cells(25).Text > "1" Then

            '    GvBannerImages.Rows(i).Cells(25).Text = dsprocedure.getnamebyid(GvBannerImages.Rows(i).Cells(25).Text)

            'End If


            'If dsconversation.getenquirycount(GvBannerImages.Rows(i).Cells(26).Text) = "0" Then

            '    GvBannerImages.Rows(i).Cells(26).Text = "Call the Patinet"
            'Else
            '    Dim enquirytime As Date
            '    enquirytime = dsconversation.getfirstresponsetimebyenquiryid(GvBannerImages.Rows(i).Cells(26).Text)
            '    GvBannerImages.Rows(i).Cells(26).Text = dstimediff.getresponsetimediff(enquirytime, GvBannerImages.Rows(i).Cells(26).Text)
            '    GvBannerImages.Rows(i).Cells(26).Text = GvBannerImages.Rows(i).Cells(26).Text & "minutes"
            'End If

            'Dim lblumr As String


            'lblumr = GvBannerImages.Rows(i).Cells(27).Text

            'If lblumr = "" Then

            '    GvBannerImages.Rows(i).Cells(28).Text = "-"
            'Else
            '    GvBannerImages.Rows(i).Cells(28).Text = dsrevenue.getrelatedip(lblumr)
            'End If



        Next
    End Sub
End Class
