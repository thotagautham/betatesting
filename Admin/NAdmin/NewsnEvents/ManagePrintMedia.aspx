<%@ Page Title="Manage Print Media News :: Administrator :: KIMS Hospitals" Language="VB" MasterPageFile="../../AdminBasePage.master" AutoEventWireup="false" Inherits="KimsHospitals.Admin_NAdmin_NewsnEvents_ManagePrintMedia" Codebehind="ManagePrintMedia.aspx.vb" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center">
    <table border=1 cellpadding=0 cellspacing=0 style="border-collapse:collapse" bgcolor="#faf8ff">
        <tr>
            <td style=" padding : 25px 25px 25px 25px; ">
<table width="660" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="152" align="left" valign="top" >
      <br />
        <table width="650" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="7" align="center">
                    <asp:Label ID="LblMsg" runat="server"></asp:Label></td>
            </tr>
          <tr>
            <td width="22" height="22" align="left" valign="top"></td>
            <td class="GridHeaderStyle" colspan=4>Search News 
                </td>
              
            <td width="22" height="22" align="left" valign="top"></td>
          </tr>
            <tr>
                <td width="22" height="22" align="left" valign="top"></td>
                <td height="25" align="left" valign="middle">Title</td>
                <td height="25" align="left" valign="middle">
                    <asp:TextBox ID="TxtTitle" runat="server"></asp:TextBox>
                    <br />
                </td>
                <td height="35" align="left" valign="middle">Date </td>
                <td height="25" align="left" valign="middle">
                    <asp:TextBox ID="TxtDate" runat="server"></asp:TextBox>
                    <asp:ImageButton ID="Image1" runat="server" CausesValidation="False" 
                        ImageUrl="~/images/Calendar_scheduleHS.png" />
                    &nbsp;<cc1:calendarextender id="CalendarExtender1" runat="server" popupbuttonid="Image1"
                        targetcontrolid="TxtDate" Format="MM/dd/yyyy"></cc1:calendarextender>
                     </td>
                <td align="left" height="25" valign="middle">&nbsp;
                    </td>
                <td width="22" height="22" align="left" valign="top"></td>
            </tr>
            <tr>
                <td align="left" height="22" valign="top" width="22">&nbsp;
                    </td>
                <td align="left" height="25" valign="middle">
                    Newspaper</td>
                <td align="left" height="25" valign="middle">
                    <asp:DropDownList ID="DDLNewsPaper" runat="server" AppendDataBoundItems="True" 
                        DataSourceID="ObjDsNewsPapers" 
                        DataTextField="NewsPaperName" DataValueField="NewsPaperName">
                        <asp:ListItem Value="0">-- Select Newspaper --</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left" height="35" valign="middle">
                    Edition</td>
                <td align="left" height="25" valign="middle">
                    <asp:DropDownList ID="DDLEdition" runat="server" AppendDataBoundItems="True" 
                        DataSourceID="ObjDSEdition" DataTextField="Edition" 
                        DataValueField="Edition">
                        <asp:ListItem Value="0">-- Select Edition --</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left" height="25" valign="middle">&nbsp;
                    </td>
                <td align="left" height="22" valign="top" width="22">&nbsp;
                    </td>
            </tr>
            <tr>
                <td align="left" height="22" valign="top" width="22">&nbsp;
                    </td>
                <td align="left" height="25" valign="middle">
                    Language</td>
                <td align="left" height="25" valign="middle">
                    <asp:DropDownList ID="DDLLanguage" runat="server" AppendDataBoundItems="True" 
                         DataSourceID="ObjDSLanguage" DataTextField="Language" 
                        DataValueField="Language">
                        <asp:ListItem Value="0">-- Select Language --</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left" height="35" valign="middle">
                    Branch</td>
                <td align="left" height="25" valign="middle">
                    <asp:DropDownList ID="DDLPrintBranch" runat="server" 
                        AppendDataBoundItems="True" 
                        DataSourceID="ObjDSPrintBranches" DataTextField="BRANCHNAME" 
                        DataValueField="BRANCHID">
                        <asp:ListItem Value="0">-- Select Branch --</asp:ListItem>

                    </asp:DropDownList>
                </td>
                <td align="left" height="25" valign="middle">&nbsp;
                    </td>
                <td align="left" height="22" valign="top" width="22">&nbsp;
                    </td>
            </tr>
            <tr>
                <td align="left" height="22" valign="top" width="22">&nbsp;
                    </td>
                <td align="left" height="25" valign="middle">
                    Specialisation</td>
                <td align="left" height="25" valign="middle">
                    <asp:DropDownList ID="DDLPrintSpec" runat="server" 
                        DataSourceID="ObjDSPrintSpecialisation" DataTextField="SPECIALIZATIONNAME" 
                        DataValueField="SPECIALIZATIONID" AppendDataBoundItems=true>
                        <asp:ListItem Value="0">-- Select Specialisation --</asp:ListItem>
                        <asp:ListItem Value="0">-- Corporate --</asp:ListItem>
                    </asp:DropDownList>
                    <asp:ObjectDataSource ID="ObjDSPrintSpecialisation" runat="server" 
                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllData" 
                        TypeName="KimsHospitals.OurHospitalsTableAdapters.News_SpecializationTableAdapter">
                    </asp:ObjectDataSource>
                </td>
                <td align="center" height="35" valign="middle" colspan="2">
                    <asp:Button ID="BtnPrintGo" runat="server" Text="Search" />
                </td>
                <td align="left" height="25" valign="middle">&nbsp;
                    </td>
                <td align="left" height="22" valign="top" width="22">&nbsp;
                    </td>
            </tr>
            </table><br /><br />
            <asp:ObjectDataSource ID="ObjDSEdition" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetAllEditionsNames" 
                TypeName="KimsHospitals.OurHospitalsTableAdapters.OHPrintMediaTableAdapter" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_OHPrintMediaID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
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
            <asp:ObjectDataSource ID="ObjDSLanguage" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetAllLanguages" 
                TypeName="KimsHospitals.OurHospitalsTableAdapters.OHPrintMediaTableAdapter" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_OHPrintMediaID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
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
            <asp:ObjectDataSource ID="ObjDsNewsPapers" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetAllNewsPaperNames" 
                TypeName="KimsHospitals.OurHospitalsTableAdapters.OHPrintMediaTableAdapter" 
                UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_OHPrintMediaID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
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
            <asp:ObjectDataSource ID="ObjDSPrintBranches" runat="server" 
              OldValuesParameterFormatString="original_{0}" 
              SelectMethod="GetAllData" 
              TypeName="KimsHospitals.OurHospitalsTableAdapters.PrintMedia_BranchesTableAdapter">
          </asp:ObjectDataSource>
                                                                    <br />
          &nbsp;<br /><br />
      </td>
      
    </tr>
  </table>
