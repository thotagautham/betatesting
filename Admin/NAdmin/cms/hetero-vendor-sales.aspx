<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="hetero-vendor-sales.aspx.vb" Inherits="betatesting.hetero_vendor_sales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <asp:GridView ID="GvBannerImages" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="HvsalesID" CellPadding="10" AlternatingRowStyle-BorderStyle="Outset" PageSize="1000">
                        <RowStyle CssClass="GridRowStyle" />
                        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                        <HeaderStyle CssClass="GridHeaderStyle" />
                    <Columns>
                       

                    

                       

                         <asp:BoundField DataField="HvsalesID" HeaderText="Hetro SALES" 
                            SortExpression="HproductslistID" />
            <asp:BoundField DataField="HVproductslistNAME" HeaderText="Name " 
                            SortExpression="Name" />

                         
                         
                        <asp:BoundField DataField="HVproductslistDESC" HeaderText="Product Description" 
                            SortExpression="Description" />
                           
                        <asp:BoundField DataField="HVproductslistcompanyid" HeaderText="Company Id" 
                            SortExpression="company id" />

                        <asp:BoundField DataField="Hproductslistcompanyid" HeaderText="Company Id" 
                            SortExpression="company id" />

                         <asp:BoundField DataField="Hproductsquantity" HeaderText="Sales Quantity" 
                            SortExpression="Sales Quantity" />
                        
                        
                         
                       
          </Columns>
                </asp:GridView>  
                
                
               
     <asp:Label ID="filename" runat="server" Text="" Visible="False"></asp:Label>
      <asp:Label ID="fileId" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblSearchStr" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblGridDataSource" runat="server" Text="" Visible="False"></asp:Label>
   


</asp:Content>