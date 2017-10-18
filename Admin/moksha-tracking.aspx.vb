Imports System.Data.SqlClient
Imports betatesting.AppointmentsTableAdapters
Imports System.IO
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web.UI.WebControls
Public Class moksha_tracking
    Inherits System.Web.UI.Page
    
    Dim message, subject, sendto As String
   
    Dim spArr, deptArr, institutesArr, qualArr, firstbranchArr, brancharr, doctorArr, SecondBranchTimmingsArr As Array
    Dim strsql, strCondition, strJoin, FirstBranch, SecondBranchTimmings As String
    Dim oracmd As SqlCommand
    Dim connString As String
    Public objConn As SqlConnection
    Dim objdata As SqlDataReader
    Dim dsstatus As New PATIENTSTATUSTableAdapter
    Dim dsleads As New ASKCARETableAdapter
    Dim doctorid As String

    Dim responsetimediff As String


    Dim dsconversation As New ENQUIRYCONVERSATIONTableAdapter
    Dim dsenquiry As New ASKCARETableAdapter
   
    Dim dt As New DataTable
    Dim ds As New DataTable
    Dim dsBannerImages As New ASKCARETableAdapter
   
    Dim dsadmins As New OtherAdminLoginsTableAdapter
    Dim pageArray As Array
    Dim PageUrl As String
    Dim dsprocedure As New ASKCAREprocedureTableAdapter
   
    Dim DtImages As DataTable

    Dim dsselection As New PATIENTSTATUSselectionTableAdapter
    Dim dstimediff As New ASKCAREdataaxisseoTableAdapter

    Dim dsascaredata As New ASKCARETableAdapter
    Dim dspotentail As New ASKCAREpotentialTableAdapter
    Dim dsqueryedit As New ASKCAREpotentialTableAdapter
    Dim enquirytime As Date
    Dim dskimsleads As New kimsleadsTableAdapter
    Dim dsaskcareleads As New ASKCAREleadsTableAdapter







    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load



        If Not IsPostBack Then





            Dim enuirynumber As String
            enuirynumber = (Request("ID"))
            DDLstatus.DataSource = dsstatus.GetAllData()
            DDLstatus.DataValueField = "PATIENTSTATUSID"
            DDLstatus.DataTextField = "PATIENTSTATUSNAME"
            DDLstatus.DataBind()

            DDLstatus.Items.Insert(0, "Status")
            DDLstatus.Items(0).Value = "0"

            'Fill Doctors Data



            responsetimecal()
          


            Dim dsdoc As New Data.DataTable
            ds = dsconversation.GetAllDataById(Request("ID"))
        End If
    End Sub
    
  
    Private Sub responsetimecal()
        If dsconversation.getenquirycount(Request("ID")) = "0" Then

            responsetime.Text = "Call the Patinet"
        Else
            enquirytime = dsconversation.getfirstresponsetimebyenquiryid(Request("ID"))
            responsetimediff = dstimediff.getresponsetimediff(enquirytime, Request("ID"))
            responsetime.Text = responsetimediff & "minutes"
        End If
    End Sub


  

    Private Sub ClearAll()

        btnSave.Text = "Save"

        DDLEnquiry_Country.SelectedIndex = -1
        DDLCITY.SelectedIndex = -1
        ddlstate.SelectedIndex = -1
        txtage.Text = ""
        txthospitalpatientname.Text = ""
        txthospitalvmrnumber.Text = ""

        txthospitaldatamobile.Text = ""
        txthospitaldataadress.Text = ""
        txthospitaldataemailid.Text = ""

        profiledata()

    End Sub
    Private Function GetListBoxSelectedItems(lb As ListBox) As String
        Dim selectedItems As String
        selectedItems = ""
        For i = 0 To lb.Items.Count - 1
            If lb.Items(i).Selected = True Then
                If (selectedItems = "") Then
                    selectedItems = "$" & lb.Items(i).Value & "$"
                Else
                    selectedItems = selectedItems & ",$" & lb.Items(i).Value & "$"
                End If
            End If
        Next i

        Return selectedItems
    End Function
    Private Function GetListBoxSelectedItemsQry(lb As ListBox, lbtype As String, setstrsql As String) As String

        For i = 0 To lb.Items.Count - 1
            If lb.Items(i).Selected = True Then
                If setstrsql = "" Then
                    setstrsql = setstrsql & " where " & lbtype & " like '%$" & lb.Items(i).Value & "$%'"
                Else
                    setstrsql = setstrsql & " or " & lbtype & " like '%$" & lb.Items(i).Value & "$%'"
                End If
            End If
        Next i

        Return setstrsql
    End Function

    Private Sub SetListBoxSelectedItems(dr As DataRow, lb As ListBox, section As String)
        If Not IsDBNull(dr(section)) Then
            pageArray = Split(dr(section).Replace("$", ""), ",")
            For i = 0 To UBound(pageArray)
                If Not lb.Items.FindByValue(pageArray(i)) Is Nothing Then
                    lb.Items.FindByValue(pageArray(i)).Selected = True
                End If
            Next
        End If
    End Sub

    Private Sub BindData()
        rptconversation.DataSource = dsconversation.GetAllDataById(Request("ID"))
        rptconversation.DataBind()
    End Sub
    Protected Sub ddlstatus_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLstatus.SelectedIndexChanged
        If (DDLstatus.SelectedIndex > 0) Then
            ddltype.Items.Clear()
            ddltype.DataSource = dsselection.GetDataByPATIENTSTATUSNAMEslection(DDLstatus.SelectedItem.Value)
            ddltype.DataValueField = "PATIENTSTATUSID"
            ddltype.DataTextField = "PATIENTSTATUSNAME"
            ddltype.DataBind()

            ddltype.Items.Insert(0, "        Select a Type")
            ddltype.Items(0).Value = "N/A"

        End If
    End Sub



    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        dsBannerImages.Updateenquirybranch(DDLBranch.SelectedItem.Value, (Request("ID")))

        Dim description As String
        description = "assigned to" & DDLBranch.SelectedItem.Text
        dsconversation.Insert(Request("ID"), "Y", description, Now(), "3", Now(), "1", "open", Session("adminaxis"), Now(), "CALL-BACK", Now())
        dstimediff.updatetrackingpage("CALL-BACK", Now(), "OPEN", Request("ID"))
        dsleads.Updatenexttrackingdate(Now(), Request("ID"))
        dsleads.updaterepliedbydata(Now(), Session("adminid"), Request("ID"), "0")

        'message = "<font face='Verdana' size='2'>Dear " & Lblname.Text & ", <br /><br />" & _
        '               "Thanks for visiting our website and giving the following details, we will get back to you as soon as possible.<br /><br /></font>" & _
        '               "<TABLE cellSpacing=5 cellPadding=0>" & _
        '               "<tr><td><font face='Verdana' size='2'>Telephone #</td><td>:</td><td><font face='Verdana' size='2'>" & Lblphonenumber.Text & "</font></td></tr>" & _
        '               "<tr><td colspan=3>&nbsp;<br /><br /></td></tr>" & _
        '               "<tr><td ><font face='Verdana' size='2'>Question category</font></td><td>:</td><td><font face='Verdana' size='2'>General Enquiry</font></td></tr>" & _
        '               "<tr><td colspan=3><font face='Verdana' size='2'>Information Required</font></td></tr>" & _
        '               "<tr><td colspan=3><font face='Verdana' size='2'>" & LBlquery.Text & "</font></td></tr></TABLE><br /><br />" & _
        '               "<font face='Verdana' size='2'>Thanks & Regards,<br />" & _
        '               "Website Support Team,<br />" & _
        '               "KIMS Hospitals. </font>"


        message = "<font face='Verdana' size='2'>Dear Admin, <br /><br />" & _
                       "Following are the enquiry details.<br /><br /></font>" & _
                       "<TABLE cellSpacing=5 cellPadding=0>" & _
                        "<tr><td><font face='Verdana' size='2'>queryid</td><td>:</td><td><font face='Verdana' size='2'>" & Request("ID") & "</font></td></tr>" & _
                       "<tr><td><font face='Verdana' size='2'>Name</td><td>:</td><td><font face='Verdana' size='2'>" & Lblname.Text & "</font></td></tr>" & _
                       "<tr><td><font face='Verdana' size='2'>Email Id </td><td>:</td><td><font face='Verdana' size='2'>" & Lblemail.Text & "</font></td></tr>" & _
                       "<tr><td><font face='Verdana' size='2'>Telephone #</td><td>:</td><td><font face='Verdana' size='2'>" & Lblphonenumber.Text & "</font></td></tr>" & _
                       "<tr><td colspan=3>&nbsp;<br /><br /></td></tr>" & _
                       "<tr><td ><font face='Verdana' size='2'>Question category</font></td><td>:</td><td><font face='Verdana' size='2'>General Enquiry</font></td></tr>" & _
                       "<tr><td colspan=3><font face='Verdana' size='2'>Information Required</font></td></tr>" & _
                       "<tr><td colspan=3><font face='Verdana' size='2'>" & LBlquery.Text & "</font></td></tr></TABLE><br /><br />" & _
                       "<font face='Verdana' size='2'>Thanks & Regards,<br />" & _
                       "Website Support Team,<br />" & _
                       "KIMS Hospitals. </font>"
        Dim enquirysubject As String


        enquirysubject = lblsource.Text & " Assigned to  " & DDLBranch.SelectedItem.Text
        subject = enquirysubject


        If DDLBranch.SelectedItem.Value = "1" And lblsource.Text <> "Appointment" Then

            sendto = "arti.as@kimshospitals.com"
        Else
            sendto = "assistance@kimshospitals.com"
        End If

        'subject = "Enquiry -- www.KimsHospitals.com"


        'Dim CF As New CommonFunctions
        'CF.SendMail(message, sendto, subject)


        'message = "<font face='Verdana' size='2'>Dear " & Lblname.Text & ", <br /><br />" & _
        '               "Thanks for visiting our website and giving the following details, we will get back to you as soon as possible.<br /><br /></font>" & _
        '               "<TABLE cellSpacing=5 cellPadding=0>" & _
        '               "<tr><td><font face='Verdana' size='2'>Telephone #</td><td>:</td><td><font face='Verdana' size='2'>" & Lblphonenumber.Text & "</font></td></tr>" & _
        '               "<tr><td colspan=3>&nbsp;<br /><br /></td></tr>" & _
        '               "<tr><td ><font face='Verdana' size='2'>Question category</font></td><td>:</td><td><font face='Verdana' size='2'>General Enquiry</font></td></tr>" & _
        '               "<tr><td colspan=3><font face='Verdana' size='2'>Information Required</font></td></tr>" & _
        '               "<tr><td colspan=3><font face='Verdana' size='2'>" & LBlquery.Text & "</font></td></tr></TABLE><br /><br />" & _
        '               "<font face='Verdana' size='2'>Thanks & Regards,<br />" & _
        '               "Website Support Team,<br />" & _
        '               "KIMS Hospitals. </font>"

        'sendto = System.Configuration.ConfigurationManager.AppSettings("AskEmailID")

        'CF.SendMail(message, sendto, subject)

        'Page.ClientScript.RegisterStartupScript(Me.GetType(), "Appointment", "alert('Assinged Successfully!');", True)


        rptconversation.DataSource = dsconversation.GetAllDataById(Request("ID"))
        rptconversation.DataBind()
        responsetimecal()
        ClearAll()
    End Sub


    


    Protected Sub rptconversation_ItemDataBound(sender As Object, e As RepeaterItemEventArgs) Handles rptconversation.ItemDataBound
        Dim lblentrydate As Label = CType(e.Item.FindControl("lblentrydate"), Label)
        Dim lblnexttrackingdate As Label = CType(e.Item.FindControl("lblnexttrackingdate"), Label)


        If Not lblentrydate Is Nothing Then
            Dim entrydate As Date
            entrydate = lblentrydate.Text
            entrydate = entrydate.AddMinutes(750)
            lblentrydate.Text = entrydate
        End If


        If Not lblnexttrackingdate Is Nothing Then
            Dim nexttrackingdate As Date
            nexttrackingdate = lblnexttrackingdate.Text
            nexttrackingdate = nexttrackingdate.AddMinutes(750)
            lblnexttrackingdate.Text = nexttrackingdate
        End If

    End Sub

    Protected Sub btnstatus_Click(sender As Object, e As EventArgs) Handles btnstatus.Click

        LblMsg.Text = ""

        If DDLstatus.SelectedItem.Value = "3" Then
            txtdate.Text = "01/01/2030"

        End If
        If DDLstatus.SelectedItem.Value = "4" Then

            txtdate.Text = "01/01/2030"
        End If

        If DDLstatus.SelectedItem.Value = "0" Then
            LblMsg.Text = "Please status"


        Else
            If txtdate.Text = "" Then
                LblMsg.Text = "Please Enter Tracking Date"
            Else
                If txtDescription.Text = "" Then
                    LblMsg.Text = "Please Description"
                Else





                    dsconversation.Insert(Request("ID"), "Y", txtDescription.Text, Now(), ddlrating.SelectedItem.Value, txtdate.Text, DDLstatus.SelectedItem.Value, DDLstatus.SelectedItem.Text, Session("adminaxis"), Now(), ddltype.SelectedItem.Text, Now())
                    dstimediff.updatetrackingpage(ddltype.SelectedItem.Text, Now(), DDLstatus.SelectedItem.Text, Request("ID"))
                    dsleads.Updatenexttrackingdate(txtdate.Text, Request("ID"))
                    dsleads.updaterepliedbydata(txtdate.Text, Session("adminid"), Request("ID"), "0")

                    DDLstatus.SelectedIndex = -1
                    ddltype.SelectedIndex = -1
                    ddlrating.SelectedIndex = -1
                    txtDescription.Text = ""
                    txtdate.Text = ""

                    LblMsg.Text = "Conversation Added Successfully"

                End If
            End If
        End If
        'gvrevenue.DataSource = dskimsrevenue.GetDataByumrnumber(lblpatientumr.Text)
        'gvrevenue.DataBind()
        rptconversation.DataSource = dsconversation.GetAllDataById(Request("ID"))
        rptconversation.DataBind()



        ClearAll()
    End Sub
End Class