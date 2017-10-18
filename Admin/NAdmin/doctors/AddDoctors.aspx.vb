Imports betatesting.DataSetCareTableAdapters
Imports betatesting.newseventsTableAdapters

Partial Class Admin_Doctors_AddDoctors
    Inherits System.Web.UI.Page
    Dim DsQuali As New QUALIFICATIONTableAdapter
    Dim DsDept As New DEPARTMENTTableAdapter
    Dim DsInstitutes As New InstitutesTableAdapter
    Dim DsSp As New SPECIALIZATIONTableAdapter

    Dim DsCountry As New COUNTRYTableAdapter
    Dim DsState As New STATETableAdapter
    Dim DsCity As New CITYTableAdapter
    Dim DsBranch As New BRANCH1TableAdapter
    Dim dsbg As New BLOODGROUPTableAdapter

    Dim DsIdentity As New CurrentIdentity
    Dim DoctorId, i As Integer
    Dim VarDoctorCode As String

    Dim institutes, sp, dept, qual, branch, Firstbranch, SecondBranch As String
    Dim MondayTimings, VarAge, Hosph, HosPhExt As Integer

    Dim DocPwd, message As String

    Dim PhotoName As String
    Dim ProfileName As String
    Dim zipval, pzipval, resphnum, mobil, totexpp, preexpp, maxp As Decimal
    Dim JoiningDate As String
    'Dim MondayTimings As String
    Dim Tuesdaytimings As String
    Dim wednesdaytimings As String
    Dim Thursdaytimings As String
    Dim Fridaytimings As String
    Dim Saturdaytimings As String
    Dim sundaytimings As String
    Dim BriefProfile As String



    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "Doctors", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If

            'Fill Department

            'LBDepartments.DataSource = DsDept.GeAlltData
            'LBDepartments.DataTextField = "Departmentname"
            'LBDepartments.DataValueField = "Departmentid"

            LBDepartments.DataSource = DsSp.GetActiveDept()
            LBDepartments.DataTextField = "SPECIALIZATIONNAME"
            LBDepartments.DataValueField = "SPECIALIZATIONID"
            LBDepartments.DataBind()

            'Fill Specialities

            LBSpecialities.DataSource = DsSp.GetOnlyActiveSpecialitiesExcludingDepts
            LBSpecialities.DataTextField = "SPECIALIZATIONNAME"
            LBSpecialities.DataValueField = "SPECIALIZATIONID"
            LBSpecialities.DataBind()

            'Fill Institutes

            LBInstitutes.DataSource = DsInstitutes.GetAllData
            LBInstitutes.DataTextField = "InstituteNAME"
            LBInstitutes.DataValueField = "InstituteID"
            LBInstitutes.DataBind()

            ' Fill Country
            ddlCountry.DataSource = DsCountry.GetAllData
            ddlCountry.DataTextField = "Countryname"
            ddlCountry.DataValueField = "Countryid"
            ddlCountry.DataBind()

            ddlCountry.Items.Insert(0, "-- Select Country --")
            ddlCountry.Items(0).Value = "0"

            ddlPCountry.DataSource = DsCountry.GetAllData
            ddlPCountry.DataTextField = "Countryname"
            ddlPCountry.DataValueField = "Countryid"
            ddlPCountry.DataBind()

            ddlPCountry.Items.Insert(0, "-- Select Country --")
            ddlPCountry.Items(0).Value = "0"

            ' Fill BloodGroup
            DDLBG.DataSource = dsbg.GetAllData
            DDLBG.DataTextField = "BGVAL"
            DDLBG.DataValueField = "BGID"
            DDLBG.DataBind()

            DDLBG.Items.Insert(0, "-- Select Blood Group --")
            DDLBG.Items(0).Value = "0"

            LBBranch.DataSource = DsBranch.GetAllData(0)
            LBBranch.DataTextField = "BranchName"
            LBBranch.DataValueField = "BranchId"
            LBBranch.DataBind()

            'LBFirstBranch.DataSource = DsBranch.GetAllData(0)
            'LBFirstBranch.DataTextField = "BranchName"
            'LBFirstBranch.DataValueField = "BranchId"
            'LBFirstBranch.DataBind()

            'LBSecondBranch.DataSource = DsBranch.GetAllData(0)
            'LBSecondBranch.DataTextField = "BranchName"
            'LBSecondBranch.DataValueField = "BranchId"
            'LBSecondBranch.DataBind()


        End If
    End Sub

    Protected Sub clear()
        DoctorName.Text = ""
        DoctorCode.Text = ""

        DDLBG.SelectedIndex = -1
        LBBranch.SelectedIndex = -1
        'LBFirstBranch.SelectedIndex = -1
        'LBSecondBranch.SelectedIndex = -1
        LBDepartments.SelectedIndex = -1
        LBInstitutes.SelectedIndex = -1
        LBSpecialities.SelectedIndex = -1

        ddlPCity.SelectedIndex = -1
        ddlCity.SelectedIndex = -1

        ddlPState.SelectedIndex = -1
        ddlState.SelectedIndex = -1

        ddlCountry.SelectedIndex = -1
        ddlPCountry.SelectedIndex = -1

        TxtQualification.Text = ""

        Age.Text = ""
        Address.Text = ""
        EmailId.Text = ""
        Salutation.SelectedIndex = -1
        PAddress.Text = ""
        Zip.Text = ""
        PZip.Text = ""
        JoinDate.Text = ""
        ResPh.Text = ""
        MobPh.Text = ""
        TxtHosPh.Text = ""
        TxtHosPhExt.Text = ""

        Passport.Text = ""
        Pan.Text = ""
        Insurance.Text = ""
        MaxPatients.Text = ""

    End Sub

    Protected Sub ddlPCountry_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPCountry.SelectedIndexChanged

        ddlPState.DataSource = DsState.GetAllData(ddlPCountry.SelectedValue)
        ddlPState.DataTextField = "Statename"
        ddlPState.DataValueField = "Stateid"
        ddlPState.DataBind()

        ddlPState.Items.Insert(0, "-- Select State --")
        ddlPState.Items(0).Value = "0"

        ddlPCity.Items.Clear()
        ddlPCity.Items.Insert(0, "-- Select City --")
        ddlPCity.Items(0).Value = "0"
    End Sub

    Protected Sub ddlCountry_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ddlState.DataSource = DsState.GetAllData(ddlCountry.SelectedValue)
        ddlState.DataTextField = "Statename"
        ddlState.DataValueField = "Stateid"
        ddlState.DataBind()

        ddlState.Items.Insert(0, "-- Select State --")
        ddlState.Items(0).Value = "0"

        ddlCity.Items.Clear()
        ddlCity.Items.Insert(0, "-- Select City --")
        ddlCity.Items(0).Value = "0"
    End Sub

    Protected Sub ddlState_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ddlCity.DataSource = DsCity.GetAllData(ddlState.SelectedValue)
        ddlCity.DataTextField = "cityname"
        ddlCity.DataValueField = "cityid"
        ddlCity.DataBind()

        ddlCity.Items.Insert(0, "-- Select City --")
        ddlCity.Items(0).Value = "0"
    End Sub

    Protected Sub ddlPState_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ddlPCity.DataSource = DsCity.GetAllData(ddlPState.SelectedValue)
        ddlPCity.DataTextField = "cityname"
        ddlPCity.DataValueField = "cityid"
        ddlPCity.DataBind()

        ddlPCity.Items.Insert(0, "-- Select City --")
        ddlPCity.Items(0).Value = "0"
    End Sub

    'Protected Sub DDlDept_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
    '    ' Fill Specialization
    '    DDlDivision.DataSource = DsSp.GeAlltData(DDlDept.SelectedValue)
    '    DDlDivision.DataTextField = "Specializationname"
    '    DDlDivision.DataValueField = "specializationid"
    '    DDlDivision.DataBind()

    '    If DDlDivision.Items.Count > 0 Then
    '        DDlDivision.Visible = True
    '    Else
    '        DDlDivision.Visible = False
    '    End If

    'End Sub

    Protected Sub AddDoctors_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles AddDoctors.Click
        DoctorId = DsIdentity.GetCurrentIdentityByTableName("doctors") + 1

        Dim caredoc As New DOCTORSTableAdapter

        'If Val(caredoc.GetPrimaryCount(DoctorCode.Text)) > 0 And DoctorCode.Text <> "" Then
        '    LblMsg.Text = "Doctor Code -- [" & DoctorCode.Text & "] Already Exisits, Try With The Other!"
        '    LblMsg.ForeColor = Drawing.Color.DarkRed
        'Else
        If Val(caredoc.GetNameCount(DoctorName.Text)) > 0 Then
            LblMsg.Text = "Doctor Name -- [" & DoctorName.Text & "] Already Exisits, Try With The Other!"
            LblMsg.ForeColor = Drawing.Color.DarkRed
        ElseIf Val(caredoc.GetEmailIdCount(EmailId.Text)) > 0 Then
            LblMsg.Text = "Email Id -- [" & EmailId.Text & "] Already Exisits, Try With The Other!"
            LblMsg.ForeColor = Drawing.Color.DarkRed
        Else

            Dim i As Integer

            sp = ""
            For i = 0 To LBSpecialities.Items.Count - 1

                If LBSpecialities.Items(i).Selected Then
                    If sp = "" Then
                        sp = "$" & LBSpecialities.Items(i).Value & "$"
                    Else
                        sp = sp & ",$" & LBSpecialities.Items(i).Value & "$"
                    End If
                End If
            Next

            institutes = ""
            For i = 0 To LBInstitutes.Items.Count - 1

                If LBInstitutes.Items(i).Selected Then
                    If institutes = "" Then
                        institutes = "$" & LBInstitutes.Items(i).Value & "$"
                    Else
                        institutes = institutes & ",$" & LBInstitutes.Items(i).Value & "$"
                    End If
                End If
            Next

            dept = ""
            For i = 0 To LBDepartments.Items.Count - 1
                If LBDepartments.Items(i).Selected Then
                    If dept = "" Then
                        dept = "$" & LBDepartments.Items(i).Value & "$"
                    Else
                        dept = dept & ",$" & LBDepartments.Items(i).Value & "$"
                    End If
                End If
            Next

            branch = ""

            For i = 0 To LBBranch.Items.Count - 1
                If LBBranch.Items(i).Selected Then
                    If branch = "" Then
                        branch = "$" & LBBranch.Items(i).Value & "$"
                    Else
                        branch = branch & ",$" & LBBranch.Items(i).Value & "$"
                    End If
                End If
            Next



            'Firstbranch = ""

            'For i = 0 To LBFirstBranch.Items.Count - 1
            '    If LBFirstBranch.Items(i).Selected Then
            '        If Firstbranch = "" Then
            '            Firstbranch = "$" & LBFirstBranch.Items(i).Value & "$"
            '        Else
            '            Firstbranch = Firstbranch & ",$" & LBFirstBranch.Items(i).Value & "$"
            '        End If
            '    End If
            'Next

            'SecondBranch = ""

            'For i = 0 To LBSecondBranch.Items.Count - 1
            '    If LBSecondBranch.Items(i).Selected Then
            '        If SecondBranch = "" Then
            '            SecondBranch = "$" & LBSecondBranch.Items(i).Value & "$"
            '        Else
            '            SecondBranch = SecondBranch & ",$" & LBSecondBranch.Items(i).Value & "$"
            '        End If
            '    End If
            'Next


            VarAge = 0
            If Age.Text <> "" Then
                VarAge = Age.Text
            End If

            zipval = 0
            If Zip.Text <> "" Then
                zipval = CDbl(Zip.Text)
            End If

            'If MondayTimmings.Text = "" Then
            '    MondayTimings = "10:00am - 09:00pm"
            'Else
            '    MondayTimings = MondayTimmings.Text
            'End If

            'MondayTimings = 0
            'If MondayTimmings.Text <> "" Then
            '    MondayTimings = MondayTimmings.Text
            'End If

            'Tuesdaytimings = "10:00am - 09:00pm"
            'If Trim(TuesdayTimmings.Text) <> "" Then
            '    Tuesdaytimings = TuesdayTimmings.Text
            'End If

            'wednesdaytimings = "10:00am - 09:00pm"
            'If Trim(WednesdayTimmings.Text) <> "" Then
            '    wednesdaytimings = WednesdayTimmings.Text
            'End If

            'Thursdaytimings = "10:00am - 09:00pm"
            'If Trim(ThursdayTimmings.Text) <> "" Then
            '    Thursdaytimings = ThursdayTimmings.Text
            'End If

            'Fridaytimings = "10:00am - 09:00pm"
            'If Trim(FridayTimmings.Text) <> "" Then
            '    Fridaytimings = FridayTimmings.Text
            'End If

            'Saturdaytimings = "10:00am - 09:00pm"
            'If Trim(SaturdayTimmings.Text) <> "" Then
            '    Saturdaytimings = SaturdayTimmings.Text
            'End If

            'sundaytimings = "10:00am - 09:00pm"
            'If Trim(SundayTimmings.Text) <> "" Then
            '    sundaytimings = SundayTimmings.Text
            'End If

            pzipval = 0
            If PZip.Text <> "" Then
                pzipval = CDbl(PZip.Text)
            End If

            resphnum = 0
            If ResPh.Text <> "" Then
                resphnum = CDbl(ResPh.Text)
            End If

            mobil = 0
            If MobPh.Text <> "" Then
                mobil = CDbl(MobPh.Text)
            End If

            maxp = 0
            If MaxPatients.Text <> "" Then
                maxp = CDbl(MaxPatients.Text)
            End If

            Hosph = 0
            If IsNumeric(TxtHosPh.Text) Then
                Hosph = TxtHosPh.Text
            End If

            HosPhExt = 0
            If IsNumeric(TxtHosPhExt) Then
                HosPhExt = TxtHosPhExt.Text
            End If

            PhotoName = "no_img.jpg"
            If Photo.HasFile Then
                If Photo.PostedFile.ContentType <> "image/jpeg" And Photo.PostedFile.ContentType <> "image/pjpeg" And Photo.PostedFile.ContentType <> "image/gif" Then
                    LblMsg.Text = "Files of type[" & Photo.PostedFile.ContentType & "] are not allowed, Only Images are allowed"
                ElseIf Photo.PostedFile.ContentLength > "1048576" Then
                    LblMsg.Text = "Photo size should not exceed 1 MB"
                Else
                    PhotoName = DoctorId & "." & Right(Photo.PostedFile.FileName, 3)
                    Photo.PostedFile.SaveAs(Server.MapPath("../../../DoctorPhotos") & "/" & PhotoName)
                End If
            End If

            'ProfileName = "N/A"
            'If FUProfile.HasFile Then
            '    If FUProfile.PostedFile.ContentType <> "application/pdf" Then
            '        LblMsg.Text = "Files of type[" & FUProfile.PostedFile.ContentType & "] are not allowed, Only PDFs are allowed"
            '    ElseIf FUProfile.PostedFile.ContentLength > "1048576" Then
            '        LblMsg.Text = "PDF size should not exceed 1 MB"
            '    Else
            '        ProfileName = DoctorId & "." & Right(FUProfile.PostedFile.FileName, 3)
            '        FUProfile.PostedFile.SaveAs(Server.MapPath("../../../doctorprofiles") & "/" & ProfileName)
            '    End Ifn
            'End If

            ProfileName = txtProfilePath.Text
            If ProfileName = "" Then
                ProfileName = "#"
            End If

            If JoinDate.Text = "" Then
                JoiningDate = "1/1/1900"
            Else
                JoiningDate = JoinDate.Text
            End If

            VarDoctorCode = ""
            If DoctorCode.Text <> "" Then
                VarDoctorCode = DoctorCode.Text
            End If

            DocPwd = RandomPassword.Generate(8, 10)

            BriefProfile = Txtbriefprofile.Value

            'caredoc.InsertData(VarDoctorCode, sp, dept, TxtQualification.Text, VarAge, rblstgen.SelectedValue, Address.Text, ddlCity.SelectedValue, ddlState.SelectedValue, ddlCountry.SelectedValue, zipval, PAddress.Text, ddlPCity.SelectedValue, ddlPState.SelectedValue, ddlPCountry.SelectedValue, pzipval, resphnum, mobil, Hosph, HosPhExt, EmailId.Text, 0, "0", branch, JoiningDate, "", PhotoName, Passport.Text, Pan.Text, Insurance.Text, maxp, rblstsurgeon.SelectedValue, BillingServiceCode.Text, Salutation.Text, DoctorName.Text, DDLBG.SelectedValue, "0", "0", DocPwd, 0, 0, ProfileName, institutes)

            caredoc.InsertData(VarDoctorCode, sp, dept, TxtQualification.Text, VarAge, rblstgen.SelectedValue, Address.Text, ddlCity.SelectedValue, ddlState.SelectedValue, ddlCountry.SelectedValue, zipval, PAddress.Text, ddlPCity.SelectedValue, ddlPState.SelectedValue, ddlPCountry.SelectedValue, pzipval, resphnum, mobil, Hosph, HosPhExt, EmailId.Text, 0, "0", branch, JoiningDate, "", PhotoName, Passport.Text, Pan.Text, Insurance.Text, maxp, rblstsurgeon.SelectedValue, BillingServiceCode.Text, Salutation.Text, DoctorName.Text, DDLBG.SelectedValue, "0", "0", DocPwd, 0, 0, ProfileName, institutes, BriefProfile, Txtpresentprofile.Value, TxtQualifications.Value, txtsepcialtraining.Value, txtexperience.Value, txtexpertise.Value, txtachievements.Value, txtpublications.Value, txtawardsandhonours.Value, txtacademicexposure.Value, txttalkdelivered.Value, txtothers.Value, txtmedia.Value, MondayTimmings.Text, TuesdayTimmings.Text, WednesdayTimmings.Text, ThursdayTimmings.Text, FridayTimmings.Text, SaturdayTimmings.Text, SundayTimmings.Text)

            'If Trim(EmailId.Text) <> "" Then
            '    message = "Dear " & DoctorName.Text & ",<br /><br />" & _
            '                "This is inform you that Login Id created for you to use the doctors control panel of KIMS Hospitals.<br />" & _
            '                "<a href='http://www.KimsHospitals.com/DoctornHealthProfessionals/default.aspx'>Click Here</a> to access the control panel with the below details.<br /><br />" & _
            '                "Login Id : " & EmailId.Text & _
            '                "<br />Password : " & DocPwd & _
            '                "<br /><br />Thanks & Regards,<br />Web Support Team,<br /> KIMS Hospitals."

            '    Dim cf As New CommonFunctions
            '    cf.SendMail(message, EmailId.Text, "KIMS Hospitals Doctors Control Panel Details")

            '    LblMsg.Text = "New Doctor Added And Login Details Sent To " & EmailId.Text
            'Else
            '    LblMsg.Text = "Doctor -- [" & DoctorName.Text & "] Added Successfully Password [" & DocPwd & "]"
            'End If

            LblMsg.Text = "Doctor -- [" & DoctorName.Text & "] Added Successfully"

            clear()
        End If
    End Sub

    'Protected Sub ddlBranchName_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlBranchName.DataBound
    '    If HttpContext.Current.User.Identity.Name <> "globaladmin" Then
    '        If HttpContext.Current.Session("Branch") <> "1" Then
    '            If ddlBranchName.Items.Count > 0 Then
    '                For i = ddlBranchName.Items.Count - 1 To 0 Step -1
    '                    If ddlBranchName.Items(i).Value <> HttpContext.Current.Session("Branch") Then
    '                        ddlBranchName.Items.RemoveAt(i)
    '                    End If
    '                Next
    '            End If
    '        End If
    '    End If

    '    ddlBranchName.Items.Insert(0, "-- Select Branch --")
    '    ddlBranchName.Items(0).Value = "0"
    'End Sub

    Protected Sub DoctorCode_TextChanged(sender As Object, e As EventArgs)

    End Sub
End Class
