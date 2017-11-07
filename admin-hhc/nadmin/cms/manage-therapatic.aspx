<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-hhc/adminbasepage.master" CodeBehind="manage-therapatic.aspx.vb" Inherits="betatesting.manage_therapatic" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <div>
    <div>HtherapaticDESC</div>
      
        <div>
           
             <asp:TextBox ID="txtHtherapaticDESC" runat="server"></asp:TextBox>
                <asp:ImageButton id="Image1" runat="Server" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" CausesValidation="False"></asp:ImageButton>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" Display="None" runat="server" ControlToValidate="txtHtherapaticDESC" ValidationGroup="vgmanagecity" ErrorMessage="Select Any Zone"></asp:RequiredFieldValidator>
        <br/>
                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" PopupButtonID="Image1" TargetControlID="txtHtherapaticDESC"></cc1:CalendarExtender>

        </div>
        <div>htheterocode</div>
     

     
        <div>
            <asp:TextBox ID="txththeterocode" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="None" runat="server" ControlToValidate="txththeterocode" ValidationGroup="vgmanagecity" ErrorMessage="Enter Therapatic code"></asp:RequiredFieldValidator>
        </div>
        <div>hthetroname</div>
       
            
        <div>
            <asp:TextBox ID="txththetroname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="None" runat="server" ControlToValidate="txththetroname" ValidationGroup="vgmanagecity" ErrorMessage="Enter Therapatic Name"></asp:RequiredFieldValidator>
        </div>
        <div>htdivisionid</div>
        <div>  
              <asp:ListBox ID="lbBranch" runat="server" SelectionMode="Multiple"></asp:ListBox></div>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="None" runat="server" ControlToValidate="lbBranch" ValidationGroup="vgmanagecity" ErrorMessage="Select Any Division"></asp:RequiredFieldValidator>
    </div>



    


        <asp:Button ID="btnSearch" runat="server" Text="Search" />
                 
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" /> &nbsp;&nbsp;
                    &nbsp;<asp:Button ID="BtnSave" runat="server" Text="Save" 
                ValidationGroup="vgmanagecity" />


     <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="vgmanagecity"  />
           

    <div>
        <asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label>


        <asp:GridView ID="GVAddVideo" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="HtherapaticID" CellPadding="10" PageSize="1000" >
                        <RowStyle CssClass="GridRowStyle" />
                        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                        <HeaderStyle CssClass="GridHeaderStyle" />
                  <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
            <%--                    <a href='/BannerImages/<%# Eval("ImagePath") %>'  target="_blank">View Image</a> &nbsp;|--%>
                               <asp:LinkButton ID="LnkBtnEdit" runat="server" CausesValidation="false" 
                                    CommandName="CmdEdit" CommandArgument='<%# Eval("HtherapaticID")%>'
                                    Text="Edit"></asp:LinkButton> &nbsp;|&nbsp;
                                <asp:LinkButton ID="LnkBtnDelete" runat="server" CausesValidation="false" 
                                    CommandName="CmdDelete" CommandArgument='<%# Eval("HtherapaticID") %>'
                                    onclientclick="return confirm('Are You Sure You Want To Delete');" 
                                    Text="Delete"></asp:LinkButton>
                                ;
                            </ItemTemplate>
                        </asp:TemplateField>  
                        <asp:BoundField DataField="HtherapaticDESC" HeaderText="Descriptions" 
                            SortExpression="HtherapaticDESC" />


                       <asp:BoundField DataField="HtherapaticSTATUS" HeaderText="Status" 
                            SortExpression="HtherapaticSTATUS" />

                       <asp:BoundField DataField="htheterocode" HeaderText="Code" 
                            SortExpression="htheterocode" />


                       <asp:BoundField DataField="hthetroname" HeaderText="Name" 
                            SortExpression="hthetroname" />
                        
                       <asp:BoundField DataField="htdivisionid" HeaderText="Division Id" 
                            SortExpression="htdivisionid" />


                        
                    </Columns>
                </asp:GridView>
    </div>


     <asp:Label ID="filename" runat="server" Text="" Visible="False"></asp:Label>
      <asp:Label ID="fileId" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblSearchStr" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblGridDataSource" runat="server" Text="" Visible="False"></asp:Label>
</asp:Content>
