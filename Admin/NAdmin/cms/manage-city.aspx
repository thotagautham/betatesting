<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="manage-city.aspx.vb" Inherits="betatesting.manage_city" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center">
<table border=1 cellpadding=0 cellspacing=0 style="border-collapse:collapse" bgcolor="#faf8ff">
        <tr>
            <td style=" padding : 25px 25px 25px 25px; ">
    <br />
 <table>
    <tr><td colspan=2 class="HeaderStyle">Manage Cities</td></tr>
    <tr class="RowStyle">
        <td colspan="2">&nbsp;
            </td>
    </tr>
    <tr class="AlternateRowStyle">
        <td class="tdStyle">Country</td>
        <td class="tdStyle">
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
    <tr class="RowStyle">
        <td class="tdStyle">State</td>
        <td class="tdStyle">
            <asp:DropDownList ID="DDLState" runat="server" AppendDataBoundItems="True" 
                AutoPostBack="True">
                <asp:ListItem Value="0">-- Select Any State --</asp:ListItem>
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RFVState" runat="server" 
                ControlToValidate="DDLState" Display="None" 
                ErrorMessage="Enter State Name" ValidationGroup="VGSave" InitialValue="0"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr class="AlternateRowStyle">
        <td class="tdStyle">City</td>
        <td class="tdStyle"><asp:TextBox ID="TxtCity" runat="server"></asp:TextBox>
            &nbsp;<asp:Button ID="BtnSave" runat="server" Text="Save" ValidationGroup="VGSave" />
            <asp:RequiredFieldValidator ID="RFVcity" runat="server" ControlToValidate="TxtCity" Display="None" ErrorMessage="Enter City"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>
            <asp:ValidationSummary ID="ValidationSummary2" runat="server" ValidationGroup="VGSave" />
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
            <asp:GridView ID="GVCity" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataKeyNames="CityID" 
                PageSize="15">
                <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                <RowStyle CssClass="GridRowStyle" />
                <HeaderStyle CssClass="GridHeaderStyle" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LnkBtnUpdate" runat="server" 
                                CommandName="Update" Text="Update" onclick="LnkBtnUpdate_Click" 
                                ValidationGroup="VGEdit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="Edit"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City NAME" SortExpression="CITYNAME">
                        <EditItemTemplate>
                            <asp:TextBox ID="TxtCity" runat="server" CausesValidation="True" Text='<%# Bind("CITYNAME") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVCity" runat="server" 
                                ControlToValidate="TxtCity" Display="None" ErrorMessage="Enter City  Name" 
                                ValidationGroup="VGEdit"></asp:RequiredFieldValidator>
                            <asp:ValidationSummary ID="ValidationSummary3" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEdit" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblCity" runat="server" Text='<%# Bind("CITYNAME") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="State" SortExpression="STATEID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DDlState" runat="server" 
                                 selectedvalue='<%# Bind("STATEID") %>' DataSourceID="ObjDSState" 
                                DataTextField="STATENAME" DataValueField="STATEID" >
                            </asp:DropDownList>
                            <asp:ObjectDataSource ID="ObjDSState" runat="server" DeleteMethod="Delete" 
                                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                                SelectMethod="GetAllData" TypeName="KimsHospitals.DataSetCareTableAdapters.STATETableAdapter" 
                                UpdateMethod="Update">
                                <DeleteParameters>
                                    <asp:Parameter Name="Original_STATEID" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="STATENAME" Type="String" />
                                    <asp:Parameter Name="COUNTRYID" Type="Int32" />
                                    <asp:Parameter Name="ACTIVE" Type="String" />
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
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LblState" runat="server" Text='<%# Bind("STATEID") %>'></asp:Label>
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
           
            <br />
            <asp:ObjectDataSource ID="ObjDSCities" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllData" 
                TypeName="KimsHospitals.DataSetCareTableAdapters.CITIESBYCOUNTRYTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLCountry" DefaultValue="0" Name="countryid" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
           
        </td>
    </tr>
</table>

<br />
&nbsp;

</td>
        </tr>
    </table>
    
    </div>
</asp:Content>

