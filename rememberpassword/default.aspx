<%@ Page Title="" Language="vb" AutoEventWireup="false"  CodeBehind="default.aspx.vb" Inherits="betatesting._default5" %>
<%@ Register TagName="Header" TagPrefix="H" Src="~/header.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <asp:ContentPlaceHolder ID="metatagscontent" runat="server">
    </asp:ContentPlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <H:Header runat="server" ID="Header" />
        <asp:ContentPlaceHolder ID="bodycontent" runat="server">
        
        </asp:ContentPlaceHolder>

    </div>
    </form>
</body>
</html>

