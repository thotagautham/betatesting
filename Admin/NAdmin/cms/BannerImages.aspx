<%@ Page Title="Banner Images :: Administrator :: KIMS Hospitals" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="BannerImages.aspx.vb" Inherits="betatesting.BannerImages" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center">
        <table>
            <tr><td colspan="2"><asp:Label ID="LblMsg" runat="server"></asp:Label></td></tr>
            <tr class="RowStyle">
                <td valign="top" class="tdStyle">Page</td>
                <td><asp:ListBox ID="lbPages" runat="server" onchange="setAll(this)" SelectionMode="Multiple"></asp:ListBox>
                </td>
            </tr>
            <tr class="RowStyle">
                <td valign="top" class="tdStyle">Select Image</td>
                <td><asp:FileUpload ID="FuImage" runat="server" />
                    <asp:RequiredFieldValidator ID="RFVImage" runat="server" ErrorMessage="Select any image"  Display="None" ControlToValidate="FuImage" ValidationGroup="VgSave"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Alternate Text</td>
                <td><asp:TextBox ID="txtAlternateText" runat="server" TextMode="MultiLine" Rows="2" Columns="50"></asp:TextBox></td>
            </tr>
            <tr class="RowStyle">
                <td valign="top" class="tdStyle">Sort Order</td>
                <td><asp:TextBox ID="txtSortOrder" runat="server" MaxLength="2"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RevSortOrder" runat="server" ErrorMessage="Sort Order :: Enter Numbers Only" ControlToValidate="txtSortOrder" ValidationExpression="[0-9]" Display="None" ValidationGroup="VgSave"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Description</td>
                <td><asp:TextBox ID="txtDescription" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
            
            <tr class="AlternateRowStyle">
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="VgSave" /> &nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" /> &nbsp;&nbsp;
                    <asp:Label ID="lblId" runat="server" Text="0" Visible="False"></asp:Label>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="VgSave" ShowSummary="False" ShowMessageBox="True" />
                </td>
            </tr>
            <tr><td colspan="2">
                    <asp:GridView ID="GvBannerImages" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="Id" CellPadding="10">
                        <RowStyle CssClass="GridRowStyle" />
                        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                        <HeaderStyle CssClass="GridHeaderStyle" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LnkBtnEdit" runat="server" CausesValidation="false" 
                                    CommandName="CmdEdit" CommandArgument='<%# Eval("Id") %>'
                                    Text="Edit"></asp:LinkButton> &nbsp;|&nbsp;
                                <asp:LinkButton ID="LnkBtnDelete" runat="server" CausesValidation="false" 
                                    CommandName="CmdDelete" CommandArgument='<%# Eval("Id") %>'
                                    onclientclick="return confirm('Are You Sure You Want To Delete');" 
                                    Text="Delete"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>  
                        <asp:BoundField DataField="Pages" HeaderText="Page" 
                            SortExpression="Pages" />
                        <asp:BoundField DataField="ImagePath" HeaderText="Image Name" 
                            SortExpression="ImagePath" />
                        <asp:BoundField DataField="SortOrder" HeaderText="Sort Order" 
                            SortExpression="SortOrder" />
                        <asp:BoundField DataField="AlternateText" HeaderText="Alternate Text" 
                            SortExpression="AlternateText" />
                         <asp:BoundField DataField="Description" HeaderText="Description" />
                    </Columns>
                </asp:GridView>    
                </td></tr>
        </table>
    </div>
    <asp:Label ID="filename" runat="server" Text="" Visible="False"></asp:Label>
      <asp:Label ID="fileId" runat="server" Text="" Visible="False"></asp:Label>

    <script language="javascript">
        function getSelectedItemsCount(lb) {
            for (var i = 0; i < lb.length; i++) {
                if (lb.options[i].selected) {
                    return 1;
                }
            }
            return 0;
        }

        function setAll(lb) {
            if (lb.options[0].selected) {
                for (var i = 1; i < lb.length; i++) {
                    if (lb.options[i].selected) {
                        lb.options[i].selected = false;
                    }
                }
            }
        }
    </script>
    

</asp:Content>
