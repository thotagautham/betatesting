Imports betatesting.DataSetCareTableAdapters
Public Class templete
    Inherits System.Web.UI.Page
    Dim dsmail As New emailsTableAdapter
    Dim message, subject, sendto As String
    Dim dscontent As New emailcontent1TableAdapter
    Dim downcontent As String
    Dim topcontent As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        topcontent = dscontent.gettopcontent("2")
        downcontent = dscontent.getbottomdata("2")
        BindData()

    End Sub
    Private Sub BindDatatotal()
        'GVPrintNews.DataSource = dsmail.GetData
        'GVPrintNews.DataBind()
        buildquery()
    End Sub
    Private Sub BindData()
        'GVPrintNews.DataSource = dsmail.GetData
        'GVPrintNews.DataBind()

    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        buildquery()


        'dscontent.Insert(txtheading.Value, txtpagedescription.Value)
    End Sub
    Private Sub buildquery()

        Dim nextid As Integer
        Dim nextname As String
        Dim nextemail As String


        If CInt(dsmail.getcount("N", txtfrom.Text, txtto.Text)) > 0 Then

            nextid = dsmail.getactivenextidbetweentwoids("N", txtfrom.Text, txtto.Text)


            Dim dsunsubscribe As String

           
            nextname = dsmail.getname(nextid).Replace("�", "").Replace("?", "").Replace("Dr.", "").Replace("prof.", "")
            nextemail = dsmail.getemail(nextid)
            dsunsubscribe = "<a href='" & System.Configuration.ConfigurationManager.AppSettings("WebsiteURLgeriatrics") & "unsubscribe.aspx?email=" & nextemail & "'>Click  to Unsubscribe</a>"
            dsunsubscribe = "<a href='" & System.Configuration.ConfigurationManager.AppSettings("WebsiteURLgeriatrics") & "unsubscribe.aspx?email=" & nextemail & "'>Click Here to Unsubscribe</a><br />"
            lblemailid.Text = dsunsubscribe

            message = topcontent & _
                      "<font face='Verdana' size='2'>Dear Dr. " & nextname.Replace("�", "").Replace("?", "").Replace("Dr.", "").Replace("Prof.", "") & ", <br /><br />" & _
                      downcontent & _
                      " <br /><br />" & _
                      " <br /><br />" & _
                      " <br /><br />" & _
                      " <br /><br />" & _
 "<a href='" & System.Configuration.ConfigurationManager.AppSettings("WebsiteURL") & "unsubscribe.aspx?email=" & nextemail & "'>Click  to Unsubscribe</a>"




            subject = "2nd Global Cancer Summit-2017"
            sendto = nextemail

            Dim CF As New CommonFunctions
            CF.SendMail(message, sendto, subject)

            dsmail.Updateactive("Y", nextid)
            'LblMsg.Text = "Email sent to" & nextemail
            BindDatatotal()
        Else

            LblMsg.Text = "No Email id"

        End If






    End Sub
End Class