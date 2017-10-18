﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="manage-admins.aspx.vb" Inherits="betatesting.manage_admins" %>





<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   
    <asp:Button ID="BtnAddNew" runat="server" Text="Add New" 
                    CausesValidation="False" />

    <asp:Button ID="BtnView" runat="server" Text="View / Search" 
                    CausesValidation="False" />
    <asp:Label ID="LblMsg" runat="server" Font-Bold="True" Font-Size="Medium"></asp:Label>
     <br />
       
    <asp:Panel ID="PnlAddNew" runat="server" Visible="false">


        <div>Add New Admin User</div>

        <div>Name</div>
        <div>
             <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVName" runat="server" 
            ControlToValidate="TxtName" Display="None" ErrorMessage="Enter Name"></asp:RequiredFieldValidator>


        </div>
        <div>
            Login Id
        </div>
        <div>

              <asp:TextBox ID="TxtLoginId" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVLoginId" runat="server" 
            ControlToValidate="TxtLoginId" Display="None" ErrorMessage="Enter Login Id"></asp:RequiredFieldValidator>
        
        </div>

        <div>
            Email Id
        </div>

        <div>

            <asp:TextBox ID="TxtEmailId" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="REVEmailID" runat="server" 
                ControlToValidate="TxtEmailId" Display="None" ErrorMessage="Invalid Email ID" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />Enter Email Id to send login details to the user
        </div>


        <div>
            Select Permitted Sections
        </div>


        <div>
            <asp:CheckBoxList ID="CBLSections" runat="server" RepeatColumns="4" 
                RepeatDirection="Horizontal">
                <asp:ListItem>CMS</asp:ListItem>
                 <asp:ListItem>Users</asp:ListItem>
              </asp:CheckBoxList>
</div>
        <div>
            <asp:Button ID="BtnSave" runat="server" Text="Save" />
        &nbsp;
        <asp:Button ID="BtnCancel" runat="server" Text="Cancel" />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            ShowMessageBox="True" ShowSummary="False" />
        </div>
        <div>
            Note : Password will be auto generated by the system
        </div>
      
    
    </asp:Panel>

    <asp:Panel ID="PnlView" runat="server">

        <div>
Search
        </div>
        <div>
            Name
        </div>
        <div>
            <asp:TextBox ID="TxtName_s" runat="server"></asp:TextBox>
        </div>
        <div>
            Login Id
        </div>
        <div>
            <asp:TextBox ID="TxtLoginId_s" runat="server"></asp:TextBox>
        </div>
        <div> Email</div>

        <div>
            <asp:TextBox ID="TxtEmailId_s" runat="server"></asp:TextBox>
        </div>

        <div>
            <asp:Button ID="BtnSearch" runat="server" Text="Search" 
                        CausesValidation="False" />
                    &nbsp;<asp:Button ID="BtnViewAll" runat="server" Text="View All" 
                        CausesValidation="False" />
        </div>
        <div>

            <asp:GridView ID="GVAdmins" runat="server" 
                        AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="avanaAdminLoginsId">
                    <HeaderStyle CssClass="GridHeaderStyle" />
                    <RowStyle CssClass="GridRowStyle" />
                    <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                    <EmptyDataTemplate><table width="600"><tr><td class="GridHeaderStyle">No Users Found !</td></tr></table></EmptyDataTemplate>
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="User Name" 
                            SortExpression="UserName" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Permissions" HeaderText="Permissions" 
                            SortExpression="Permissions" />
                        <asp:BoundField DataField="EmailID" HeaderText="Email ID" 
                            SortExpression="EmailID" />
                        <asp:ButtonField CommandName="CmdEdit" HeaderText="Edit" Text="Edit" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LnkBtnResetPwd" runat="server" CausesValidation="false" 
                                    CommandName="CmdResetPwd" Text="Reset Password" 
                                    OnClientClick="return confirm('Are You Sure You Want To Reset Password');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LnkBtnActive" runat="server" CausesValidation="false" 
                                    CommandName="CmdActive" Text='<%# Eval("ActiveStatus") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
        </div>
            
          
        </asp:Panel>
    <asp:Label ID="LblGridSource" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="LblOtherAdminID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="LblActiveStatus" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="LblPassword" runat="server" Visible="false"></asp:Label>
</asp:Content>

