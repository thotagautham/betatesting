<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-stockist/innebasepage.master" CodeBehind="default.aspx.vb" Inherits="betatesting._default3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="NavigationPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        
        
<br />
    <div ><asp:Label ID="LblMsg" runat="server" ></asp:Label></div>
<div>
<div> Stockist's Login</div>
    <div>
 User Name(Login ID)
    </div>
   
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
