<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-hhc/adminbasepage.master" CodeBehind="manage-state.aspx.vb" Inherits="betatesting.manage_state1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>
<div class="col-xs-12 col-sm-12 col-md-12">
<h1>    Manage States</h1>

         </div>



<div class="col-xs-12 col-sm-12 col-md-12"  style="padding:1% 0;">
<div class="col-xs-12 col-sm-6 col-md-6">
        Zone
    </div>

<div class="col-xs-6 col-sm-6 col-md-6">

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
           

            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="None" runat="server" ControlToValidate="DDLCountry" ValidationGroup="vgcatlog" ErrorMessage="Select Any Zone"></asp:RequiredFieldValidator>

    </div>
         </div>



<div class="col-xs-12 col-sm-12 col-md-12"  style="padding:1% 0;">
<div class="col-xs-6 col-sm-6 col-md-6">
           State

       </div>

<div class="col-xs-6 col-sm-6 col-md-6">
             <asp:TextBox ID="TxtState" runat="server" CssClass="form-control" placeholder="Type State"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" runat="server" ControlToValidate="TxtState" ValidationGroup="vgcatlog" ErrorMessage="Enter State Name"></asp:RequiredFieldValidator>

             </div>
<div class="col-xs-12 col-sm-12 col-md-4 col-md-offset-8"  style="padding:1% 0;">
            &nbsp;<asp:Button ID="BtnSave" runat="server" Text="Save" 
                ValidationGroup="vgcatlog" />


     <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="vgcatlog" />
           
        </div>
</div>
      
<div class="col-xs-12 col-sm-12 col-md-12"  style="padding:2% 0;">
      <asp:Label ID="LblMsg" runat="server" style="color:#FF0000;"></asp:Label>
  </div>
         
<div class="col-xs-12 col-sm-12 col-md-12">       
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
                SelectMethod="GetAllData" TypeName="betatesting.DataSetCareTableAdapters.STATETableAdapter" 
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
     
</div>

       
</ContentTemplate>
   </asp:UpdatePanel>

</asp:Content>