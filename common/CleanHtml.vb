Imports System
Imports System.Text.RegularExpressions

Namespace WebSearch
    ''' <summary> 
    ''' Summary description for CleanHtml. 
    ''' </summary> 
    Public Class CleanHtml
        Public Sub New()
            ' 
            ' TODO: Add constructor logic here 
            ' 
        End Sub
        Public Shared Function Clean(ByVal Contents As String) As String
            If Contents.IndexOf("startnav") <> -1 Then
                Dim startnav As Integer = Contents.IndexOf("startnav")
                Dim endnav As Integer = Contents.IndexOf("endnav")
                Dim lengthnav As Integer = endnav - startnav
                Dim subContents As String = Contents.Substring(startnav, lengthnav)
                Contents = Contents.Replace(subContents, "")
            End If
            Contents = Regex.Replace(Contents, "<(select|option|script|style|title)(.*?)>((.|" & vbLf & ")*?)</(select|option|script|style|title)>", " ", RegexOptions.IgnoreCase)
            Contents = Regex.Replace(Contents, "&(nbsp|quot|copy);", "")
            'Contents = regexp.Replace(Contents, "<[^>]*>", ""); 
            Contents = Regex.Replace(Contents, "<([\s\S])+?>", " ", RegexOptions.IgnoreCase).Replace(" ", " ")
            'Contents = regexp.Replace(Contents, "<[^<>]+>", " ", RegexOptions.IgnoreCase); 
            'Contents = regexp.Replace("(<(\w+)[^>]*?>(.*?)</\1>", "$1"); 
            Contents = Regex.Replace(Contents, "\W", " ")
            'Trace.Warn("File Contents", Contents); 
            Return Contents
        End Function
    End Class
End Namespace