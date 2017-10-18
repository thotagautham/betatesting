<%@ Page Language="VB" MasterPageFile="../../AdminBasePage.master" AutoEventWireup="false" Inherits="KimsHospitals.Admin_NAdmin_Doctors_DocotrDetails" title="Untitled Page" Codebehind="DoctorDetails.aspx.vb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">
        <tr>
            <td>
                <table align="center" cellpadding="0" cellspacing="5">
                    <tr>
                        <td align="center" class="boldwhite" colspan="6">
                            Doctor Details</td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Designation</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:Label ID="DoctorCode" runat="server"></asp:Label></td>
                        <td>
                            Email Id</td>
                        <td>
                            :</td>
                        <td>
                            &nbsp;
                            <asp:Label ID="EmailID" runat="server"></asp:Label></td>
                    </tr>
                    <tr style="color: #000000">
                        <td>
                            Doctor Name</td>
                        <td>
                            :</td>
                        <td>
                            <asp:Label ID="DoctorName" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td style="height: 19px" valign="top">
                            Age</td>
                        <td style="height: 19px">
                            :</td>
                        <td style="height: 19px">
                            &nbsp;<asp:Label ID="Age" runat="server"></asp:Label></td>
                        <td style="color: #000000; height: 19px" valign="top">
                            Gender</td>
                        <td style="height: 19px" valign="top">
                            :</td>
                        <td style="height: 19px">
                            <asp:Label ID="gender" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Surgeon</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:Label ID="surgeon" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td>
                            Blood Group</td>
                        <td>
                            :</td>
                        <td>
                            <asp:Label ID="BloodGroup" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="right" colspan="6">
                            <table align="center" cellpadding="0" cellspacing="5">
                                <tr>
                                    <td>
                                        <asp:Image ID="ImgPhoto" runat="server" Visible="False" /></td>
                                </tr>
                            </table>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Specialisation</td>
                        <td valign="top">
                            :</td>
                        <td>
                            &nbsp;<asp:Label ID="Specialization" runat="server"></asp:Label></td>
                        <td style="color: #000000" valign="top">
                            Department</td>
                        <td valign="top">
                            :</td>
                        <td>
                            &nbsp;<asp:Label ID="Department" runat="server"></asp:Label></td>
                    </tr>
                    <tr style="color: #000000">
                        <td style="color: #000000" valign="top">
                            Institute</td>
                        <td valign="top">
                            :</td>
                        <td>
                            &nbsp;<asp:Label ID="LblInstitute" runat="server"></asp:Label></td>
                        <td valign="top">
                            Qualification</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:Label ID="Qualification" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="boldgray" colspan="6">
                            Permanent Address</td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Address</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:Label ID="Address" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Country</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:Label ID="Country" runat="server"></asp:Label></td>
                        <td valign="top">
                            State</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:Label ID="State" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td valign="top">
                            City</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:Label ID="City" runat="server"></asp:Label></td>
                        <td valign="top">
                            Zip</td>
                        <td valign="top">
                            :</td>
                        <td>
                            &nbsp;<asp:Label ID="Zip" runat="server"></asp:Label></td>
                    </tr>
                    <tr style="color: #000000">
                        <td class="boldgray" colspan="6">
                            Present Address</td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Address</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:Label ID="PAddress" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Country</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:Label ID="PCountry" runat="server"></asp:Label></td>
                        <td valign="top">
                            State</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:Label ID="PState" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td valign="top">
                            City</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:Label ID="PCity" runat="server"></asp:Label></td>
                        <td valign="top">
                            Zip</td>
                        <td valign="top">
                            :</td>
                        <td>
                            &nbsp;<asp:Label ID="PZip" runat="server"></asp:Label></td>
                    </tr>
                    <tr style="color: #000000">
                        <td class="boldgray" colspan="6">
                            Contact Details</td>
                    </tr>
                    <tr>
                        <td>
                            Residence Ph#</td>
                        <td>
                            :</td>
                        <td>
                            &nbsp;<asp:Label ID="ResPh" runat="server"></asp:Label></td>
                        <td style="color: #000000">
                            Mobile Ph#</td>
                        <td>
                            :</td>
                        <td>
                            &nbsp;<asp:Label ID="MobPh" runat="server"></asp:Label></td>
                    </tr>
                    <tr style="color: #000000">
                        <td>
                            Hopsital Ph#</td>
                        <td>
                            :</td>
                        <td>
                            &nbsp;<asp:Label ID="HosPh" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="boldgray" colspan="6">
                            General
                            Timings</td>
                    </tr>
                    <tr>
                        <td class="boldgray" colspan="6">
                            Online Appointment Slot Timings</td>
                    </tr>
                    <tr>
                        <td class="boldgray" colspan="6">
                            Working At</td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Country</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:Label ID="BCountry" runat="server"></asp:Label></td>
                        <td valign="top">
                            State</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:Label ID="BState" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td valign="top">
                            City</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:Label ID="BCity" runat="server"></asp:Label></td>
                        <td valign="top">
                            Branch Name</td>
                        <td valign="top">
                            :</td>
                        <td>
                            &nbsp;<asp:Label ID="BranchName" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Billing Service Code</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:Label ID="BillingServiceCode" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td class="boldgray" colspan="6">
                            Experience</td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Joining Date</td>
                        <td valign="top">
                            :</td>
                        <td>
                            &nbsp;&nbsp;
                            <asp:Label ID="JoinDate" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Passport Number</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:Label ID="Passport" runat="server"></asp:Label></td>
                        <td valign="top">
                            Pan Number</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:Label ID="Pan" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Insurance Card Number</td>
                        <td valign="top">
                            :</td>
                        <td>
                            <asp:Label ID="Insurance" runat="server"></asp:Label></td>
                        <td valign="top">
                            Max Patients Per Day</td>
                        <td valign="top">
                            :</td>
                        <td>
                            &nbsp;<asp:Label ID="MaxPatients" runat="server"></asp:Label></td>
                    </tr>
                    <tr>
                        <td align="center" colspan="6">
                            &nbsp; &nbsp;<br />
                            <br />
                            <br />
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

