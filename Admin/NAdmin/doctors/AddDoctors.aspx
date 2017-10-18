<%@ Page Language="VB" MasterPageFile="../../AdminBasePage.master" AutoEventWireup="false" Inherits="KimsHospitals.Admin_Doctors_AddDoctors" title="Add Doctors :: Administrator :: KIMS Hospitals" Codebehind="AddDoctors.aspx.vb" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
<Triggers>
                <asp:PostBackTrigger ControlID="AddDoctors" />
                    </Triggers>
                <ContentTemplate>
<DIV align=center><BR /><asp:Label id="LblMsg" runat="server" __designer:wfdid="w1"></asp:Label><BR /><BR />&nbsp;</DIV><TABLE style="BORDER-COLLAPSE: collapse" cellSpacing=0 cellPadding=0 align=center border=1><TBODY><TR><TD><TABLE cellSpacing=5 cellPadding=0 align=center><TBODY><TR>
                    <TD class="HeaderStyle" align=center colSpan=4>Doctors Registration</TD></TR>
                    <TR class="RowStyle"><TD vAlign=top class="tdStyle">Designation</TD><TD><asp:TextBox id="DoctorCode" runat="server" MaxLength="100" Width="50"></asp:TextBox></TD>
                        <TD class="tdStyle">Email Id</TD><TD><asp:TextBox id="EmailId" runat="server" MaxLength="30"></asp:TextBox> 
                            <asp:RegularExpressionValidator id="REVEmailID" runat="server" Display="None" ControlToValidate="EmailId" ErrorMessage="Invalid Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator> 
                        <asp:RequiredFieldValidator ID="RFVEmailId" runat="server" 
                            ControlToValidate="EmailId" Display="None" ErrorMessage="Enter Email Id"></asp:RequiredFieldValidator>
                        </TD></TR><TR class="AlternateRowStyle"><TD class="tdStyle">Salutation</TD><TD><asp:DropDownList id="Salutation" runat="server">            
                <asp:ListItem>Mr</asp:ListItem>
                <asp:ListItem>Ms</asp:ListItem>
                <asp:ListItem>Mrs</asp:ListItem>
            </asp:DropDownList></TD><TD class="tdStyle">Doctor Name</TD><TD><asp:TextBox id="DoctorName" runat="server" MaxLength="100" Width="50"></asp:TextBox></TD></TR>
                    <TR class="RowStyle"><TD vAlign=top class="tdStyle">Age</TD><TD><asp:TextBox id="Age" runat="server" MaxLength="2"></asp:TextBox> </TD>
                        <TD vAlign=top class="tdStyle">Gender</TD><TD><asp:RadioButtonList id="rblstgen" runat="server" RepeatDirection="Horizontal"><asp:ListItem Selected="True" Value="M">Male</asp:ListItem>
<asp:ListItem Value="F">Female</asp:ListItem>
</asp:RadioButtonList></TD></TR><TR class="AlternateRowStyle">
                        <TD vAlign=top class="tdStyle">Surgeon</TD><TD><asp:RadioButtonList id="rblstsurgeon" runat="server" RepeatDirection="Horizontal"><asp:ListItem Selected="True" Value="Y">Yes</asp:ListItem>
<asp:ListItem Value="N">No</asp:ListItem>
</asp:RadioButtonList></TD>
<TD vAlign=top class="tdStyle">Branch Name</TD><TD>
    <asp:ListBox ID="LBBranch" runat="server" Rows="3" SelectionMode="Multiple"></asp:ListBox>
 <asp:RequiredFieldValidator id="RFVBranch" runat="server" Display="None" ControlToValidate="LBBranch" ErrorMessage="Branch Should Not Be Empty"></asp:RequiredFieldValidator></TD>
