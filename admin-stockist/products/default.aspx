<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-stockist/innebasepage.master" CodeBehind="Default.aspx.vb" Inherits="betatesting._Default35" %>
<asp:Content ID="Content1" ContentPlaceHolderID="NavigationPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <div>

        Manage Products
    </div>

    <div>
        Product Name
    </div>

    <div>
        <asp:TextBox ID="txtproductname" runat="server"></asp:TextBox>

         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtproductname" Display="Dynamic" 
                ErrorMessage="Enter Country Name" ValidationGroup="VGSave"></asp:RequiredFieldValidator>

        </div>


      <div>
        Product Description
    </div>

    <div>
        <asp:TextBox ID="txtproductdescription" runat="server"></asp:TextBox>

         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="txtproductdescription" Display="Dynamic" 
                ErrorMessage="Enter Product Name" ValidationGroup="VGSave"></asp:RequiredFieldValidator>

        </div>


    
      <div>
       Comapny Code
    </div>

    <div>
        <asp:TextBox ID="txtcompanycode" runat="server"></asp:TextBox>

         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="txtcompanycode" Display="Dynamic" 
                ErrorMessage="Enter company code" ValidationGroup="VGSave"></asp:RequiredFieldValidator>

        </div>


    <div>
            &nbsp;<asp:Button ID="BtnSave" runat="server" Text="Save" 
                ValidationGroup="VGSave" />
           
       
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
            <asp:TemplateField HeaderText="Product Name" >
                <ItemTemplate>
                    <asp:Label ID="LblTitle" runat="server" Text='<%# Bind("HvproductslistNAME")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product Description" >
                <ItemTemplate>
                    <asp:Label ID="LblDate" runat="server" Text='<%# Bind("HvproductslistDESC")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Company Code" >
                <ItemTemplate>
                    <asp:Label ID="LblNewsPaperName" runat="server" 
                        Text='<%# Bind("Hvproductslistcompanyid")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            

               
        </Columns>
    </asp:GridView>



</asp:Content>
