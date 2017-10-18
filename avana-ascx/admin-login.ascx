<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="admin-login.ascx.vb" Inherits="betatesting.admin_login" %>


<asp:TextBox ID="TxtLoginID" runat="server" Width="136px"></asp:TextBox>


<asp:TextBox ID="TxtPwd" runat="server" TextMode="Password"></asp:TextBox>



<asp:Button ID="Button1" runat="server" Text="Sign In" />




<asp:Label ID="LblMsg" runat="server" Font-Bold="True" 
            Font-Size="Medium"></asp:Label>