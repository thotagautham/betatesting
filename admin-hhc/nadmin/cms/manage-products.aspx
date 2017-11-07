<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-hhc/adminbasepage.master" CodeBehind="manage-products.aspx.vb" Inherits="betatesting.manage_products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div class="col-xs-12 col-sm-12 col-md-12">
<h1>Manage Products</h1>
    </div>

  <div class="col-xs-12 col-sm-12 col-md-4"  style="padding:1% 0;">
        <asp:TextBox ID="txtproducts" runat="server" placeholder="Product Name" CssClass="form-control"></asp:TextBox>

       <asp:RequiredFieldValidator ID="rfvzone" Display="None" runat="server" ControlToValidate="txtproducts" ValidationGroup="vgmanagecity" ErrorMessage="Enter Product Name"></asp:RequiredFieldValidator>


         
<br /><br />
        <asp:TextBox ID="txtproductdescription" runat="server" placeholder="Product Description" CssClass="form-control"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" runat="server" ControlToValidate="txtproductdescription" ValidationGroup="vgmanagecity" ErrorMessage="Enter Product Description"></asp:RequiredFieldValidator>
          
<br /><br />
 <asp:TextBox ID="txtsapid" runat="server" placeholder="Hetro Sap Id" CssClass="form-control"></asp:TextBox>
         
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="None" runat="server" ControlToValidate="txtsapid" ValidationGroup="vgmanagecity" ErrorMessage="Enter Product Sap Id"></asp:RequiredFieldValidator>
    </div>
    
    
    
  <div class="col-xs-12 col-sm-12 col-md-12"  style="padding:1% 0;">

          <asp:Label ID="LblMsg" runat="server"></asp:Label>
    </div>
   
        <div class="col-xs-12 col-sm-12 col-md-4"  style="padding:1% 0;"> 
        <asp:Button ID="BtnSave" runat="server" Text="Save" 
                ValidationGroup="vgmanagecity" />


     <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="vgmanagecity"  />
           
        </div>
  
        <div class="col-xs-12 col-sm-12 col-md-12"  style="padding:1% 0;">   
            <asp:GridView ID="GVCountries" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataKeyNames="HproductslistID" 
                DataSourceID="ObjDSCountries" PageSize="20">
                <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                <RowStyle CssClass="GridRowStyle" />
                <HeaderStyle CssClass="GridHeaderStyle" />
                <Columns>

                      

                    <asp:CommandField ShowEditButton="True" ValidationGroup="VGEdit" />
                    <asp:TemplateField HeaderText="Product NAME" SortExpression="HproductslistNAME">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtproductname" runat="server" Text='<%# Bind("HproductslistNAME")%>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVCountry3" runat="server" 
                                ControlToValidate="txtproductname" Display="None" ErrorMessage="Enter Product Name" 
                                ValidationGroup="VGEdit"></asp:RequiredFieldValidator>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEdit" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("HproductslistNAME")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    



                    <asp:TemplateField HeaderText="Product Description" SortExpression="HproductslistDESC">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtproductdescription" runat="server" Text='<%# Bind("HproductslistDESC")%>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVCountry2" runat="server" 
                                ControlToValidate="txtproductdescription" Display="None" ErrorMessage="Enter Product Description" 
                                ValidationGroup="VGEdit"></asp:RequiredFieldValidator>
                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                                ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEdit" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("HproductslistDESC")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>



                    <asp:TemplateField HeaderText="HHC Sap  Id" SortExpression="Hproductslistcompanyid">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtsapid" runat="server" Text='<%# Bind("Hproductslistcompanyid")%>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVCountry" runat="server" 
                                ControlToValidate="txtsapid" Display="None" ErrorMessage="Enter HHC Sap Id" 
                                ValidationGroup="VGEdit"></asp:RequiredFieldValidator>
                            <asp:ValidationSummary ID="ValidationSummary3" runat="server" 
                                ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEdit" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Hproductslistcompanyid")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <a href='/admin-hhc/nadmin/cms/manage-product-description.aspx?heteroid=<%# Eval("HproductslistID") %>'  target="_blank">View Details</a> &nbsp;|
                               
                            </ItemTemplate>
                        </asp:TemplateField>  

                  
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjDSCountries" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetData" 
                TypeName="betatesting.hhcTableAdapters.HproductslistTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_HproductslistID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="HproductslistNAME" Type="String" />
                    <asp:Parameter Name="HproductslistDESC" Type="String" />
                    <asp:Parameter Name="Hproductslistcompanyid" Type="String" />
                    <asp:Parameter Name="Original_HproductslistID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="HproductslistNAME" Type="String" />
                    <asp:Parameter Name="HproductslistDESC" Type="String" />
                    <asp:Parameter Name="Hproductslistcompanyid" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
 
</div>
</asp:Content>
