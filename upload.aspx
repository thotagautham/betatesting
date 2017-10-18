<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="upload.aspx.vb" Inherits="betatesting.upload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="FUNewsImage" runat="server" />

        <asp:Button ID="btnSave" runat="server" Text="Save" />
    </div>
    </form>
</body>
</html>
