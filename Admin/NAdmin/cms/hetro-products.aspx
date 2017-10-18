<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="hetro-products.aspx.vb" Inherits="betatesting.hetro_products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


      <asp:GridView ID="GvBannerImages" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="HproductslistID" CellPadding="10" AlternatingRowStyle-BorderStyle="Outset" PageSize="1000">
                        <RowStyle CssClass="GridRowStyle" />
                        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                        <HeaderStyle CssClass="GridHeaderStyle" />
                    <Columns>
                       

                    

                       

                         <asp:BoundField DataField="HproductslistID" HeaderText="Hetro Products" 
                            SortExpression="HproductslistID" />
            <asp:BoundField DataField="HproductslistNAME" HeaderText="Name " 
                            SortExpression="Name" />

                         
                         
                        <asp:BoundField DataField="HproductslistDESC" HeaderText="Product Description" 
                            SortExpression="Description" />
                           
                        <asp:BoundField DataField="Hproductslistcompanyid" HeaderText="Company Id" 
                            SortExpression="company id" />
                        
                        
                         
                       
          </Columns>
                </asp:GridView>  
                
                
               
     <asp:Label ID="filename" runat="server" Text="" Visible="False"></asp:Label>
      <asp:Label ID="fileId" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblSearchStr" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblGridDataSource" runat="server" Text="" Visible="False"></asp:Label>
   


</asp:Content>