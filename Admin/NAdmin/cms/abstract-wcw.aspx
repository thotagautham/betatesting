<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="abstract-wcw.aspx.vb" Inherits="betatesting.abstract_wcw" %>





<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


      <asp:GridView ID="GvBannerImages" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="wcwQUERYID" CellPadding="10" AlternatingRowStyle-BorderStyle="Outset" PageSize="1000">
                        <RowStyle CssClass="GridRowStyle" />
                        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                        <HeaderStyle CssClass="GridHeaderStyle" />
                    <Columns>
                       

                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                
                              

                                <a href='http://drugdiscoveryconference.org/abstract/<%# Eval("currentstatus")%>'  target="_blank">View Abstract</a>
                                
                               
                            </ItemTemplate>
                        </asp:TemplateField>

                       

                         <asp:BoundField DataField="wcwQUERYID" HeaderText="Id" 
                            SortExpression="wcwQUERYID" />
            <asp:BoundField DataField="Name" HeaderText="Name " 
                            SortExpression="Name" />

                         
                         
                        <asp:BoundField DataField="EmailId" HeaderText="EmailId" 
                            SortExpression="EmailId" />
                           
                        <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" 
                            SortExpression="PhoneNumber" />
                        <asp:BoundField DataField="hospitalstatusremakrsecond" HeaderText="Mode of Presentation" 
                            SortExpression="Mode of Presentation" />
                        
                        <asp:BoundField DataField="VedicagraharamQUERYDESC" HeaderText="Address" 
                            SortExpression="Address" />
                        <asp:BoundField DataField="country" HeaderText="state " 
                            SortExpression="state" />
                         <asp:BoundField DataField="State" HeaderText="Country " 
                            SortExpression="state" />
                       <asp:BoundField DataField="QUERYDATETIME" HeaderText="Received Time" 
                            SortExpression="Time" />  
                         
                       
          </Columns>
                </asp:GridView>  
                
                
               
     <asp:Label ID="filename" runat="server" Text="" Visible="False"></asp:Label>
      <asp:Label ID="fileId" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblSearchStr" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblGridDataSource" runat="server" Text="" Visible="False"></asp:Label>
   


</asp:Content>
