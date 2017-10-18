Imports System
Imports System.Data

Namespace WebSearch
    ''' <summary> 
    ''' Defines shared methods to create and add records to dataset 
    ''' </summary> 
    Public Class PagesDataset
        Public Sub New()
            ' 
            ' TODO: Add constructor logic here 
            ' 
        End Sub

        ''' <summary> 
        ''' Creates a datset for the pages and returns the result 
        ''' </summary> 
        Public Shared Function Create() As DataSet
            Dim pgDataSet As New DataSet()
            Dim keys As DataColumn() = New DataColumn(0) {}
            pgDataSet.Tables.Add(New DataTable("Pages"))

            pgDataSet.Tables("Pages").Columns.Add("PageId", System.Type.[GetType]("System.Int32"))
            pgDataSet.Tables("Pages").Columns.Add("Title", System.Type.[GetType]("System.String"))
            pgDataSet.Tables("Pages").Columns.Add("Description", System.Type.[GetType]("System.String"))
            pgDataSet.Tables("Pages").Columns.Add("Path", System.Type.[GetType]("System.String"))
            pgDataSet.Tables("Pages").Columns.Add("MatchCount", System.Type.[GetType]("System.Int32"))
            pgDataSet.Tables("Pages").Columns.Add("Size", System.Type.[GetType]("System.Decimal"))

            pgDataSet.Tables("Pages").Columns("PageID").AutoIncrement = True
            pgDataSet.Tables("Pages").Columns("PageID").AutoIncrementSeed = 1
            keys(0) = pgDataSet.Tables("Pages").Columns("PageId")
            pgDataSet.Tables("Pages").PrimaryKey = keys
            Return pgDataSet
        End Function

        ''' <summary> 
        ''' Creates a datset for the pages and returns the result 
        ''' </summary> 
        Public Shared Sub StoreFile(ByVal dstPgs As DataSet, ByVal srchPg As Page)
            'Objects are defined 
            Dim pageRow As DataRow

            'New row is created 
            pageRow = dstPgs.Tables("Pages").NewRow()

            'Data is added 
            pageRow("Title") = srchPg.Title
            pageRow("Description") = srchPg.Description
            pageRow("Path") = srchPg.Path
            pageRow("MatchCount") = srchPg.MatchCount
            pageRow("Size") = srchPg.Size

            'Row is added to the dataset 
            dstPgs.Tables("Pages").Rows.Add(pageRow)
        End Sub
    End Class
End Namespace