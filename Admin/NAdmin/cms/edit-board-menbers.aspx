<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="edit-board-menbers.aspx.vb" Inherits="betatesting.edit_board_menbers" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
<Triggers>
                        <asp:PostBackTrigger ControlID="UpdateDoctors" />
                    </Triggers>
                <ContentTemplate>
<DIV align=center><asp:Label id="LblMsg" runat="server"></asp:Label>&nbsp;</DIV><BR /><BR />
<TABLE style="BORDER-COLLAPSE: collapse" cellSpacing=0 cellPadding=0 align=center border=1><TBODY><TR><TD>
<TABLE cellSpacing=5 cellPadding=0 align=center>
<TBODY><TR><TD class="boldwhite" align=center colSpan=6>Amend Doctor Information</TD></TR>
        <TR><TD vAlign=top>Designation</TD><TD vAlign=top>:</TD><TD><asp:TextBox id="DoctorCode" runat="server" MaxLength="100"></asp:TextBox></TD>
        <TD>Email Id</TD><TD>:</TD>
        <TD><asp:TextBox id="EmailId" runat="server" MaxLength="100"></asp:TextBox> <asp:RegularExpressionValidator id="REVEmailID" runat="server" Display="None" ControlToValidate="EmailId" ErrorMessage="Invalid Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator> </TD></TR><TR><TD>Salutation</TD><TD>:</TD><TD><asp:DropDownList id="Salutation" runat="server">            
                <asp:ListItem>Mr</asp:ListItem>
                <asp:ListItem>Ms</asp:ListItem>
                <asp:ListItem>Mrs</asp:ListItem>
            </asp:DropDownList></TD><TD>Doctor Name</TD><TD>:</TD><TD><asp:TextBox id="DoctorName" runat="server" MaxLength="100"></asp:TextBox></TD></TR><TR><TD vAlign=top>Age</TD><TD>:</TD><TD><asp:TextBox id="Age" runat="server" MaxLength="2"></asp:TextBox> <asp:RegularExpressionValidator id="REVAGE" runat="server" Display="None" ControlToValidate="Age" ErrorMessage="Only Numbers are allowed for age" ValidationExpression="[0-9]*"></asp:RegularExpressionValidator></TD><TD vAlign=top>Gender</TD><TD vAlign=top>:</TD><TD><asp:RadioButtonList id="rblstgen" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="M" Selected="True">Male</asp:ListItem>
<asp:ListItem Value="F">Female</asp:ListItem>
</asp:RadioButtonList></TD></TR><TR><TD vAlign=top>Surgeon</TD><TD vAlign=top>:</TD><TD><asp:RadioButtonList id="RBLstSur" runat="server" RepeatDirection="Horizontal"><asp:ListItem Value="Y">Yes</asp:ListItem>
<asp:ListItem Value="N" Selected="True">No</asp:ListItem>
</asp:RadioButtonList></TD>
<TD vAlign=top>Branch Name</TD><TD vAlign=top>:</TD>
                        <TD>
                            <asp:ListBox ID="LBBranch" runat="server" SelectionMode="Multiple"></asp:ListBox>
                        <asp:RequiredFieldValidator ID="RFVBranch" runat="server"  
                            ControlToValidate="LBBranch" Display="None" 
                            ErrorMessage="Branch Should Not Be Empty"></asp:RequiredFieldValidator>
                        </TD>
</TR><TR><TD>Blood Group</TD><TD>:</TD><TD><asp:DropDownList id="DDlBG" runat="server"><asp:ListItem Value="0">-- Select Blood Group --</asp:ListItem>
</asp:DropDownList></TD><TD vAlign=top>Qualification</TD><TD vAlign=top>:</TD><TD>
                        <asp:TextBox ID="TxtQualification" runat="server"></asp:TextBox>
                        </TD></TR><TR><TD colSpan=6 align="right">
                        <asp:Image ID="ImgPhoto" runat="server" Visible="False" />
