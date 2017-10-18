<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="new.aspx.vb" Inherits="betatesting._new" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            font-family: Arial;
            font-size: 10pt;
        }
        table
        {
            border: 1px solid #ccc;
            border-collapse: collapse;
            background-color: #fff;
        }
        table th
        {
            background-color: #B8DBFD;
            color: #333;
            font-weight: bold;
        }
        table th, table td
        {
            padding: 5px;
            border: 1px solid #ccc;
        }
        table, table table td
        {
            border: 0px solid #ccc;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="btnImport" runat="server" Text="Import" OnClick="ImportExcel" />
        <hr />
       <asp:GridView ID="GvBannerImages" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="STATENAME" CellPadding="10" AlternatingRowStyle-BorderStyle="Outset" PageSize="1000">
                        <RowStyle CssClass="GridRowStyle" />
                        <AlternatingRowStyle CssClass="GridAlternateRowStyle" />
                        <HeaderStyle CssClass="GridHeaderStyle" />
                    <Columns>
                       

                        

                       

                         <asp:BoundField DataField="STATENAME" HeaderText="STATENAME" 
                            SortExpression="STATENAME" />
          
                           <asp:BoundField DataField="COUNTRYID" HeaderText="COUNTRYID" 
                            SortExpression="COUNTRYID" />
          
                           <asp:BoundField DataField="STATENAME" HeaderText="STATENAME" 
                            SortExpression="STATENAME" />
          
                           <asp:BoundField DataField="STATENAME" HeaderText="STATENAME" 
                            SortExpression="STATENAME" />
          
                       
          </Columns>
                </asp:GridView>
    </div>
    </form>
</body>
</html>
