Imports betatesting.DataSetCareTableAdapters
Imports betatesting.cmsTableAdapters
Public Class edit_board_menbers
    Inherits System.Web.UI.Page
    Dim DsQuali As New QUALIFICATIONTableAdapter
   

    Dim DsCountry As New COUNTRYTableAdapter
    Dim DsState As New STATETableAdapter
    Dim DsCity As New CITYTableAdapter
   
    Dim dsbg As New BLOODGROUPTableAdapter
    Dim ProfileName As String

    Dim DsDoc As New kfrcdoctorstableadapter
    Dim VarAge, Hosph, HosPhExt As Integer

    Dim PhotoName, JoiningDate As String
    Dim MondayTimings As String
    Dim Tuesdaytimings As String
    Dim wednesdaytimings As String
    Dim Thursdaytimings As String
    Dim Fridaytimings As String
    Dim Saturdaytimings As String
    Dim sundaytimings As String
    Dim meta As String
    Dim SecMondayTimings As String
    Dim SecTuesdayTimings As String
    Dim Secwednesdaytimings As String
    Dim SecThursdaytimings As String
    Dim SecFridaytimings As String
    Dim SecSaturdaytimings As String
    Dim Secsundaytimings As String


    Dim i As Integer
    Dim docarr As Array
    Dim sp, dept, qual, institutes, branch, firbranch, secbranch, FirstBranch, secondbranch, SecondBranchTimmings As String
    Dim spArr, deptArr, institutesArr, qualArr, branchArr, FirstBranchArr, secbranchArr, SecondBranchTimmingsArr As Array
    Dim zipval, pzipval, resphnum, mobil, totexpp, preexpp, maxp As Decimal

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not IsPostBack Then

            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "Doctors", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If

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
            DDlBG.DataSource = dsbg.GetAllData
            DDLBG.DataTextField = "BGVAL"
            DDLBG.DataValueField = "BGID"
            DDLBG.DataBind()

            DDLBG.Items.Insert(0, "-- Select Blood Group --")
            DDLBG.Items(0).Value = "0"


            'Fill Department

          


            'Fill Doctors Data
            Dim DtDoc As New Data.DataTable
            Dim dtrow As Data.DataRow
            DtDoc = DsDoc.GetAllActiveDataByID(Request("DocID"))
            If DtDoc.Rows.Count > 0 Then
                dtrow = DtDoc.Rows(0)

                'If HttpContext.Current.User.Identity.Name <> "globaladmin" Then
                '    If HttpContext.Current.Session("Branch") <> "1" Then
                '        If HttpContext.Current.Session("Branch") <> dtrow("Branch") Then
                '            Response.Redirect("../default.aspx")
                '        End If
                '    End If
                'End If

                If Not IsDBNull(dtrow("designation")) Then
                    DoctorCode.Text = dtrow("designation")
                End If
                'If Not IsDBNull(dtrow("metatags")) Then
                '    txtmeta.Value = dtrow("metatags")
                'End If

                If Not IsDBNull(dtrow("emailid")) Then
                    EmailId.Text = dtrow("emailid")
                End If

                DoctorName.Text = dtrow("name")
                If Not IsDBNull(dtrow("Salutation")) Then
                    Salutation.Items.FindByValue(dtrow("Salutation")).Selected = True
                End If

                If Not IsDBNull(dtrow("age")) Then
                    Age.Text = dtrow("age")
                End If

                If Not IsDBNull(dtrow("gender")) Then
                    rblstgen.Items.FindByValue(Trim(dtrow("gender"))).Selected = True
                End If

                'If Not IsDBNull(dtrow("grade")) Then
                '    If Not Nullable(DDLGrade.Items.FindByValue(dtrow("grade"))) Then
                '        DDLGrade.Items.FindByValue(dtrow("grade")).Selected = True
                '    End If

                'End If

                If Not IsDBNull(dtrow("surgeon")) Then
                    RBLstSur.Items.FindByValue(dtrow("surgeon")).Selected = True
                End If

                If Not IsDBNull(dtrow("bldgrp")) Then
                    DDlBG.Items.FindByValue(dtrow("bldgrp")).Selected = True
                End If

                If Not IsDBNull(dtrow("photo")) Then

                    ImgPhoto.ImageUrl = "~/DoctorPhotos/" & dtrow("photo")
                    ImgPhoto.Visible = True
                    LblDocPhoto.Text = dtrow("photo")

                End If

              


                If Not IsDBNull(dtrow("qualification")) Then
                    TxtQualification.Text = dtrow("qualification")
                End If

                ' Fill Permanent Address
                If Not IsDBNull(dtrow("address")) Then
                    Address.Text = dtrow("address")
                End If

                If Not IsDBNull(dtrow("metatags")) Then
                    txtmetades.Text = dtrow("metatags")
                End If

                If Not IsDBNull(dtrow("metakeywords")) Then
                    txtmetakeyword.Text = dtrow("metakeywords")
                End If

                If Not IsDBNull(dtrow("metatitle")) Then
                    txtmetatitle.Text = dtrow("metatitle")
                End If

               


                If Not IsDBNull(dtrow("BriefProfile")) Then
                    Txtbriefprofile.Value = dtrow("BriefProfile")
                End If


                If Not IsDBNull(dtrow("PresentPosition")) Then
                    Txtpresentposition.Value = dtrow("PresentPosition")
                End If


                If Not IsDBNull(dtrow("Qualifications")) Then
                    TxtQualifications.Value = dtrow("Qualifications")
                End If


                If Not IsDBNull(dtrow("SpecialTraining")) Then
                    txtsepcialtraining.Value = dtrow("SpecialTraining")
                End If


                If Not IsDBNull(dtrow("Experience")) Then
                    txtexperience.Value = dtrow("Experience")
                End If


                If Not IsDBNull(dtrow("Expertise")) Then
                    txtexpertise.Value = dtrow("Expertise")
                End If


                If Not IsDBNull(dtrow("AchievementsBreakthroughCases")) Then
                    txtachievements.Value = dtrow("AchievementsBreakthroughCases")
                End If


                If Not IsDBNull(dtrow("Publications")) Then
                    txtpublications.Value = dtrow("Publications")
                End If




                If Not IsDBNull(dtrow("AwardsAndHonors")) Then
                    txtawardsandhonours.Value = dtrow("AwardsAndHonors")
                End If


                If Not IsDBNull(dtrow("AcademicExposure")) Then
                    txtacademicexposure.Value = dtrow("AcademicExposure")
                End If


                If Not IsDBNull(dtrow("TalkDelivered")) Then
                    txttalkdelivered.Value = dtrow("TalkDelivered")
                End If


                If Not IsDBNull(dtrow("Other")) Then
                    txtothers.Value = dtrow("Other")
                End If


                If Not IsDBNull(dtrow("Media")) Then
                    txtmedia.Value = dtrow("Media")
                End If


                If Not IsDBNull(dtrow("MondayTimmings")) Then
                    MondayTimmings.Text = dtrow("MondayTimmings")
                End If

                If Not IsDBNull(dtrow("TuesdayTimmings")) Then
                    TuesdayTimmings.Text = dtrow("TuesdayTimmings")
                End If

                If Not IsDBNull(dtrow("WednesdayTimmings")) Then
                    WednesdayTimmings.Text = dtrow("WednesdayTimmings")
                End If

                If Not IsDBNull(dtrow("ThursdayTimmings")) Then
                    ThursdayTimmings.Text = dtrow("ThursdayTimmings")
                End If

                If Not IsDBNull(dtrow("FridayTimmings")) Then
                    FridayTimmings.Text = dtrow("FridayTimmings")
                End If

                If Not IsDBNull(dtrow("SaturdayTimmings")) Then
                    SaturdayTimmings.Text = dtrow("SaturdayTimmings")
                End If

                If Not IsDBNull(dtrow("SundayTimmings")) Then
                    SundayTimmings.Text = dtrow("SundayTimmings")
                End If

                If Not IsDBNull(dtrow("country")) Then
                    ddlCountry.Items.FindByValue(dtrow("country")).Selected = True

                    ddlState.DataSource = DsState.GetAllData(dtrow("country"))
                    ddlState.DataTextField = "Statename"
                    ddlState.DataValueField = "Stateid"
                    ddlState.DataBind()

                End If
                ddlState.Items.Insert(0, "-- Select State --")
                ddlState.Items(0).Value = "0"

                If Not IsDBNull(dtrow("state")) Then
                    ddlState.Items.FindByValue(dtrow("state")).Selected = True

                    ddlCity.DataSource = DsCity.GetAllData(dtrow("state"))
                    ddlCity.DataTextField = "cityname"
                    ddlCity.DataValueField = "cityid"
                    ddlCity.DataBind()
                End If

                ddlCity.Items.Insert(0, "-- Select City --")
                ddlCity.Items(0).Value = "0"

                If Not IsDBNull(dtrow("city")) Then
                    ddlCity.Items.FindByValue(dtrow("city")).Selected = True
                End If


                If Not IsDBNull(dtrow("zip")) Then
                    Zip.Text = dtrow("zip")
                End If


                ' Fill Present Address

                If Not IsDBNull(dtrow("paddress")) Then
                    PAddress.Text = dtrow("paddress")
                End If

                If Not IsDBNull(dtrow("pcountry")) Then
                    ddlPCountry.Items.FindByValue(dtrow("pcountry")).Selected = True

                    ddlPState.DataSource = DsState.GetAllData(dtrow("pcountry"))
                    ddlPState.DataTextField = "Statename"
                    ddlPState.DataValueField = "Stateid"
                    ddlPState.DataBind()
                End If


                ddlPState.Items.Insert(0, "-- Select State --")
                ddlPState.Items(0).Value = "0"

                If Not IsDBNull(dtrow("pstate")) Then
                    ddlPState.Items.FindByValue(dtrow("pstate")).Selected = True

                    ddlPCity.DataSource = DsCity.GetAllData(dtrow("pstate"))
                    ddlPCity.DataTextField = "cityname"
                    ddlPCity.DataValueField = "cityid"
                    ddlPCity.DataBind()
                End If

                ddlPCity.Items.Insert(0, "-- Select City --")
                ddlPCity.Items(0).Value = "0"

                If Not IsDBNull(dtrow("pcity")) Then
                    ddlPCity.Items.FindByValue(dtrow("pcity")).Selected = True
                End If

                If Not IsDBNull(dtrow("pzip")) Then
                    PZip.Text = dtrow("pzip")
                End If


                If Not IsDBNull(dtrow("residenceph")) Then
                    ResPh.Text = dtrow("residenceph")
                End If

                If Not IsDBNull(dtrow("mobile")) Then
                    MobPh.Text = dtrow("mobile")
                End If

                If Not IsDBNull(dtrow("hospitalph")) Then
                    TxtHosPh.Text = dtrow("hospitalph")
                End If

                If Not IsDBNull(dtrow("hospitalphext")) Then
                    TxtHosPhExt.Text = dtrow("hospitalphext")
                End If


                If Not IsDBNull(dtrow("billingservicecode")) Then
                    BillingServiceCode.Text = dtrow("billingservicecode")
                End If


                If Not IsDBNull(dtrow("joiningdatetime")) Then
                    JoinDate.Text = dtrow("joiningdatetime")
                End If

                If Not IsDBNull(dtrow("passportinteger")) Then
                    Passport.Text = dtrow("passportinteger")
                End If

                If Not IsDBNull(dtrow("panno")) Then
                    Pan.Text = dtrow("panno")
                End If

                If Not IsDBNull(dtrow("insurancecardinteger")) Then
                    Insurance.Text = dtrow("insurancecardinteger")
                End If

                If Not IsDBNull(dtrow("maxpatients")) Then
                    MaxPatients.Text = dtrow("maxpatients")
                End If

                If Not IsDBNull(dtrow("ProfileDoc")) Then
                    'LblProfile.Text = dtrow("ProfileDoc")
                    txtProfilePath.Text = dtrow("ProfileDoc")
                End If
            End If
        End If
    End Sub

    Protected Sub ddlPCountry_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPCountry.SelectedIndexChanged

        ddlPState.DataSource = DsState.GetAllData(ddlPCountry.SelectedValue)
        ddlPState.DataTextField = "Statename"
        ddlPState.DataValueField = "Stateid"
        ddlPState.DataBind()

        ddlPState.Items.Insert(0, "-- Select State --")
        ddlPState.Items(0).Value = "0"
    End Sub

    Protected Sub ddlCountry_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        ddlState.DataSource = DsState.GetAllData(ddlCountry.SelectedValue)
        ddlState.DataTextField = "Statename"
        ddlState.DataValueField = "Stateid"
        ddlState.DataBind()

        ddlState.Items.Insert(0, "-- Select State --")
        ddlState.Items(0).Value = "0"
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




    Protected Sub UpdateDoctors_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim caredoc As New kfrcDOCTORSTableAdapter
        'If Val(caredoc.GetCountFromOtherIDs(DoctorCode.Text, Request("DocID"))) > 0 Then
        '    LblMsg.Text = "Doctor Code -- [" & DoctorCode.Text & "] Already Exisits, Try With The Other!"
        '    LblMsg.ForeColor = Drawing.Color.DarkRed
        'Else
        Dim photoname As String = LblDocPhoto.Text
        If FUPhoto.HasFile Then
            If FUPhoto.PostedFile.ContentType <> "image/jpeg" And FUPhoto.PostedFile.ContentType <> "image/pjpeg" And FUPhoto.PostedFile.ContentType <> "image/gif" Then
                LblMsg.Text = "Files of type[" & FUPhoto.PostedFile.ContentType & "] are not allowed, Only Images are allowed"
            ElseIf FUPhoto.PostedFile.ContentLength > "1048576" Then
                LblMsg.Text = "Photo size should not exceed 1 MB"
            Else
                Dim code = RandomPassword.Generate(6, 8)
                FUPhoto.PostedFile.SaveAs(Server.MapPath("../../../DoctorPhotos") & "/" & Request("DocID") & "_" & code & "." & Right(FUPhoto.PostedFile.FileName, 3))
                photoname = Request("DocID") & "_" & code & "." & Right(FUPhoto.PostedFile.FileName, 3)
            End If
        End If

        'ProfileName = LblProfile.Text
        'If FUProfile.HasFile Then
        '    If FUProfile.PostedFile.ContentType <> "application/pdf" Then
        '        LblMsg.Text = "Files of type[" & FUProfile.PostedFile.ContentType & "] are not allowed, Only PDFs are allowed"
        '    ElseIf FUProfile.PostedFile.ContentLength > "1048576" Then
        '        LblMsg.Text = "PDF size should not exceed 1 MB"
        '    Else
        '        ProfileName = Request("DocID") & "." & Right(FUProfile.PostedFile.FileName, 3)
        '        FUProfile.PostedFile.SaveAs(Server.MapPath("../../../doctorprofiles") & "/" & ProfileName)
        '    End If
        'End If

        ProfileName = txtProfilePath.Text
        If ProfileName = "" Then
            ProfileName = "#"
        End If

        qual = TxtQualification.Text

        zipval = 0
        If Zip.Text <> "" Then
            zipval = CDbl(Zip.Text)
        End If



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

        VarAge = 0
        If IsNumeric(Age.Text) Then
            VarAge = Age.Text
        End If

        MondayTimings = "10:00am - 09:00pm"
        If Trim(MondayTimmings.Text) <> "" Then
            MondayTimings = MondayTimmings.Text
        End If

        Tuesdaytimings = "10:00am - 09:00pm"
        If Trim(TuesdayTimmings.Text) <> "" Then
            Tuesdaytimings = TuesdayTimmings.Text
        End If

        wednesdaytimings = "10:00am - 09:00pm"
        If Trim(WednesdayTimmings.Text) <> "" Then
            wednesdaytimings = WednesdayTimmings.Text
        End If

        Thursdaytimings = "10:00am - 09:00pm"
        If Trim(ThursdayTimmings.Text) <> "" Then
            Thursdaytimings = ThursdayTimmings.Text
        End If

        Fridaytimings = "10:00am - 09:00pm"
        If Trim(FridayTimmings.Text) <> "" Then
            Fridaytimings = FridayTimmings.Text
        End If

        Saturdaytimings = "10:00am - 09:00pm"
        If Trim(SaturdayTimmings.Text) <> "" Then
            Saturdaytimings = SaturdayTimmings.Text
        End If

        sundaytimings = "10:00am - 09:00pm"
        If Trim(SundayTimmings.Text) <> "" Then
            sundaytimings = SundayTimmings.Text
        End If



        JoiningDate = "1/1/1900"
        If IsDate(JoinDate) Then
            JoiningDate = JoinDate.Text
        End If

      

        'LblMsg.Text = DoctorCode.Text & "<br>" & Salutation.Text & "<br>" & DoctorName.Text & "<br>" & BloodGroup.Text & "<br>" & sp & "<br>" & dept & "<br>" & qual & "<br>" & Age.Text & "<br>" & rblstgen.Text & "<br>" & Address.Text & "<br>" & ddlCity.SelectedValue & "<br>" & ddlState.SelectedValue & "<br>" & ddlCountry.SelectedValue & "<br>" & zipval & "<br>" & PAddress.Text & "<br>" & ddlPCity.SelectedValue & "<br>" & ddlPState.SelectedValue & "<br>" & ddlPCountry.SelectedValue & "<br>" & pzipval & "<br>" & resphnum & "<br>" & mobil & "<br>" & HosPh.Text & "<br>" & HosExt.Text & "<br>" & EmailId.Text & "<br>" & "0" & "<br>" & ddlITHrs.Text & ":" & ddlITMins.Text & "<br>" & ddlOTHrs.Text & ":" & ddlOTMins.Text & "<br>" & TimeRegion.SelectedValue & "<br>" & "Y" & "<br>" & 1 & "<br>" & ddlBranchName.SelectedValue & "<br>" & totexpp & "<br>" & preexpp & "<br>" & PreHos.Text & "<br>" & JoinDate.Text & "<br>" & "" & "<br>" & DoctorCode.Text & "." & Right(Photo.PostedFile.FileName, 3) & "<br>" & Passport.Text & "<br>" & Pan.Text & "<br>" & Insurance.Text & "<br>" & maxp & "<br>l2" & "" & "<br>l1" & ""
        caredoc.UpdateData(DoctorCode.Text, "0", "0", qual, VarAge, rblstgen.Text, Address.Text, ddlCity.SelectedValue, ddlState.SelectedValue, ddlCountry.SelectedValue, zipval, PAddress.Text, ddlPCity.SelectedValue, ddlPState.SelectedValue, ddlPCountry.SelectedValue, pzipval, resphnum, mobil, Hosph, HosPhExt, EmailId.Text, "0", 0, "0", JoiningDate, "", photoname, Passport.Text, Pan.Text, Insurance.Text, maxp, RBLstSur.SelectedValue, BillingServiceCode.Text, Salutation.Text, DoctorName.Text, DDlBG.SelectedValue, "0", "0", "0", "0", ProfileName, institutes, Txtbriefprofile.Value, Txtpresentposition.Value, TxtQualifications.Value, txtsepcialtraining.Value, txtexperience.Value, txtexpertise.Value, txtachievements.Value, txtpublications.Value, txtawardsandhonours.Value, txtacademicexposure.Value, txttalkdelivered.Value, txtothers.Value, txtmedia.Value, MondayTimmings.Text, TuesdayTimmings.Text, WednesdayTimmings.Text, ThursdayTimmings.Text, FridayTimmings.Text, SaturdayTimmings.Text, SundayTimmings.Text, txtmetades.Text, txtmetakeyword.Text, txtmetatitle.Text, Request("DocID"))

        LblMsg.Text = "Doctor -- [" & DoctorName.Text & "] Updated Successfully"

        clear()

        Response.Redirect("ViewDoctors.aspx")

    End Sub
    Protected Sub clear()
        DoctorName.Text = ""
        DoctorCode.Text = ""
        DDlBG.SelectedIndex = -1
        LBBranch.SelectedIndex = -1
        ddlCity.SelectedIndex = -1
        ddlCountry.SelectedIndex = -1
        LBDepartments.SelectedIndex = -1
        LBInstitutes.SelectedIndex = -1
        LBSpecialities.SelectedIndex = -1
        '        DDLGrade.SelectedIndex = -1
        ddlPCity.SelectedIndex = -1
        ddlPCountry.SelectedIndex = -1
        ddlPState.SelectedIndex = -1
        ddlState.SelectedIndex = -1
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
        Txtbriefprofile.Value = ""
        Txtpresentposition.Value = ""
        txtsepcialtraining.Value = ""
        txtexperience.Value = ""
        txtexpertise.Value = ""
        txtachievements.Value = ""
        txtpublications.Value = ""
        txtawardsandhonours.Value = ""
        txtacademicexposure.Value = ""
        txttalkdelivered.Value = ""
        txtothers.Value = ""
        txtmedia.Value = ""
    End Sub


End Class