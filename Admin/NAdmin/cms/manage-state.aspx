<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="manage-state.aspx.vb" Inherits="betatesting.manage_state" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <table>
    <tr><td colspan=2>Manage State</td></tr>
    <tr>
        <td colspan="2">&nbsp;
            </td>
    </tr>
    <tr>
        <td>Country</td>
        <td>
            <asp:DropDownList ID="DDLCountry" runat="server" DataSourceID="ObjDsCountry" 
                DataTextField="COUNTRYNAME" DataValueField="COUNTRYID" 
                AppendDataBoundItems="True" AutoPostBack="True">
                <asp:ListItem Value="0">-- Select Any Country --</asp:ListItem>
            </asp:DropDownList>
            <asp:ObjectDataSource ID="ObjDsCountry" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetAllData" 
                TypeName="KimsHospitals.DataSetCareTableAdapters.COUNTRYTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_COUNTRYID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="COUNTRYNAME" Type="String" />
                    <asp:Parameter Name="ACTIVE" Type="String" />
                    <asp:Parameter Name="Original_COUNTRYID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="COUNTRYNAME" Type="String" />
                    <asp:Parameter Name="ACTIVE" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
            <asp:RequiredFieldValidator ID="RFVCountry" runat="server" 
                ControlToValidate="DDLCountry" Display="None" ErrorMessage="Select Any Country" 
                ValidationGroup="VGSave"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>State</td>
        <td><asp:TextBox ID="TxtState" runat="server"></asp:TextBox>
            &nbsp;<asp:Button ID="BtnSave" runat="server" Text="Save" 
                ValidationGroup="VGSave" />
            <asp:RequiredFieldValidator ID="RFVState" runat="server" 
                ControlToValidate="TxtState" Display="None" 
                ErrorMessage="Enter State Name" ValidationGroup="VGSave"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                ValidationGroup="VGSave" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:Label ID="LblMsg" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:GridView ID="GVState" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataKeyNames="STATEID" 
                DataSourceID="ObjDSState" PageSize="20">
                <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                <RowStyle CssClass="GridRowStyle" />
                <HeaderStyle CssClass="GridHeaderStyle" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" ValidationGroup="VGEdit" />
                    <asp:TemplateField HeaderText="STATE NAME" SortExpression="STATENAME">
                        <EditItemTemplate>
                            <asp:TextBox ID="TxtState" runat="server" CausesValidation="True" 
                                Text='<%# Bind("STATENAME") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVState" runat="server" 
                                ControlToValidate="TxtState" Display="None" ErrorMessage="Enter State  Name" 
                                ValidationGroup="VGEdit"></asp:RequiredFieldValidator>
                            <asp:ValidationSummary ID="ValidationSummary3" runat="server" 
                                ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEdit" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("STATENAME") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="COUNTRY" SortExpression="COUNTRYID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DDlCountry" runat="server" DataSourceID="ObjDsCountry" 
                                DataTextField="COUNTRYNAME" DataValueField="COUNTRYID" selectedvalue='<%# Bind("COUNTRYID") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblCountry" runat="server" Text='<%# Bind("COUNTRYID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:BoundField DataField="ACTIVE" HeaderText="ACTIVE Status" 
                        SortExpression="ACTIVE" ReadOnly="True" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LnkBtnActiveStatus" runat="server" CausesValidation="false" 
                                CommandName="CmdActive" Text='<%# Eval("ACTIVE") %>' 
                                 ></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjDSState" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetAllData" TypeName="KimsHospitals.DataSetCareTableAdapters.STATETableAdapter" 
                UpdateMethod="UpdateStateData">
                <DeleteParameters>
                    <asp:Parameter Name="Original_STATEID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="STATENAME" Type="String" />
                    <asp:Parameter Name="COUNTRYID" Type="Int32" />
                    <asp:Parameter Name="Original_STATEID" Type="Int32" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLCountry" DefaultValue="0" Name="COUNTRYID" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="STATENAME" Type="String" />
                    <asp:Parameter Name="COUNTRYID" Type="Int32" />
                    <asp:Parameter Name="ACTIVE" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
        </td>
    </tr>
</table>

</asp:Content>
