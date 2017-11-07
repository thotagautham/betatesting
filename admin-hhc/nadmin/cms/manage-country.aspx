<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-hhc/adminbasepage.master" CodeBehind="manage-country.aspx.vb" Inherits="betatesting.manage_country1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>

    <div class="col-xs-12 col-sm-12 col-md-12">
    <div class="col-xs-12 col-sm-12 col-md-12">
        <h3>Manage Zones</h3>
        </div>
            <div class="col-xs-12 col-sm-12 col-md-12">
            
            <div class="col-xs-6 col-sm-6 col-md-6">
            <asp:TextBox ID="TxtCountry" CssClass="form-control" placeholder="Country" runat="server"></asp:TextBox>

                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="None" runat="server" ControlToValidate="TxtCountry" ValidationGroup="vgcatlog" ErrorMessage="Enter Zone Name"></asp:RequiredFieldValidator>
</div>
            <div class="col-xs-6 col-sm-6 col-md-6">
            &nbsp;<asp:Button ID="BtnSave" runat="server" Text="Save" 
                ValidationGroup="vgcatlog" />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="vgcatlog" />
                </div></div>
    </div>

    

   
    <div class="col-xs-12 col-sm-12 col-md-12"  style="color:#FF0000; margin-top:2%;">

          <asp:Label ID="LblMsg" runat="server"></asp:Label>
    </div>
   
      <div class="col-xs-12 col-sm-12 col-md-12">
  
  
            <asp:GridView ID="GVCountries" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataKeyNames="COUNTRYID" 
                DataSourceID="ObjDSCountries" PageSize="20">
                <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                <RowStyle CssClass="GridRowStyle" />
                <HeaderStyle CssClass="GridHeaderStyle" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" ValidationGroup="VGEdit" />
                    <asp:TemplateField HeaderText="COUNTRY NAME" SortExpression="COUNTRYNAME">
                        <EditItemTemplate>
                            <asp:TextBox ID="TxtCountry" runat="server" Text='<%# Bind("COUNTRYNAME") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVCountry" runat="server" 
                                ControlToValidate="TxtCountry" Display="None" ErrorMessage="Enter Country Name" 
                                ValidationGroup="VGEdit"></asp:RequiredFieldValidator>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEdit" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("COUNTRYNAME") %>'></asp:Label>
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
            <asp:ObjectDataSource ID="ObjDSCountries" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetAllData" 
                TypeName="betatesting.DataSetCareTableAdapters.COUNTRYTableAdapter" UpdateMethod="UpdateData">
                <DeleteParameters>
                    <asp:Parameter Name="Original_COUNTRYID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="COUNTRYNAME" Type="String" />
                    <asp:Parameter Name="Original_COUNTRYID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="COUNTRYNAME" Type="String" />
                    <asp:Parameter Name="ACTIVE" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
 
</div>

          
</ContentTemplate>
   </asp:UpdatePanel>

</asp:Content>