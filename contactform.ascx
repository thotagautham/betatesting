<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="contactform.ascx.vb" Inherits="betatesting.contactform" %>


<asp:Label style="color:#F00;" ID="LblMsg" runat="server"></asp:Label>

<asp:TextBox ID="TxtName" runat="server" MaxLength="50"   placeholder=" Name" required="true" width="100%" Height="40"></asp:TextBox>
<br />
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TxtName" ErrorMessage="Enter Name" 
                        Display="None" ValidationGroup="VGEnquiry" InitialValue="Type Name*"> </asp:RequiredFieldValidator>
                        
        <br />                
                        
<asp:TextBox ID="TxtEmailID" runat="server" MaxLength="75"   required="true"  placeholder=" Email" width="100%" Height="40"></asp:TextBox>
<br />

<asp:RequiredFieldValidator ID="RFVEmailId" runat="server" 
                    ControlToValidate="TxtEmailID" Display="None" ErrorMessage="Enter Email Id" ValidationGroup="VGEnquiry" InitialValue="Type Email*"></asp:RequiredFieldValidator>
      <br />              
                    
<asp:RegularExpressionValidator ID="REVEmailId" runat="server" 
                    ControlToValidate="TxtEmailID" Display="None" 
                    ErrorMessage="Invalid Email ID" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="VGEnquiry"> </asp:RegularExpressionValidator>
                    
                    
<asp:TextBox ID="txtsubject" runat="server" MaxLength="50" required="true"  placeholder="Subject" width="100%" Height="40"></asp:TextBox>

<br />
<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TxtName" ErrorMessage="Enter Name" 
                        Display="None" ValidationGroup="VGEnquiry" InitialValue="Type Name*"> </asp:RequiredFieldValidator>
       <br />
                 
<asp:TextBox ID="TxtComments" runat="server" Rows="3" TextMode="MultiLine"  required="true" Columns="25" width="100%"  placeholder="Your  Message here"></asp:TextBox>
<br />
<asp:RequiredFieldValidator ID="RFVComments" runat="server" ControlToValidate="TxtComments" Display="None" ValidationGroup="VGEnquiry" ErrorMessage="Enter Comments" InitialValue="Type Message"></asp:RequiredFieldValidator>
<br />
<span style="text-align:center"><asp:Button ID="btnSave" runat="server" Text="Submit" ValidationGroup="VGEnquiry" style=" font-size: 14px; color: #FFF; padding: 12px 30px; background: #B42275 none repeat scroll 0% 0%; line-height: 20px; text-transform: uppercase; border: medium none; outline: medium none; transition: all 0.3s ease-in-out 0s; border-radius: 2px; box-shadow: 0px -4px 0px #73164B inset;" /></span>

<asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEnquiry" />