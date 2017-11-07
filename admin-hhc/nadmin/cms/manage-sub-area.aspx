<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-hhc/adminbasepage.master" CodeBehind="manage-sub-area.aspx.vb" Inherits="betatesting.manage_sub_area" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="col-xs-12 col-sm-12 col-md-12">
<h1>Manage Cities</h1>
    </div>


  <div class="col-xs-12 col-sm-12 col-md-12"  style="padding:1% 0;">
<div class="col-xs-12 col-sm-6 col-md-6"> Country</div>

<div class="col-xs-12 col-sm-6 col-md-6"> 

         <asp:DropDownList ID="DDLCountry" runat="server" CssClass="form-control" DataSourceID="ObjDsCountry" 
                DataTextField="COUNTRYNAME" DataValueField="COUNTRYID" 
                AppendDataBoundItems="True" AutoPostBack="True">
                <asp:ListItem Value="">-- Select Any Country --</asp:ListItem>
            </asp:DropDownList>

         <asp:RequiredFieldValidator ID="rfvzone" Display="None" runat="server" ControlToValidate="DDLCountry" ValidationGroup="vgmanagecity" ErrorMessage="Select Any Zone"></asp:RequiredFieldValidator>
        <asp:ObjectDataSource ID="ObjDsCountry" runat="server" DeleteMethod="Delete" 
                InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" 
                SelectMethod="GetAllData" 
                TypeName="betatesting.DataSetCareTableAdapters.COUNTRYTableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_COUNTRYID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="COUNTRYNAME" Type="String" />
                    <asp:Parameter Name="ACTIVE" Type="String" />
                    <asp:Parameter Name="Original_COUNTRYID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="COUNTRYNAME" Type="String" />
                    <asp:Parameter Name="ACTIVE" Type="String" />
                </InsertParameters>
            </asp:ObjectDataSource>
            
          
    </div>
    </div>
    
  <div class="col-xs-12 col-sm-12 col-md-12"  style="padding:1% 0;">
<div class="col-xs-12 col-sm-6 col-md-6">State</div>
<div class="col-xs-12 col-sm-6 col-md-6">
         <asp:DropDownList ID="DDLState" runat="server" CssClass="form-control" AppendDataBoundItems="True" 
                AutoPostBack="True">
                <asp:ListItem Value="">-- Select Any State --</asp:ListItem>
            </asp:DropDownList>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" Display="None" runat="server" ControlToValidate="DDLState" ValidationGroup="vgmanagecity" ErrorMessage="Select Any State"></asp:RequiredFieldValidator>  </div>
    </div>


  <div class="col-xs-12 col-sm-12 col-md-12"  style="padding:1% 0;">
<div class="col-xs-12 col-sm-6 col-md-6">City</div>
<div class="col-xs-12 col-sm-6 col-md-6">
         <asp:DropDownList ID="ddlcity" runat="server" CssClass="form-control" AppendDataBoundItems="True" 
                AutoPostBack="True">
                <asp:ListItem Value="">-- Select Any city --</asp:ListItem>
            </asp:DropDownList>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="None" runat="server" ControlToValidate="ddlcity" ValidationGroup="vgmanagecity" ErrorMessage="Select Any City"></asp:RequiredFieldValidator>  </div>
    </div>
  

  <div class="col-xs-12 col-sm-12 col-md-12"  style="padding:1% 0;">
<div class="col-xs-12 col-sm-6 col-md-6">Sub area </div>
<div class="col-xs-12 col-sm-6 col-md-6">

        
         <asp:TextBox ID="TxtsubCity" runat="server"  CssClass="form-control" placeholder="Type SubCity"></asp:TextBox>

     <asp:RequiredFieldValidator ID="RequiredFieldValidator33" Display="None" runat="server" ControlToValidate="TxtsubCity" ValidationGroup="vgmanagecity" ErrorMessage="Enter Sub  City Name"></asp:RequiredFieldValidator>  </div>
        </div>
        
        
        <div class="col-xs-12 col-sm-12 col-md-4 col-md-offset-8"  style="padding:1% 0;">    
              <asp:Button ID="BtnSave" runat="server" Text="Save" 
                ValidationGroup="vgmanagecity" />


     <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="vgmanagecity"  />
           
        </div>


 <div class="col-xs-12 col-sm-12 col-md-12"  style="padding:1% 0;"> 

         <asp:Label ID="LblMsg" runat="server"></asp:Label>
    </div>

<div>  
           
        
    
  

    <asp:GridView ID="gvcity" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="SUBAREACITYID" CellPadding="10" PageSize="100">
                        <RowStyle CssClass="GridRowStyle" />
                        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                        <HeaderStyle CssClass="GridHeaderStyle" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                
                               <asp:LinkButton ID="LnkBtnEdit" runat="server" CausesValidation="false" 
                                    CommandName="CmdEdit" CommandArgument='<%# Eval("SUBAREACITYID")%>'
                                    Text="Edit"></asp:LinkButton> &nbsp;|&nbsp;
                                <asp:LinkButton ID="LnkBtnDelete" runat="server" CausesValidation="false" 
                                    CommandName="CmdDelete" CommandArgument='<%# Eval("SUBAREACITYID") %>'
                                    onclientclick="return confirm('Are You Sure You Want To Delete');" 
                                    Text="Delete"></asp:LinkButton>
                                ;
                            </ItemTemplate>
                        </asp:TemplateField>  
                        <asp:BoundField DataField="subareaCITYNAME" HeaderText="Sub Area Name" 
                            SortExpression="PageUrl" />
                        <asp:BoundField DataField="Cityid" HeaderText="City" 
                            SortExpression="ImagePath" />
                         <asp:BoundField DataField="ACTIVE" HeaderText="ACTIVE Status" 
                        SortExpression="ACTIVE" ReadOnly="True" />
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LnkBtnActiveStatus" runat="server" CausesValidation="false" 
                                CommandName="CmdActive" Text='<%# Eval("ACTIVE") %>' 
                                 ></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                        
                    </Columns>
                </asp:GridView>

      <asp:Label ID="filename" runat="server" Text="" Visible="False"></asp:Label>
      <asp:Label ID="fileId" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblSearchStr" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblGridDataSource" runat="server" Text="" Visible="False"></asp:Label>
      </div>

</asp:Content>
