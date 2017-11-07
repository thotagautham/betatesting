<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-hhc/adminbasepage.master" CodeBehind="change-password.aspx.vb" Inherits="betatesting.change_password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table align="center">
    <tr><td align="center" colspan="2"><asp:Label ID="LblMsg" runat="server" 
            Font-Bold="True" Font-Size="Medium"></asp:Label></td></tr>
    <tr>
        <td  colspan="2" class="HeaderStyle">Change Password</td>
    </tr>
    <tr class="RowStyle">
        <td class="tdStyle">Old Password</td>
        <td  class="tdStyle"><asp:TextBox ID="TxtOldPassword" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFVOldPwd" runat="server" 
                ControlToValidate="TxtOldPassword" Display="None" 
                ErrorMessage="Enter Old Password" ValidationGroup=""></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr class="AlternateRowStyle">
        <td  class="tdStyle">New Password</td>
        <td  class="tdStyle"><asp:TextBox ID="TxtNewPassword" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFVNewPassword" runat="server" 
                ControlToValidate="TxtNewPassword" Display="None" 
                ErrorMessage="Enter New Password"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr class="RowStyle">
        <td  class="tdStyle">Confirm New Password</td>
        <td  class="tdStyle"><asp:TextBox ID="TxtConfirmPassword" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFVConfPassword" runat="server" 
                ControlToValidate="TxtConfirmPassword" Display="None" 
                ErrorMessage="Enter Confirm Password"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CVPassword" runat="server" 
                ControlToCompare="TxtNewPassword" ControlToValidate="TxtConfirmPassword" 
                Display="None" ErrorMessage="Confirm Password Should Be Same As New Password"></asp:CompareValidator>
        </td>
    </tr>
    <tr class="AlternateRowStyle"><td colspan="2" align="center">
        <asp:Button ID="BtnSave" runat="server" Text="Save" /> 
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            ShowMessageBox="True" ShowSummary="False" />
        </td></tr>
</table>

</asp:Content>


