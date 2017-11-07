<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default2.aspx.vb" Inherits="betatesting._default9" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
          <div align="center">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#6D7192" Text="We have emailed your password to the email id you provided.
" Visible="False"></asp:Label>
    </div> 
    <div align="center">
    <asp:Panel ID="Panel1" runat="server" Width="395px">
        <div>Forgot Password ? Help</div>
   <div>  Don’t worry!<strong> Just enter the email id /mobile / sapid  with which you registered with us, then click Submit.</strong><br /><br />
Your password will be sent to the email id entered below. So please enter the correct email id
</div>
    <div>E-Mail/Mobile/sapid</div>

        <div> <asp:TextBox ID="TxtEmail" runat="server" CssClass="textbox" Placeholder="Enter Your Email Id" Width="190"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVEmail" runat="server" ControlToValidate="TxtEmail" Display="None" ErrorMessage="Should Enter Email Address" ValidationGroup="VG"></asp:RequiredFieldValidator>
                           
                           
                      <div>[eg: name@yahoo.com, etc...]</div>
            <asp:Button ID="btnsave" runat="server" Text="Button" />

            <div>   <asp:ImageButton ID="ImgSubmit" runat="server" ImageUrl="~/images/submit.jpg" ValidationGroup="VG" /> </div>
                          
                             <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ShowMessageBox="True" ShowSummary="False" />

          
                <div>

                    <p>Has your e-mail address changed? If you've forgotten your password and no longer use the e-mail address associated with your futurebazaar.com account, 
you may click on create a new futurebazaar.com account link below.   </p>
                </div>
 

                  <div>

                       <p> <asp:HyperLink ID="HyperLink1" runat="server" CssClass="lnkfont" 
                        NavigateUrl="~/admin-stockist/register/">Create a new Stockist Account</asp:HyperLink></p>
               
                  </div>
                  
        </asp:Panel>
</div>
    </form>
</body>
</html>
