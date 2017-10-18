<%@ Page Title="" Language="VB" MasterPageFile="../../AdminBasePage.master" AutoEventWireup="false" Inherits="KimsHospitals.Admin_NAdmin_NewsnEvents_AddNews" Codebehind="AddNews.aspx.vb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div align="center">
    <table border="1" cellpadding="0" cellspacing="0" style="border-collapse:collapse" bgcolor="#faf8ff">
        <tr>
            <td style=" padding : 25px 25px 25px 25px; ">
<table border=0 cellpadding=0 cellspacing=0>
    <tr><td colspan="2">&nbsp;</td></tr>
    <tr><td colspan="2">
        <asp:Label ID="LblMsg" runat="server"></asp:Label>
        </td></tr>
    <tr><td colspan="2">&nbsp;</td></tr>
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
        <BR /><cc1:CalendarExtender id="CalendarExtender1" runat="server" __designer:wfdid="w5" PopupButtonID="Image1" TargetControlID="TxtDate"></cc1:CalendarExtender>
        </td></tr>
        <tr class="RowStyle"><td align="left" class="tdStyle">News Image</td><td align="left">
        <asp:FileUpload ID="FUNewsImage" runat="server" />
            <asp:RequiredFieldValidator ID="RFVImage" runat="server" 
                ControlToValidate="FUNewsImage" Display="None" 
                ErrorMessage="Upload Any News Image" ValidationGroup="VGSave"></asp:RequiredFieldValidator>
        </td></tr>
    <tr class="AlternateRowStyle"><td align="left" class="tdStyle">News Paper</td><td align="left">
        <asp:DropDownList ID="DDLNewsPapers" runat="server" AppendDataBoundItems="True" 
            DataSourceID="ObjDSNewsPapers" DataTextField="NewsPaperName" 
            DataValueField="NewsPaperId">
            <asp:ListItem Value="0">-- Select Any News Paper --</asp:ListItem>
        </asp:DropDownList>
        <asp:ObjectDataSource ID="ObjDSNewsPapers" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetAllActiveData" 
            TypeName=" betatesting.newseventsTableAdapters.NewsPapersTableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_NewsPaperId" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="NewsPaperName" Type="String" />
                <asp:Parameter Name="NewsPaperLogo" Type="String" />
                <asp:Parameter Name="Active" Type="String" />
                <asp:Parameter Name="Original_NewsPaperId" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="NewsPaperName" Type="String" />
                <asp:Parameter Name="NewsPaperLogo" Type="String" />
                <asp:Parameter Name="Active" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:RequiredFieldValidator ID="RFVNewsPaper" runat="server" 
            ControlToValidate="DDLNewsPapers" Display="None" 
            ErrorMessage="Select Any News Paper" InitialValue="0" ValidationGroup="VGSave"></asp:RequiredFieldValidator>
        </td></tr>
    
    <tr class="RowStyle"><td align="left" class="tdStyle">Edition</td><td align="left">
        <asp:TextBox ID="TxtEdition" runat="server">Other</asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RFVEdition" runat="server" 
            ControlToValidate="TxtEdition" Display="None" ErrorMessage="Enter Edition" 
            ValidationGroup="VGSave"></asp:RequiredFieldValidator>
        <br />
        If you know edition then replace &quot;Other&quot; with the edition name, if not please 
        dont remove &quot;Other&quot;</td></tr>
    
    <tr class="AlternateRowStyle"><td align="left" class="tdStyle">Page Number</td><td align="left">
        <asp:TextBox ID="TxtPageNumber" runat="server" MaxLength="2"></asp:TextBox>
        </td></tr>
    
    <tr class="RowStyle"><td align="left" class="tdStyle">Language</td><td align="left">
        <asp:TextBox ID="TxtLanguage" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVLanguage" runat="server" 
            ControlToValidate="TxtLanguage" Display="None" ErrorMessage="Enter Language" 
            ValidationGroup="VGSave"></asp:RequiredFieldValidator>
        </td></tr>
    
    <tr class="AlternateRowStyle"><td align="left" class="tdStyle">Branch</td><td align="left">
        <asp:ListBox ID="LBBranch" runat="server" Rows="3" SelectionMode="Multiple"></asp:ListBox>
        <asp:DropDownList ID="DDLBranch" runat="server" AppendDataBoundItems="True" 
            DataSourceID="ObjDSBranch" DataTextField="BRANCHNAME" DataValueField="BRANCHID">
            <asp:ListItem Value="0">-- Select Branch --</asp:ListItem>
            
        </asp:DropDownList>
        <asp:ObjectDataSource ID="ObjDSBranch" runat="server" DeleteMethod="Delete" 
            InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
            SelectMethod="GetAllBranches" 
            TypeName=" betatesting.DataSetCareTableAdapters.BRANCH1TableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_BRANCHID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="BRANCHNAME" Type="String" />
                <asp:Parameter Name="CITY" Type="Int32" />
                <asp:Parameter Name="STATE" Type="Int32" />
                <asp:Parameter Name="COUNTRY" Type="Int32" />
                <asp:Parameter Name="ACTIVE" Type="String" />
                <asp:Parameter Name="Original_BRANCHID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="BRANCHNAME" Type="String" />
                <asp:Parameter Name="CITY" Type="Int32" />
                <asp:Parameter Name="STATE" Type="Int32" />
                <asp:Parameter Name="COUNTRY" Type="Int32" />
                <asp:Parameter Name="ACTIVE" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
        <asp:RequiredFieldValidator ID="RFVBranch" runat="server" 
            ControlToValidate="DDLBranch" Display="None" ErrorMessage="Select Any Branch" 
            InitialValue="0" ValidationGroup="VGSave"></asp:RequiredFieldValidator>
        </td></tr>
    
    <tr class="RowStyle"><td align="left" class="tdStyle">Specialisation</td><td align="left">
        <asp:DropDownList ID="DDLSpecialisation" runat="server" 
            AppendDataBoundItems="True" DataSourceID="ObjDSSpecialisation" 
            DataTextField="SPECIALIZATIONNAME" DataValueField="SPECIALIZATIONID">
            <asp:ListItem Value="0">-- Select Any Specialisation --</asp:ListItem>
        </asp:DropDownList>
        <asp:ObjectDataSource ID="ObjDSSpecialisation" runat="server" 
            DeleteMethod="Delete" InsertMethod="Insert" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllActiveData" 
            TypeName=" betatesting.DataSetCareTableAdapters.SPECIALIZATIONTableAdapter" 
            UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_SPECIALIZATIONID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="SPECIALIZATIONNAME" Type="String" />
                <asp:Parameter Name="SPECIALIZATIONDESC" Type="String" />
                <asp:Parameter Name="ACTIVE" Type="String" />
                <asp:Parameter Name="DEPARTMENTID" Type="Int32" />
                <asp:Parameter Name="Procedures" Type="String" />
                <asp:Parameter Name="Original_SPECIALIZATIONID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="SPECIALIZATIONNAME" Type="String" />
                <asp:Parameter Name="SPECIALIZATIONDESC" Type="String" />
                <asp:Parameter Name="ACTIVE" Type="String" />
                <asp:Parameter Name="DEPARTMENTID" Type="Int32" />
                <asp:Parameter Name="Procedures" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
        </td></tr>
    
    <tr class="AlternateRowStyle"><td align="left" class="tdStyle">Upload PDF</td><td align="left">
        <asp:FileUpload ID="FUPDF" runat="server" />
        </td></tr>
    
    <tr><td align="center" colspan="2">
        <asp:Button ID="BtnSave" runat="server" Text="Save" ValidationGroup="VGSave" />
        </td></tr>
