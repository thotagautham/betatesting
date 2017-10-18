<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="default.aspx.vb" Inherits="betatesting._default7" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table border="1" bordercolor="#e9e9e9" style="border-collapse:collapse" cellpadding="0" cellspacing"0" align="center">
    <tr>
        <td style="padding:10px;">
             
        
<table border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr class="HeaderStyle">
                        <td width="22" height="22" align="left" valign="top"></td>
                        <td height="25" align="left" valign="middle" bgcolor="#AA94DD" colspan=4 class="HeaderStyle">FIND An Expert User</td>
                        <td width="22" height="22" align="left" valign="top"></td>
                      </tr>
                        <tr class="RowStyle">
                            <td width="22" height="22" align="left" valign="top">&nbsp;</td>
                            <td height="25" align="left" valign="middle">Expert Name</td>
                            <td height="25" align="left" valign="middle">
                                <asp:TextBox ID="TxtDoctorName" runat="server"></asp:TextBox>
                            </td>
                            <td>Vendor Specialisation</td>    
                            <td height="35" align="left" valign="middle">
                                <asp:DropDownList ID="DDLSpecialisation" runat="server" AppendDataBoundItems="true" >
                                    <asp:ListItem Value="0">-- Vendor Specialisation --</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td width="22" height="22" align="left" valign="top">&nbsp;</td>
                        </tr>
                        <tr class="AlternateRowStyle">
                            <td align="left" height="22" valign="top" width="22">
                            </td>
                            <td align="left" height="25" valign="middle"> Vendor Type&nbsp;</td>
                            <td align="left" height="25" valign="middle">
                               
                                <asp:DropDownList ID="DDLBranch" runat="server" AppendDataBoundItems="True" >
                                    <asp:ListItem Value="0">-- Select Vendor Type --</asp:ListItem>
                                </asp:DropDownList>
                               
                            </td>
                            <td align="center" colspan="2">
                                <asp:Button ID="BtnSearch" runat="server" Text="Search" />
                            </td>
                            <td align="left" height="22" valign="top" width="22">
                            </td>
                      </tr>
                      <tr>
                        <td colspan="6">&nbsp;</td>
                      </tr>
                   </table> 
  
  </td>
    </tr>
</table>  

<br /><br />

<div align="center">


    <asp:GridView ID="GridView1" runat="server"  ForeColor="Black" BorderStyle="Solid" 
                                BorderColor="#404040" AutoGenerateColumns="False" DataKeyNames="VENDORID" 
                                AllowPaging="True" PageSize="15">
                                <RowStyle CssClass="GridRowStyle" />
                                <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                                <HeaderStyle CssClass="GridHeaderStyle" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="VENDORID" DataNavigateUrlFormatString="vendor-details/default.aspx?vendorid={0}"
                Text="View Details" />
            <asp:HyperLinkField DataNavigateUrlFields="VENDORID" DataNavigateUrlFormatString="../Edit-vendor/default.aspx?vendorid={0}"
                Text="Edit" />
            
            <asp:BoundField DataField="VENDORID" HeaderText="VENDORID" ReadOnly="True" SortExpression="VENDORID" Visible="False" />
            <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
            <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname" />
            <asp:BoundField DataField="vendortype" HeaderText="vendortype" 
                SortExpression="vendortype" />
            <asp:BoundField DataField="MOBILE" HeaderText="MOBILE" SortExpression="MOBILE" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="CITY" HeaderText="CITY" SortExpression="CITY" />
            <asp:BoundField DataField="Active" HeaderText="Active Status" />
            <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LnkBtnActiveStatus" runat="server" CausesValidation="false" 
                                CommandName="CmdActive" Text='<%# Eval("ACTIVE")%>' ></asp:LinkButton>
                            <asp:LinkButton ID="LnkBtnDelete" runat="server" CausesValidation="false" 
                                    CommandName="CmdDelete" CommandArgument='<%# Eval("VENDORID")%>'
                                    onclientclick="return confirm('Are You Sure You Want To Delete');" 
                                    Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
        </Columns>
        <RowStyle Height="30px"></RowStyle>

<HeaderStyle BackColor="#7c5ccb" ForeColor="White"></HeaderStyle>
    </asp:GridView>
</div>
    &nbsp;
                        
                        
                        
                        <br /><br />
</asp:Content>
