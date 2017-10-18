<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="HETERO-VENDOR-PRODUCTS.aspx.vb" Inherits="betatesting.HETERO_VENDOR_PRODUCTS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:GridView ID="GvBannerImages" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="HVproductslistID" CellPadding="10" AlternatingRowStyle-BorderStyle="Outset" PageSize="1000">
                        <RowStyle CssClass="GridRowStyle" />
                        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                        <HeaderStyle CssClass="GridHeaderStyle" />
                    <Columns>
                       

                    

                       

                         <asp:BoundField DataField="HVproductslistID" HeaderText="Hetro Products" 
                            SortExpression="HproductslistID" />
            <asp:BoundField DataField="HVproductslistNAME" HeaderText="Name " 
                            SortExpression="Name" />

                         
                         
                        <asp:BoundField DataField="HVproductslistDESC" HeaderText="Product Description" 
                            SortExpression="Description" />
                           
                        <asp:BoundField DataField="HVproductslistcompanyid" HeaderText="Vendor Company Id" 
                            SortExpression="company id" />

                        <asp:BoundField DataField="Hproductslistcompanyid" HeaderText="Hetro Company Id" 
                            SortExpression="company id" />
                        
                        
                         
                       
          </Columns>
                </asp:GridView>  
                
                
               
     <asp:Label ID="filename" runat="server" Text="" Visible="False"></asp:Label>
      <asp:Label ID="fileId" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblSearchStr" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblGridDataSource" runat="server" Text="" Visible="False"></asp:Label>
   


</asp:Content>