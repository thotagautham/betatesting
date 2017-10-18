Imports System
Imports System.Text.RegularExpressions

Namespace WebSearch

    '********************************************************************* 
    ' 
    ' SearchCriteria enumeration 
    ' 
    ' An enumeration to the save the type of search 
    ' 
    '********************************************************************* 
    Public Enum SearchCriteria
        AllWords
        AnyWords
        Phrase
    End Enum
    Public Class Page
        'private 
        Private m_path As String = ""
        Private m_title As String = ""
        Private m_keywords As String = ""
        Private m_description As String = ""
        Private m_contents As String = ""
        Private m_matchcount As Integer = 0
        Private m_size As Decimal = 0
        Public Sub New()
            ' 
            ' TODO: Add constructor logic here 
            ' 
        End Sub

        ''' <summary> 
        ''' Assign and retreive Size of the file 
        ''' </summary> 
        Public Property Size() As Decimal
            Get
                Return m_size
            End Get
            Set(ByVal value As Decimal)
                m_size = value
            End Set
        End Property

        ''' <summary> 
        ''' Assign and retreive path of the file 
        ''' </summary> 
        Public Property Path() As String
            Get
                Return m_path
            End Get
            Set(ByVal value As String)
                m_path = value
            End Set
        End Property

        ''' <summary> 
        ''' Assign and retreive title of the file 
        ''' </summary> 
        Public Property Title() As String
            Get
                Return m_title
            End Get
            Set(ByVal value As String)
                m_title = value
            End Set
        End Property

        ''' <summary> 
        ''' Assign and retreive Keywords ( meta tags ) of the file 
        ''' </summary> 
        Public Property Keywords() As String
            Get
                Return m_keywords
            End Get
            Set(ByVal value As String)
                m_keywords = value
            End Set
        End Property

        ''' <summary> 
        ''' Assign and retreive description ( meta tags ) of the file 
        ''' </summary> 
        Public Property Description() As String
            Get
                Return m_description
            End Get
            Set(ByVal value As String)
                m_description = value
            End Set
        End Property

        ''' <summary> 
        ''' Assign and retreive contents of the file 
        ''' </summary> 
        Public Property Contents() As String
            Get
                Return m_contents
            End Get
            Set(ByVal value As String)
                m_contents = value
            End Set
        End Property

        ''' <summary> 
        ''' Assign and retreive MatchCount of the file 
        ''' </summary> 
        Public Property MatchCount() As Integer
            Get
                Return m_matchcount
            End Get
            Set(ByVal value As Integer)
                m_matchcount = value
            End Set
        End Property

        ''' <summary> 
        ''' Subroutine to the check the file contains title and decription 
        ''' </summary> 
        Public Sub CheckFileInfo()
            If m_title Is Nothing OrElse m_title.Trim().Equals("") Then
                m_title = "No Title"
            End If
            If m_description Is Nothing OrElse m_description.Trim().Equals("") Then
                If m_contents Is Nothing OrElse m_contents.Trim().Equals("") Then
                    m_description = "There is no description available for this page"
                Else
                    If m_contents.Length > 200 Then
                        m_description = m_contents.Substring(0, 200)
                    Else
                        m_description = m_contents
                    End If
                End If
            End If
        End Sub

        ''' <summary> 
        ''' Subroutine to the search file 
        ''' </summary> 
        Public Sub Search(ByVal strSearchWords As String, ByVal SrchCriteria As SearchCriteria)
            If SrchCriteria = SearchCriteria.Phrase Then
                SearchPhrase(strSearchWords)
            Else
                SearchWords(strSearchWords, SrchCriteria)
            End If
        End Sub

        ''' <summary> 
        ''' Subroutine to the search file 
        ''' </summary> 
        Public Sub SearchPhrase(ByVal strSearchWords As String)
            Dim mtches As MatchCollection
            mtches = Regex.Matches(m_contents, [String].Format("\b{0}\b", strSearchWords), RegexOptions.IgnoreCase)
            If mtches.Count > 0 Then
                m_matchcount = mtches.Count
            End If

        End Sub

        ''' <summary> 
        ''' Subroutine to the search file 
        ''' </summary> 
        Public Sub SearchWords(ByVal strSearchWords As String, ByVal SrchCriteria As SearchCriteria)
            Dim intSearchLoopCounter As Integer
            Dim sarySearchWord As String()
            Dim mtches As MatchCollection
            Dim del As Char() = {" "c}
            sarySearchWord = strSearchWords.Trim().Split(del)
            For intSearchLoopCounter = 0 To sarySearchWord.Length - 1
                mtches = Regex.Matches(m_contents, [String].Format("\b{0}\b", sarySearchWord(intSearchLoopCounter)), RegexOptions.IgnoreCase)
                If SrchCriteria = SearchCriteria.AnyWords Then
                    m_matchcount = m_matchcount + mtches.Count
                ElseIf SrchCriteria = SearchCriteria.AllWords Then
                    'Check to see if any of the words have been found 
                    If mtches.Count > 0 Then
                        'Get the number of times the search word is matched 

                        If m_matchcount = 0 OrElse (m_matchcount > 0 AndAlso m_matchcount > mtches.Count) Then
                            m_matchcount = mtches.Count
                        End If
                    Else
                        'If the search word is not found then set the search found variable back to false as one of the words has not been found 
                        m_matchcount = 0
                        Exit Sub
                    End If

                End If

            Next

        End Sub
    End Class
End Namespace