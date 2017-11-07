<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-avana/adminbasepage.master" CodeBehind="manage-colour.aspx.vb" Inherits="betatesting.manage_colour" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



     <div>

        Manage Colours
    </div>

    <div>
        Colour Name
    </div>

    <div>
        <asp:TextBox ID="txtcolours" runat="server" placeholder="Enter Colour Name Eg : Pink"></asp:TextBox>
          
            <asp:RequiredFieldValidator ID="RFVCountry2" runat="server" 
                ControlToValidate="txtcolours" Display="Dynamic" 
                ErrorMessage="Enter Colour Name" ValidationGroup="vgcolour"></asp:RequiredFieldValidator>
       
    </div>


    
    <div>

          <asp:Label ID="LblMsg" runat="server"></asp:Label>
    </div>
   
  <div>
        <asp:Button ID="BtnSave" runat="server" Text="Save" 
                ValidationGroup="vgcolour" />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="vgcolour" />
  </div>
  
  
            <asp:GridView ID="GVCountries" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataKeyNames="ColourID" 
                DataSourceID="ObjDSCountries" PageSize="20">
                <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                <RowStyle CssClass="GridRowStyle" />
                <HeaderStyle CssClass="GridHeaderStyle" />
                <Columns>

                      

                    <asp:CommandField ShowEditButton="True" ValidationGroup="VGEdit" />
                    <asp:TemplateField HeaderText="Product NAME" SortExpression="colourname">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtcolour" runat="server" Text='<%# Bind("colourname")%>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVCountry3" runat="server" 
                                ControlToValidate="txtcolour" Display="None" ErrorMessage="Enter Colour Name" 
                                ValidationGroup="VGEdit"></asp:RequiredFieldValidator>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEdit" />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("colourname")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    




                  
                </Columns>
            </asp:GridView>
            <asp:ObjectDataSource ID="ObjDSCountries" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetData" 
                TypeName="betatesting.avanaTableAdapters.coloursTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_ColourID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="colourname" Type="String" />
                   <asp:Parameter Name="Original_ColourID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="colourname" Type="String" />
                   <asp:Parameter Name="Original_ColourID" Type="Int32" />
                </InsertParameters>
            </asp:ObjectDataSource>
 

</asp:Content>