</table>

    <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
        ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGSave" />

<br /><br />
    <asp:GridView ID="GVPrintNews" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="OHPrintMediaID,ImageURL,PDFName" 
        DataSourceID="ObjDSNews">
        <HeaderStyle CssClass="GridHeaderStyle" />
        <RowStyle CssClass="GridRowStyle" />
        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:TemplateField HeaderText="Title" SortExpression="Title">
                <EditItemTemplate>
                    <asp:TextBox ID="TxtTitle" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVTitle" runat="server" 
                        ControlToValidate="TxtTitle" Display="None" ErrorMessage="Enter Title" 
                        ValidationGroup="VGEdit"></asp:RequiredFieldValidator>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEdit" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LblTitle" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Date" SortExpression="NewsDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TxtDate" runat="server" Text='<%# Bind("NewsDate") %>'></asp:TextBox>
                    <asp:ImageButton id="Image1" runat="Server" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" CausesValidation="False"></asp:ImageButton>
                    <BR /><cc1:CalendarExtender id="CalendarExtender1" runat="server" __designer:wfdid="w5" PopupButtonID="Image1" TargetControlID="TxtDate"></cc1:CalendarExtender>
              <asp:RequiredFieldValidator ID="RFVDate" runat="server" 
            ControlToValidate="TxtDate" Display="None" ErrorMessage="Enter News Date" 
            ValidationGroup="VGEdit"></asp:RequiredFieldValidator> 
            </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LblDate" runat="server" Text='<%# Bind("NewsDate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Image" SortExpression="ImageURL">
                <EditItemTemplate>
                    <asp:FileUpload ID="FUNewsImage" runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LblImage" runat="server" Text='<%# Eval("ImageURL") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="News Paper" SortExpression="NewsPaperName">
                <EditItemTemplate>
                    <asp:DropDownList ID="DDLNewsPaper" runat="server" 
                        DataSourceID="ObjDSNewsPapers" DataTextField="NewsPaperName" 
                        DataValueField="NewsPaperName" selectedvalue='<%# Bind("NewsPaperName") %>'>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LblNewsPaperName" runat="server" 
                        Text='<%# Bind("NewsPaperName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Edition" SortExpression="Edition">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Edition") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Edition") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="PageNumber" HeaderText="Page #" 
                SortExpression="PageNumber" />
            <asp:TemplateField HeaderText="Language" SortExpression="Language">
                <EditItemTemplate>
                    <asp:TextBox ID="TxtLanguage" runat="server" Text='<%# Bind("Language") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVLanguage" runat="server" 
                        ControlToValidate="TxtLanguage" Display="None" ErrorMessage="Enter Language" 
                        ValidationGroup="VGEdit"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Language") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Branch" SortExpression="BranchID">
                <EditItemTemplate>
                    <asp:DropDownList ID="DDlBranch" runat="server" DataSourceID="ObjDSBranch" 
                        DataTextField="BRANCHNAME" DataValueField="BRANCHID" selectedvalue='<%# Bind("BranchID") %>'  AppendDataBoundItems="True">
                    <asp:ListItem Value="0">-- Select Branch --</asp:ListItem>
                   
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LblBranch" runat="server" Text='<%# Bind("BranchID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Specialisation" SortExpression="Specialisation">
                <EditItemTemplate>
                    <asp:DropDownList ID="DDLSpecialisation" runat="server" 
                        DataSourceID="ObjDSSpecialisation" DataTextField="SPECIALIZATIONNAME" 
                        DataValueField="SPECIALIZATIONID" 
                        selectedvalue='<%# Bind("Specialisation") %>' AppendDataBoundItems="True">
                        <asp:ListItem Value="0">-- Select Specialisation --</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LblSpecialisation" runat="server" 
                        Text='<%# Bind("Specialisation") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="PDF" SortExpression="PDFName">
                <EditItemTemplate>
                    <asp:FileUpload ID="FUPdf" runat="server" />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LblPDF" runat="server" Text='<%# Eval("PDFName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
                        CommandName="CmdDelete" CommandArgument='<%# Eval("OHPrintMediaID") %>'
                        onclientclick="return confirm('Are You Sure You Want To Delete');" 
                        Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>    
        </Columns>
    </asp:GridView>


    <asp:ObjectDataSource ID="ObjDSNews" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetAllData" 
        TypeName=" betatesting.newseventsTableAdapters.News_PrintMediaTableAdapter" 
        UpdateMethod="UpdateData">
        <DeleteParameters>
            <asp:Parameter Name="Original_OHPrintMediaID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="NewsDate" Type="DateTime" />
            <asp:Parameter Name="NewsPaperName" Type="String" />
            <asp:Parameter Name="Edition" Type="String" />
            <asp:Parameter Name="PageNumber" Type="String" />
            <asp:Parameter Name="Language" Type="String" />
            <asp:Parameter Name="BranchID" Type="Int32" />
            <asp:Parameter Name="Specialisation" Type="String" />
             <asp:Parameter Name="Original_OHPrintMediaID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="NewsDate" Type="DateTime" />
            <asp:Parameter Name="ImageURL" Type="String" />
            <asp:Parameter Name="NewsPaperName" Type="String" />
            <asp:Parameter Name="NewsPaperLogo" Type="String" />
            <asp:Parameter Name="Edition" Type="String" />
            <asp:Parameter Name="PageNumber" Type="String" />
            <asp:Parameter Name="Language" Type="String" />
            <asp:Parameter Name="BranchID" Type="Int32" />
            <asp:Parameter Name="Specialisation" Type="String" />
            <asp:Parameter Name="PDFName" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>

</td>
        </tr>
    </table>
</div>
<br />
<br />

</asp:Content>

