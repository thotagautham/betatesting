<%@ Page Title="" Language="VB" MasterPageFile="../../AdminBasePage.master" AutoEventWireup="false" ValidateRequest="false"  Inherits="betatesting.Admin_NAdmin_cms_editpage" Codebehind="editpage.aspx.vb" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table>
        <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td>
        <table bgcolor="#faf8ff">
            <tr><td colspan="2" class="boldwhite" height="30">Edit</td></tr>
            <tr>
                    <td align="center" colspan="2" >
                        <asp:Label ID="LblMsg" runat="server" Style="position: relative"></asp:Label></td>
            </tr>
            <tr><td>Select Page to edit content</td>
                <td><asp:DropDownList ID="DDLPages" runat="server" AutoPostBack="True" >
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RFVPage" runat="server" ControlToValidate="DDLPages"
                    Display="None" ErrorMessage="Select Any Page And Try Again !!" InitialValue="0"
                    Style="position: relative" ValidationGroup="VGPEDIT"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr id="sectionrow" runat="server" Visible="False"><td ><strong>Section</strong></td>
                <td ><asp:DropDownList ID="DDLSection" runat="server">
                        <asp:ListItem Value="">-- Select Any Section --</asp:ListItem>
                        <asp:ListItem Value="departments">Departments</asp:ListItem>
                        <asp:ListItem Value="research">Research</asp:ListItem>
                        <asp:ListItem Value="education-and-training">Education & Training</asp:ListItem>
                        <asp:ListItem Value="clinical-trials-and-ethics-committee">Clinical trials and ethics committee</asp:ListItem>
                        <asp:ListItem Value="journal">Journal</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr id="pagenamerow" runat="server" Visible="False"><td><strong>Page Name</strong></td>
                <td> 
                    <asp:TextBox ID="TxtPageName" runat="server" CssClass="textbox"  ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVName" runat="server" ErrorMessage="Name cannot be empty"
                    Style="position: relative" Display="None" ControlToValidate="TxtPageName"  ValidationGroup="VGPEDIT"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr><td>Title</td>
                <td><asp:TextBox ID="TxtTitle" runat="server" CssClass="textbox" ></asp:TextBox> 
                    <asp:RequiredFieldValidator ID="RFVTitle" runat="server" Display="None" ErrorMessage="Title cannot be empty"
                         ControlToValidate="TxtTitle" ValidationGroup="VGPEDIT"></asp:RequiredFieldValidator>
                </td>
            </tr>
             <tr><td><strong>Sort Order</strong></td><td  valign="top">
                    <asp:TextBox ID="TxtSortOrder" runat="server" MaxLength="2"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="REVSortOrder" runat="server" ControlToValidate="TxtSortOrder"
                Display="None" ErrorMessage="Sort order should be only numeric" ValidationExpression="[0-9]*" ValidationGroup="VGPEDIT"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr><td valign="top" colspan="2">Meta Tags, Keywords & Description</td></tr>
            <tr><td  valign="top" colspan="2">
                <asp:TextBox ID="TxtKeywords" runat="server" Columns="100" Rows="10" 
                    TextMode="MultiLine" style="margin-left: 1px"></asp:TextBox> 
                <asp:RequiredFieldValidator ID="RFVKeywords" runat="server" Display="None" ErrorMessage="Enter Keywords"
                    ControlToValidate="TxtKeywords" ValidationGroup="VGPEDIT"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr><td valign="top" colspan="2">Content</td></tr>
            <tr><td valign="top" colspan="2">
                <FCKeditorV2:FCKeditor ID="TxtContent" runat="server" Height="500px">
                </FCKeditorV2:FCKeditor>
                <asp:CustomValidator ID="CVMessage" runat="server" 
        ClientValidationFunction="CheckEditor" 
        Display="None" ErrorMessage="Enter Page Content" ValidateEmptyText="true"  ValidationGroup="VGPEDIT" ></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    &nbsp;<asp:Button ID="BtnSubmit" runat="server" 
                        Style="position: relative; left: 0px; top: -1px;" Text="Save" 
                        OnClick="BtnSubmit_Click" ValidationGroup="VGPEDIT" CssClass="button"  />&nbsp;
                    <asp:Button ID="BtnDelete"  runat="server" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?');" Visible="False"  />    
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                        ShowSummary="False" Style="position: relative; top: 0px; left: 0px;" 
                        ValidationGroup="VGPEDIT" />
                    <asp:TextBox ID="TxtShowHide" runat="server" Visible="False"></asp:TextBox>
                    
                    <asp:TextBox ID="txtOldPageUrl" runat="server" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" height="3" background="../../images/body_topbg.gif" style="width: 110px"></td>
            </tr>
            </table>
            </td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
    </table>
    
    <script type="text/javascript">


        function CheckEditor(source, args) {
            var fckBody = FCKeditorAPI.GetInstance('ContentPlaceHolder1_TxtContent');
            args.IsValid = fckBody.GetXHTML(true) != "";
        }
    
        function FCKeditor_OnComplete(editorInstance) {
            FCKeditorAPI.GetInstance('ContentPlaceHolder1_TxtContent').Commands.GetCommand('Flash').Execute = function () { return false; };
            FCKeditorAPI.GetInstance('ContentPlaceHolder1_TxtContent').Commands.GetCommand('Image').Execute = function () { return false; };
            FCKeditorAPI.GetInstance('ContentPlaceHolder1_TxtContent').Commands.GetCommand('About').Execute = function () { return false; };
            FCKeditorAPI.GetInstance('ContentPlaceHolder1_TxtContent').Commands.GetCommand('Save').Execute = function () { return false; };
        } 
</script>
    
</asp:Content>

