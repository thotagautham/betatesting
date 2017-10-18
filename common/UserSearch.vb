Imports System
Imports System.Text
Imports System.Text.RegularExpressions
Imports System.IO
Imports System.Diagnostics
Imports System.Data


Namespace WebSearch
    ''' <summary> 
    ''' Properties are used to store search data of the user 
    ''' </summary> 
    Public Class UserSearch
        Private m_totalFilesSearched As Integer = 0
        Private m_totalFilesFound As Integer = 0
        Private m_searchCriteria As SearchCriteria = SearchCriteria.AllWords
        Private m_searchWords As String = ""
        Private m_dstPages As DataSet
        Private m_page As New System.Web.UI.Page()
        Public Sub New()
            ' 
            ' TODO: Add constructor logic here 
            ' 
        End Sub

        ''' <summary> 
        ''' Retreive TotalFilesSearched of the site 
        ''' </summary> 
        Public ReadOnly Property TotalFilesSearched() As Integer
            Get
                Return m_totalFilesSearched
            End Get
        End Property

        ''' <summary> 
        ''' Retreive TotalFilesFound of the site 
        ''' </summary> 
        Public ReadOnly Property TotalFilesFound() As Integer
            Get
                Return m_totalFilesFound
            End Get
        End Property

        ''' <summary> 
        ''' Retreive data of tzh entire site of the site 
        ''' </summary> 
        Public ReadOnly Property PageDataset() As DataSet
            Get
                Return m_dstPages
            End Get
        End Property

        ''' <summary> 
        ''' Assign and retreive SearchCriteria of the site 
        ''' </summary> 
        Public Property SearchCriteria() As SearchCriteria
            Get
                Return m_searchCriteria
            End Get
            Set(ByVal value As SearchCriteria)
                m_searchCriteria = value
            End Set
        End Property

        ''' <summary> 
        ''' Assign and retreive SearchWords of the site 
        ''' </summary> 
        Public Property SearchWords() As String
            Get
                Return m_searchWords
            End Get
            Set(ByVal value As String)
                m_searchWords = value
            End Set
        End Property

        ''' <summary> 
        ''' Search the entire site 
        ''' </summary> 
        Public Function Search(ByVal targetDirectory As String) As DataSet
            'If the site is in English then use the server HTML encode method 
            If Site.EnglishLanguage = True Then
                m_searchWords = m_page.Server.HtmlEncode(m_searchWords)
            Else
                'Just replace the script tag <> with HTML encoded &lt; and &gt; 
                m_searchWords = m_searchWords.Replace("<", "&lt;")
                m_searchWords = m_searchWords.Replace(">", "&gt;")
            End If
            If m_dstPages Is Nothing Then
                m_dstPages = PagesDataset.Create()
            End If

            ProcessDirectory(targetDirectory)
            Return m_dstPages
        End Function

        ''' <summary> 
        ''' Files in the directories are searched 
        ''' </summary> 
        Private Sub ProcessDirectory(ByVal targetDirectory As String)
            Dim fileEntries As String()
            Dim subdirectoryEntries As String()

            fileEntries = Directory.GetFiles(targetDirectory)
            For Each filePath As String In fileEntries
                m_totalFilesSearched += 1
                ProcessFile(filePath)
            Next

            subdirectoryEntries = Directory.GetDirectories(targetDirectory)
            'Recurse into subdirectories of this directory 
            For Each subdirectory As String In subdirectoryEntries
                'Check to make sure the folder about to be searched is not a barred folder if it is then don't search 
                If Site.BarredFolders.IndexOf(Path.GetFileName(subdirectory)) < 0 Then
                    ProcessDirectory(subdirectory)
                End If
            Next

        End Sub

        ''' <summary> 
        ''' Real logic for processing found files would go here. 
        ''' </summary> 
        Private Sub ProcessFile(ByVal FPath As String)
            Dim srchFile As Page

            srchFile = GetInfo(FPath)
            If srchFile IsNot Nothing Then
                srchFile.Search(m_searchWords, m_searchCriteria)
                If srchFile.MatchCount > 0 Then
                    m_totalFilesFound += 1
                    'Response.Write(srchFile.Contents) 
                    srchFile.CheckFileInfo()
                    PagesDataset.StoreFile(m_dstPages, srchFile)
                End If
            End If
        End Sub

        ''' <summary> 
        ''' File data is picked in this method 
        ''' </summary> 
        Private Function GetInfo(ByVal FPath As String) As Page
            Dim fileInform As New FileInfo(FPath)
            Dim srchFile As New Page()
            Dim strBldFile As New StringBuilder()
            'Check the file extension to make sure the file is of the extension type to be searched 
            If Site.FilesTypesToSearch.IndexOf(fileInform.Extension) >= 0 Then
                'm_page.Trace.Warn("File ext.", fileInform.Extension); 
                'Check to make sure the file about to be searched is not a barred file if it is don't search the file 
                If Site.BarredFiles.IndexOf(Path.GetFileName(FPath)) < 0 Then
                    'm_page.Trace.Warn("File", FPath) 
                    If Not File.Exists(FPath) Then
                        'm_page.Trace.Warn("Error", String.Format("{0} does not exist.", FPath)) 
                        'Add throw excetion here 
                        ' 
                        ' 
                        Return Nothing
                    End If
                    GetFileInfo(FPath, srchFile)

                    Return srchFile
                End If
            End If
            Return Nothing
        End Function

        ''' <summary> 
        ''' File path is modfied to be displayed as hyperlink in this method 
        ''' </summary> 
        Private Sub GetFilePath(ByVal strFileURL As String, ByVal srchFile As Page)
            'Turn the server path to the file into a URL path to the file 
            strFileURL = strFileURL.Replace(m_page.Server.MapPath("./"), "")
            'Replace the NT backslash with the internet forward slash in the URL to the file 
            strFileURL = strFileURL.Replace("\", "/")
            'Encode the file name and path into the URL code method 
            strFileURL = m_page.Server.UrlEncode(strFileURL)
            'Just incase it's encoded any backslashes 
            strFileURL = strFileURL.Trim().Replace("%2f", "/")
            srchFile.Path = strFileURL
            'm_page.Trace.Warn("Url", srchFile.Path) 
        End Sub

        ''' <summary> 
        ''' File data is picked in this method 
        ''' </summary> 

        Private Sub GetFileInfo(ByVal FPath As String, ByVal srchFile As Page)
            Dim fileInform As New FileInfo(FPath)
            Dim strBldFile As New StringBuilder()
            Dim fileSize As Decimal = fileInform.Length / 1024
            srchFile.Size = fileSize
            GetFilePath(FPath, srchFile)
            If Site.DynamicFilesTypesToSearch.IndexOf(fileInform.Extension) >= 0 AndAlso fileInform.Extension <> "" Then
                m_page.Trace.Warn("Path", [String].Format("{0}/{1}", Site.DynamicFilesTypesToSearch, Site.DynamicFilesTypesToSearch.IndexOf(fileInform.Extension)))
                m_page.Trace.Warn("Path", [String].Format("{0}/{1}", "", srchFile.Path))
                GetDynamicFileContent(srchFile)
            Else
                GetStaticFileContent(FPath, srchFile)
            End If
            If Not srchFile.Contents.Equals("") Then
                'Read in the title of the file 
                'srchFile.Title = GetMetaContent(srchFile.Contents, "<title>", "</title>")
                srchFile.Title = GetMetaContent(srchFile.Contents, "title=""", """")
                'm_page.Trace.Warn("Page Title", strPageTitle) 
                'Read in the description meta tag of the file 
                srchFile.Description = GetMetaContent(srchFile.Contents, "<meta name=""description"" content=""", """>")
                'm_page.Trace.Warn("Page Desc", strPageDescription) 
                'Read in the keywords of the file 
                srchFile.Keywords = GetMetaContent(srchFile.Contents, "<meta name=""keywords"" content=""", """>")
                'm_page.Trace.Warn("Page Keywords", strPageKeywords) 
                srchFile.Contents = CleanHtml.Clean(srchFile.Contents)
                srchFile.Contents = strBldFile.AppendFormat("{0} {1} {2} {3}", srchFile.Contents, srchFile.Description, srchFile.Keywords, srchFile.Title).ToString().Trim()
                'm_page.Trace.Warn("File Info", strBldFile.ToString) 
            End If
        End Sub
        '''<summary> 
        ''' File Content is picked in this method 
        '''</summary> 
        Private Sub GetStaticFileContent(ByVal FPath As String, ByVal srchFile As Page)
            Dim sr As StreamReader
            sr = File.OpenText(FPath)
            Try
                srchFile.Contents = sr.ReadToEnd()
                sr.Close()
            Catch ex As Exception
                'm_page.Trace.Warn("Error", ex.Message) 
            End Try
        End Sub

        '''<summary> 
        ''' File Content is picked in this method 
        '''</summary> 
        Private Sub GetDynamicFileContent(ByVal srchFile As Page)
            Dim wcMicrosoft As System.Net.WebClient
            Dim objUTF8Encoding As UTF8Encoding
            wcMicrosoft = New System.Net.WebClient()
            objUTF8Encoding = New UTF8Encoding()
            srchFile.Contents = objUTF8Encoding.GetString(wcMicrosoft.DownloadData([String].Format("{0}", Site.ApplicationPath, srchFile.Path)))
        End Sub

        '''<summary> 
        ''' Metacontent is stripped in this method 
        '''</summary> 
        Private Function GetMetaContent(ByVal strFile As String, ByVal strMetaStart As String, ByVal strMetaEnd As String) As String
            'List the text between the title tags: 
            Dim regexp As Regex
            Dim strMeta As String
            Dim strPattern As String
            Dim strInPattern As String

            'If no description or keywords are found then you may be using http-equiv= instead of name= in your meta tags 
            If strFile.ToLower().IndexOf(strMetaStart) = -1 AndAlso strMetaStart.IndexOf("name=") <> -1 Then
                'Swap name= for http-equiv= 
                strMetaStart = strMetaStart.Replace("name=", "http-equiv=")
            End If
            'Build Pattern 
            strInPattern = "((.|" & vbLf & ")*?)"
            strPattern = [String].Format("{0}{1}{2}", strMetaStart, strInPattern, strMetaEnd)
            regexp = New Regex(strPattern, RegexOptions.IgnoreCase)
            'Match Pattern 
            strMeta = regexp.Match(strFile).ToString()
            'Build Pattern 
            strInPattern = "(.*?)"
            strPattern = [String].Format("{0}{1}{2}", strMetaStart, strInPattern, strMetaEnd)
            'Get Pattern content 
            strMeta = Regex.Replace(strMeta, strPattern, "$1", RegexOptions.IgnoreCase)
            Return strMeta
        End Function
    End Class
End Namespace