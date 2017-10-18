<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/clinic.master" CodeBehind="default.aspx.vb" Inherits="betatesting._default2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <div style="width:500px; margin:0 auto;border:1px solid #949494; ">
        <table align="center" width="100%">
            <tr>
                <td align="center" colspan="2"><asp:Label ID="LblMsg" runat="server" 
                Font-Bold="False" Font-Size="Medium" style="color:red;"></asp:Label></td>
            </tr>
            
            <tr>
                <td height="40" colspan="16" align="center" valign="middle" bgcolor="#03abd4" class="sub_head_white">Change Password</td>
            </tr>
        
            <tr class="RowStyle">
                <td class="tdStyle">Old Password</td>
                <td  class="tdStyle" style="padding:10px;"><asp:TextBox ID="TxtOldPassword" TextMode="password" runat="server" CssClass="form-control" placeholder="Old Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVOldPwd" runat="server" 
                        ControlToValidate="TxtOldPassword" Display="None" 
                        ErrorMessage="Enter Old Password"></asp:RequiredFieldValidator>
                </td>
            </tr>
            
            <tr class="AlternateRowStyle">
                <td  class="tdStyle">New Password</td>
                <td  class="tdStyle" style="padding:10px;"><asp:TextBox ID="TxtNewPassword" TextMode="password" runat="server" CssClass="form-control" placeholder="New Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVNewPassword" runat="server" 
                        ControlToValidate="TxtNewPassword" Display="None" 
                        ErrorMessage="Enter New Password"></asp:RequiredFieldValidator>
                </td>
            </tr>
            
            <tr class="RowStyle">
                <td  class="tdStyle">Confirm New Password</td>
                <td  class="tdStyle" style="padding:10px;"><asp:TextBox ID="TxtConfirmPassword" TextMode="password" runat="server" CssClass="form-control" placeholder="Confirm New Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVConfPassword" runat="server" 
                        ControlToValidate="TxtConfirmPassword" Display="None" 
                        ErrorMessage="Enter Confirm Password"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CVPassword" runat="server" 
                        ControlToCompare="TxtNewPassword" ControlToValidate="TxtConfirmPassword" 
                        Display="None" ErrorMessage="Confirm Password Should Be Same As New Password"></asp:CompareValidator>
                </td>
            </tr>
            
            <tr class="AlternateRowStyle"><td colspan="2" align="center">
                <asp:Button ID="BtnSave" runat="server" Text="SAVE" style="background-color: #03abd4; color:#fff;width: 95px; height: 30px; font-family: 'allerregular'; margin-right:5px; border:1px solid #ccc; margin-top:5px;"/> 
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" />
                </td>
            </tr>
            <tr><td height="15"></td></tr>
        </table>
    </div> 
</asp:Content>
