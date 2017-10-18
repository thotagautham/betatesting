<%@ Page Language="VB" MasterPageFile="../../AdminBasePage.master" AutoEventWireup="false" Inherits="KimsHospitals.Admin_Miscellaneous_ManageEvents" title="Untitled Page" Codebehind="ManageEvents.aspx.vb" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<DIV align=center><asp:Label id="LblMsg" runat="server"></asp:Label>&nbsp;</DIV><BR /><BR />
<TABLE style="BORDER-COLLAPSE: collapse" cellSpacing=0 cellPadding=0 align=center border=1><TBODY><TR><td>
<TABLE cellSpacing=5 cellPadding=0 align=center><TBODY>
<TR><td class="HeaderStyle" colSpan=2>Add Events</td>
</TR>
<TR class="RowStyle"><td class="tdStyle">
    Event Title</td><td class="tdStyle"><asp:TextBox id="EventTitle" runat="server"></asp:TextBox>&nbsp;<asp:RegularExpressionValidator 
        id="REVAllName" runat="server" 
        ErrorMessage="Only AlphaNumeric  String is Allowed" SetFocusOnError="True" 
        ControlToValidate="EventTitle" Display="None" 
        ValidationExpression="[a-zA-Z0-9 ]*"></asp:RegularExpressionValidator> 
    <asp:RequiredFieldValidator id="RFVAllianceName" runat="server" 
        ErrorMessage="Enter Event Title" SetFocusOnError="True" 
        ControlToValidate="EventTitle" Display="None"></asp:RequiredFieldValidator> </td></TR>
    <tr class="AlternateRowStyle">
        <td valign="top" class="tdStyle">
            Event Start Date</td>
        <td class="tdStyle">
            <asp:TextBox ID="EventDate" runat="server"></asp:TextBox>
            <asp:ImageButton ID="Image1" runat="Server" AlternateText="Click to show calendar"
                CausesValidation="False" ImageUrl="~/images/Calendar_scheduleHS.png" /><br />
            <cc1:calendarextender id="CalendarExtender1" runat="server" popupbuttonid="Image1"
                targetcontrolid="EventDate"></cc1:calendarextender>
            <asp:RequiredFieldValidator ID="RFVEventDate" runat="server" ControlToValidate="EventDate"
                Display="None" ErrorMessage="Enter Event Start Date"></asp:RequiredFieldValidator></td>
    </tr>
    <tr class="RowStyle">
        <td valign="top" class="tdStyle">
            Event End Date</td>
        <td class="tdStyle">
            <asp:TextBox ID="TxtEndDate" runat="server"></asp:TextBox>
            <asp:ImageButton ID="Image2" runat="Server" AlternateText="Click to show calendar"
                CausesValidation="False" ImageUrl="~/images/Calendar_scheduleHS.png" />
            <cc1:calendarextender id="CalendarExtender2" runat="server" popupbuttonid="Image2"
                targetcontrolid="TxtEndDate"></cc1:calendarextender>
                                                                <asp:RequiredFieldValidator ID="RFVEndDate" runat="server" 
                ControlToValidate="TxtEndDate" Display="None" 
                ErrorMessage="Enter Event End Date"></asp:RequiredFieldValidator>
                                                                </td>
    </tr>
    <tr class="AlternateRowStyle">
        <td valign="top" class="tdStyle">
            Venue</td>
         <td class="tdStyle">
            <asp:TextBox ID="TxtVenue" runat="server" Columns="30" Rows="5" 
                TextMode="MultiLine"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RFVVenue" runat="server" 
                ControlToValidate="TxtVenue" Display="None" ErrorMessage="Enter Venue"></asp:RequiredFieldValidator>
                                                                </td>
    </tr>
    <tr class="RowStyle">
        <td valign="top" class="tdStyle">
            Branch</td>
       <td class="tdStyle">
            <asp:DropDownList ID="DDLBranch" runat="server" AppendDataBoundItems="True" 
                DataSourceID="ObjDSBranch" DataTextField="BRANCHNAME" DataValueField="BRANCHID">
                <asp:ListItem Value="0">-- Select Any Branch --</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RFVBranch" runat="server" 
                ControlToValidate="DDLBranch" Display="None" ErrorMessage="Select Any Branch" 
                InitialValue="0"></asp:RequiredFieldValidator>
            <asp:ObjectDataSource ID="ObjDSBranch" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetActiveData" 
                TypeName="KimsHospitals.OurHospitalsTableAdapters.BRANCHTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_BRANCHID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="BRANCHNAME" Type="String" />
                    <asp:Parameter Name="CITY" Type="Int32" />
                    <asp:Parameter Name="STATE" Type="Int32" />
                    <asp:Parameter Name="COUNTRY" Type="Int32" />
                    <asp:Parameter Name="BranchImage" Type="String" />
                    <asp:Parameter Name="ACTIVE" Type="String" />
                    <asp:Parameter Name="Original_BRANCHID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="BRANCHNAME" Type="String" />
                    <asp:Parameter Name="CITY" Type="Int32" />
                    <asp:Parameter Name="STATE" Type="Int32" />
                    <asp:Parameter Name="COUNTRY" Type="Int32" />
                    <asp:Parameter Name="BranchImage" Type="String" />
                    <asp:Parameter Name="ACTIVE" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
                                                                </td>
    </tr>
    <tr class="AlternateRowStyle">
        <td valign="top" class="tdStyle">
            Specialisation</td>
       <td class="tdStyle">
            <asp:DropDownList ID="DDLSpec" runat="server" AppendDataBoundItems="True" 
                DataSourceID="ObjDSpecialisation" DataTextField="SPECIALIZATIONNAME" 
                DataValueField="SPECIALIZATIONID">
                <asp:ListItem Value="0">-- Select Any Specialisation --</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RFVSpecialisation" runat="server" 
                ControlToValidate="DDLSpec" Display="None" 
                ErrorMessage="Select Any Specialisation" InitialValue="0"></asp:RequiredFieldValidator>
            <asp:ObjectDataSource ID="ObjDSpecialisation" runat="server" 
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
                    <asp:Parameter Name="Original_SPECIALIZATIONID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="SPECIALIZATIONNAME" Type="String" />
                    <asp:Parameter Name="SPECIALIZATIONDESC" Type="String" />
                    <asp:Parameter Name="ACTIVE" Type="String" />
                    <asp:Parameter Name="DEPARTMENTID" Type="Int32" />
                </InsertParameters>
            </asp:ObjectDataSource>
                                                                </td>
    </tr>
    <tr class="RowStyle">
        <td valign="top" class="tdStyle">
            Event Group</td>
        <td class="tdStyle">
            <asp:DropDownList ID="ddlEventGroup" runat="server">
                <asp:ListItem Value="0">-- Select Group -- </asp:ListItem>
                  <asp:ListItem>Doctors</asp:ListItem>
                  <asp:ListItem>Educational</asp:ListItem>
                  <asp:ListItem>Conferences</asp:ListItem>
                  <asp:ListItem>Voluntary</asp:ListItem>
                  <asp:ListItem>Others</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RFVEventGroup" runat="server" ControlToValidate="ddlEventGroup"
                ErrorMessage="Event Group should Not Be Empty" InitialValue="0" 
                Display="None"></asp:RequiredFieldValidator></td>
    </tr>
    <TR class="AlternateRowStyle"><td class="tdStyle">
    Upload PDF</td><td class="tdStyle"><asp:FileUpload id="EventPDF" runat="server" EnableTheming="False"></asp:FileUpload> 
        </td></TR>
        <TR  class="RowStyle"><td vAlign=top class="tdStyle" colspan="2">Description</td></tr>
        <tr class="AlternateRowStyle">
        <td colspan="2">
                <FCKeditorV2:FCKeditor ID="EventDesc" runat="server" Height="500px" Width="1000px">
                        </FCKeditorV2:FCKeditor></td></TR>
        <TR  class="RowStyle"><td align=center colSpan=2><asp:Button id="AddEvent" runat="server" Text="Save" ></asp:Button>&nbsp;&nbsp; 
        <asp:Button ID="BtnCancel" runat="server" Text="Cancel" Visible="False" />
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            ShowMessageBox="True" ShowSummary="False" />
        </td></TR></TBODY></TABLE></td></TR></TBODY></TABLE><br /><br />
        
        <div align=center>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataKeyNames="EVENTID" DataSourceID="ObDSEvents">
                <HeaderStyle CssClass="GridHeaderStyle" />
                <RowStyle CssClass="GridRowStyle" />
                <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                <EmptyDataTemplate><table width="600"><tr><td class="GridHeaderStyle">No Records Found</td></tr></table></EmptyDataTemplate>
                <Columns>
                    <asp:ButtonField CommandName="CmdEdit" Text="Edit" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LnkBtnActivate" runat="server" CausesValidation="false" 
                                CommandName="" 
                                onclientclick="return confirm('Are You Sure You Want To Activate');" 
                                Text="Activate" onclick="LinkButton1_Click"></asp:LinkButton>
                            &nbsp;
                            <asp:LinkButton ID="LnkBtnDeActivate" runat="server" CausesValidation="False" 
                                onclick="LnkBtnDeActivate_Click" 
                                onclientclick="return confirm('Are You Sure You Want To DeActivate');">DeActivate</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EVENTTITLE" HeaderText="Title" 
                        SortExpression="EVENTTITLE" />
                    <asp:BoundField DataField="Specialization" HeaderText="Specialization" 
                        SortExpression="Specialization" />
                    <asp:BoundField DataField="EVENTDATETIME" HeaderText="Start Date" 
                        SortExpression="EVENTDATETIME" />
                    <asp:BoundField DataField="ToDate" HeaderText="End Date" 
                        SortExpression="ToDate" />
                    <asp:BoundField DataField="Venue" HeaderText="Venue" SortExpression="Venue" />
                    <asp:BoundField DataField="BranchId" HeaderText="Branch" 
                        SortExpression="BranchId" />
                    <asp:BoundField DataField="EVENTGROUP" HeaderText="Event Group" 
                        SortExpression="EVENTGROUP" />
                    <asp:BoundField DataField="ACTIVE" HeaderText="Active Status" 
                        SortExpression="ACTIVE" />
                    <asp:BoundField DataField="EventDoc" HeaderText="Document" 
                        SortExpression="EventDoc" />
                </Columns>
            </asp:GridView> 
            <asp:ObjectDataSource ID="ObDSEvents" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetAllData" 
                TypeName=" betatesting.DataSetCareTableAdapters.EVENTSTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_EVENTID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="EVENTTITLE" Type="String" />
                    <asp:Parameter Name="EVENTDATETIME" Type="DateTime" />
                    <asp:Parameter Name="EVENTGROUP" Type="String" />
                    <asp:Parameter Name="EVENTDESC" Type="String" />
                    <asp:Parameter Name="ACTIVE" Type="String" />
                    <asp:Parameter Name="ToDate" Type="DateTime" />
                    <asp:Parameter Name="Venue" Type="String" />
                    <asp:Parameter Name="BranchId" Type="Int32" />
                    <asp:Parameter Name="Specialization" Type="Int32" />
                    <asp:Parameter Name="EventDoc" Type="String" />
                    <asp:Parameter Name="Original_EVENTID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="EVENTTITLE" Type="String" />
                    <asp:Parameter Name="EVENTDATETIME" Type="DateTime" />
                    <asp:Parameter Name="EVENTGROUP" Type="String" />
                    <asp:Parameter Name="EVENTDESC" Type="String" />
                    <asp:Parameter Name="ACTIVE" Type="String" />
                    <asp:Parameter Name="ToDate" Type="DateTime" />
                    <asp:Parameter Name="Venue" Type="String" />
                    <asp:Parameter Name="BranchId" Type="Int32" />
                    <asp:Parameter Name="Specialization" Type="Int32" />
                    <asp:Parameter Name="EventDoc" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </div>
        
        
<script  type="text/javascript">
    function FCKeditor_OnComplete(editorInstance) {
        FCKeditorAPI.GetInstance('ctl00_ContentPlaceHolder1_EventDesc').Commands.GetCommand('Flash').Execute = function() { return false; };
        FCKeditorAPI.GetInstance('ctl00_ContentPlaceHolder1_EventDesc').Commands.GetCommand('Image').Execute = function() { return false; };
        FCKeditorAPI.GetInstance('ctl00_ContentPlaceHolder1_EventDesc').Commands.GetCommand('About').Execute = function() { return false; };
        FCKeditorAPI.GetInstance('ctl00_ContentPlaceHolder1_EventDesc').Commands.GetCommand('Save').Execute = function() { return false; };
    }
</script>
</asp:Content>

