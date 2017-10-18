Imports System
Imports System.Configuration

Namespace WebSearch
    ''' <summary> 
    ''' Properties are used to store configurations of the user 
    ''' </summary> 
    Public Class Site
        Private Shared m_ApplicationPath As String
        Public Sub New()
            ' 
            ' TODO: Add constructor logic here 
            ' 
        End Sub

        ''' <summary> 
        ''' Retreive FilesTypesToSearch of the site 
        ''' </summary> 
        Public Shared ReadOnly Property FilesTypesToSearch() As String
            Get
                Return ConfigurationManager.AppSettings("FilesTypesToSearch")
            End Get
        End Property

        ''' <summary> 
        ''' Retreive DynamicFilesTypesToSearch of the site 
        ''' </summary> 
        Public Shared ReadOnly Property DynamicFilesTypesToSearch() As String
            Get
                Return ConfigurationManager.AppSettings("DynamicFilesTypesToSearch")
            End Get
        End Property

        ''' <summary> 
        ''' Retreive BarredFolders of the site 
        ''' </summary> 
        Public Shared ReadOnly Property BarredFolders() As String
            Get
                Return ConfigurationManager.AppSettings("BarredFolders")
            End Get
        End Property

        ''' <summary> 
        ''' Retreive BarredFiles of the site 
        ''' </summary> 
        Public Shared ReadOnly Property BarredFiles() As String
            Get
                Return ConfigurationManager.AppSettings("BarredFiles")
            End Get
        End Property

        ''' <summary> 
        ''' Retreive EnglishLanguage of the site 
        ''' </summary> 
        Public Shared ReadOnly Property EnglishLanguage() As Boolean
            Get
                Return Boolean.Parse(ConfigurationManager.AppSettings("EnglishLanguage"))
            End Get
        End Property

        ''' <summary> 
        ''' Assign and retreive ApplicationPath of the site 
        ''' </summary> 
        Public Shared Property ApplicationPath() As String
            Get
                Return m_ApplicationPath
            End Get
            Set(ByVal value As String)
                m_ApplicationPath = value
            End Set
        End Property
    End Class
End Namespace