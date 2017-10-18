<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="add-media.aspx.vb" Inherits="betatesting.add_media" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
<div align="center">
    <table border="1" cellpadding="0" cellspacing="0" style="border-collapse:collapse" bgcolor="#faf8ff">
        <tr><td><asp:Label ID="LblMsg" runat="server"></asp:Label></td></tr>
        <tr>
            <td style=" padding : 25px 25px 25px 25px; ">
<table border=0 cellpadding=0 cellspacing=0>
   <tr class="GridRowStyle"><td colspan="2" class="GridHeaderStyle">Add Print Media News</td></tr>
    <tr class="RowStyle"><td align="left" class="tdStyle">Title</td><td align="left" 
            class="GridRowStyle"><asp:TextBox ID="TxtTitle" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVTitle" runat="server" 
            ControlToValidate="TxtTitle" Display="None" ErrorMessage="Enter Title" 
            ValidationGroup="VGSave"></asp:RequiredFieldValidator>
        </td></tr>
     <tr class="AlternateRowStyle"><td align="left" class="tdStyle">News Date</td>
        <td align="left">
        <asp:TextBox ID="TxtDate" runat="server"></asp:TextBox><asp:ImageButton id="Image1" runat="Server" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" CausesValidation="False"></asp:ImageButton>
        <asp:RequiredFieldValidator ID="RFVDate" runat="server" 
            ControlToValidate="TxtDate" Display="None" ErrorMessage="Enter News Date" 
            ValidationGroup="VGSave"></asp:RequiredFieldValidator>
        <BR /><cc1:calendarextender id="CalendarExtender1" runat="server" PopupButtonID="Image1" TargetControlID="TxtDate"></cc1:calendarextender>
        </td></tr>
     <tr class="RowStyle"><td align="left" class="tdStyle">Thumbnail image</td><td align="left">
        <asp:FileUpload ID="FUNewsImage" runat="server" />
            <asp:RequiredFieldValidator ID="RFVImage" runat="server" 
                ControlToValidate="FUNewsImage" Display="None" 
                ErrorMessage="Upload Any News Image" ValidationGroup="VGSave"></asp:RequiredFieldValidator>
        </td></tr>
     <tr class="AlternateRowStyle">
        <td valign="top" class="tdStyle">Navigation Url</td>
        <td><asp:TextBox ID="txtnavagationpathurl" runat="server"  ></asp:TextBox>
            <asp:RegularExpressionValidator ID="REVNavigationURL" runat="server" ControlToValidate="txtnavagationpathurl" Display="None" ErrorMessage="Invalid Navigation URL" ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" ValidationGroup="VgSave"></asp:RegularExpressionValidator>
        </td>
    </tr>
     <tr class="RowStyle">
                <td valign="top" class="tdStyle">Upload File</td>
                <td><asp:FileUpload ID="FUDocument" runat="server" />
                    <asp:HyperLink ID="Hlfile" Target ="_blank" runat="server"></asp:HyperLink> </td>
            </tr>
     <tr class="AlternateRowStyle"><td align="left" class="tdStyle">News Paper</td><td align="left">
        <asp:DropDownList ID="DDLNewsPapers" runat="server" AppendDataBoundItems="True">
        </asp:DropDownList>
        </td></tr>
     <tr class="RowStyle"><td align="left" class="tdStyle">News Channel</td><td align="left">
        <asp:DropDownList ID="DDLNewsChannel" runat="server" AppendDataBoundItems="True" >
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RFVNewsPaper" runat="server" 
            ControlToValidate="DDLNewsPapers" Display="None" 
            ErrorMessage="Select Any News Paper" InitialValue="0" ValidationGroup="VGSave"></asp:RequiredFieldValidator>
        </td></tr>
    <tr class="AlternateRowStyle"><td align="left" class="tdStyle">Edition</td><td align="left">
        <asp:TextBox ID="TxtEdition" runat="server">Other</asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RFVEdition" runat="server" 
            ControlToValidate="TxtEdition" Display="None" ErrorMessage="Enter Edition" 
            ValidationGroup="VGSave"></asp:RequiredFieldValidator>
        <br />
        If you know edition then replace &quot;Other&quot; with the edition name, if not please 
        dont remove &quot;Other&quot;</td></tr>
    
    <tr class="RowStyle"><td align="left" class="tdStyle">Page Number</td><td align="left">
        <asp:TextBox ID="TxtPageNumber" runat="server" MaxLength="2"></asp:TextBox>
        </td></tr>
    
    <tr class="AlternateRowStyle"><td align="left" class="tdStyle">Language</td><td align="left">
        <asp:TextBox ID="TxtLanguage" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVLanguage" runat="server" 
            ControlToValidate="TxtLanguage" Display="None" ErrorMessage="Enter Language" 
            ValidationGroup="VGSave"></asp:RequiredFieldValidator>
        </td></tr>
            <tr class="RowStyle">
                <td valign="top" class="tdStyle">Branch</td>
                <td><asp:ListBox ID="lbBranch" runat="server" SelectionMode="Multiple"></asp:ListBox></td>
            </tr>
            <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Institute</td>
                <td><asp:ListBox ID="lbInstitute" runat="server" SelectionMode="Multiple"></asp:ListBox></td>
            </tr>
             <tr class="RowStyle">
                <td valign="top" class="tdStyle">Department</td>
                <td><asp:ListBox ID="lbDepartment" runat="server" SelectionMode="Multiple"></asp:ListBox></td>
            </tr>
            <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Specialty</td>
                <td><asp:ListBox ID="lbSpecialty" runat="server" SelectionMode="Multiple"></asp:ListBox></td>
            </tr>
     <tr class="RowStyle">
                <td valign="top" class="tdStyle">Doctors</td>
                <td><asp:ListBox ID="lbdoctor" runat="server" SelectionMode="Multiple"></asp:ListBox></td>
            </tr>       

      <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Page Title</td>
                <td><asp:TextBox ID="txtpagetittle" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
          
              <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Keywords</td>
                <td><asp:TextBox ID="txtkeywords" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>

             <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">meta tags</td>
                <td><asp:TextBox ID="txtmetatags" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
            <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Page description </td>
                <td><asp:TextBox ID="txtpagedescription" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
           
            
    <tr class="AlternateRowStyle">
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" />
                    <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="VgSave" /> &nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" /> &nbsp;&nbsp;
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="VgSave" ShowSummary="False" ShowMessageBox="True" />
                    <asp:CustomValidator ID="CVsection" runat="server" ClientValidationFunction="checkPageSelection" Display="None" ErrorMessage="Enter Page url/Section or select any Branch/Institute/Department/Speciality" ValidationGroup="VgSave"></asp:CustomValidator>
                </td>
            </tr>
           </table>
                </td>
            </tr>
        </table>
    <asp:Label ID="filename" runat="server" Text="" Visible="False"></asp:Label>
      <asp:Label ID="fileId" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblSearchStr" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblGridDataSource" runat="server" Text="" Visible="False"></asp:Label>
    <asp:GridView ID="GVPrintNews" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" >
        <HeaderStyle CssClass="GridHeaderStyle" />
        <RowStyle CssClass="GridRowStyle" />
        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Label ID="LblImage" runat="server" Text='<%# Eval("ImageURL") %>'></asp:Label> &nbsp;|&nbsp;
                    <asp:LinkButton ID="LnkBtnEdit" runat="server" CausesValidation="false" 
                        CommandName="CmdEdit" CommandArgument='<%# Eval("OHPrintMediaID") %>'
                        Text="Edit"></asp:LinkButton> &nbsp;|&nbsp;
                    <asp:LinkButton ID="LnkBtnDelete" runat="server" CausesValidation="false" 
                        CommandName="CmdDelete" CommandArgument='<%# Eval("OHPrintMediaID") %>'
                        onclientclick="return confirm('Are You Sure You Want To Delete');" 
                        Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="Title" >
                <ItemTemplate>
                    <asp:Label ID="LblTitle" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date" >
                <ItemTemplate>
                    <asp:Label ID="LblDate" runat="server" Text='<%# Bind("NewsDate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="News Paper" >
                <ItemTemplate>
                    <asp:Label ID="LblNewsPaperName" runat="server" 
                        Text='<%# Bind("NewsPaperName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="News Channel" >
               <ItemTemplate>
                    <asp:Label ID="Lblchannelname" runat="server" 
                        Text='<%# Bind("NewsChannelName")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Edition" >
                <ItemTemplate>
                    <asp:Label ID="LblEdition" runat="server" Text='<%# Bind("Edition") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="PageNumber" HeaderText="Page" />
            <asp:TemplateField HeaderText="Language" >
                <ItemTemplate>
                    <asp:Label ID="LblLanguage" runat="server" Text='<%# Bind("Language") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="Navigation Url" >
              <ItemTemplate>
                    <asp:Label ID="LblNavigationURL" runat="server" Text='<%# Eval("PDFName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>


 </div>

</asp:Content>
