<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-hhc/adminbasepage.master" CodeBehind="manage-division.aspx.vb" Inherits="betatesting.manage_division" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div class="col-xs-12 col-sm-12 col-md-12">
<h1>Manage Divison</h1>
    </div>

  <div class="col-xs-12 col-sm-12 col-md-4"  style="padding:1% 0;">


         <asp:TextBox ID="txtdivisionname" placeholder="Division Name" CssClass="form-control" runat="server"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="None" runat="server" ControlToValidate="txtdivisionname" ValidationGroup="vgmanagecity" ErrorMessage="Enter Division  Name"></asp:RequiredFieldValidator> 


        <asp:TextBox ID="txtdivisiondescripton" CssClass="form-control" placeholder="Division Description" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator33" Display="None" runat="server" ControlToValidate="txtdivisiondescripton" ValidationGroup="vgmanagecity" ErrorMessage="Enter Division  Description"></asp:RequiredFieldValidator> 
       
<br /><br />
        <asp:TextBox ID="txtdivisioncode" CssClass="form-control" placeholder="HHC Division Code" runat="server"></asp:TextBox>
       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" runat="server" ControlToValidate="txtdivisioncode" ValidationGroup="vgmanagecity" ErrorMessage="Enter Division  Code "></asp:RequiredFieldValidator> 
<br /><br />
         
     
    </div>
  <div class="col-xs-12 col-sm-12 col-md-4"  style="padding:1% 0;">

          <asp:Label ID="LblMsg" runat="server"></asp:Label>
    </div>
   
  <div class="col-xs-12 col-sm-12 col-md-12"  style="padding:1% 0;">
         <asp:Button ID="BtnSave" runat="server" Text="Save" 
                ValidationGroup="vgmanagecity" />


     <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="vgmanagecity"  />
           
        </div>
  
  <div class="col-xs-12 col-sm-12 col-md-12"  style="padding:1% 0;">  
            <asp:GridView ID="GVCountries" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataKeyNames="HdivisionID" 
                DataSourceID="ObjDSCountries" PageSize="20">
                <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                <RowStyle CssClass="GridRowStyle" />
                <HeaderStyle CssClass="GridHeaderStyle" />
                <Columns>

                      

                    <asp:CommandField ShowEditButton="True" ValidationGroup="VGEdit" />
                    <asp:TemplateField HeaderText="Product NAME" SortExpression="HdivisionDESC">
                      
                        <EditItemTemplate>
                            <asp:TextBox ID="txtdivisiondescripton" runat="server" Text='<%# Bind("HdivisionDESC")%>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVCountry3" runat="server" 
                                ControlToValidate="txtdivisiondescripton" Display="None" ErrorMessage="Enter Product Name" 
                                ValidationGroup="VGEdit"></asp:RequiredFieldValidator>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEdit" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("HdivisionDESC")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    



                    <asp:TemplateField HeaderText="Product Description" SortExpression="hdname">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtdivisionname" runat="server" Text='<%# Bind("hdname")%>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVCountry2" runat="server" 
                                ControlToValidate="txtdivisionname" Display="None" ErrorMessage="Enter Product Description" 
                                ValidationGroup="VGEdit"></asp:RequiredFieldValidator>
                            <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                                ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEdit" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("hdname")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>



                    <asp:TemplateField HeaderText="HHC Sap  Id" SortExpression="heterodivisoncode">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtdivisioncode" runat="server" Text='<%# Bind("heterodivisoncode")%>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVCountry" runat="server" 
                                ControlToValidate="txtdivisioncode" Display="None" ErrorMessage="Enter HHC Sap Id" 
                                ValidationGroup="VGEdit"></asp:RequiredFieldValidator>
                            <asp:ValidationSummary ID="ValidationSummary3" runat="server" 
                                ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEdit" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("heterodivisoncode")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                      

                  
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjDSCountries" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetData" 
                TypeName="betatesting.hhcTableAdapters.HdivisionTableAdapter" UpdateMethod="Updatequery">
                <DeleteParameters>
                    <asp:Parameter Name="Original_HproductslistID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="HdivisionDESC" Type="String" />
                    <asp:Parameter Name="heterodivisoncode" Type="String" />
                    <asp:Parameter Name="hdname" Type="String" />
                    <asp:Parameter Name="Original_HdivisionID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="HdivisionDESC" Type="String" />
                    <asp:Parameter Name="heterodivisoncode" Type="String" />
                     <asp:Parameter Name="hdname" Type="String" />
                    <asp:Parameter Name="HdivisionID" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
 
</div>
</asp:Content>