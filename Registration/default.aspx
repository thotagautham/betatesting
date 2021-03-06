﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default.aspx.vb" Inherits="betatesting._default5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <tr><td align="center"><asp:Label ID="LblMsg" runat="server" Font-Bold="True" Font-Size="Medium"></asp:Label></td></tr>
    <tr class="RowStyle"><td class="tdStyle">First Name</td><td class="tdStyle">
        <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVName" runat="server" 
            ControlToValidate="TxtName" Display="None" ErrorMessage="Enter Name"></asp:RequiredFieldValidator>
        </td></tr>
   <tr class="RowStyle"><td class="tdStyle">Last Name</td><td class="tdStyle">
        <asp:TextBox ID="txtlastname" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TxtName" Display="None" ErrorMessage="Enter Name"></asp:RequiredFieldValidator>
        </td></tr>
    <tr class="AlternateRowStyle">
        <td class="tdStyle">Email Id</td>
        <td class="tdStyle"><asp:TextBox ID="TxtEmailId" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="REVEmailID" runat="server" 
                ControlToValidate="TxtEmailId" Display="None" ErrorMessage="Invalid Email ID" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />Enter Email Id to send login details to the user</td></tr>
    
    <tr class="RowStyle"><td class="tdStyle">Password</td><td class="tdStyle">
        <asp:TextBox ID="txtpassword" type="password" runat="server"></asp:TextBox>
        
        </td></tr>

         <tr class="RowStyle"><td class="tdStyle">Re Enter Password</td><td class="tdStyle">
        <asp:TextBox ID="txtreenterpassword" type="password" runat="server"></asp:TextBox>
        
        </td></tr>
    <tr class="RowStyle"><td colspan="2" align="center"><asp:Button ID="BtnSave" runat="server" Text="Save" />
        &nbsp;
        <asp:Button ID="BtnCancel" runat="server" Text="Cancel" />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            ShowMessageBox="True" ShowSummary="False" />
        </td></tr>
    <tr><td colspan="2" class="tdStyle">Note : Password will be auto generated by the system</td></tr>
</table>
    </div>
    </form>
</body>
</html>
