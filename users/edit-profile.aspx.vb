Imports betatesting.DataSetCareTableAdapters
Public Class edit_profile
    

    Inherits System.Web.UI.Page

        Dim DsQuali As New QUALIFICATIONTableAdapter

        Dim DsSp As New VENDORSPECIALIZATIONTableAdapter


        Dim DsCountry As New COUNTRYTableAdapter
        Dim DsState As New STATETableAdapter
        Dim DsCity As New CITYTableAdapter
        Dim DsBranch As New VENDORTYPESTableAdapter

        Dim dsbg As New BLOODGROUPTableAdapter
        Dim ProfileName As String

        Dim DsDoc As New VENDORSUsersTableAdapter

        Dim VarAge, Hosph, HosPhExt As Integer

        Dim PhotoName, JoiningDate As String


        Dim i As Integer
        Dim docarr As Array
        Dim sp, dept, qual, institutes, branch, firbranch, secbranch, FirstBranch, secondbranch, SecondBranchTimmings As String
        Dim spArr, deptArr, institutesArr, qualArr, branchArr, FirstBranchArr, secbranchArr, SecondBranchTimmingsArr As Array
        Dim zipval, pzipval, resphnum, mobil, totexpp, preexpp, maxp As Decimal

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        If Not IsPostBack Then

            If IsNothing(Session("UserId")) Then
                Response.Redirect("~/default.aspx", True)
            End If

          



            'Fill Department


            'Fill Specialities

            LBSpecialities.DataSource = DsSp.GetAllActiveData
            LBSpecialities.DataTextField = "SPECIALIZATIONNAME"
            LBSpecialities.DataValueField = "SPECIALIZATIONID"
            LBSpecialities.DataBind()

            'Fill Institutes




            ' Fill Workign At Details
            LBBranch.DataSource = DsBranch.GetData
            LBBranch.DataTextField = "VENDORTYPENAME"
            LBBranch.DataValueField = "VENDORTYPEID"
            LBBranch.DataBind()

            'LBFirstBranch.DataSource = DsBranch.GetAllData(0)
            'LBFirstBranch.DataTextField = "BranchName"
            'LBFirstBranch.DataValueField = "BranchId"
            'LBFirstBranch.DataBind()

            'LBSecondBranch.DataSource = DsBranch.GetAllData(0)
            'LBSecondBranch.DataTextField = "BranchName"
            'LBSecondBranch.DataValueField = "BranchId"
            'LBSecondBranch.DataBind()

            'Fill Doctors Data
            Dim DtDoc As New Data.DataTable
            Dim dtrow As Data.DataRow
            DtDoc = DsDoc.GetAllActivedatabyId(Session("UserId"))
            If DtDoc.Rows.Count > 0 Then
                dtrow = DtDoc.Rows(0)

                'If HttpContext.Current.User.Identity.Name <> "globaladmin" Then
                '    If HttpContext.Current.Session("Branch") <> "1" Then
                '        If HttpContext.Current.Session("Branch") <> dtrow("Branch") Then
                '            Response.Redirect("../default.aspx")
                '        End If
                '    End If
                'End If

                If Not IsDBNull(dtrow("Firstname")) Then
                    txtfirstName.Text = dtrow("Firstname")
                End If
                If Not IsDBNull(dtrow("designation")) Then
                    DoctorCode.Text = dtrow("designation")
                End If
                If Not IsDBNull(dtrow("Lastname")) Then
                    txtlastName.Text = dtrow("Lastname")
                End If

                If Not IsDBNull(dtrow("Email")) Then
                    EmailId.Text = dtrow("Email")
                End If

                'Salutation.Text = dtrow("GENDER")
                'If Not IsDBNull(dtrow("GENDER")) Then
                '    Salutation.Items.FindByValue(dtrow("GENDER")).Selected = True
                'End If

                If Not IsDBNull(dtrow("AGE")) Then
                    Age.Text = dtrow("AGE")
                End If



                If Not IsDBNull(dtrow("photo")) Then
                    If dtrow("photo") <> "" And dtrow("photo") <> "N/A" Then
                        ImgPhoto.ImageUrl = "~/Expertphotos/" & dtrow("photo")
                        ImgPhoto.Visible = True
                    End If
                End If

                If Not IsDBNull(dtrow("VendorSPECIALISATION")) Then
                    spArr = Split(dtrow("VendorSPECIALISATION").Replace("$", ""), ",")
                    For i = 0 To UBound(spArr)
                        If Not LBSpecialities.Items.FindByValue(spArr(i)) Is Nothing Then
                            LBSpecialities.Items.FindByValue(spArr(i)).Selected = True
                        End If
                    Next
                End If



                If Not IsDBNull(dtrow("vendortype")) Then
                    branchArr = Split(dtrow("vendortype").Replace("$", ""), ",")
                    For i = 0 To UBound(branchArr)
                        If Not LBBranch.Items.FindByValue(branchArr(i)) Is Nothing Then
                            LBBranch.Items.FindByValue(branchArr(i)).Selected = True
                        End If
                    Next
                End If

                'If Not IsDBNull(dtrow("FirstBranch")) Then
                '    FirstBranchArr = Split(dtrow("FirstBranch").Replace("$", ""), ",")
                '    For i = 0 To UBound(FirstBranchArr)
                '        If Not LBFirstBranch.Items.FindByValue(FirstBranchArr(i)) Is Nothing Then
                '            LBFirstBranch.Items.FindByValue(FirstBranchArr(i)).Selected = True
                '        End If
                '    Next
                'End If

                'If Not IsDBNull(dtrow("SecondBranchTimmings")) Then
                '    SecondBranchTimmingsArr = Split(dtrow("SecondBranchTimmings").Replace("$", ""), ",")
                '    For i = 0 To UBound(SecondBranchTimmingsArr)
                '        If Not LBSecondBranch.Items.FindByValue(SecondBranchTimmingsArr(i)) Is Nothing Then
                '            LBSecondBranch.Items.FindByValue(SecondBranchTimmingsArr(i)).Selected = True
                '        End If
                '    Next
                'End If


                If Not IsDBNull(dtrow("QUALIFICATION")) Then
                    TxtQualification.Text = dtrow("QUALIFICATION")
                End If

                ' Fill Permanent Address
                'If Not IsDBNull(dtrow("COUNTRY")) Then
                '    txtcountry.Text = dtrow("COUNTRY")
                'End If

                'If Not IsDBNull(dtrow("ADDRESS")) Then
                '    Address.Text = dtrow("ADDRESS")
                'End If

                'If Not IsDBNull(dtrow("CITY")) Then
                '    txtcity.Text = dtrow("CITY")
                'End If

                'If Not IsDBNull(dtrow("STATE")) Then
                '    Txtstate.Text = dtrow("STATE")
                'End If



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







                If Not IsDBNull(dtrow("ZIP")) Then
                    Zip.Text = dtrow("ZIP")
                End If


                ' Fill Present Address


                If Not IsDBNull(dtrow("MOBILE")) Then
                    MobPh.Text = dtrow("MOBILE")
                End If


            End If
        End If
    End Sub










    Protected Sub UpdateDoctors_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim caredoc As New VENDORSUsersTableAdapter
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
                FUPhoto.PostedFile.SaveAs(Server.MapPath("~/expertphotos") & "/" & Session("UserId") & "_" & code & "." & Right(FUPhoto.PostedFile.FileName, 3))
                photoname = Session("UserId") & "_" & code & "." & Right(FUPhoto.PostedFile.FileName, 3)
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



        qual = TxtQualification.Text

        zipval = 0
        If Zip.Text <> "" Then
            zipval = CDbl(Zip.Text)
        End If



        mobil = 0
        If MobPh.Text <> "" Then
            mobil = CDbl(MobPh.Text)
        End If







        VarAge = 0
        If IsNumeric(Age.Text) Then
            VarAge = Age.Text
        End If



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

        'LblMsg.Text = DoctorCode.Text & "<br>" & Salutation.Text & "<br>" & DoctorName.Text & "<br>" & BloodGroup.Text & "<br>" & sp & "<br>" & dept & "<br>" & qual & "<br>" & Age.Text & "<br>" & rblstgen.Text & "<br>" & Address.Text & "<br>" & ddlCity.SelectedValue & "<br>" & ddlState.SelectedValue & "<br>" & ddlCountry.SelectedValue & "<br>" & zipval & "<br>" & PAddress.Text & "<br>" & ddlPCity.SelectedValue & "<br>" & ddlPState.SelectedValue & "<br>" & ddlPCountry.SelectedValue & "<br>" & pzipval & "<br>" & resphnum & "<br>" & mobil & "<br>" & HosPh.Text & "<br>" & HosExt.Text & "<br>" & EmailId.Text & "<br>" & "0" & "<br>" & ddlITHrs.Text & ":" & ddlITMins.Text & "<br>" & ddlOTHrs.Text & ":" & ddlOTMins.Text & "<br>" & TimeRegion.SelectedValue & "<br>" & "Y" & "<br>" & 1 & "<br>" & ddlBranchName.SelectedValue & "<br>" & totexpp & "<br>" & preexpp & "<br>" & PreHos.Text & "<br>" & JoinDate.Text & "<br>" & "" & "<br>" & DoctorCode.Text & "." & Right(Photo.PostedFile.FileName, 3) & "<br>" & Passport.Text & "<br>" & Pan.Text & "<br>" & Insurance.Text & "<br>" & maxp & "<br>l2" & "" & "<br>l1" & ""



        caredoc.Updatevendoruserderailsinadminpannel(sp, TxtQualification.Text, Age.Text, Salutation.Text, Address.Text, "0", "0", "0", Zip.Text, MobPh.Text, "Y", photoname, DoctorCode.Text, Txtbriefprofile.Value, Txtpresentposition.Value, TxtQualifications.Value, txtsepcialtraining.Value, txtexperience.Value, txtexpertise.Value, txtachievements.Value, txtpublications.Value, txtawardsandhonours.Value, txtacademicexposure.Value, txttalkdelivered.Value, txtothers.Value, txtmedia.Value, txtfirstname.Text, txtlastname.Text, EmailId.Text, branch, Session("UserId"))

        LblMsg.Text = "Expert -- [" & txtfirstName.Text & "] Updated Successfully"

        clear()

        Response.Redirect("~/default.aspx")

    End Sub
    Protected Sub clear()
        txtfirstName.Text = ""
        txtlastName.Text = ""
        DoctorCode.Text = ""
        DDlBG.SelectedIndex = -1
        LBBranch.SelectedIndex = -1

        'txtcountry.Text = ""

        LBSpecialities.SelectedIndex = -1
        '        DDLGrade.SelectedIndex = -1

        TxtQualification.Text = ""
        Age.Text = ""
        Address.Text = ""
        EmailId.Text = ""
        Salutation.SelectedIndex = -1

        Zip.Text = ""


        MobPh.Text = ""


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