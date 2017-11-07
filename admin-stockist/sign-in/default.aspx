<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-stockist/innebasepage.master" CodeBehind="Default.aspx.vb" Inherits="betatesting._Default38" %>
<asp:Content ID="Content1" ContentPlaceHolderID="NavigationPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

      <div>

        <asp:Label ID="LblMsg" runat="server" Font-Bold="True" 
        Font-Size="Medium"></asp:Label>

    <asp:TextBox ID="TxtEmailId" runat="server" placeholder="Enter existing email-id" CssClass="form-control"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TxtEmailId" Display="None" ErrorMessage="Enter emailid/mobile/sapid!"></asp:RequiredFieldValidator>

         <asp:TextBox ID="txtpassword" type="password" runat="server" placeholder="Enter password" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtpassword" Display="None" ErrorMessage="Password Required!"></asp:RequiredFieldValidator>
        




        	<asp:Button ID="BtnSave" runat="server" Text="SIGN IN" style="background-color: #03abd4; color:#fff;width: 100px; height: 35px; font-family: 'allerregular'; margin-right:5px; border:1px solid #ccc;" />
        			
        			<asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            		ShowMessageBox="True" ShowSummary="False" />
    </div>
  
</asp:Content>
