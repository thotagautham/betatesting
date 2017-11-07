<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="login.ascx.vb" Inherits="betatesting.login1" %>

 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>

<div class="col-xs-12 col-sm-12 col-md-4 col-md-offset-4" style="text-align:center;">

<div class="col-xs-12 col-sm-12 col-md-12" style="text-align:center;">
<h3>Administrator's Login</h3>
</div>


<div class="col-xs-12 col-sm-12 col-md-12" style="text-align:center;">
<br />
<asp:TextBox ID="TxtLoginID" runat="server" CssClass="form-control" placeholder="User name"></asp:TextBox>

     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" runat="server" ControlToValidate="TxtLoginID" ValidationGroup="vgcatlog" ErrorMessage="Enter Name"></asp:RequiredFieldValidator>


</div>

<div class="col-xs-12 col-sm-12 col-md-12" style="text-align:center;">
<br />

<asp:TextBox ID="TxtPwd" runat="server" TextMode="Password" CssClass="form-control"  placeholder="Password"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="None" runat="server" ControlToValidate="TxtPwd" ValidationGroup="vgcatlog" ErrorMessage="Enter Password"></asp:RequiredFieldValidator>
</div>

<div class="col-xs-12 col-sm-12 col-md-12" style="text-align:center;">
<br />
<asp:Button ID="Button1" runat="server" Text="Sign In" ValidationGroup="vgcatlog" />



    
     <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="vgcatlog" />
</div>


<div class="col-xs-12 col-sm-12 col-md-12" style="text-align:center; color:#FF0000;">
<br />
<asp:Label ID="LblMsg" runat="server" Font-Bold="True" 
            Font-Size="Medium"></asp:Label></div>
            <br /><br />
            </div>


           
</ContentTemplate>
   </asp:UpdatePanel>
