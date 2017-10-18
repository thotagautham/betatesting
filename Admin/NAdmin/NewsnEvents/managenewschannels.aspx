<%@ Page Title="Manage News Channels :: Administrator :: KIMS Hospitals" Language="VB" MasterPageFile="~/Admin/AdminBasePage.master" AutoEventWireup="false" Inherits="KimsHospitals.managenewschannels" Codebehind="managenewschannels.aspx.vb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
    <tr><td colspan="2">&nbsp;</td></tr>
    <tr><td colspan="2">
        <asp:Label ID="LblMsg" runat="server"></asp:Label>
        </td></tr>
    <tr><td colspan="2">&nbsp;</td></tr>
    <tr><td colspan="2">Manage  channels</td></tr>
    <tr><td>Name</td><td><asp:TextBox ID="TxtchannelName" runat="server" 
            MaxLength="100"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVName" runat="server" 
            ControlToValidate="TxtchannelName" Display="None" 
            ErrorMessage="Enter Channel Name" ValidationGroup="VGSave"></asp:RequiredFieldValidator>
        </td></tr>
    <tr><td>Logo</td><td><asp:FileUpload ID="FULogo" runat="server" />
        <asp:RequiredFieldValidator ID="RFVLogo" runat="server" 
            ControlToValidate="FULogo" Display="None" ErrorMessage="Upload Logo" 
            ValidationGroup="VGSave"></asp:RequiredFieldValidator>
        </td></tr>
    <tr><td colspan="2" align="center"><asp:Button ID="BtnSave" runat="server" Text="Save" ValidationGroup="VGSave" />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGSave" />
        </td></tr>
</table>

    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="Id" 
        DataSourceID="ObjDSChannel">
        <HeaderStyle CssClass="GridHeaderStyle" />
        <RowStyle CssClass="GridRowStyle" />
        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
        <Columns>
            <asp:CommandField ShowEditButton="True" ValidationGroup="VGEdit" />
            <asp:TemplateField HeaderText="Name" SortExpression="channelname">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("channelname")%>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TxtchannelName" runat="server" 
                        Text='<%# Bind("channelname")%>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFVchannelname" runat="server" 
                        ControlToValidate="TxtchannelName" Display="None" 
                        ErrorMessage="Enter Channel Name" ValidationGroup="VGEdit"></asp:RequiredFieldValidator>
                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                        ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEdit" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Logo" SortExpression="NewsPaperLogo">
                <ItemTemplate>
                    <asp:Label ID="LblLogo" runat="server" Text='<%# Bind("channellogo")%>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:FileUpload ID="FULogo" runat="server" />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Active" HeaderText="Active Status" SortExpression="Active" ReadOnly="true"  />
           <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LnkBtnActiveStatus" runat="server" CausesValidation="false" 
                        CommandName="CmdActive" Text='<%# Eval("ACTIVE") %>' ></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <asp:ObjectDataSource ID="ObjDSChannel" runat="server" DeleteMethod="Delete" 
        InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
        SelectMethod="GetAllData" 
        TypeName=" betatesting.newseventsTableAdapters.newschannelsTableAdapter" UpdateMethod="UpdateNewsChannelName">
        <DeleteParameters>
            <asp:Parameter Name="Original_Id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="channelname" Type="String" />
            <asp:Parameter Name="Original_Id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="channelname" Type="String" />
            <asp:Parameter Name="channellogo" Type="String" />
            <asp:Parameter Name="Active" Type="String" />
        </InsertParameters>
    </asp:ObjectDataSource>

</asp:Content>

