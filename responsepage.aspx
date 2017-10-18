<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="responsepage.aspx.vb" Inherits="betatesting.responsepage" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="LBL_DisplayResult" runat="server"></asp:Label><br>
        <br>
        <asp:Label ID="lblResponseDecrypted" runat="server"></asp:Label><br>
        <br>
        <asp:Label ID="lblValidate" runat="server"></asp:Label><br>
        <br>
        <asp:Label ID="lblXMLResponse" runat="server"></asp:Label>
    </div>
<%
For Each var As String In Request.ServerVariables
        Response.Write((var & ":   ") + Request(var) & "<br>")
    Next
%>
    </form>
</body>
</html>