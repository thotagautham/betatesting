<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="care-resumes.aspx.vb" Inherits="betatesting.care_resumes" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


      <asp:GridView ID="GvBannerImages" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="VENDORID" CellPadding="10" AlternatingRowStyle-BorderStyle="Outset" PageSize="1000">
                        <RowStyle CssClass="GridRowStyle" />
                        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                        <HeaderStyle CssClass="GridHeaderStyle" />
                    <Columns>
                       

                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                
                              

                                <a href='http://carehospitals.com/careers/resumes/<%# Eval("PHOTO")%>'  target="_blank">View Resume</a>
                                
                               
                            </ItemTemplate>
                        </asp:TemplateField>

                       

                         <asp:BoundField DataField="VENDORID" HeaderText="Id" 
                            SortExpression="VENDORID" />

                         <asp:BoundField DataField="Firstname" HeaderText="FIrst Name" 
                            SortExpression="First Name" />
                        <asp:BoundField DataField="Lastname" HeaderText="Last Name " 
                            SortExpression="state" />

                           <asp:BoundField DataField="Email" HeaderText="Email" 
                            SortExpression="Email" />
                           
                        <asp:BoundField DataField="MOBILE" HeaderText="MOBILE" 
                            SortExpression="MOBILE" />
                        <asp:BoundField DataField="Media" HeaderText="Qualification" 
                            SortExpression="Mode of Presentation" />

            <asp:BoundField DataField="QUALIFICATION" HeaderText="Specilisation" 
                            SortExpression="Specilisation" />

                          <asp:BoundField DataField="vendortype" HeaderText="Post Applied For" 
                            SortExpression="Specilisation" />
                         
                         
                     
                        
                       
                         
                       
          </Columns>
                </asp:GridView>  
                
                
               
     <asp:Label ID="filename" runat="server" Text="" Visible="False"></asp:Label>
      <asp:Label ID="fileId" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblSearchStr" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblGridDataSource" runat="server" Text="" Visible="False"></asp:Label>
   


</asp:Content>
