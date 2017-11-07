<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-stockist/innebasepage.master" CodeBehind="default.aspx.vb" Inherits="betatesting._default33" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <div>
        <asp:TextBox ID="TxtOldPassword" TextMode="password" runat="server" CssClass="form-control" placeholder="Old Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVOldPwd" runat="server" 
                        ControlToValidate="TxtOldPassword" Display="None" 
                        ErrorMessage="Enter Old Password"></asp:RequiredFieldValidator>


        <asp:TextBox ID="TxtNewPassword" TextMode="password" runat="server" CssClass="form-control" placeholder="New Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVNewPassword" runat="server" 
                        ControlToValidate="TxtNewPassword" Display="None" 
                        ErrorMessage="Enter New Password"></asp:RequiredFieldValidator>

        <asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label>

        <asp:TextBox ID="TxtConfirmPassword" TextMode="password" runat="server" CssClass="form-control" placeholder="Confirm New Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVConfPassword" runat="server" 
                        ControlToValidate="TxtConfirmPassword" Display="None" 
                        ErrorMessage="Enter Confirm Password"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CVPassword" runat="server" 
                        ControlToCompare="TxtNewPassword" ControlToValidate="TxtConfirmPassword" 
                        Display="None" ErrorMessage="Confirm Password Should Be Same As New Password"></asp:CompareValidator>
    

         <asp:Button ID="BtnSave" runat="server" Text="SAVE" style="background-color: #03abd4; color:#fff;width: 95px; height: 30px; font-family: 'allerregular'; margin-right:5px; border:1px solid #ccc; margin-top:5px;"/> 
                <br />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" />


    </div>
</asp:Content>
