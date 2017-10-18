<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="manage-pages.aspx.vb" Inherits="betatesting.manage_pages" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




      <div align="center">
        <table>
            <tr><td colspan="2"><asp:Label ID="LblMsg" runat="server"></asp:Label></td></tr>

 <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">page Url</td>
                <td><asp:TextBox ID="txtpageurl" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>

            <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Page Title</td>
                <td><asp:TextBox ID="txtpagetittle" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
          
              <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Keywords</td>
                <td><asp:TextBox ID="txtkeywords" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>

             <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">meta tags</td>
                <td><asp:TextBox ID="txtmetatags" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
            <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Page description </td>
                <td><asp:TextBox ID="txtpagedes" runat="server"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox></td>
            </tr>
           
           <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle"> Body Left Top</td>
            <td><FCKeditorV2:FCKeditor ID="txtbodylefttop" runat="server" Height="600" Width="900">
                        </FCKeditorV2:FCKeditor>
    </td>
</tr>
             <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle"> Body Right Top</td>
            <td><FCKeditorV2:FCKeditor ID="txtbodyrighttop" runat="server" Height="600" Width="900">
                        </FCKeditorV2:FCKeditor>
    </td>
</tr>
             <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">  Body Center</td>
            <td><FCKeditorV2:FCKeditor ID="txtbodycenter" runat="server" Height="600" Width="900">
                        </FCKeditorV2:FCKeditor>
    </td>
</tr>
             <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle"> Body Bottom</td>
            <td><FCKeditorV2:FCKeditor ID="txtbodybottom" runat="server" Height="600" Width="900">
                        </FCKeditorV2:FCKeditor>
    </td>
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
                    AutoGenerateColumns="False" DataKeyNames="kimsPageId" CellPadding="10">
                        <RowStyle CssClass="GridRowStyle" />
                        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                        <HeaderStyle CssClass="GridHeaderStyle" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
            <%--                    <a href='/BannerImages/<%# Eval("ImagePath") %>'  target="_blank">View Image</a> &nbsp;|--%>
                               <asp:LinkButton ID="LnkBtnEdit" runat="server" CausesValidation="false" 
                                    CommandName="CmdEdit" CommandArgument='<%# Eval("kimsPageId")%>'
                                    Text="Edit"></asp:LinkButton> &nbsp;|&nbsp;
                                <asp:LinkButton ID="LnkBtnDelete" runat="server" CausesValidation="false" 
                                    CommandName="CmdDelete" CommandArgument='<%# Eval("kimsPageId") %>'
                                    onclientclick="return confirm('Are You Sure You Want To Delete');" 
                                    Text="Delete"></asp:LinkButton>
                                ;
                            </ItemTemplate>
                        </asp:TemplateField>  
                        <asp:BoundField DataField="PageUrl" HeaderText="Url" 
                            SortExpression="PageUrl" />
                       
                        
                    </Columns>
                </asp:GridView>    
                </td></tr>
        </table>
    </div>
     <asp:Label ID="filename" runat="server" Text="" Visible="False"></asp:Label>
      <asp:Label ID="fileId" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblSearchStr" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblGridDataSource" runat="server" Text="" Visible="False"></asp:Label>
</asp:Content>

