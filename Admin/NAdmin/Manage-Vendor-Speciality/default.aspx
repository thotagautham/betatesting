<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind ="default.aspx.vb" Inherits="betatesting._default3" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


     <div align="center">
        <table>
            <tr><td colspan="2"><asp:Label ID="LblMsg" runat="server"></asp:Label></td></tr>

              <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Specilsation  NAME</td>
                <td><asp:TextBox ID="txtname" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
          
              <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">DESCRIPTION </td>
                <td><asp:TextBox ID="txtdescription" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>

             <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">	Procedures</td>
                <td><asp:TextBox ID="txtprocedures" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
           <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Vendor Type</td>
                <td><asp:ListBox ID="Lbvendortypes" runat="server" SelectionMode="Multiple"></asp:ListBox></td>
               <asp:RequiredFieldValidator id="RFVBranch" runat="server" Display="None" ControlToValidate="Lbvendortypes" ErrorMessage="Branch Should Not Be Empty"></asp:RequiredFieldValidator>
            </tr>

            <tr class="trbg2">
        <td valign="top">
            Active Status</td>
        <td valign="top">
        </td>
        <td colspan="2" valign="top">
            <asp:DropDownList ID="DDLActiveStatus" runat="server">
                <asp:ListItem Value="Y">Active</asp:ListItem>
                <asp:ListItem Value="N">DeActive</asp:ListItem>
            </asp:DropDownList></td>
    </tr>
           
              
      
    
           
           
            
            
            <tr class="AlternateRowStyle">
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" />
                    <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="VgSave" /> &nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" /> &nbsp;&nbsp;
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="VgSave"  ShowMessageBox="True" />
                    <asp:CustomValidator ID="CVsection" runat="server" ClientValidationFunction="checkPageSelection" Display="None" ErrorMessage="Enter Page url/Section or select any Branch/Institute/Department/Speciality" ValidationGroup="VgSave"></asp:CustomValidator>
                </td>
            </tr>
            <tr><td colspan="2">
                    <asp:GridView ID="GVVENDORTYPES" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="SPECIALIZATIONID" CellPadding="10">
                        <RowStyle CssClass="GridRowStyle" />
                        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                        <HeaderStyle CssClass="GridHeaderStyle" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
            <%--                    <a href='/BannerImages/<%# Eval("ImagePath") %>'  target="_blank">View Image</a> &nbsp;|--%>
                               <asp:LinkButton ID="LnkBtnEdit" runat="server" CausesValidation="false" 
                                    CommandName="CmdEdit" CommandArgument='<%# Eval("SPECIALIZATIONID")%>'
                                    Text="Edit"></asp:LinkButton> &nbsp;|&nbsp;
                                <asp:LinkButton ID="LnkBtnDelete" runat="server" CausesValidation="false" 
                                    CommandName="CmdDelete" CommandArgument='<%# Eval("SPECIALIZATIONID")%>'
                                    onclientclick="return confirm('Are You Sure You Want To Delete');" 
                                    Text="Delete"></asp:LinkButton>
                                ;
                            </ItemTemplate>
                        </asp:TemplateField>  
                        <asp:BoundField DataField="SPECIALIZATIONNAME" HeaderText="SPECIALIZATIONNAME" 
                            SortExpression="SPECIALIZATIONNAME" />
                        <asp:BoundField DataField="SPECIALIZATIONDESC" HeaderText="SPECIALIZATIONDESC" 
                            SortExpression="SPECIALIZATIONDESC" />
                        
                        
                    </Columns>
                </asp:GridView>    
                </td></tr>
        </table>
    </div>
     <asp:Label ID="filename" runat="server" Text="" Visible="False"></asp:Label>
      <asp:Label ID="fileId" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblSearchStr" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblGridDataSource" runat="server" Text="" Visible="False"></asp:Label>
    <script language="javascript">
        function checkPageSelection(source, args) {

            var txtname = document.getElementById('<%= txtname.ClientID%>');
            var txtdescription = document.getElementById('<%= txtdescription.ClientID%>');
            var txtprocedures = document.getElementById('<%= txtprocedures.ClientID%>');

            args.IsValid = (txtPageUrl.value != "" || getSelectedItemsCount(ddlBranch) > 0 || getSelectedItemsCount(ddlInstitute) > 0 || getSelectedItemsCount(ddlDepartment) > 0 || getSelectedItemsCount(ddlSpeciality) > 0 || txtSection.value != "");
        }

        function getSelectedItemsCount(lb) {
            for (var i = 0; i < lb.length; i++) {
                if (lb.options[i].selected) {
                    return 1;
                }
            }
            return 0;
        }

    </script>


</asp:Content>
