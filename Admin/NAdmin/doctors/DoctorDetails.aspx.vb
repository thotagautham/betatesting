Imports betatesting.DataSetCareTableAdapters

Partial Class Admin_NAdmin_Doctors_DocotrDetails
    Inherits System.Web.UI.Page
    Dim DsSp As New SPECIALIZATIONTableAdapter
    Dim DsQuali As New QUALIFICATIONTableAdapter
    Dim DsDept As New DEPARTMENTTableAdapter
    Dim DsInstitutes As New InstitutesTableAdapter

    Dim DsCountry As New COUNTRYTableAdapter
    Dim DsState As New STATETableAdapter
    Dim DsCity As New CITYTableAdapter

    Dim DsBranch As New BRANCH1TableAdapter
    Dim DsFloors As New FLOORSTableAdapter
    Dim dsRooms As New INPATIENTROOMSTableAdapter
    Dim dsbg As New BLOODGROUPTableAdapter

    Dim dsdoc As New DOCTORSTableAdapter
    Dim i As Integer
    Dim docarr As Array
    Dim sp, dept, qual As String
    Dim spArr, deptArr, qualArr, branchArr As Array
    Dim zipval, pzipval, resphnum, mobil, totexpp, preexpp, maxp As Decimal

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "Doctors", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If

            'Fill Doctors Data
            Dim DtDoc As Data.DataTable = dsdoc.GetAllActiveDataByID(Request("DocId"))
            Dim dtrow As Data.DataRow

            If DtDoc.Rows.Count > 0 Then
                dtrow = DtDoc.Rows(0)
                If Not IsDBNull(dtrow("doctorcode")) Then
                    DoctorCode.Text = dtrow("doctorcode")
                End If

                If Not IsDBNull(dtrow("emailid")) Then
                    EmailID.Text = dtrow("emailid")
                End If

                DoctorName.Text = dtrow("name")
                If Not IsDBNull(dtrow("age")) Then
                    Age.Text = dtrow("age")
                End If

                If Not IsDBNull(dtrow("gender")) Then
                    If Trim(dtrow("gender")) = "M" Then
                        gender.Text = "Male"
                    Else
                        gender.Text = "FeMale"
                    End If
                End If

                If Not IsDBNull(dtrow("surgeon")) Then
                    If dtrow("surgeon") = "Y" Then
                        surgeon.Text = "Yes"
                    Else
                        surgeon.Text = "No"
                    End If
                End If

                If Not IsDBNull(dtrow("bldgrp")) Then
                    BloodGroup.Text = dsbg.GetValueByID(dtrow("bldgrp"))
                End If

                If Not IsDBNull(dtrow("photo")) Then
                    If dtrow("photo") <> "" And dtrow("photo") <> "N/A" Then
                        ImgPhoto.ImageUrl = "~/DoctorPhotos/" & dtrow("photo")
                        ImgPhoto.Visible = True
                    End If
                End If

                If (dtrow("specialisation").ToString() <> "") Then
                    spArr = Split(dtrow("specialisation").ToString().Replace("$", ""), ",")
                    For i = 0 To UBound(spArr)
                        If i = 0 Then
                            Specialization.Text = DsSp.GetValueByID(spArr(i))
                        Else
                            Specialization.Text = Specialization.Text & ", " & DsSp.GetValueByID(spArr(i))
                        End If
                    Next
                End If

                If (dtrow("department").ToString() <> "") Then

                    deptArr = Split(dtrow("department").ToString().Replace("$", ""), ",")
                    For i = 0 To UBound(deptArr)
                        If i = 0 Then
                            Department.Text = DsDept.GetValueByID(deptArr(i))
                        Else
                            Department.Text = Department.Text & ", " & DsDept.GetValueByID(deptArr(i))
                        End If
                    Next
                End If

                If (dtrow("institutes").ToString() <> "") Then

                    deptArr = Split(dtrow("institutes").ToString().Replace("$", ""), ",")
                    For i = 0 To UBound(deptArr)
                        If i = 0 Then
                            LblInstitute.Text = DsInstitutes.GetValueById(deptArr(i))
                        Else
                            LblInstitute.Text = LblInstitute.Text & ", " & DsInstitutes.GetValueById(deptArr(i))
                        End If
                    Next
                End If

                If (dtrow("Branch").ToString() <> "") Then

                    branchArr = Split(dtrow("Branch").ToString().Replace("$", ""), ",")
                    For i = 0 To UBound(branchArr)
                        If i = 0 Then
                            BranchName.Text = DsBranch.GetValueByID(branchArr(i))
                        Else
                            BranchName.Text = BranchName.Text & ", " & DsBranch.GetValueByID(branchArr(i))
                        End If
                    Next
                End If

                If Not IsDBNull(dtrow("qualification")) Then
                    Qualification.Text = dtrow("qualification")
                End If

                ' Fill Permanent Address

                If Not IsDBNull(dtrow("address")) Then
                    Address.Text = dtrow("address")
                End If
                If Not IsDBNull(dtrow("country")) Then
                    Country.Text = DsCountry.GetValueByID(dtrow("country"))
                End If
                If Not IsDBNull(dtrow("state")) Then
                    State.Text = DsState.GetValueByID(dtrow("state"))
                End If
                If Not IsDBNull(dtrow("city")) Then
                    City.Text = DsCity.GetValueByID(dtrow("city"))
                End If

                If Not IsDBNull(dtrow("zip")) Then
                    Zip.Text = dtrow("zip")
                End If

                ' Fill Present Address

                If Not IsDBNull(dtrow("paddress")) Then
                    PAddress.Text = dtrow("paddress")
                End If

                If Not IsDBNull(dtrow("pcountry")) Then
                    PCountry.Text = DsCountry.GetValueByID(dtrow("pcountry"))
                End If

                If Not IsDBNull(dtrow("pstate")) Then
                    PState.Text = DsState.GetValueByID(dtrow("pstate"))
                End If

                If Not IsDBNull(dtrow("pcity")) Then
                    PCity.Text = DsCity.GetValueByID(dtrow("pcity"))
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

                ' Fill Workign At Details
                'Dim DtBranch As New Data.DataTable
                'Dim dtBranchrow As Data.DataRow
                'DtBranch = DsBranch.GetAllDataByID(dtrow("Branch"))
                'If DtBranch.Rows.Count > 0 Then
                '    dtBranchrow = DtBranch.Rows(0)
                '    BCountry.Text = DsCountry.GetValueByID(dtBranchrow("country"))
                '    BState.Text = DsState.GetValueByID(dtBranchrow("state"))
                '    BCity.Text = DsCity.GetValueByID(dtBranchrow("city"))
                'End If

                
                'If Not IsDBNull(dtrow("floor")) Then
                '    Floors.Text = DsFloors.GetValueByID(dtrow("floor"))
                'End If

                'If Not IsDBNull(dtrow("roominteger")) Then
                '    RNum.Text = dsRooms.GetValueByID(dtrow("roominteger"))
                'End If

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

            End If

        End If
    End Sub
End Class