&nbsp;</TD></TR>
                    <TR><td class="boldgray" vAlign="top" colspan="2">Specialities</td>
                        <TD class="boldgray" vAlign="top" colspan="2">Department&nbsp;</TD>
                        <td class="boldgray" vAlign="top" colspan="2">Institutes</td>
                    </TR>
                    <TR><td vAlign="top" Height="250px" colspan="2"><asp:ListBox ID="LBSpecialities" runat="server" SelectionMode="Multiple"></asp:ListBox></td>
                        <TD vAlign="top" Height="250px" colspan="2"><asp:ListBox id="LBDepartments" runat="server"  SelectionMode="Multiple"></asp:ListBox> </td>
                        <td vAlign="top" Height="250px" colspan="2"><asp:ListBox ID="LBInstitutes" runat="server" SelectionMode="Multiple"></asp:ListBox>&nbsp; 
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
                        </TD>
                    </TR>
                    <TR><TD class="boldgray" colspan="6">Permanent Address</TD></TR>
                    <TR><TD vAlign=top>Address</TD><TD vAlign=top>:</TD><TD>
                    <asp:TextBox ID="Address" runat="server" MaxLength="800" Rows="3" TextMode="MultiLine"></asp:TextBox>
                    </TD></TR><TR><TD vAlign=top>Country</TD><TD vAlign=top>:</TD><TD>
                        <asp:DropDownList id="ddlCountry" runat="server" AutoPostBack="True" 
                            OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged">
                        </asp:DropDownList></TD><TD vAlign=top>State</TD><TD vAlign=top>:</TD><TD>
                        <asp:DropDownList ID="ddlState" runat="server" AutoPostBack="True" 
                            OnSelectedIndexChanged="ddlState_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="0">--Select State --</asp:ListItem>
                        </asp:DropDownList>
                        </TD></TR><TR><TD valign="top">City</TD>
                        <td valign="top">:</td>
                        <td>
                            <asp:DropDownList ID="ddlCity" runat="server">
                                <asp:ListItem Selected="True" Value="0">--Select City --</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td valign="top">
                            Zip</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:TextBox ID="Zip" runat="server" MaxLength="10"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="REVZip" runat="server" 
                                ControlToValidate="Zip" Display="None" 
                                ErrorMessage="Only Numerics Are Allowed for Zip Code in Permanent Address" 
                                ValidationExpression="[0-9]*"></asp:RegularExpressionValidator>
                        </td>
                    </TR><TR><TD class="boldgray" colspan="6">Present Address</TD></TR><TR><TD vAlign=top>
                    Address</TD><TD vAlign=top>:</TD><TD>
                    <asp:TextBox ID="PAddress" runat="server" MaxLength="800" Rows="3" 
                        TextMode="MultiLine"></asp:TextBox>
                    </TD></TR><TR><TD vAlign=top>Country</TD><TD vAlign=top>:</TD><TD>
                        <asp:DropDownList id="ddlPCountry" runat="server" AutoPostBack="True">
