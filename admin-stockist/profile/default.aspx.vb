Imports betatesting.hhcTableAdapters
Imports betatesting.CorporatesTableAdapters
Imports betatesting.DataSetCareTableAdapters
Public Class _default36
    Inherits System.Web.UI.Page
    Dim dsstckist As New HstockistdetailsnewTableAdapter
    Dim DsCountry As New COUNTRYTableAdapter
    Dim DsState As New STATETableAdapter
    Dim dscity As New CITYTableAdapter
    ' Dim dssubcity As subareaCITY2TableAdapter
    Dim dsdivision As New HdivisionTableAdapter
    Dim dstherapatic As New HtherapaticTableAdapter

    Dim dssubarea As New subareaCITY2TableAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            showlabels()




            If IsNothing(Session("HstockistdetailsID")) Then
                Response.Redirect("~/admin-stockist/sign-in/", True)
            End If
        End If
    End Sub


    Private Sub ClearAll()
    End Sub

    Private Sub showtextbox()

        txthsfullname.Visible = True


        txthslastname.Visible = True

        txthsemailid.Visible = True
        txthsmobile.Visible = True

        txthsplotno.Visible = True

        txthsadressone.Visible = True

        txthsadresstwo.Visible = True

        txthspincode.Visible = True

        txthstelephone.Visible = True

        txthsfax.Visible = True

        txthsgstprovisionalid.Visible = True

        txthspan.Visible = True

        txthsspocname.Visible = True

        txthsspocmobile.Visible = True

        txthsssistatus.Visible = True

        txthsdruglicenceno.Visible = True

        txthszone.Visible = True
        btnedit.Text = "Update"
        DDLEnquiry_Country.Visible = True
        ddlstate.Visible = True
        DDLCITY.Visible = True
        ddlsubcity.Visible = True
        ddldivision.Visible = True
        ddltherapatic.Visible = True


    End Sub

    Private Sub hidetextbox()


        txthsfullname.Visible = False


        txthslastname.Visible = False


        txthsmobile.Visible = False

        txthsplotno.Visible = False

        txthsadressone.Visible = False

        txthsadresstwo.Visible = False

        txthspincode.Visible = False

        txthstelephone.Visible = False

        txthsfax.Visible = False

        txthsgstprovisionalid.Visible = False

        txthspan.Visible = False

        txthsspocname.Visible = False

        txthsspocmobile.Visible = False

        txthsssistatus.Visible = False

        txthsdruglicenceno.Visible = False

        txthszone.Visible = False


        DDLEnquiry_Country.Visible = False
        ddlstate.Visible = False
        DDLCITY.Visible = False
        ddlsubcity.Visible = False
        ddldivision.Visible = False
        ddltherapatic.Visible = False
        btnedit.Text = "Edit"
    End Sub

    Private Sub showlabels()



        'Fill Doctors Data
        Dim DtDoc As New Data.DataTable
        Dim dtrow As Data.DataRow
        DtDoc = dsstckist.GetDataByHstockistdetailsID(Session("HstockistdetailsID"))
        If DtDoc.Rows.Count > 0 Then
            dtrow = DtDoc.Rows(0)

            'If HttpContext.Current.User.Identity.Name <> "globaladmin" Then
            '    If HttpContext.Current.Session("Branch") <> "1" Then
            '        If HttpContext.Current.Session("Branch") <> dtrow("Branch") Then
            '            Response.Redirect("../default.aspx")
            '        End If
            '    End If
            'End If

            If Not IsDBNull(dtrow("hsfullname")) Then
                lblhsfullname.Text = dtrow("hsfullname")
                txthsfullname.Text = dtrow("hsfullname")
                txthsfullname.Visible = False
            Else
                lblhsfullname.Text = "Enter First Name"
                txthsfullname.Text = "Enter First Name"
                txthsfullname.Visible = False
            End If

            If Not IsDBNull(dtrow("hslastname")) Then
                lblhslastname.Text = dtrow("hslastname")
                txthslastname.Text = dtrow("hslastname")
                txthslastname.Visible = False
            Else
                lblhslastname.Text = "Enter Last Name"
                txthslastname.Text = "Enter Last Name"
                txthslastname.Visible = False
            End If

            If Not IsDBNull(dtrow("hsemailid")) Then
                lblhsemailid.Text = dtrow("hsemailid")
                txthsemailid.Text = dtrow("hsemailid")
                txthsemailid.Visible = False
            Else
                lblhsemailid.Text = "Enter Email Id"
                txthsemailid.Text = "Enter Email Id"
                txthsemailid.Visible = False
            End If

            If Not IsDBNull(dtrow("hsmobile")) Then
                lblhsmobile.Text = dtrow("hsmobile")
                txthsmobile.Text = dtrow("hsmobile")
                txthsmobile.Visible = False
            Else
                lblhsmobile.Text = "Enter Mobile"
                txthsmobile.Text = "Enter Mobile"
                txthsmobile.Visible = False
            End If

            If Not IsDBNull(dtrow("hsplotno")) Then
                lblhsplotno.Text = dtrow("hsplotno")
                txthsplotno.Text = dtrow("hsplotno")
                txthsplotno.Visible = False
            Else
                lblhsplotno.Text = "Enter plot no"
                txthsplotno.Text = "Enter plot no"
                txthsplotno.Visible = False
            End If

            If Not IsDBNull(dtrow("hsadressone")) Then
                lblhsadressone.Text = dtrow("hsadressone")
                txthsadressone.Text = dtrow("hsadressone")
                txthsadressone.Visible = False
            Else
                lblhsadressone.Text = "Enter  address one"
                txthsadressone.Text = "Enter  address one"
                txthsadressone.Visible = False
            End If

            If Not IsDBNull(dtrow("hsadresstwo")) Then
                lblhsadresstwo.Text = dtrow("hsadresstwo")
                txthsadresstwo.Text = dtrow("hsadresstwo")
                txthsadresstwo.Visible = False
            Else
                lblhsadresstwo.Text = "enter address two"
                txthsadresstwo.Text = "enter address two"
                txthsadresstwo.Visible = False
            End If

            If Not IsDBNull(dtrow("hspincode")) Then
                lblhspincode.Text = dtrow("hspincode")
                txthspincode.Text = dtrow("hspincode")
                txthspincode.Visible = False
            Else
                lblhspincode.Text = "Enter Pincode"
                txthspincode.Text = "Enter Pincode"
                txthspincode.Visible = False
            End If

            If Not IsDBNull(dtrow("hstelephone")) Then
                lblhstelephone.Text = dtrow("hstelephone")
                txthstelephone.Text = dtrow("hstelephone")
                txthstelephone.Visible = False
            Else
                lblhstelephone.Text = "Enter telephone no"
                txthstelephone.Text = "Enter telephone no"
                txthstelephone.Visible = False
            End If

            If Not IsDBNull(dtrow("hsfax")) Then
                lblhsfax.Text = dtrow("hsfax")
                txthsfax.Text = dtrow("hsfax")
                txthsfax.Visible = False
            Else
                lblhsfax.Text = "Enter Fax"
                txthsfax.Text = "Enter Fax"
                txthsfax.Visible = False
            End If

            If Not IsDBNull(dtrow("hsgstprovisionalid")) Then
                lblhsgstprovisionalid.Text = dtrow("hsgstprovisionalid")
                txthsgstprovisionalid.Text = dtrow("hsgstprovisionalid")
                txthsgstprovisionalid.Visible = False
            Else
                lblhsgstprovisionalid.Text = "Enter Provisional Id"
                txthsgstprovisionalid.Text = "Enter Provisional Id"
                txthsgstprovisionalid.Visible = False
            End If


            If Not IsDBNull(dtrow("hspan")) Then
                lblhspan.Text = dtrow("hspan")
                txthspan.Text = dtrow("hspan")
                txthspan.Visible = False
            Else
                lblhspan.Text = "Enter Pan"
                txthspan.Text = "Enter Pan"
                txthspan.Visible = False
            End If

            If Not IsDBNull(dtrow("hsspocname")) Then
                lblhsspocname.Text = dtrow("hsspocname")
                txthsspocname.Text = dtrow("hsspocname")
                txthsspocname.Visible = False
            Else
                lblhsspocname.Text = "enter spoc name"
                txthsspocname.Text = "enter spoc name"
                txthsspocname.Visible = False
            End If

            If Not IsDBNull(dtrow("hsspocmobile")) Then
                lblhsspocmobile.Text = dtrow("hsspocmobile")
                txthsspocmobile.Text = dtrow("hsspocmobile")
                txthsspocmobile.Visible = False
            Else
                lblhsspocmobile.Text = "Enter spoc mobile"
                txthsspocmobile.Text = "Enter spoc mobile"
                txthsspocmobile.Visible = False
            End If


            If Not IsDBNull(dtrow("hsssistatus")) Then
                lblhsssistatus.Text = dtrow("hsssistatus")
                txthsssistatus.Text = dtrow("hsssistatus")
                txthsssistatus.Visible = False
            Else
                lblhsssistatus.Text = "enter ssis status"
                txthsssistatus.Text = "enter ssis status"
                txthsssistatus.Visible = False
            End If


            If Not IsDBNull(dtrow("hsdruglicenceno")) Then
                lblhsdruglicenceno.Text = dtrow("hsdruglicenceno")
                txthsdruglicenceno.Text = dtrow("hsdruglicenceno")
                txthsdruglicenceno.Visible = False
            Else
                lblhsdruglicenceno.Text = "enter drug license"
                txthsdruglicenceno.Text = "enter drug license"
                txthsdruglicenceno.Visible = False
            End If


            'If Not IsDBNull(dtrow("hszone")) Then
            '    lblhszone.Text = dtrow("hszone")
            '    txthszone.Text = dtrow("hszone")
            '    txthszone.Visible = False
            'Else
            '    lblhszone.Text = "enter hs zone"
            '    txthszone.Text = "enter hs zone"
            '    txthszone.Visible = False
            'End If


            Dim divison As String


            ddldivision.DataSource = dsdivision.GetData
            ddldivision.DataTextField = "hdname"
            ddldivision.DataValueField = "HdivisionID"
            ddldivision.DataBind()
            If Not IsDBNull(dtrow("hsdivision")) Then


                divison = dtrow("hsdivision")

                If divison = "" Then

                    ddldivision.SelectedIndex = -1
                Else

                    ddldivision.Items.FindByValue(dtrow("hsdivision")).Selected = True

                End If
            Else
                ddldivision.SelectedIndex = -1

            End If


            Dim therapatic As String


            ddltherapatic.DataSource = dstherapatic.GetData
            ddltherapatic.DataTextField = "htheterocode"
            ddltherapatic.DataValueField = "HtherapaticID"
            ddltherapatic.DataBind()

            If Not IsDBNull(dtrow("hstherapatic")) Then

                therapatic = dtrow("hstherapatic")


                If therapatic = "" Then

                    ddltherapatic.SelectedIndex = -1
                Else

                    ddltherapatic.Items.FindByValue(dtrow("hstherapatic")).Selected = True

                End If
            Else
                ddltherapatic.SelectedIndex = -1

            End If








            Dim country, state, city, subcity As String


            DDLEnquiry_Country.DataSource = DsCountry.GetActiveData
            DDLEnquiry_Country.DataTextField = "COUNTRYNAME"
            DDLEnquiry_Country.DataValueField = "COUNTRYID"
            DDLEnquiry_Country.DataBind()

            If Not IsDBNull(dtrow("hscountry")) Then


                country = dtrow("hscountry")

                If country = "" Then

                    DDLEnquiry_Country.SelectedIndex = -1
                Else

                    DDLEnquiry_Country.Items.FindByValue(dtrow("hscountry")).Selected = True

                End If



                If (DDLEnquiry_Country.SelectedIndex > 0) Then
                    ddlstate.DataSource = DsState.GetAllData(country)
                    ddlstate.DataTextField = "STATENAME"
                    ddlstate.DataValueField = "STATEID"
                    ddlstate.DataBind()
                    If Not IsDBNull(dtrow("hsstate")) Then

                        state = (dtrow("hsstate"))

                        If country = "" Then

                            ddlstate.SelectedIndex = -1
                        Else

                            ddlstate.Items.FindByValue(dtrow("hsstate")).Selected = True

                        End If


                       

                            If (ddlstate.SelectedIndex > 0) Then
                                DDLCITY.DataSource = dscity.GetAllData(state)
                                DDLCITY.DataTextField = "CITYNAME"
                                DDLCITY.DataValueField = "CITYID"
                                DDLCITY.DataBind()
                                If Not IsDBNull(dtrow("hsheadquater")) Then

                                    city = (dtrow("hsheadquater"))

                                    DDLCITY.Items.FindByValue(dtrow("hsheadquater")).Selected = True


                                    If DDLCITY.SelectedIndex > 0 Then
                                        ddlsubcity.DataSource = dssubarea.getalldata(city)
                                        ddlsubcity.DataTextField = "subareaCITYNAME"
                                        ddlsubcity.DataValueField = "subareaCITYID"
                                        ddlsubcity.DataBind()

                                        If Not IsDBNull(dtrow("hsheadquater")) Then

                                            subcity = (dtrow("hssubarea"))

                                            ddlsubcity.Items.FindByValue(dtrow("hssubarea")).Selected = True

                                        Else

                                        End If



                                    End If
                                Else
                                    DDLCITY.SelectedIndex = -1
                                End If
                            End If
                    Else

                            ddlstate.SelectedIndex = -1
                    End If

                End If
            Else

                DDLEnquiry_Country.SelectedIndex = -1

            End If







        End If


    End Sub


    Protected Sub btnedit_Click(sender As Object, e As EventArgs) Handles btnedit.Click





        If btnedit.Text = "Update" Then



            dsstckist.updatedetails(txthsfullname.Text, txthslastname.Text, txthsemailid.Text, txthsmobile.Text, txthsplotno.Text, txthsadressone.Text, txthsadresstwo.Text, DDLEnquiry_Country.SelectedItem.Value, ddlstate.SelectedItem.Value, DDLCITY.SelectedItem.Value, ddlsubcity.SelectedItem.Value, ddldivision.SelectedItem.Value, txthscnf.Text, ddltherapatic.SelectedItem.Value, txthspincode.Text, txthstelephone.Text, txthsfax.Text, txthsgstprovisionalid.Text, txthspan.Text, txthsspocname.Text, txthsspocmobile.Text, txthsssistatus.Text, txthsdruglicenceno.Text, Session("HstockistdetailsID"))
            hidetextbox()
            showlabels()
        Else
            showtextbox()
        End If




    End Sub


    Protected Sub DDLEnquiry_Country_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DDLEnquiry_Country.SelectedIndexChanged


        If (DDLEnquiry_Country.SelectedIndex > 0) Then
            ddlstate.Items.Clear()
            ddlstate.DataSource = DsState.GetAllData(DDLEnquiry_Country.SelectedItem.Value)
            ddlstate.DataTextField = "STATENAME"
            ddlstate.DataValueField = "STATEID"
            ddlstate.DataBind()
            ddlstate.Items.Insert(0, " Select a State")
            ddlstate.Items(0).Value = "0"


        End If
    End Sub
    Protected Sub ddlstate_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlstate.SelectedIndexChanged




        If (ddlstate.SelectedIndex > 0) Then
            DDLCITY.Items.Clear()
            DDLCITY.DataSource = dscity.GetAllData(ddlstate.SelectedItem.Value)
            DDLCITY.DataTextField = "CITYNAME"
            DDLCITY.DataValueField = "CITYID"
            DDLCITY.DataBind()
            DDLCITY.Items.Insert(0, " Select a City")
            DDLCITY.Items(0).Value = "0"
        End If

    End Sub


    Protected Sub DDLCITY_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DDLCITY.SelectedIndexChanged


        If DDLCITY.SelectedIndex > 0 Then

            ddlsubcity.Items.Clear()
            ddlsubcity.DataSource = dssubarea.getalldata(DDLCITY.SelectedItem.Value)
            ddlsubcity.DataTextField = "subareaCITYNAME"
            ddlsubcity.DataValueField = "subareaCITYID"
            ddlsubcity.DataBind()
            ddlsubcity.Items.Insert(0, " Select a Sub Area")
            ddlsubcity.Items(0).Value = "0"

        End If

    End Sub
End Class