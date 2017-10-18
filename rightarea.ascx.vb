Imports betatesting.DataSetCareTableAdapters
Public Class rightarea
    Inherits System.Web.UI.UserControl

    Dim DsAC As New DataSetCareTableAdapters.ASKCARETableAdapter


    Dim message, subject, sendto As String
    Dim DsSpecialities As New VENDORTYPESTableAdapter
    Dim DsState As New STATETableAdapter
    Dim DsCountry As New COUNTRYTableAdapter

    Dim i As Integer



End Class