</TR><TR class="RowStyle"><TD class="tdStyle">Blood Group</TD><TD><asp:DropDownList id="DDLBG" runat="server"><asp:ListItem Value="0">-- Select Blood Group --</asp:ListItem>
</asp:DropDownList></TD><TD vAlign=top class="tdStyle" >Qualification</TD><td><asp:TextBox ID="TxtQualification" runat="server"></asp:TextBox></td></TR><TR>
                    <TD colSpan="4">&nbsp;</TD></TR>
                    <TR><TD vAlign="top" colSpan="4"></TD></TR>
                    <TR><td class="boldgray" vAlign="top" style="height: 8px">Specialities</td>
                        <TD class="boldgray" vAlign="top" colspan="2" style="height: 8px">Department&nbsp;</TD>
                        <td class="boldgray" vAlign="top" style="height: 8px">Institutes</td>
                    </TR>
                    <TR><td vAlign="top" style="height: 89px"><asp:ListBox ID="LBSpecialities" runat="server" SelectionMode="Multiple" Height="1500"></asp:ListBox>
                        <asp:RequiredFieldValidator ID="RFVSpecialities" runat="server" 
                            ErrorMessage="Select Any Speciality" Display="None" 
                            ControlToValidate="LBSpecialities" Enabled="False"></asp:RequiredFieldValidator></td>
                        <TD vAlign="top" colspan="2" style="height: 89px"><asp:ListBox id="LBDepartments" runat="server"  SelectionMode="Multiple" Height="1500"></asp:ListBox> 
                            <asp:CustomValidator ID="CheckInstituteDepartment" ClientValidationFunction="ValidateInstituteDepartment" runat="server" 
                        ErrorMessage="Please Select Institute Or Department" 
                        Display="None"></asp:CustomValidator>
                        <script language="javascript" type="text/javascript">

                            function ValidateInstituteDepartment(source, args) {
                                var lstdept = document.getElementById('<%= LBDepartments.ClientID %>');

        var lstinstitute = document.getElementById('<%= LBInstitutes.ClientID %>');

        var i;
        var valselected;
        valselected = false;

        for (i = 0; i < lstdept.length; i++) {
            if (lstdept.options[i].selected) {
                valselected = true;
                i = lstdept.length;
            }
        }

        if (valselected == false) {
            for (i = 0; i < lstinstitute.length; i++) {
                if (lstinstitute.options[i].selected) {
                    valselected = true;
                    i = lstinstitute.length;
                }
            }
        }

        args.IsValid = valselected;

    }
</script> 
                        </td>
                        <td vAlign="top" style="height: 89px"><asp:ListBox ID="LBInstitutes" runat="server" SelectionMode="Multiple" Height="500"></asp:ListBox>&nbsp; </TD>
                    </TR>
                    <TR><TD vAlign=top colSpan="4"></TD></TR><TR><TD class="boldgray" colSpan="4">Permanent Address</TD></TR><TR class="RowStyle"><TD vAlign=top 
                            class="tdStyle">Address</TD><TD colspan="3"><asp:TextBox id="Address" runat="server" MaxLength="800" Rows="3" TextMode="MultiLine"></asp:TextBox></TD></TR>
                    <TR class="AlternateRowStyle"><TD vAlign=top class="tdStyle">Country</TD><TD><asp:DropDownList id="ddlCountry" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"></asp:DropDownList></TD>
                        <TD vAlign=top class="tdStyle">State</TD><TD><asp:DropDownList id="ddlState" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"><asp:ListItem Selected="True" Value="0">--Select State --</asp:ListItem>
