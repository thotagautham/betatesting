<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="mail.aspx.vb" Inherits="betatesting.mail" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>

<body>
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
        <asp:Button ID="Button1" runat="server" Text="Button" style="height: 26px" />
   <asp:Label ID="labelmessage" runat="server"></asp:Label>
    </div>
        <div align="center">
    <table border="1" cellpadding="0" cellspacing="0" style="border-collapse:collapse" bgcolor="#faf8ff">
        <tr><td><asp:Label ID="LblMsg" runat="server"></asp:Label></td></tr>
        <tr>
            <td style=" padding : 25px 25px 25px 25px; ">
<table border=0 cellpadding=0 cellspacing=0>
   <tr class="GridRowStyle"><td colspan="2" class="GridHeaderStyle">Add Print Media News</td></tr>
   
    
    <tr class="RowStyle"><td align="left" class="tdStyle">From Number</td><td align="left">
        <asp:TextBox ID="txtfrom" runat="server" MaxLength="2000"></asp:TextBox>
        </td></tr>
     <tr class="RowStyle"><td align="left" class="tdStyle">To Number</td><td align="left">
        <asp:TextBox ID="txtto" runat="server" MaxLength="2000"></asp:TextBox>
        </td></tr>

    
    <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Message

                </td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtheading" runat="server" Height="600" Width="900">
                        </FCKeditorV2:FCKeditor>
    </td>

         </tr>    
    
    <tr class="AlternateRowStyle">
                <td valign="top" class="tdStyle">Message

                </td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtpagedescription" runat="server" Height="600" Width="900">
                        </FCKeditorV2:FCKeditor>
    </td>

         </tr>    
    
    <asp:Label ID="lblemailid" runat="server" Text="" Visible="false"></asp:Label>
    <tr class="AlternateRowStyle">
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="btnSearch" runat="server" Text="Search" />
                    <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="VgSave" /> &nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" /> &nbsp;&nbsp;
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="VgSave" ShowSummary="False" ShowMessageBox="True" />
                    <asp:CustomValidator ID="CVsection" runat="server" ClientValidationFunction="checkPageSelection" Display="None" ErrorMessage="Enter Page url/Section or select any Branch/Institute/Department/Speciality" ValidationGroup="VgSave"></asp:CustomValidator>
                </td>
            </tr>
           </table>
                </td>
            </tr>
        </table>
    <asp:Label ID="filename" runat="server" Text="" Visible="False"></asp:Label>
      <asp:Label ID="fileId" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblSearchStr" runat="server" Text="" Visible="False"></asp:Label>
    <asp:Label ID="LblGridDataSource" runat="server" Text="" Visible="False"></asp:Label>
    <asp:GridView ID="GVPrintNews" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" >
        <HeaderStyle CssClass="GridHeaderStyle" />
        <RowStyle CssClass="GridRowStyle" />
        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
        <Columns>
           
           
        </Columns>
    </asp:GridView>


 </div>
    </form>
</body>
</html>
