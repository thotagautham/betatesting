﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="enquiry-geriatrics.aspx.vb" Inherits="betatesting.enquiry_geriatrics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


      <asp:GridView ID="GvBannerImages" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="geriaticQUERYID" CellPadding="10" AlternatingRowStyle-BorderStyle="Outset" PageSize="1000">
                        <RowStyle CssClass="GridRowStyle" />
                        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                        <HeaderStyle CssClass="GridHeaderStyle" />
                    <Columns>
                       
                      
                         <asp:BoundField DataField="geriaticQUERYID" HeaderText="Id" 
                            SortExpression="geriaticQUERYID" />
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