</asp:DropDownList></TD></TR><TR class="RowStyle"><TD vAlign=top class="tdStyle">City</TD><TD><asp:DropDownList id="ddlCity" runat="server"><asp:ListItem Selected="True" Value="0">--Select City --</asp:ListItem>
</asp:DropDownList></TD><TD vAlign=top class="tdStyle">Zip</TD><TD><asp:TextBox id="Zip" runat="server" MaxLength="10"></asp:TextBox> <asp:RegularExpressionValidator id="REVZip" runat="server" Display="None" ControlToValidate="Zip" ErrorMessage="Only Numerics Are Allowed for Zip Code in Permanent Address" ValidationExpression="[0-9]*"></asp:RegularExpressionValidator></TD></TR><TR>
                    <TD class="boldgray" colSpan=4>Present Address</TD></TR>
                    <TR class="AlternateRowStyle"><TD vAlign=top class="tdStyle">Address</TD>
                        <TD colspan="3"><asp:TextBox id="PAddress" runat="server" MaxLength="800" Rows="3" TextMode="MultiLine"></asp:TextBox></TD></TR>
                    <TR class="RowStyle"><TD vAlign=top class="tdStyle">Country</TD><TD><asp:DropDownList id="ddlPCountry" runat="server" AutoPostBack="True"></asp:DropDownList></TD>
                        <TD vAlign=top class="tdStyle">State</TD><TD><asp:DropDownList id="ddlPState" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlPState_SelectedIndexChanged"><asp:ListItem Selected="True" Value="0">--Select State --</asp:ListItem>
</asp:DropDownList></TD></TR><TR class="AlternateRowStyle"><TD vAlign=top class="tdStyle">City</TD><TD><asp:DropDownList id="ddlPCity" runat="server"><asp:ListItem Selected="True" Value="0">--Select City --</asp:ListItem>
</asp:DropDownList></TD><TD vAlign=top class="tdStyle">Zip</TD><TD><asp:TextBox id="PZip" runat="server" MaxLength="10"></asp:TextBox> <asp:RegularExpressionValidator id="REVPZip" runat="server" Display="None" ControlToValidate="PZip" ErrorMessage="Only Numbers Are Allowed For Zip Code in Present Address" ValidationExpression="[0-9]*"></asp:RegularExpressionValidator></TD></TR><TR>
                    <TD class="boldgray" colSpan=4>Contact Details</TD></TR><TR class="RowStyle">
                    <TD class="tdStyle">Residence Ph#</TD><TD><asp:TextBox id="ResPh" runat="server" MaxLength="15"></asp:TextBox> <asp:RegularExpressionValidator id="REVResph" runat="server" Display="None" ControlToValidate="ResPh" ErrorMessage="Only Numbers Are Allowed For Residence Phone Number" ValidationExpression="[0-9]*"></asp:RegularExpressionValidator></TD>
                    <TD class="tdStyle">Mobile Ph#</TD><TD><asp:TextBox id="MobPh" runat="server" MaxLength="15"></asp:TextBox> <asp:RegularExpressionValidator id="REVMobph" runat="server" Display="None" ControlToValidate="MobPh" ErrorMessage="Only Numbers Are Allowed For Mobile Phone Number" ValidationExpression="[0-9]*"></asp:RegularExpressionValidator></TD></TR>
                    <TR class="AlternateRowStyle"><TD class="tdStyle">
                    Hopsital Ph#</TD><TD>
                    <asp:TextBox ID="TxtHosPh" runat="server" MaxLength="20"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="REVHosPh" runat="server" 
                        ControlToValidate="TxtHosPh" Display="None" 
                        ErrorMessage="Only Numbers Are Allowed For Hospital Phone Number" 
                        ValidationExpression="[0-9]*"></asp:RegularExpressionValidator>
                    </TD>
                    <td class="tdStyle">
                        Hospital Ph Ext</td>
                    <td>
                        <asp:TextBox ID="TxtHosPhExt" runat="server" MaxLength="10"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="REVHosPhExt" runat="server" 
                            ControlToValidate="TxtHosPhExt" Display="None" 
                            ErrorMessage="Only Numbers Are Allowed For Hospital Phone Extension Number" 
                            ValidationExpression="[0-9]*"></asp:RegularExpressionValidator>
                    </td>
                    <TR class="AlternateRowStyle">
                        <TD vAlign=top class="tdStyle">Billing Service Code</TD><TD><asp:TextBox id="BillingServiceCode" runat="server" __designer:wfdid="w31"></asp:TextBox></TD></TR>
                    <TR class="RowStyle"><TD vAlign=top class="tdStyle">Joining Date</TD><TD><asp:TextBox id="JoinDate" runat="server"></asp:TextBox><asp:ImageButton id="Image1" runat="Server" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" CausesValidation="False"></asp:ImageButton><BR />
