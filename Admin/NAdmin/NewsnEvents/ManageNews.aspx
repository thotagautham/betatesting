<%@ Page Language="VB" MasterPageFile="../../AdminBasePage.master" AutoEventWireup="false" Inherits="KimsHospitals.Admin_NAdmin_Miscellaneous_ManageNews" title="Untitled Page" Codebehind="ManageNews.aspx.vb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<DIV align=center><asp:Label id="LblMsg" runat="server"></asp:Label>&nbsp;</DIV><BR /><BR />
<TABLE style="BORDER-COLLAPSE: collapse" cellSpacing=0 cellPadding=0 align=center border=1>
    <TBODY>
        <TR>
            <td>
                <TABLE cellSpacing=5 cellPadding=0 align=center>
                    <TBODY>
                        <TR class="GridRowStyle"><td class="GridHeaderStyle">Manage News</td></TR>
                        <tr class="RowStyle"><td  class="tdStyle">News Title</td><td>:</td><td>
                            <asp:TextBox ID="TxtNewsTitle" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVNewsTitle" runat="server" ControlToValidate="TxtNewsTitle"
                                Display="None" ErrorMessage="Enter Title"></asp:RequiredFieldValidator></td></tr>
                        <tr class="RowStyle">
                            <td valign="top"  class="tdStyle">
                                Descripiton</td>
                            <td valign="top">
                                :</td>
                            <td>
                                <asp:TextBox ID="TxtNewsDesc" runat="server" Columns="65" Rows="10" TextMode="MultiLine"></asp:TextBox></td>
                        </tr>
                        <tr class="AlternateRowStyle">
                            <td valign="top"  class="tdStyle">
                                Date</td>
                            <td valign="top">
                                :</td>
                            <td>
                                <asp:TextBox ID="EventDate" runat="server"></asp:TextBox>
            <asp:ImageButton ID="Image1" runat="Server" AlternateText="Click to show calendar"
                CausesValidation="False" ImageUrl="~/images/Calendar_scheduleHS.png" /><br />
            <cc1:calendarextender id="CalendarExtender1" runat="server" popupbuttonid="Image1"
                targetcontrolid="EventDate" Format="MM/dd/yyyy"></cc1:calendarextender><asp:RequiredFieldValidator
                                    ID="RFVEventDate" runat="server" ControlToValidate="EventDate" Display="None"
                                    ErrorMessage="Event Date Should Not Be Empty"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EventDate"
                                    Display="None" ErrorMessage="Invalid Date Format" ValidationExpression="^[0-2]?[0-9](/|-)[0-3]?[0-9](/|-)[1-2][0-9][0-9][0-9]$"></asp:RegularExpressionValidator></td>
                        </tr>
                        <tr class="RowStyle">
                            <td valign="top"  class="tdStyle">
                                PDF(If Any)</td>
                            <td valign="top">
                                :</td>
                            <td>
                                <asp:FileUpload ID="NewsPDF" runat="server" /></td>
                        </tr>
                        <tr class="AlternateRowStyle">
                            <td colspan="3" align=center>
                                <asp:Button ID="BtnSave" runat="server" Text="Save" />
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                                    ShowSummary="False" />
                            </td>
                        </tr>
                    </TBODY> 
               </TABLE>
            </td>
         </TR>
    </TBODY>
</TABLE>           
<script  type="text/javascript">
editor_generate('ctl00_ContentPlaceHolder1_TxtNewsDesc');
</script>
</asp:Content>

