<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/clinic.master" CodeBehind="default.aspx.vb" Inherits="betatesting._default3" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
                 <div align="center">
    <asp:Panel ID="Panel1" runat="server" Width="395px">
        <table>
    <tr>
        <td colspan="2" align="center" class="topheading">Forgot Password ? Help</td>
    </tr>
    <tr><td height="20"></td></tr>
    <tr>
    <td colspan="2" align="center" class="home1">
    Don’t worry!<strong> Just enter the email id with which you registered on Kimshospitals.com, then click Submit.</strong><br /><br />
Your password will be sent to the email id entered below. So please enter the correct email id
    </td>
    </tr>
    <tr><td colspan="2" height="30"></td></tr>
            <table cellpadding="0" cellspacing="0" width="295">
                <tbody>
                    <tr>
                        <td align="right">E-Mail:</td>
                        <td align="right">
                            <asp:TextBox ID="TxtEmail" runat="server" CssClass="textbox" Placeholder="Enter Your Email Id" Width="190"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFVEmail" runat="server" ControlToValidate="TxtEmail" Display="None" ErrorMessage="Should Enter Email Address" ValidationGroup="VG"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="REVEmail" runat="server" ControlToValidate="TxtEmail" Display="None" ErrorMessage="Should enter Valid Email Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="VG"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" colspan="2"><small style="padding-left:20px;">[eg: name@yahoo.com, etc...] </small></td>
                    </tr>
                    <tr>
                        <td align="center" colspan="2" height="100" valign="middle">
                            <asp:ImageButton ID="ImgSubmit" runat="server" ImageUrl="~/images/submit.jpg" ValidationGroup="VG" />
                            <ajaxToolkit:ValidatorCalloutExtender ID="VRFVEmail" runat="server" TargetControlID="RFVEmail">
                            </ajaxToolkit:ValidatorCalloutExtender>
                            <ajaxToolkit:ValidatorCalloutExtender ID="VREVEmail" runat="server" TargetControlID="REVEmail">
                            </ajaxToolkit:ValidatorCalloutExtender>
                        </td>
                    </tr>
                </tbody>
            </table>
<!--    <tr>
    <td class="home">&nbsp;</td>
        <td class="home1" height="50" align="center">
            
</td>
    </tr>-->
    

            
            <!--    <tr>
    <td class="home">&nbsp;</td>
        <td class="home1" height="50" align="center">
            
</td>
    </tr>-->
    

            <tr>
                <td class="home1" colspan="2" align="center" height="100" valign="bottom"><p>Has your e-mail address changed? If you've forgotten your password and no longer use the e-mail address associated with your futurebazaar.com account, 
you may click on create a new futurebazaar.com account link below.   </p>
 

                    &nbsp;</td>
            </tr>
            <tr>
                <td class="home1" colspan="2">
                   <p> <asp:HyperLink ID="HyperLink1" runat="server" CssClass="lnkfont" 
                        NavigateUrl="~/privilege-card/register/">Create a new KIMS Privilege Account</asp:HyperLink></p>
                </td>
            </tr>
</table>
    </asp:Panel>
</div>
    <div align="center">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#6D7192" Text="We have emailed your password to the email id you provided.
" Visible="False"></asp:Label>
    </div> 
             

</asp:Content>
