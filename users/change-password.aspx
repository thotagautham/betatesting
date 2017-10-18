<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/innerbasepage.master" CodeBehind="change-password.aspx.vb" Inherits="betatesting.change_password" %>
<asp:Content ID="Content1" ContentPlaceHolderID="metatagscontent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    
    <div style="width:500px; margin:0 auto; background-color: #8a73ad;">
        <table align="center">
            <tr>
                <td align="center" colspan="2"><asp:Label ID="LblMsg" runat="server" 
                Font-Bold="False" Font-Size="Medium" style="color:red;"></asp:Label></td>
            </tr>
            
            <tr>
                <td  colspan="2" class="HeaderStyle"><h3 style="font-family: Myriad Pro; color:#fff;">Change Password</h3></td>
            </tr>
        
            <tr class="RowStyle">
                <td class="tdStyle">Old Password</td>
                <td  class="tdStyle" style="padding:10px;"><asp:TextBox ID="TxtOldPassword" runat="server" CssClass="form-control" placeholder="Old Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVOldPwd" runat="server" 
                        ControlToValidate="TxtOldPassword" Display="None" 
                        ErrorMessage="Enter Old Password"></asp:RequiredFieldValidator>
                </td>
            </tr>
            
            <tr class="AlternateRowStyle">
                <td  class="tdStyle">New Password</td>
                <td  class="tdStyle" style="padding:10px;"><asp:TextBox ID="TxtNewPassword" runat="server" CssClass="form-control" placeholder="New Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVNewPassword" runat="server" 
                        ControlToValidate="TxtNewPassword" Display="None" 
                        ErrorMessage="Enter New Password"></asp:RequiredFieldValidator>
                </td>
            </tr>
            
            <tr class="RowStyle">
                <td  class="tdStyle">Confirm New Password</td>
                <td  class="tdStyle" style="padding:10px;"><asp:TextBox ID="TxtConfirmPassword" runat="server" CssClass="form-control" placeholder="Confirm New Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVConfPassword" runat="server" 
                        ControlToValidate="TxtConfirmPassword" Display="None" 
                        ErrorMessage="Enter Confirm Password"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CVPassword" runat="server" 
                        ControlToCompare="TxtNewPassword" ControlToValidate="TxtConfirmPassword" 
                        Display="None" ErrorMessage="Confirm Password Should Be Same As New Password"></asp:CompareValidator>
                </td>
            </tr>
            
            <tr class="AlternateRowStyle"><td colspan="2" align="center">
                <asp:Button ID="BtnSave" runat="server" Text="SAVE" style="background-color: #5a5a90; color:#fff;width: 95px; height: 30px; font-family:Myriad Pro; margin-right:5px;"/> 
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" />
                </td>
            </tr>
        </table>
    </div>

</asp:Content>