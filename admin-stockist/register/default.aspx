<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/admin-stockist/innebasepage.master" CodeBehind="Default.aspx.vb" Inherits="betatesting._Default37" %>
<asp:Content ID="Content1" ContentPlaceHolderID="NavigationPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    
    <div>First Name</div>

    <div>

         <asp:TextBox ID="txtfirstname" runat="server"  placeholder="Stockist  First Name"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RFVName" runat="server" 
                        ControlToValidate="txtfirstname" ErrorMessage="Enter First  Name" 
                        Display="None" ValidationGroup="VGEnquiry" > </asp:RequiredFieldValidator>

    </div>
    <div>Last Name</div>
      <div>
           <asp:TextBox ID="txtlastname" runat="server"  placeholder="Stockist Last Name"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="Rfvlastname" runat="server" 
                        ControlToValidate="txtlastname" ErrorMessage="Enter Last Name" 
                        Display="None" ValidationGroup="VGEnquiry" > </asp:RequiredFieldValidator>


      </div>
    <div>Email id</div>
      <div>
          <a href="../sign-in/">../sign-in/</a>
           <asp:TextBox ID="txtEmailId" name="txtEmailId" runat="server"  placeholder="Official Email id"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RFVEmailId" runat="server" 
                    ControlToValidate="txtEmailId" Display="None" ErrorMessage="Enter  Email Id" ValidationGroup="VGEnquiry" ></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="REVEmailId" runat="server" 
                    ControlToValidate="txtEmailId" Display="None" 
                    ErrorMessage="Invalid Email ID" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="VGEnquiry"> </asp:RegularExpressionValidator>


      </div>
    <div>Mobile Number</div>
      <div>

             <asp:TextBox ID="txtmobilenumber" runat="server" Width="100%" placeholder="Mobile Number"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RFVTelephone" runat="server" Display="None"  ErrorMessage="Enter Telephone Number" ControlToValidate="txtmobilenumber" ValidationGroup="VGEnquiry" InitialValue="Type Telephone*"></asp:RequiredFieldValidator>


      </div>


    <div>

        <asp:Button ID="btnSubmit" runat="server" Text="Submit" ValidationGroup="VGEnquiry" /> &nbsp;&nbsp;
                    <asp:Button ID="BtnCancel" runat="server" Text="Cancel" /> &nbsp;&nbsp;
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEnquiry" />
           <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEnquiry" />
    </div>
    

    <div>
        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
    </div>

</asp:Content>
