Imports system.Data.sqlClient
Imports betatesting.DataSetCareTableAdapters
Partial Class Admin_NAdmin_Doctors_FindaDoctor
    Inherits System.Web.UI.Page
    Dim DsCountry As New COUNTRYTableAdapter
    Dim DsState As New STATETableAdapter
    Dim DsCity As New CITYTableAdapter
    Dim DsBranch As New BRANCH1TableAdapter
    Dim DsDisease As New DISEASESTableAdapter
    Dim DsSp As New SPECIALIZATIONTableAdapter
    Dim dsdoc As New DOCTORSTableAdapter

    Dim strsql, DispStr As String
    Dim oracmd As SqlCommand
    Dim connString As String
    Public objConn As SqlConnection
    Dim objdata As SqlDataReader
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Dim CF As New CommonFunctions
            If CF.CheckPermissions(Session("Permissions"), "Doctors", Master, Session("Roles")) = False Then
                Response.Redirect("~/admin/nadmin/default.aspx")
            End If

            'Fill Disease
            ddlDisease.DataSource = DsDisease.GetAllData
            ddlDisease.DataTextField = "DiseaseName"
            ddlDisease.DataValueField = "DiseaseID"
            ddlDisease.DataBind()

            ' Fill Country
            Country.DataSource = DsCountry.GetAllData
            Country.DataTextField = "Countryname"
            Country.DataValueField = "Countryid"
            Country.DataBind()

            Country.Items.Insert(0, "-- Select Country --")
            Country.Items(0).Value = "0"
        End If


    End Sub

    Protected Sub Country_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Country.SelectedIndexChanged
        State.DataSource = DsState.GetAllData(Country.SelectedValue)
        State.DataTextField = "Statename"
        State.DataValueField = "Stateid"
        State.DataBind()

        State.Items.Insert(0, "-- Select State --")
        State.Items(0).Value = "0"

        City.Items.Clear()
        City.Items.Insert(0, "-- Select City --")
        City.Items(0).Value = "0"

        Branch.Items.Clear()
        Branch.Items.Insert(0, "-- Select Branch --")
        Branch.Items(0).Value = "0"
    End Sub

    Protected Sub State_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        City.DataSource = DsCity.GetAllData(State.SelectedValue)
        City.DataTextField = "cityname"
        City.DataValueField = "cityid"
        City.DataBind()

        City.Items.Insert(0, "-- Select City --")
        City.Items(0).Value = "0"

        Branch.Items.Clear()
        Branch.Items.Insert(0, "-- Select Branch --")
        Branch.Items(0).Value = "0"
    End Sub

    Protected Sub City_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        Branch.DataSource = DsBranch.GetAllData(City.SelectedValue)
        Branch.DataTextField = "BranchName"
        Branch.DataValueField = "BranchId"
        Branch.DataBind()

        Branch.Items.Insert(0, "-- Select Branch --")
        Branch.Items(0).Value = "0"
    End Sub


    Public Sub openConnection()
        connString = ConfigurationManager.ConnectionStrings("MSSQLConnString").ConnectionString
        objConn = New SqlConnection(connString)
        objConn.Open()
    End Sub
    Public Sub closeConnection()
        objConn.Close()
        objConn = Nothing
    End Sub
    Private Sub getData(ByVal strsql As String)
        openConnection()
        oracmd = New SqlCommand(strsql, objConn)
        objdata = oracmd.ExecuteReader()
        If objdata.HasRows Then
            GVDoctors.DataSource = objdata
            GVDoctors.DataBind()
            GVDoctors.Visible = True
            LblMsg.Text = ""
        Else
            LblMsg.Text = "No Records Found For Your Search Criteria, Please Try Again!"
            GVDoctors.Visible = False
        End If
        objdata.Close()
        oracmd = Nothing
        objdata = Nothing
        closeConnection()
    End Sub


    Protected Sub SearchByName_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        ' strsql = "select name,doctorcode from doctors where upper(name) like '%" & UCase(DocName.Text) & "%'"
        strsql = "select name,doctorcode from doctors where doctorid=" & LstDoctor.SelectedValue
        getData(strsql)
    End Sub

    Protected Sub SearchByDisease_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        If ddlDisease.SelectedValue = 0 Then
            strsql = "select name,doctorcode from doctors d,doctordisease dd where d.doctorid=dd.doctorid"
        Else
            strsql = "select name,doctorcode from doctors d,doctordisease dd where d.doctorid=dd.doctorid and dd.diseaseid=" & ddlDisease.SelectedValue
        End If

        getData(strsql)
    End Sub

    Protected Sub SearchByBranch_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        strsql = "select name,doctorcode from doctors d,branch b where d.branch=b.branchid "
        If Branch.SelectedValue > 0 Then
            strsql = strsql & " and d.branch=" & Branch.SelectedValue
        ElseIf City.SelectedValue > 0 Then
            strsql = strsql & " and b.city=" & City.SelectedValue
        ElseIf State.SelectedValue > 0 Then
            strsql = strsql & " and b.state=" & State.SelectedValue
        ElseIf Country.SelectedValue > 0 Then
            strsql = strsql & " and b.country=" & Country.SelectedValue
        End If

        getData(strsql)
    End Sub
End Class
