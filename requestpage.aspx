<%@ Page Language="vb" AutoEventWireup="false"  Debug="true" CodeBehind="requestpage.aspx.vb" Inherits="vedic.requestpage" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblResponse" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblCheckSum" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td>
                    Request Using
                </td>
                <td>
                    <asp:DropDownList ID="ddlRequest" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlRequest_SelectedIndexChanged">
                        <asp:ListItem Text="-Select-" Selected="True" Value="0"></asp:ListItem>
                        <asp:ListItem Text="Property File" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Key,Iv" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                </td>
            </tr>
            <tr>
                <td>
                    Request Type
                </td>
                <td>
                    <asp:TextBox ID="TXT_requesttype" runat="server">T</asp:TextBox>
                    <%-- <asp:DropDownList ID="ddlRequestType" runat="server" AutoPostBack="true" onselectedindexchanged="ddlRequestType_SelectedIndexChanged" 
                        >
                  <asp:ListItem Text="-Select-" Selected="True" Value="0"></asp:ListItem>
                  <asp:ListItem Text="T" Value="1"></asp:ListItem>
                  <asp:ListItem Text="S" Value="2"></asp:ListItem>
                  <asp:ListItem Text="R" Value="3"></asp:ListItem>
                  <asp:ListItem Text="O" Value="4"></asp:ListItem>
                  <asp:ListItem Text="TNR" Value="5"></asp:ListItem>
                  <asp:ListItem Text="TCI" Value="6"></asp:ListItem>
                 </asp:DropDownList>--%>
                </td>
            </tr>
            <tr>
                <td>
                    Merchant Code
                </td>
                <td>
                    <asp:TextBox ID="TXT_merchantcode" runat="server">T4624</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Merchant Transaction Reference Number
                </td>
                <td>
                    <asp:TextBox ID="TXT_MerchantTxnRefNo" runat="server">1234567889585</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    ITC
                </td>
                <td>
                    <asp:TextBox ID="TXT_ITC" runat="server">sunil_mumbai</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Amount
                </td>
                <td>
                    <asp:TextBox ID="TXT_Amount" runat="server">1.00</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Currency code
                </td>
                <td>
                    <asp:TextBox ID="TXT_Currencycode" runat="server">INR</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Unique Customer ID
                </td>
                <td>
                    <asp:TextBox ID="TXT_uniqueCustomerID" runat="server">8457125412512</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Return URL
                </td>
                <td>
                    <asp:TextBox ID="TXT_returnURL" runat="server">http://mokshamedia.in/responsepage.aspx</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    StoS Return URL
                </td>
                <td>
                    <asp:TextBox ID="TXT_StoSreturnURL" runat="server">https://www.tekprocess.co.in/LoginModule/Test.jsp</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    TPSL Transaction ID
                </td>
                <td>
                    <asp:TextBox ID="TXT_TPSLTXNID" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Shopping Cart details
                </td>
                <td>
                    <asp:TextBox ID="TXT_Shoppingcartdetails" runat="server">kims_1.0_0.0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Txn Date
                </td>
                <td>
                    <asp:TextBox ID="TXT_TxnDate" runat="server">16-07-2014</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Email
                </td>
                <td>
                    <asp:TextBox ID="TXT_Email" runat="server">sunil.sahu@techprocess.co.in</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Mobile No
                </td>
                <td>
                    <asp:TextBox ID="TXT_mobileNo" runat="server">8451053257</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Bank code
                </td>
                <td>
                    <asp:TextBox ID="TXT_Bankcode" runat="server">10310</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Customer Name
                </td>
                <td>
                    <asp:TextBox ID="TXT_customerName" runat="server">sunil</asp:TextBox>
                </td>
            </tr>
            <tr id="trProprty" runat="server" visible="false">
                <td>
                    Property Path
                </td>
                <td>
                    <asp:TextBox ID="TXT_propertyPath" runat="server">D:\Hosting\11503294\html\PropertyFile\Merchant.property</asp:TextBox>
                </td>
            </tr>
            <tr runat="server">
                <td>
                    Card Holder Name
                </td>
                <td>
                    <asp:TextBox ID="TXT_CardHolderName" runat="server">Test Name</asp:TextBox>
                </td>
            </tr>
            <tr runat="server">
                <td>
                    Card Number
                </td>
                <td>
                    <asp:TextBox ID="TXT_CardNumber" runat="server">1234567890123456</asp:TextBox>
                </td>
            </tr>
            <tr runat="server">
                <td>
                    Expiry Month
                </td>
                <td>
                    <asp:TextBox ID="TXT_ExpiryMonth" runat="server">12</asp:TextBox>
                </td>
            </tr>
            <tr runat="server">
                <td>
                    Expiry Year
                </td>
                <td>
                    <asp:TextBox ID="TXT_ExpiryYear" runat="server">2017</asp:TextBox>
                </td>
            </tr>
            <tr runat="server">
                <td>
                    CVV
                </td>
                <td>
                    <asp:TextBox ID="TXT_CVV" runat="server">007</asp:TextBox>
                </td>
            </tr>
            <tr id="trCardId" runat="server" visible="true">
                <td>
                    Card ID
                </td>
                <td>
                    <asp:TextBox ID="TXT_CardID" runat="server">12345</asp:TextBox>
                </td>
            </tr>
            <tr id="trMMID" runat="server" visible="true">
                <td>
                    MMID
                </td>
                <td>
                    <asp:TextBox ID="TXT_MMID" runat="server">1234567</asp:TextBox>
                </td>
            </tr>
            <tr id="trRegisteredMobileNumber" runat="server" visible="true">
                <td>
                    Registered Mobile Number
                </td>
                <td>
                    <asp:TextBox ID="TXT_RegisteredMobileNumber" runat="server">1234567890</asp:TextBox>
                </td>
            </tr>
            <tr id="trOTP" runat="server" visible="true">
                <td>
                    OTP
                </td>
                <td>
                    <asp:TextBox ID="TXT_OTP" runat="server">123456</asp:TextBox>
                </td>
            </tr>
            <tr id="trKey" runat="server" visible="false">
                <td>
                    IsKey
                </td>
                <td>
                    <asp:TextBox ID="TXT_IsKey" runat="server">1281981786GAITVG</asp:TextBox>
                </td>
            </tr>
            <tr id="trIv" runat="server" visible="false">
                <td>
                    IsIv
                </td>
                <td>
                    <asp:TextBox ID="TXT_IsIv" runat="server">4453128073HKGDWM</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="BTN_Submit" runat="server" Text="Submit" OnClick="BTN_Submit_Click" />
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>