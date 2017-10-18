<%@ Page Language="VB" MasterPageFile="~/Admin/adminbasepage.master" AutoEventWireup="false" Inherits="betatesting.Admin_Default" title="Administrator Control Panel :: Thnink Beyond Age" Codebehind="Default.aspx.vb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
        
<br />
    <div align=center><asp:Label ID="LblMsg" runat="server" Font-Bold="True" 
            Font-Size="Medium"></asp:Label></div><br /><br />
<div align=center>
<table>
    <tr>
        <td colspan="2" class="HeaderStyle">Administrator's Login</td>
    </tr>
    <tr class="RowStyle">
        <td class="tdStyle">User Name(Login ID)</td>
        <td class="tdStyle"><asp:TextBox ID="TxtLoginID" runat="server" Width="136px"></asp:TextBox></td>
    </tr>
    <tr class="AlternateRowStyle"><td class="tdStyle">Password</td>
        <td  class="tdStyle"><asp:TextBox ID="TxtPwd" runat="server" TextMode="Password"></asp:TextBox></td></tr>
    <tr class="RowStyle"><td colspan="2" align=center><asp:Button ID="Button1" runat="server" Text="Sign In" /></td></tr>
</table>
</div>
</ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>