<cc1:CalendarExtender id="CalendarExtender1" runat="server" __designer:wfdid="w5" PopupButtonID="Image1" TargetControlID="JoinDate"></cc1:CalendarExtender>

 </TD><TD class="tdStyle">Photo</TD><TD><asp:FileUpload id="Photo" runat="server" __designer:wfdid="w2"></asp:FileUpload></TD></TR>
                    <TR class="AlternateRowStyle"><TD vAlign=top class="tdStyle">Passport Number</TD><TD><asp:TextBox id="Passport" runat="server" MaxLength="20"></asp:TextBox></TD>
                        <TD vAlign=top class="tdStyle">Pan Number</TD><TD><asp:TextBox id="Pan" runat="server" MaxLength="20"></asp:TextBox></TD></TR>
                    <TR class="RowStyle"><TD vAlign=top class="tdStyle">Insurance Card Number</TD><TD><asp:TextBox id="Insurance" runat="server" MaxLength="20"></asp:TextBox></TD>
                        <TD vAlign=top class="tdStyle">Max Patients Per Day</TD><TD><asp:TextBox id="MaxPatients" runat="server" MaxLength="2" CausesValidation="True"></asp:TextBox> </TD></TR>
                    <tr class="AlternateRowStyle">
                        <td valign="top" class="tdStyle">
                            Profile Path</td>
                        <td>
                            <asp:TextBox ID="txtProfilePath" runat="server"></asp:TextBox>
                            <!-- <asp:FileUpload ID="FUProfile" runat="server" /> -->
                        </td>
                        <td valign="top" colspan="2">&nbsp;
                            </td>
                    </tr>
              
    <TR><td vAlign=top> Brief Profile</td>
            <td>
                <FCKeditorV2:FCKeditor ID="Txtbriefprofile" runat="server" Height="600" Width="900">
                </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Present Position</td>
            <td>
             <FCKeditorV2:FCKeditor ID="Txtpresentprofile" runat="server" Height="600" Width="100">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

 <TR><td vAlign=top> Qualifications</td>
            <td>
             <FCKeditorV2:FCKeditor ID="TxtQualifications" runat="server" Height="600px" Width="900px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>
    <TR><td vAlign=top> Special Training</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtsepcialtraining" runat="server" Height="600" Width="900">
                        </FCKeditorV2:FCKeditor>
    </td></TR>


    <TR><td vAlign=top> Experience</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtexperience" runat="server" Height="600" Width="900">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Expertise</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtexpertise" runat="server" Height="600" Width="900">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Achievements/Breakthrough Cases</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtachievements" runat="server" Height="600" Width="900">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Publications</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtpublications" runat="server" Height="600" Width="900">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Awards And Honors</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtawardsandhonours" runat="server" Height="600" Width="900">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

   
    
     <TR><td vAlign=top> Academic Exposure</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtacademicexposure" runat="server" Height="600" Width="900">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

     <TR><td vAlign=top> Talk Delivered</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txttalkdelivered" runat="server" Height="600" Width="900">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Other</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtothers" runat="server" Height="600" Width="900">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Media</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtmedia" runat="server" Height="600" Width="900">
                        </FCKeditorV2:FCKeditor>
    </td></TR>
<table>
  <%-- <tr><TD vAlign=top class="tdStyle">First Branch Name</TD><TD></tr> 
    <asp:ListBox ID="LBFirstBranch" runat="server" Rows="3" ></asp:ListBox>--%>

