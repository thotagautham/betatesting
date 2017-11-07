<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-hhc/adminbasepage.master" CodeBehind="change-password.aspx.vb" Inherits="betatesting.change_password2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>
    <div>
        Change Password
    </div>
    <div>

        <asp:Label ID="LblMsg" runat="server"></asp:Label>
    </div>

    <div>
        Change Password
    </div>
    <div>
        Old Password
    </div>
    <div>
        <asp:TextBox ID="TxtOldPassword" runat="server" placeholder="Enter Old Password"></asp:TextBox>

         <asp:RequiredFieldValidator ID="rfvzone" Display="None" runat="server" ControlToValidate="TxtOldPassword" ValidationGroup="vgmanagecity" ErrorMessage="Enter Old Password"></asp:RequiredFieldValidator>
    </div>

    <div>
        New Password

    </div>
    <div>
        <asp:TextBox ID="TxtNewPassword" runat="server" placeholder ="Enter New Password"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" runat="server" ControlToValidate="TxtNewPassword" ValidationGroup="vgmanagecity" ErrorMessage="Enter New Password"></asp:RequiredFieldValidator>
    </div>
    <div>
        Confirm New Password

    </div>
    <div>
        <asp:TextBox ID="TxtConfirmPassword" runat="server" placeholder ="Re Enter New Password"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="None" runat="server" ControlToValidate="TxtConfirmPassword" ValidationGroup="vgmanagecity" ErrorMessage="Re Enter New Password"></asp:RequiredFieldValidator>

           <asp:CompareValidator ID="CVPassword" runat="server" 
                ControlToCompare="TxtNewPassword" ControlToValidate="TxtConfirmPassword" 
                Display="None" ErrorMessage="Confirm Password Should Be Same As New Password"></asp:CompareValidator>
    </div>

    
   <div>
<asp:Button ID="BtnSave" runat="server" Text="Save" 
                ValidationGroup="vgmanagecity" />


     <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="vgmanagecity"  />
           
        </div>
   


</ContentTemplate>
   </asp:UpdatePanel>
</asp:Content>


