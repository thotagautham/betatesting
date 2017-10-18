<%@ Page Title="Uploads :: Administrator :: KFRC" Language="VB" MasterPageFile="../../AdminBasePage.master" AutoEventWireup="false" Inherits="kfrcvb.admin_LoginPages_Uploads" Codebehind="Uploads.aspx.vb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center">
    <table border=1 cellpadding=0 cellspacing=0 style="border-collapse:collapse" bgcolor="#faf8ff">
        <tr>
            <td style=" padding : 25px 25px 25px 25px; ">
            <br />
            <asp:Label ID="LblMsg" runat="server"></asp:Label>
             <table>
        <tr class="RowStyle">
            <td valign="top" class="tdStyle">
                <br />
                                Select Section : 
                <br />
                <br />
            </td>
            <td class="tdStyle"> 
                <br />
                <asp:DropDownList ID="DDLSection" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="0">-- Select Any Section --</asp:ListItem>
                    <asp:ListItem Value="AboutGlobal">About Global</asp:ListItem>
                    <asp:ListItem Value="ForPatients">For Patients</asp:ListItem>
                    <asp:ListItem Value="ForDoctors">For Doctors</asp:ListItem>
                    <asp:ListItem Value="KnowingCancer">Knowing Cancer</asp:ListItem>
                    <asp:ListItem Value="TypesofCancer">Types of Cancer</asp:ListItem>
                    <asp:ListItem Value="TherapiesTreatments">Therapies & Treatments</asp:ListItem>
                    <asp:ListItem Value="DealingWithCancer">Dealing With Cancer</asp:ListItem>
                    <asp:ListItem Value="AboutCancerCure">About Cancer Cure</asp:ListItem>
                    <asp:ListItem Value="Other">Other</asp:ListItem>
               </asp:DropDownList>
                <br />
                <br />
            </td>
        </tr>
        <tr class="AlternateRowStyle">
            <td colspan="2" class="tdStyle">
                <br />
                If the selected file already exists , do you want to replace it or 
                not ?<br />
                <asp:RadioButtonList ID="RBLFileReplace" runat="server" 
                    RepeatDirection="Horizontal">
                    <asp:ListItem>Yes</asp:ListItem>
                    <asp:ListItem Selected="True">No</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr class="RowStyle">
            <td valign="top" class="tdStyle" colspan="2">(Files of type Jpegs,gif, MSword, PDF and HTML Are Allowed)<br />
&nbsp;<asp:Button ID="BtnUpload" runat="server" Text="Upload" />
                <br />
            </td>
        </tr>
        <tr class="RowStyle">
            <td valign="top" class="tdStyle">File 1</td>
            <td class="tdStyle" valign="top">
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr class="RowStyle">
            <td valign="top" class="tdStyle">File 2</td>
            <td class="tdStyle" valign="top">
                <asp:FileUpload ID="FileUpload2" runat="server" />
            </td>
        </tr>
        <tr class="RowStyle">
            <td valign="top" class="tdStyle">File 3</td>
            <td class="tdStyle" valign="top">
                <asp:FileUpload ID="FileUpload3" runat="server" />
            </td>
        </tr>
        <tr class="RowStyle">
            <td valign="top" class="tdStyle">File 4</td>
            <td class="tdStyle" valign="top">
                <asp:FileUpload ID="FileUpload4" runat="server" />
            </td>
        </tr>
        <tr class="RowStyle">
            <td valign="top" class="tdStyle">File 5</td>
            <td class="tdStyle" valign="top">
                <asp:FileUpload ID="FileUpload5" runat="server" />
            </td>
        </tr>
    </table>
  
             <br />
    <asp:RequiredFieldValidator ID="RFVSection" runat="server" 
        ErrorMessage="Select Any Section" ControlToValidate="DDLSection" Display="None" 
        InitialValue="0"></asp:RequiredFieldValidator>
    <asp:CustomValidator ID="CVFiles" runat="server" 
                    ClientValidationFunction="CheckFiles" Display="None" 
                    ErrorMessage="Select Any File And Try Again"></asp:CustomValidator>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
    <br />
    Select File Types&nbsp;&nbsp;:&nbsp;&nbsp;
    <asp:DropDownList ID="DDLImageTypes" runat="server" AppendDataBoundItems="True" 
        AutoPostBack="True">
        <asp:ListItem Value="0">-- View All --</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="UploadFileId" CellPadding="10">
            <RowStyle CssClass="GridRowStyle" />
            <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
            <HeaderStyle CssClass="GridHeaderStyle" />
        <Columns>
            <asp:BoundField DataField="UploadFileName" HeaderText="File Name" 
                SortExpression="UploadFileName" />
            <asp:BoundField DataField="FileType" HeaderText="File Type" 
                SortExpression="FileType" />
            <asp:BoundField DataField="FilePath" HeaderText="File Path" 
                SortExpression="FilePath" />
             <asp:BoundField DataField="UploadedDate" HeaderText="Uploaded Date" />
            <asp:BoundField DataField="UploadedBy" HeaderText="Uploaded By" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LnkBtnDelete" runat="server" CausesValidation="false" 
                        CommandName="CmdDelete" CommandArgument='<%# Eval("UploadFileId") %>'
                        onclientclick="return confirm('Are You Sure You Want To Delete');" 
                        Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>  
        </Columns>
    </asp:GridView>
    <br />
    &nbsp;
</td>
</tr>
    </table>
    
</div>

<br /><br />

<script language="javascript" type="text/javascript">
    
    function CheckFiles(source, args)
    {
        if(document.getElementById('<%= FileUpload1.ClientID %>').value == '' && document.getElementById('<%= FileUpload2.ClientID %>').value == '' && document.getElementById('<%= FileUpload3.ClientID %>').value == '' &&document.getElementById('<%= FileUpload4.ClientID %>').value == '' &&document.getElementById('<%= FileUpload5.ClientID %>').value == '' )
        {
            args.IsValid = false; 
        }
        else
        {
            args.IsValid = true;
        }
        
    } 
</script> 

</asp:Content>

