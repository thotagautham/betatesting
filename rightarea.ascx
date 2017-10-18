<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="Innovrightarea.ascx.vb" Inherits="betatesting.rightarea" %>
	

 
    <div>

        <div class="form-group">
                               <asp:Label style="color:#F00;" ID="LblMsg" runat="server"></asp:Label>
                        </div>
     					<div class="form-group">
                            <label>Name *</label>
                             <asp:TextBox ID="TxtName" runat="server" MaxLength="50" CssClass="form-control"  placeholder="Enter Name"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TxtName" ErrorMessage="Enter Name" 
                        Display="None" ValidationGroup="VGEnquiry" InitialValue="Type Name*"> </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>Email *</label>
                           <asp:TextBox ID="TxtEmailID" runat="server" MaxLength="75"  CssClass="form-control"  placeholder="Enter Email"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVEmailId" runat="server" 
                    ControlToValidate="TxtEmailID" Display="None" ErrorMessage="Enter Email Id" ValidationGroup="VGEnquiry" InitialValue="Type Email*"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="REVEmailId" runat="server" 
                    ControlToValidate="TxtEmailID" Display="None" 
                    ErrorMessage="Invalid Email ID" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="VGEnquiry"> </asp:RegularExpressionValidator>
                        </div>
                        <div class="form-group">
                            <label>Phone</label>
                            <asp:TextBox ID="TxtTelephone" runat="server" MaxLength="50" CssClass="form-control"  placeholder="Enter Number"></asp:TextBox>
          <asp:RequiredFieldValidator ID="RFVTelephone" runat="server" Display="None"  ErrorMessage="Enter Telephone Number" ControlToValidate="TxtTelephone" ValidationGroup="VGEnquiry" InitialValue="Type Telephone*"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>Message *</label>
                            <asp:TextBox ID="TxtComments" runat="server" Rows="2" TextMode="MultiLine" Columns="25" CssClass="form-control"  placeholder="Enter Message"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVComments" runat="server" ControlToValidate="TxtComments" Display="None" ValidationGroup="VGEnquiry" ErrorMessage="Enter Comments" InitialValue="Type Message"></asp:RequiredFieldValidator>
                        </div>                        
                        <div class="form-group">
                            <asp:ImageButton ID="ImgBtnSendEnquiry" runat="server" ImageUrl="Innovimages/submit_img.png"  class="btn btn-danger enquirysubmit" ValidationGroup="VGEnquiry" />
                            
<asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEnquiry" />
                        </div>
    </div>
    




<script language="javascript" type="text/javascript">
    function Trim(text) {

        while (text.value.charAt(0) == ' ')
            text.value = text.value.substring(1, text.value.length);
        while (text.value.charAt(text.value.length - 1) == ' ')
            text.value = text.value.substring(0, text.value.length - 1);
    }

    function maxLength(field, maxChars) {
        if (field.value.length >= maxChars) {
            event.returnValue = false;
            return false;
        }
    }

    function maxLengthPaste(field, maxChars) {
        event.returnValue = false;
        if ((field.value.length + window.clipboardData.getData("Text").length) > maxChars) {
            return false;
        }
        event.returnValue = true;
    }

    function ClearMsg() {
        document.getElementById('ctl00_H1_LblVillageQuickMsg').innerHTML = '';
    }
</script>