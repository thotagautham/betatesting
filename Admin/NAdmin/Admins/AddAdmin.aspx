<%@ Page Title="" Language="VB" MasterPageFile="~/Admin/AdminBasePage.master" AutoEventWireup="false" Inherits="betatesting.Admin_NAdmin_Admins_AddAdmin" Codebehind="AddAdmin.aspx.vb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <br />
    <table align="center">
        <tr class="RowStyle">
            <td><asp:Button ID="BtnAddNew" runat="server" Text="Add New" 
                    CausesValidation="False" />&nbsp;&nbsp;&nbsp;
                <asp:Button ID="BtnView" runat="server" Text="View / Search" 
                    CausesValidation="False" />
            </td>
        </tr>
        <tr><td align="center"><asp:Label ID="LblMsg" runat="server" Font-Bold="True" Font-Size="Medium"></asp:Label></td></tr>
    </table>   
    <asp:Panel ID="PnlAddNew" runat="server" Visible="false">
      <table align="center">
    
    <tr><td colspan="2" class="HeaderStyle">Add New Admin User</td></tr>
    <tr class="RowStyle"><td class="tdStyle">Name</td><td class="tdStyle">
        <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVName" runat="server" 
            ControlToValidate="TxtName" Display="None" ErrorMessage="Enter Name"></asp:RequiredFieldValidator>
        </td></tr>
   <tr class="RowStyle"><td class="tdStyle">Login Id</td><td class="tdStyle">
        <asp:TextBox ID="TxtLoginId" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVLoginId" runat="server" 
            ControlToValidate="TxtLoginId" Display="None" ErrorMessage="Enter Login Id"></asp:RequiredFieldValidator>
        </td></tr>
    <tr class="AlternateRowStyle">
        <td class="tdStyle">Email Id</td>
        <td class="tdStyle"><asp:TextBox ID="TxtEmailId" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="REVEmailID" runat="server" 
                ControlToValidate="TxtEmailId" Display="None" ErrorMessage="Invalid Email ID" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <br />Enter Email Id to send login details to the user</td></tr>
    <tr class="RowStyle">
        <td colspan="2" class="tdStyle">Select Permitted Sections</td>
    </tr>
    <tr class="AlternateRowStyle">
        <td colspan="2">
            <asp:CheckBoxList ID="CBLSections" runat="server" RepeatColumns="4" 
                RepeatDirection="Horizontal">
                <asp:ListItem>CMS</asp:ListItem>
                <asp:ListItem>Users</asp:ListItem>
                <asp:ListItem>DRUG</asp:ListItem>
                <asp:ListItem>GCS</asp:ListItem>
                <asp:ListItem>GERIATRICS</asp:ListItem>
                <asp:ListItem>GYNACOLOGY</asp:ListItem>
                <asp:ListItem>INNOVATION</asp:ListItem>
                <asp:ListItem>WCW</asp:ListItem>
                <asp:ListItem>VEDIC</asp:ListItem>
                 <asp:ListItem>RETIERMENT-HOMES</asp:ListItem>
                <asp:ListItem>HEALTHCARECONSORIUM</asp:ListItem>
                 <asp:ListItem>EPISTEMO-GLOBAL</asp:ListItem>
                <asp:ListItem>WGC-BIOGENESIS</asp:ListItem>
                <asp:ListItem>UTOPIA-SILVER-STONE</asp:ListItem>
                <asp:ListItem>GENETICS-GENOMICS-MEDICINE</asp:ListItem>
                <asp:ListItem>CARE</asp:ListItem>
                <asp:ListItem>Moksha</asp:ListItem>
            </asp:CheckBoxList>
        </td>
    </tr>
    <tr class="RowStyle"><td colspan="2" align="center"><asp:Button ID="BtnSave" runat="server" Text="Save" />
        &nbsp;
        <asp:Button ID="BtnCancel" runat="server" Text="Cancel" />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            ShowMessageBox="True" ShowSummary="False" />
        </td></tr>
    <tr><td colspan="2" class="tdStyle">Note : Password will be auto generated by the system</td></tr>
</table>
    
    </asp:Panel>

    <asp:Panel ID="PnlView" runat="server">
        <table align="center">
            <tr><td class="HeaderStyle" colspan="5">Search</td></tr>
            <tr class="RowStyle">
                <td class="tdStyle">Name</td>
                <td class="tdStyle"><asp:TextBox ID="TxtName_s" runat="server"></asp:TextBox></td>
                <td class="tdStyle">Login Id</td>
                <td class="tdStyle" colspan="2"><asp:TextBox ID="TxtLoginId_s" runat="server"></asp:TextBox></td>
            </tr>
            <tr class="AlternateRowStyle">
                <td class="tdStyle">Email Id</td>
                <td class="tdStyle"><asp:TextBox ID="TxtEmailId_s" runat="server"></asp:TextBox></td>
                <td><asp:Button ID="BtnSearch" runat="server" Text="Search" 
                        CausesValidation="False" />
                    &nbsp;<asp:Button ID="BtnViewAll" runat="server" Text="View All" 
                        CausesValidation="False" />
                </td>
            </tr>
            <tr>
                <td colspan="5">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="5" align="center"><asp:GridView ID="GVAdmins" runat="server" 
                        AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="OtherAdminId">
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
                </asp:GridView></td>
            </tr>
        </table>
        </asp:Panel>
    <asp:Label ID="LblGridSource" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="LblOtherAdminID" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="LblActiveStatus" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="LblPassword" runat="server" Visible="false"></asp:Label>
</asp:Content>

