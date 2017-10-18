<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="enquiry.aspx.vb" Inherits="betatesting.enquiry1" %>

<%@ Register Src="~/srihamsa-rightarea.ascx" TagPrefix="uc1" TagName="srihamsarightarea" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
        <uc1:srihamsarightarea runat="server" ID="srihamsarightarea" />
    </div>
    </form>
</body>
</html>
