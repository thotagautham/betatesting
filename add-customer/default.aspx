<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default.aspx.vb" Inherits="betatesting._default27" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>



     <div align="center">
        <table>
            <tr><td colspan="2"><asp:Label ID="LblMsg" runat="server"></asp:Label></td></tr>

              <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Name</td>
                <td><asp:TextBox ID="txtfirstname" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
           <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Last Name</td>
                <td><asp:TextBox ID="txtlastname" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
             <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Email Id</td>
                <td><asp:TextBox ID="txtemail" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
             <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Adress</td>
                <td><asp:TextBox ID="txtadress" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
             <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">State</td>
                <td><asp:TextBox ID="txtstate" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>

            </tr>
             <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Country</td>
                <td><asp:TextBox ID="txtcountry" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
             <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Mobile</td>
                <td><asp:TextBox ID="txtmobile" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
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
                    <asp:GridView ID="GVAddVideo" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="DoctorVideoID" CellPadding="10">
                        <RowStyle CssClass="GridRowStyle" />
                        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                        <HeaderStyle CssClass="GridHeaderStyle" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
            <%--                    <a href='/BannerImages/<%# Eval("ImagePath") %>'  target="_blank">View Image</a> &nbsp;|--%>
                               <asp:LinkButton ID="LnkBtnEdit" runat="server" CausesValidation="false" 
                                    CommandName="CmdEdit" CommandArgument='<%# Eval("ID")%>'
                                    Text="Edit"></asp:LinkButton> &nbsp;|&nbsp;
                                <asp:LinkButton ID="LnkBtnDelete" runat="server" CausesValidation="false" 
                                    CommandName="CmdDelete" CommandArgument='<%# Eval("ID")%>'
                                    onclientclick="return confirm('Are You Sure You Want To Delete');" 
                                    Text="Delete"></asp:LinkButton>
                                ;
                            </ItemTemplate>
                        </asp:TemplateField>  
                        <asp:BoundField DataField="name" HeaderText="name" 
                            SortExpression="name" />
                        <asp:BoundField DataField="Emailid" HeaderText="Emailid" 
                            SortExpression="Emailid" />
                        <asp:BoundField DataField="Mobile" HeaderText="Mobile" 
                            SortExpression="Mobile" />
                        <asp:BoundField DataField="AlternateText" HeaderText="Alternate Text" 
                            SortExpression="AlternateText" />
                         
                        
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