</asp:DropDownList></TD><TD vAlign=top>State</TD><TD vAlign=top>:</TD><TD>
                        <asp:DropDownList ID="ddlPState" runat="server" AutoPostBack="True" 
                            OnSelectedIndexChanged="ddlPState_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="0">--Select State --</asp:ListItem>
                        </asp:DropDownList>
                        </TD></TR><TR><TD valign="top">City</TD>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:DropDownList ID="ddlPCity" runat="server">
                                <asp:ListItem Selected="True" Value="0">--Select City --</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td valign="top">
                            Zip</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:TextBox ID="PZip" runat="server" MaxLength="10"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="REVPZip" runat="server" 
                                ControlToValidate="PZip" Display="None" 
                                ErrorMessage="Only Numbers Are Allowed For Zip Code in Present Address" 
                                ValidationExpression="[0-9]*"></asp:RegularExpressionValidator>
                        </td>
                    </TR><TR><TD class="boldgray" colspan="6">Contact Details</TD></TR><TR><TD>
                    Residence Ph#</TD><TD>:</TD><TD>
                    <asp:TextBox ID="ResPh" runat="server" MaxLength="15"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="REVResph" runat="server" 
                        ControlToValidate="ResPh" Display="None" 
                        ErrorMessage="Only Numbers Are Allowed For Residence Phone Number" 
                        ValidationExpression="[0-9]*"></asp:RegularExpressionValidator>
                    </TD>
                    <td>
                        Mobile Ph#</td>
                    <td>
                        :</td>
                    <td>
                        <asp:TextBox ID="MobPh" runat="server" MaxLength="15"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="REVMobph" runat="server" 
                            ControlToValidate="MobPh" Display="None" 
                            ErrorMessage="Only Numbers Are Allowed For Mobile Phone Number" 
                            ValidationExpression="[0-9]*"></asp:RegularExpressionValidator>
                    </td>
                    </TR>
                    <tr>
                        <td>
                            Hopsital Ph#</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:TextBox ID="TxtHosPh" runat="server" MaxLength="20"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="REVHosPh" runat="server" 
                                ControlToValidate="TxtHosPh" Display="None" 
                                ErrorMessage="Only Numbers Are Allowed For Hospital Phone Number" 
                                ValidationExpression="[0-9]*"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                            Hospital Ph Ext</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:TextBox ID="TxtHosPhExt" runat="server" MaxLength="10"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="REVHosPhExt" runat="server" 
                                ControlToValidate="TxtHosPhExt" Display="None" 
                                ErrorMessage="Only Numbers Are Allowed For Hospital Phone Extension Number" 
                                ValidationExpression="[0-9]*"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <TR>
                        <td valign="top">
                            Billing Service Code</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:TextBox ID="BillingServiceCode" runat="server"></asp:TextBox>
                        </td>
                    </TR><TR><TD class="boldgray" colspan="6">Experience</TD></TR><TR><TD vAlign=top>
                    Joining Date</TD><TD vAlign=top>:</TD><TD>&nbsp;<asp:TextBox id="JoinDate" 
                        runat="server" __designer:wfdid="w16"></asp:TextBox>
                    <asp:ImageButton ID="Image1" runat="Server" __designer:wfdid="w12" 
                        AlternateText="Click to show calendar" CausesValidation="False" 
                        ImageUrl="~/images/Calendar_scheduleHS.png" />
                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" 
                        __designer:wfdid="w13" PopupButtonID="Image1" TargetControlID="JoinDate">
                    </cc1:CalendarExtender>
                    </TD></TR><TR><TD vAlign=top>Passport Number</TD><TD vAlign=top>:</TD><TD>
                        <asp:TextBox id="Passport" runat="server" MaxLength="20"></asp:TextBox></TD><TD vAlign=top>
                            Pan Number</TD><TD vAlign=top>:</TD><TD><asp:TextBox id="Pan" 
                            runat="server" MaxLength="20"></asp:TextBox> </TD></TR><TR><TD valign="top">
                        Insurance Card Number</TD>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:TextBox ID="Insurance" runat="server" MaxLength="20"></asp:TextBox>
                        </td>
                        <td valign="top">
                            Max Patients Per Day</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:TextBox ID="MaxPatients" runat="server" CausesValidation="True" 
                                MaxLength="2"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="REVMaxPat" runat="server" 
                                ControlToValidate="MaxPatients" Display="None" 
                                ErrorMessage="Only Numbers Are Allowed For Max Patients" 
                                ValidationExpression="[0-9]*"></asp:RegularExpressionValidator>
                        </td>
                    </TR>
                    <tr>
                        <td valign="top">Photo</td>
                        <td valign="top">&nbsp;</td>
                        <td>
                            <asp:FileUpload ID="FUPhoto" runat="server" />
                        </td>
                        <td valign="top">
                            Profile</td>
                        <td valign="top">
                            &nbsp;</td>
                        <td>
                            <asp:TextBox ID="txtProfilePath" runat="server"></asp:TextBox>
                            <asp:FileUpload ID="FUProfile" runat="server" Visible="false" />
                        </td>
                    </tr>


    <TR><td vAlign=top> Brief Profile</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="Txtbriefprofile" runat="server" Height="500px" Width="800px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Present Position</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="Txtpresentposition" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Qualifications</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="TxtQualifications" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>


    <TR><td vAlign=top> Special Training</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtsepcialtraining" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>


    <TR><td vAlign=top> Experience</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtexperience" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Expertise</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtexpertise" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Achievements/Breakthrough Cases</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtachievements" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Publications</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtpublications" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Awards And Honors</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtawardsandhonours" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

   
    
     <TR><td vAlign=top> Academic Exposure</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtacademicexposure" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

     <TR><td vAlign=top> Talk Delivered</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txttalkdelivered" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Other</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtothers" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Media/td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtmedia" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle"> Meta Description</td>
                <td><asp:TextBox ID="txtmetades" runat="server" TextMode="MultiLine" Rows="2" Columns="50"></asp:TextBox></td>
            </tr>
     <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle"> Meta  key Word</td>
                <td><asp:TextBox ID="txtmetakeyword" runat="server" TextMode="MultiLine" Rows="2" Columns="50"></asp:TextBox></td>
            </tr>
     <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle"> Meta Title</td>
                <td><asp:TextBox ID="txtmetatitle" runat="server" TextMode="MultiLine" Rows="2" Columns="50"></asp:TextBox></td>
            </tr>
    <%-- <tr><TD vAlign=top class="tdStyle">First Branch Name</TD><TD></tr> 
    <asp:ListBox ID="LBFirstBranch" runat="server" Rows="3" ></asp:ListBox>
    --%>
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
     <tr>
        <td  valign="top" colspan="2"><strong></strong>
            &nbsp;</td>
    </tr>

    
    </td></TR>
    <%--<table>
   <tr><TD vAlign=top class="tdStyle">Second  Branch Name</TD><TD></tr> 
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
   </table>--%>
   
                     <tr>
                        <td align="center" colspan="6">
                            <asp:Button ID="UpdateDoctors" runat="server" onclick="UpdateDoctors_Click" 
                                Text="Save" />
                            &nbsp;&nbsp;
                            <input id="Reset1" tabindex="0" type="reset" value="Clear" />
                            <br />
                            <asp:RequiredFieldValidator ID="RFVDoctorName" runat="server" 
                                ControlToValidate="DoctorName" Display="None" 
                                ErrorMessage="Doctor Name Should Not Be Empty"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                ShowMessageBox="True" ShowSummary="False" />
                            <br />
                            <asp:Label ID="LblDocPhoto" runat="server" __designer:wfdid="w2" 
                                Visible="False"></asp:Label>
                            <asp:Label ID="LblProfile" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    </TBODY></TABLE></TD></TR></TBODY></TABLE>
</ContentTemplate>
                   </asp:UpdatePanel>
</asp:Content>

