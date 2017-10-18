Imports System.Data
Imports betatesting.cmsTableAdapters
Imports betatesting.HeaderBannerTableAdapters
Imports betatesting.AppointmentsTableAdapters
Imports System.Data.SqlClient
Public Class kfrc
    Inherits System.Web.UI.MasterPage

    Dim dspages As New kfrckimsPagesTableAdapter
    Dim dt As DataTable


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim pageurl As String

        pageurl = Request.Url.ToString.ToLower.Replace("http://", "").Replace("www.", "").Replace("default.aspx", "").Replace("default", "")

        dt = dspages.GetDataBypageurl(pageurl)


        Dim seopagetitle As String

        seopagetitle = dt.Rows(0)("pagetittle").ToString()

        If seopagetitle = "" Then
            Me.Page.Title = dt.Rows(0)("kimsPageId").ToString().Replace("-", " ").Replace("www.", "").Replace("/", "").Replace("http", "")
        Else
            Me.Page.Title = dt.Rows(0)("pagetittle").ToString()
        End If
        Dim keywords As New HtmlMeta()
        keywords.HttpEquiv = "keywords"
        keywords.Name = "keywords"
        keywords.Content = dt.Rows(0)("pagekeywords").ToString()
        If keywords.Content = "" Then
            keywords.Content = dt.Rows(0)("kimsPageId").ToString().Replace("-", " ").Replace("www.", "").Replace("/", "").Replace("http", "")
        End If
        Me.Page.Header.Controls.Add(keywords)

        'Add Description Meta Tag
        Dim description As New HtmlMeta()
        description.HttpEquiv = "description"
        description.Name = "description"
        description.Content = dt.Rows(0)("pagemetatags").ToString()
        If description.Content = "" Then
            description.Content = dt.Rows(0)("kimsPageId").ToString().Replace("-", " ").Replace("www.", "").Replace("/", "").Replace("http", "")
        End If
        Me.Page.Header.Controls.Add(description)

        Dim pagecontent As String

        pagecontent = dt.Rows(0)("contenttopleft").ToString()

        If pagecontent = "" Then

            Lblcontent.Text = "Page Under Construction"
        Else
            Lblcontent.Text = pagecontent
        End If

    End Sub

End Class