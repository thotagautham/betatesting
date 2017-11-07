<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-hhc/adminbasepage.master" CodeBehind="manage-city.aspx.vb" Inherits="betatesting.manage_city1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>
<div class="col-xs-12 col-sm-12 col-md-12">
<h1>Manage Cities</h1>
    </div>

<div class="col-xs-12 col-sm-12 col-md-12"  style="padding:1% 0;">
<div class="col-xs-12 col-sm-6 col-md-6"> Zone </div>
<div class="col-xs-12 col-sm-6 col-md-6"> 
         <asp:DropDownList ID="DDLCountry" runat="server" CssClass="form-control" DataSourceID="ObjDsCountry" 
                DataTextField="COUNTRYNAME" DataValueField="COUNTRYID" 
                AppendDataBoundItems="True" AutoPostBack="True">
                <asp:ListItem Value="">-- Select Any Zone --</asp:ListItem>
            </asp:DropDownList>
            <asp:ObjectDataSource ID="ObjDsCountry" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetAllData" 
                TypeName="betatesting.DataSetCareTableAdapters.COUNTRYTableAdapter" UpdateMethod="Update">
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
              <asp:RequiredFieldValidator ID="rfvzone" Display="None" runat="server" ControlToValidate="DDLCountry" ValidationGroup="vgmanagecity" ErrorMessage="Select Any Zone"></asp:RequiredFieldValidator>
    </div>
    </div>

<div class="col-xs-12 col-sm-12 col-md-12"  style="padding:1% 0;">
<div class="col-xs-12 col-sm-6 col-md-6"> State</div>
<div class="col-xs-12 col-sm-6 col-md-6">
         <asp:DropDownList ID="DDLState" runat="server" CssClass="form-control" AppendDataBoundItems="True" 
                AutoPostBack="True">
                <asp:ListItem Value="">-- Select Any State --</asp:ListItem>
            </asp:DropDownList>
               <asp:RequiredFieldValidator ID="rfvstate" Display="None" runat="server" ControlToValidate="DDLState" ValidationGroup="vgmanagecity" ErrorMessage="Select Any State"></asp:RequiredFieldValidator>
    </div>
    </div>


<div class="col-xs-12 col-sm-12 col-md-12"  style="padding:1% 0;">
<div class="col-xs-12 col-sm-6 col-md-6"> City</div>        
<div class="col-xs-12 col-sm-6 col-md-6">
        <asp:TextBox ID="TxtCity" runat="server"  CssClass="form-control" placeholder="Type City"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvcity" Display="None" runat="server" ControlToValidate="TxtCity" ValidationGroup="vgmanagecity" ErrorMessage="Enter City Name"></asp:RequiredFieldValidator>
        </div>
<div class="col-xs-12 col-sm-12 col-md-4 col-md-offset-8"  style="padding:1% 0;">      
            &nbsp;<asp:Button ID="BtnSave" runat="server" Text="Save" 
                ValidationGroup="vgmanagecity" />


     <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="vgmanagecity"  />
           
        </div>


    <div>

         <asp:Label ID="LblMsg" runat="server"></asp:Label>
    </div>

<div>
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
                                SelectMethod="GetAllData" TypeName="betatesting.DataSetCareTableAdapters.STATETableAdapter" 
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
           
           
            <asp:ObjectDataSource ID="ObjDSCities" runat="server" 
                OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllData" 
                TypeName="betatesting.DataSetCareTableAdapters.CITIESBYCOUNTRYTableAdapter">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DDLCountry" DefaultValue="0" Name="countryid" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:ObjectDataSource>
           
    
    </div>





<div>

</div>

</ContentTemplate>
   </asp:UpdatePanel>
</asp:Content>