</td>
        </tr>
    </table>
<br /><br />
    <asp:GridView ID="GVPrintNews" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="OHPrintMediaID,ImageURL,PDFName">
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
        <asp:RequiredFieldValidator ID="RFVDate" runat="server" 
            ControlToValidate="TxtDate" Display="None" ErrorMessage="Enter News Date" 
            ValidationGroup="VGEdit"></asp:RequiredFieldValidator>
        <BR /><cc1:CalendarExtender id="CalendarExtender1" runat="server" __designer:wfdid="w5" PopupButtonID="Image1" TargetControlID="TxtDate"></cc1:CalendarExtender>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LblDate" runat="server" Text='<%# Bind("NewsDate") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Image" SortExpression="ImageURL">
                <EditItemTemplate>
                    <asp:FileUpload ID="FUNewsImage" runat="server" />
                    <asp:Label ID="LblImagee" runat="server" Text='<%# Eval("ImageURL") %>' Visible="false"></asp:Label>
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
                    <asp:TextBox ID="TxtEdition" runat="server" Text='<%# Bind("Edition") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Edition") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="Page #" SortExpression="PageNumber">
                <EditItemTemplate>
                    <asp:TextBox ID="TxtPageNumber" runat="server" Text='<%# Bind("PageNumber") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="LblPageNumber" runat="server" Text='<%# Bind("PageNumber") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
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
                        DataTextField="BRANCHNAME" DataValueField="BRANCHID" 
                        selectedvalue='<%# Bind("BranchID") %>' AppendDataBoundItems="True">
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
                    <asp:Label ID="LblPDFF" runat="server" Text='<%# Eval("PDFName") %>' Visible="false"></asp:Label>
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


</div>
<br /><br />
</asp:Content>

