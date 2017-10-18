<%@ Page Title="Add Pages :: About Us :: Administrator Control Panel :: KFRC" Language="VB" MasterPageFile="../../AdminBasePage.master" ValidateRequest="False" AutoEventWireup="false" Inherits="kfrcvb.Admin_NAdmin_AboutUs_addpages" Codebehind="addpages.aspx.vb" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table>
        <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td>
        <table bgcolor="#faf8ff">
        <tr><td colspan="2" class="boldwhite" height="30">Add New Page</td></tr>
<tr>
    <td align="center" colspan="2" ><asp:Label ID="LblMsg" runat="server" Style="position: relative" ForeColor="Red" ></asp:Label></td>
</tr>
<tr>
<td ><strong>Section</strong></td>
<td ><asp:DropDownList ID="DDLSection" runat="server">
        <asp:ListItem Value="0">-- Select Any Section --</asp:ListItem>
        <asp:ListItem Value="departments">Departments</asp:ListItem>
        <asp:ListItem Value="research">Research</asp:ListItem>
        <asp:ListItem Value="education-and-training">Education & Training</asp:ListItem>
        <asp:ListItem Value="clinical-trials-and-ethics-committee">Clinical trials and ethics committee</asp:ListItem>
        <asp:ListItem Value="journal">Journal</asp:ListItem>
    </asp:DropDownList>
    <asp:RequiredFieldValidator ID="RFVSection" runat="server" 
        ControlToValidate="DDLSection" Display="None" ErrorMessage="Select Any Section" 
        InitialValue="0" ValidationGroup="VGADD"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr>
<td ><strong>Page Name</strong>
</td>
<td > 
    <asp:TextBox ID="TxtPageName" runat="server" CssClass="textbox"  ></asp:TextBox>
    <asp:RequiredFieldValidator ID="RFVName" runat="server" ErrorMessage="Name cannot be empty"
        Style="position: relative" Display="None" ControlToValidate="TxtPageName" ValidationGroup="VGADD"></asp:RequiredFieldValidator>
    </td>
</tr>
<tr><td ><strong>Title</strong></td>
<td>
    <asp:TextBox ID="TxtTitle" runat="server" CssClass="textbox" 
         ></asp:TextBox> 
    <asp:RequiredFieldValidator ID="RFVTitle" runat="server" ErrorMessage="Title cannot be empty"
        Style="position: relative" Display="None" ControlToValidate="TxtTitle" ValidationGroup="VGADD"></asp:RequiredFieldValidator></td>
    </tr>
     <tr><td><strong>Sort Order</strong></td><td  valign="top">
            <asp:TextBox ID="TxtSortOrder" runat="server" MaxLength="2"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtSortOrder"
        Display="None" ErrorMessage="Sort order should be only numeric" ValidationExpression="[0-9]*"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td  valign="top" colspan="2"><strong>Meta Tags, Keywords & Description<asp:RequiredFieldValidator ID="RFVKeyWords" runat="server" Display="None" ErrorMessage="Keywords cannot be empty"
                ControlToValidate="TxtKeywords" ValidationGroup="VGADD"></asp:RequiredFieldValidator></strong>
            &nbsp;</td>
    </tr>
    <tr>
        <td  valign="top" colspan="2" style="height: 7px">
            <asp:TextBox ID="TxtKeywords" runat="server" Columns="100" Rows="10" 
                TextMode="MultiLine" style="margin-left: 1px"></asp:TextBox> 
            </td>
    </tr>
    <tr>
    <td valign="top" colspan="2"><strong>Content </strong>
        </td>
    </tr>
    <tr>
    <td valign="top" colspan="2">
        <FCKeditorV2:FCKeditor ID="TxtContent" runat="server" Height="500px">
        </FCKeditorV2:FCKeditor>
        <asp:CustomValidator ID="CVMessage" runat="server" 
                ClientValidationFunction="CheckEditor" 
                Display="None" ErrorMessage="Enter Page Content" ValidateEmptyText="true"  
                ValidationGroup="VGADD"></asp:CustomValidator>
        </td>
    </tr>
    <tr>
        <td colspan="2" align="center">
            &nbsp;<asp:Button ID="BtnSubmit" runat="server" Style="position: relative" 
                Text="Add Page" OnClick="BtnSubmit_Click" ValidationGroup="VGADD" 
                /></td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                ShowSummary="False" Style="position: relative; left: 0px; top: 6px; height: 80px;" 
                ValidationGroup="VGADD" />
        </td>
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

