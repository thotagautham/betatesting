<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-avana/adminbasepage.master" CodeBehind="manage-catlog-images.aspx.vb" Inherits="betatesting.manage_catlog_images" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
       <asp:UpdatePanel ID="UpdatePanel1" runat="server">


           <Triggers>
                        <asp:PostBackTrigger ControlID="btnsave" />
                    </Triggers>
       <ContentTemplate>

     <div>
        Manage Catlog Images
    </div>


    <div id ="catlogimages" runat="server" visible="false">




             
   
<div>



    <div>
Title
    </div>
    <div>

        <asp:TextBox ID="txttitle" runat="server" placeholder="Enter txttitle"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" runat="server" ControlToValidate="txttitle" ValidationGroup="vgcatlog" ErrorMessage="Enter Name"></asp:RequiredFieldValidator>
    </div>
    </div>
 <div>
    <div>
         Description
    </div>
    <div>
 <asp:TextBox ID="txtlongdescriptiontext" runat="server" Rows="3" TextMode="MultiLine" placeholder="Description" ></asp:TextBox>
         
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="None" runat="server" ControlToValidate="txtlongdescriptiontext" ValidationGroup="vgcatlog" ErrorMessage="Enter Long Description"></asp:RequiredFieldValidator>
    </div>
   </div>


           <div>
    <div>
         Sort Order
    </div>
    <div>
 <asp:TextBox ID="txtsortorder" runat="server" Rows="3" TextMode="MultiLine" placeholder="Description" ></asp:TextBox>
         
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="None" runat="server" ControlToValidate="txtsortorder" ValidationGroup="vgcatlog" ErrorMessage="Enter Long Description"></asp:RequiredFieldValidator>
    </div>
   </div>
 


              
<div>Upload</div>
           <div>
               <asp:FileUpload ID="FUNewsImage"  runat="server" />

                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="None" runat="server" ControlToValidate="FUNewsImage" ValidationGroup="vgcatlog" ErrorMessage="Enter Long Description"></asp:RequiredFieldValidator>
           </div>


    </div>





    
           <div>

    <asp:Button ID="btnsave" runat="server" Text="Add New" ValidationGroup="vgcatlog" />
     <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="vgcatlog" />


       


           </div>


           <div>
               <asp:Label ID="LblMsg" runat="server" Text="Label"></asp:Label>

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
                        CommandName="CmdEdit" CommandArgument='<%# Eval("avanacatlogimagesID")%>'
                        Text="Edit"></asp:LinkButton> &nbsp;|&nbsp;
                    <asp:LinkButton ID="LnkBtnDelete" runat="server" CausesValidation="false" 
                        CommandName="CmdDelete" CommandArgument='<%# Eval("avanacatlogimagesID")%>'
                        onclientclick="return confirm('Are You Sure You Want To Delete');" 
                        Text="Delete"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>  
            <asp:TemplateField HeaderText="Title" >
                <ItemTemplate>
                    <asp:Label ID="LblTitle" runat="server" Text='<%# Bind("Title")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="description" >
                <ItemTemplate>
                    <asp:Label ID="LblDate" runat="server" Text='<%# Bind("description")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="sortorder" >
                <ItemTemplate>
                    <asp:Label ID="LblNewsPaperName" runat="server" 
                        Text='<%# Bind("sortorder")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            

             <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                      <a href='/files/avana/images/<%# Eval("imageurl")%>' target="_blank">View Images</a>
                </ItemTemplate>
            </asp:TemplateField>  
        </Columns>
    </asp:GridView>




</ContentTemplate>
   </asp:UpdatePanel>


</asp:Content>
