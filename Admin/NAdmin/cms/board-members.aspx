<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="board-members.aspx.vb" Inherits="betatesting.board_members" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<table border="1" bordercolor="#e9e9e9" style="border-collapse:collapse" cellpadding="0" cellspacing"0" align="center">
    <tr>
        <td style="padding:10px;">
             
        
<table border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr class="HeaderStyle">
                        <td width="22" height="22" align="left" valign="top"></td>
                        <td height="25" align="left" valign="middle" bgcolor="#AA94DD" colspan=4 class="HeaderStyle">FIND A DOCTOR</td>
                        <td width="22" height="22" align="left" valign="top"></td>
                      </tr>
                        <tr class="RowStyle">
                            <td width="22" height="22" align="left" valign="top">&nbsp;</td>
                            <td height="25" align="left" valign="middle">Doctor Name</td>
                            <td height="25" align="left" valign="middle">
                                <asp:TextBox ID="TxtDoctorName" runat="server"></asp:TextBox>
                            </td>
                            <td>Specialisation</td>    
                            <td height="35" align="left" valign="middle">
                                <asp:DropDownList ID="DDLSpecialisation" runat="server" AppendDataBoundItems="true" >
                                    <asp:ListItem Value="0">-- Select Specialisation --</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td width="22" height="22" align="left" valign="top">&nbsp;</td>
                        </tr>
                        <tr class="AlternateRowStyle">
                            <td align="left" height="22" valign="top" width="22">
                            </td>
                            <td align="left" height="25" valign="middle"> Branch&nbsp;</td>
                            <td align="left" height="25" valign="middle">
                               
                                <asp:DropDownList ID="DDLBranch" runat="server" AppendDataBoundItems="True" >
                                    <asp:ListItem Value="0">-- Select Branch --</asp:ListItem>
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
                                BorderColor="#404040" AutoGenerateColumns="False" DataKeyNames="DOCTORID" 
                                AllowPaging="True" PageSize="1000">
                                <RowStyle CssClass="GridRowStyle" />
                                <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                                <HeaderStyle CssClass="GridHeaderStyle" />
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="doctorid" DataNavigateUrlFormatString="doctordetails.aspx?docid={0}"
                Text="View Details" />
            <asp:HyperLinkField DataNavigateUrlFields="doctorid" DataNavigateUrlFormatString="managedoctors.aspx?docid={0}"
                Text="Edit" />
            <asp:BoundField DataField="DOCTORID" HeaderText="DOCTORID" ReadOnly="True" SortExpression="DOCTORID" Visible="False" />
            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
            <asp:BoundField DataField="DOCTORCODE" HeaderText="Designation" SortExpression="DOCTORCODE" />
            <asp:BoundField DataField="BRANCH" HeaderText="Branch" 
                SortExpression="BRANCH" />
            <asp:BoundField DataField="MOBILE" HeaderText="MOBILE" SortExpression="MOBILE" />
            <asp:BoundField DataField="EMAILID" HeaderText="EMAILID" SortExpression="EMAILID" />
            <asp:BoundField DataField="BILLINGSERVICECODE" HeaderText="BILLINGSERVICECODE" SortExpression="BILLINGSERVICECODE" />
            <asp:BoundField DataField="Active" HeaderText="Active Status" />
            <asp:BoundField DataField="PHOTO" HeaderText="Photo" />
            <asp:BoundField DataField="SPECIALISATION" HeaderText="SPECIALISATION" />
            <asp:BoundField DataField="DEPARTMENT" HeaderText="DEPARTMENT" />
            <asp:BoundField DataField="Institutes" HeaderText="Institutes" />
            <asp:BoundField DataField="BriefProfile" HeaderText="Brief Profile" />
            <asp:BoundField DataField="PresentPosition" HeaderText="Present Position" />
            <asp:BoundField DataField="Qualifications" HeaderText="Qualifications" />
            <asp:BoundField DataField="SpecialTraining" HeaderText="Special Training" />
            <asp:BoundField DataField="Experience" HeaderText="Experience" />
            <asp:BoundField DataField="Expertise" HeaderText="Expertise" />
            <asp:BoundField DataField="AchievementsBreakthroughCases" HeaderText="Achievements Breakthrough Cases" />
            <asp:BoundField DataField="Publications" HeaderText="Publications" />
            <asp:BoundField DataField="AcademicExposure" HeaderText="Academic Exposure" />
            <asp:BoundField DataField="TalkDelivered" HeaderText="Talk Delivered" />
            <asp:BoundField DataField="Other" HeaderText="Other" />
            <asp:BoundField DataField="Media" HeaderText="Media" />
            <asp:BoundField DataField="DOCTORID" HeaderText="Media List" />
            <asp:BoundField DataField="DOCTORID" HeaderText="Patient Exp" />
            <asp:BoundField DataField="DOCTORID" HeaderText="Doctor Interviews" />
            <asp:BoundField DataField="DOCTORID" HeaderText="Blog" />
            <asp:BoundField DataField="DOCTORID" HeaderText="Slide Share" />
            <asp:BoundField DataField="DOCTORID" HeaderText="Events" />
            
            <asp:BoundField DataField="PHOTO" HeaderText="Photo" />

            <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:LinkButton ID="LnkBtnActiveStatus" runat="server" CausesValidation="false" 
                                CommandName="CmdActive" Text='<%# Eval("ACTIVE") %>' ></asp:LinkButton>
                            <asp:LinkButton ID="LnkBtnDelete" runat="server" CausesValidation="false" 
                                    CommandName="CmdDelete" CommandArgument='<%# Eval("DoctorId") %>'
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