<tr><TD vAlign=top>Monday Timmings</TD><TD vAlign=top>:</TD><TD>
                        <asp:TextBox ID="MondayTimmings" runat="server"></asp:TextBox>
                        </TD></tr>
   
    <tr><TD vAlign=top>Tuesday Timmings</TD><TD vAlign=top>:</TD><TD>
                        <asp:TextBox ID="TuesdayTimmings" runat="server"></asp:TextBox>
                        </TD></tr>
   
    <tr><TD vAlign=top>Wednesday Timmings</TD><TD vAlign=top>:</TD><TD>
                        <asp:TextBox ID="WednesdayTimmings" runat="server"></asp:TextBox>
                        </TD></tr>
   
    <tr><TD vAlign=top>ThursdayTimmings</TD><TD vAlign=top>:</TD><TD>
                        <asp:TextBox ID="ThursdayTimmings" runat="server"></asp:TextBox>
                        </TD></tr>
   
    <tr><TD vAlign=top>FridayTimmings</TD><TD vAlign=top>:</TD><TD>
                        <asp:TextBox ID="FridayTimmings" runat="server"></asp:TextBox>
                        </TD></tr>
   
    <tr><TD vAlign=top>Saturday Timmings</TD><TD vAlign=top>:</TD><TD>
                        <asp:TextBox ID="SaturdayTimmings" runat="server"></asp:TextBox>
                        </TD></tr>
   
    <tr><TD vAlign=top>Sunday Timmings</TD><TD vAlign=top>:</TD><TD>
                        <asp:TextBox ID="SundayTimmings" runat="server"></asp:TextBox>
                        </TD></tr>
   </table>

                        <table>
 <%--  <tr><TD vAlign=top class="tdStyle">Second  Branch Name</TD><TD></tr> 
    <asp:ListBox ID="LBSecondBranch" runat="server" Rows="3" ></asp:ListBox>

<tr><TD vAlign=top>Monday Timmings</TD><TD vAlign=top>:</TD><TD>
                        <asp:TextBox ID="SecMondayTimmings" runat="server"></asp:TextBox>
                        </TD></tr>
   
    <tr><TD vAlign=top>Tuesday Timmings</TD><TD vAlign=top>:</TD><TD>
                        <asp:TextBox ID="SecTuesdayTimmings" runat="server"></asp:TextBox>
                        </TD></tr>
   
    <tr><TD vAlign=top>Wednesday Timmings</TD><TD vAlign=top>:</TD><TD>
                        <asp:TextBox ID="SecWednesdayTimmings" runat="server"></asp:TextBox>
                        </TD></tr>
   
    <tr><TD vAlign=top>ThursdayTimmings</TD><TD vAlign=top>:</TD><TD>
                        <asp:TextBox ID="SecThursdayTimmings" runat="server"></asp:TextBox>
                        </TD></tr>
   
    <tr><TD vAlign=top>FridayTimmings</TD><TD vAlign=top>:</TD><TD>
                        <asp:TextBox ID="SecFridayTimmings" runat="server"></asp:TextBox>
                        </TD></tr>
   
    <tr><TD vAlign=top>Saturday Timmings</TD><TD vAlign=top>:</TD><TD>
                        <asp:TextBox ID="SecSaturdayTimmings" runat="server"></asp:TextBox>
                        </TD></tr>
   
    <tr><TD vAlign=top>Sunday Timmings</TD><TD vAlign=top>:</TD><TD>
                        <asp:TextBox ID="SecSundayTimmings" runat="server"></asp:TextBox>
                        </TD></tr>
 --%>  </table>

                    <TR><TD align=center colSpan=4><asp:Button id="AddDoctors" runat="server" Text="Save"></asp:Button>&nbsp;&nbsp; <BR /><BR /><BR /><asp:RequiredFieldValidator id="RFVDoctorName" runat="server" Display="None" ControlToValidate="DoctorName" ErrorMessage="Doctor Name Should Not Be Empty"></asp:RequiredFieldValidator><BR /><BR /> <asp:ValidationSummary id="ValidationSummary1" runat="server" ShowSummary="False" ShowMessageBox="True"></asp:ValidationSummary></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
</ContentTemplate>
                   </asp:UpdatePanel>
</asp:Content>

