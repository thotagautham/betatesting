<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-hhc/adminbasepage.master" CodeBehind="manage-vendor-products.aspx.vb" Inherits="betatesting.manage_vendor_products" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>







    <div>

        Manage Products
    </div>

    <div>
        Product Name
    </div>

    <div>
        <asp:TextBox ID="txtproductname" runat="server"></asp:TextBox>

       
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" runat="server" ControlToValidate="txtproductname" ValidationGroup="vgcatlog" ErrorMessage="Enter Stockist Product Name"></asp:RequiredFieldValidator>
</div>
      


      <div>
        Product Description
    </div>

    <div>
        <asp:TextBox ID="txtproductdescription" runat="server"></asp:TextBox>
        
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="None" runat="server" ControlToValidate="txtproductdescription" ValidationGroup="vgcatlog" ErrorMessage="Enter Stockist Product Description"></asp:RequiredFieldValidator>
</div>


    
      <div>
       Comapny Code
    </div>

    <div>
        <asp:TextBox ID="txtcompanycode" runat="server"></asp:TextBox>

       
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="None" runat="server" ControlToValidate="txtcompanycode" ValidationGroup="vgcatlog" ErrorMessage="Enter Stockist Product Company Code"></asp:RequiredFieldValidator>
</div>

    <div>

        HHC Product
    </div>
    <div>
        <asp:DropDownList ID="ddlproducts" runat="server"   AppendDataBoundItems="true" AutoPostBack="true" Width="198" Height="30">
                        <asp:ListItem Value="">Select Product</asp:ListItem>
                      </asp:DropDownList>


        
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="None" runat="server" ControlToValidate="ddlproducts" ValidationGroup="vgcatlog" ErrorMessage="Select Any HHC Product"></asp:RequiredFieldValidator>
</div>
   

    <div>
        Stockist
    </div>
    <div>
        <asp:DropDownList ID="ddlstockist" runat="server"   AppendDataBoundItems="true" AutoPostBack="true" Width="198" Height="30">
                        <asp:ListItem Value="">Select Stockist</asp:ListItem>
                      </asp:DropDownList>

        
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="None" runat="server" ControlToValidate="ddlstockist" ValidationGroup="vgcatlog" ErrorMessage="Select Any HHC Stockist"></asp:RequiredFieldValidator>
</div>
    
    <div>
            &nbsp;<asp:Button ID="BtnSave" runat="server" Text="Save" 
                ValidationGroup="vgcatlog" />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="vgcatlog" />
                </div>
           
       
   
    <div>

          <asp:Label ID="LblMsg" runat="server"></asp:Label>
    </div>
   
  
   <div>
                  <asp:Label ID="filename" runat="server" Text="" Visible="False"></asp:Label>
      <asp:Label ID="fileId" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblSearchStr" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblGridDataSource" runat="server" Text="" Visible="False"></asp:Label>
           </div>
           


    <asp:GridView ID="GVPrintNews" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" >
        <HeaderStyle CssClass="GridHeaderStyle" />
        <RowStyle CssClass="GridRowStyle" />
        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                   
                    <asp:LinkButton ID="LnkBtnEdit" runat="server" CausesValidation="false" 
                        CommandName="CmdEdit" CommandArgument='<%# Eval("HvproductslistID")%>'
                        Text="Edit"></asp:LinkButton> &nbsp;|&nbsp;
                    <asp:LinkButton ID="LnkBtnDelete" runat="server" CausesValidation="false" 
                        CommandName="CmdDelete" CommandArgument='<%# Eval("HvproductslistID")%>'
                        onclientclick="return confirm('Are You Sure You Want To Delete');" 
                        Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>  
          <asp:BoundField DataField="HvproductslistID" HeaderText="ID" 
                            SortExpression="HvproductslistID" />
            <asp:BoundField DataField="Hproductslistcompanyid" HeaderText="Hetero Sap Id" 
                            SortExpression="Hproductslistcompanyid" />
            <asp:BoundField DataField="hvstockistid" HeaderText="Stockist Sap id" 
                            SortExpression="hvstockistid" />
             <asp:BoundField DataField="HvproductslistNAME" HeaderText="Stockist Product Name" 
                            SortExpression="HvproductslistNAME" />
             <asp:BoundField DataField="HvproductslistDESC" HeaderText="Stockist Product Description" 
                            SortExpression="HvproductslistDESC" />
             <asp:BoundField DataField="Hvproductslistcompanyid" HeaderText="Stockist Company Id" 
                            SortExpression="Hvproductslistcompanyid" />
             
             
            

               
        </Columns>
    </asp:GridView>


                     
</ContentTemplate>
   </asp:UpdatePanel>
</asp:Content>