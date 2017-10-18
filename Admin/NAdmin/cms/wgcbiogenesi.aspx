<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="wgcbiogenesi.aspx.vb" Inherits="betatesting.wgcbiogenesi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <asp:GridView ID="GvBannerImages" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="gynaQUERYID" CellPadding="10" AlternatingRowStyle-BorderStyle="Outset" PageSize="1000">
                        <RowStyle CssClass="GridRowStyle" />
                        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                        <HeaderStyle CssClass="GridHeaderStyle" />
                    <Columns>
                       
                         <asp:BoundField DataField="gynaQUERYID" HeaderText="Id" 
                            SortExpression="gynaQUERYID" />
            <asp:BoundField DataField="Name" HeaderText="Name " 
                            SortExpression="Name" />
                        <asp:BoundField DataField="EmailId" HeaderText="EmailId" 
                            SortExpression="EmailId" />
                           
                        <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" 
                            SortExpression="PhoneNumber" />
                        
                        <asp:BoundField DataField="VedicagraharamQUERYDESC" HeaderText="Message" 
                            SortExpression="mesage" />
                       <asp:BoundField DataField="QUERYDATETIME" HeaderText="Received Time" 
                            SortExpression="Time" />   
                       
          </Columns>
                </asp:GridView>  
                
                
               
     <asp:Label ID="filename" runat="server" Text="" Visible="False"></asp:Label>
      <asp:Label ID="fileId" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblSearchStr" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblGridDataSource" runat="server" Text="" Visible="False"></asp:Label>
   



</asp:Content>
