<%@ Page Title="GERIATRICS :: SIGN IN ACCOUNT" Language="vb" AutoEventWireup="false" MasterPageFile="~/innerbasepage.master" CodeBehind="sign-in.aspx.vb" Inherits="betatesting.sign_in" %>
<asp:Content ID="Content1" ContentPlaceHolderID="metatagscontent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodycontent" runat="server">
    <div align=center><asp:Label ID="LblMsg" runat="server" Font-Bold="True" 
        Font-Size="Medium"></asp:Label></div><br /><br />
    <div style="width:428px; margin:0 auto; background-color: #8a73ad; padding: 0 50px 50px 50px;">
    	<h3 style="font-family: Myriad Pro; color:#fff;">Sign-In Form</h3>
      	<table>
    		<tr class="AlternateRowStyle">
        		<td class="tdStyle">Email Id</td>
        		<td class="tdStyle" style="padding:10px;">
                	<asp:TextBox ID="TxtEmailId" runat="server" placeholder="Enter existing email-id" CssClass="form-control"></asp:TextBox>
            		<asp:RegularExpressionValidator ID="REVEmailID" runat="server" 
                	ControlToValidate="TxtEmailId" Display="None" ErrorMessage="Invalid Email ID" 
                	ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            	</td>
            </tr>
        
        	<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="TxtEmailId" Display="None" ErrorMessage="Email Id Required!"></asp:RequiredFieldValidator>
    
   			<tr class="RowStyle">
            	<td class="tdStyle">Password</td>
                <td class="tdStyle" style="padding:10px;">
                    <asp:TextBox ID="txtpassword" type="password" runat="server" placeholder="Enter password" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtpassword" Display="None" ErrorMessage="Password Required!"></asp:RequiredFieldValidator>
        
        		</td>
            </tr>

         
    		<tr class="RowStyle">
            	<td colspan="2" align="center">
                	<asp:Button ID="BtnSave" runat="server" Text="SIGN IN" style="background-color: #5a5a90; color:#fff;width: 95px; height: 30px; font-family:Myriad Pro; margin-right:5px;" />
        			
        			<asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            		ShowMessageBox="True" ShowSummary="False" />
                </td>
               
            </tr>
           
    		<tr>
            	<td colspan="2" class="tdStyle"></td>
            </tr>
		</table>
        

    </div>
    <br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

    
</asp:Content>
