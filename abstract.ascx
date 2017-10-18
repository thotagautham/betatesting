<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="abstract.ascx.vb" Inherits="betatesting.abstract" %>



<div>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
				<Triggers>
               		 <asp:PostBackTrigger ControlID="btnSave" />
                 </Triggers>
                 
                 <ContentTemplate>
            
            	
<div class="form-group">
                    
              <asp:Label style="color:#F00;" ID="LblMsg" runat="server"></asp:Label>
    </div>
                	  <div class="form-group">
                      <label> First Name </label>
                    



<asp:TextBox ID="TxtName" runat="server" MaxLength="50" cssclass="form-control" placeholder="NAME"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVName" runat="server" 
                        ControlToValidate="TxtName" ErrorMessage="Enter Name" 
                        Display="None" ValidationGroup="VGEnquiry" InitialValue="Type Name*"> </asp:RequiredFieldValidator>
                  </div>
                     
                     <div class="form-group">
                      <label> Country </label>
                    



<asp:TextBox ID="txtcountry" runat="server" MaxLength="50" cssclass="form-control" placeholder="Country"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtcountry" ErrorMessage="Enter Country" 
                        Display="None" ValidationGroup="VGEnquiry" InitialValue="Type Country*"> </asp:RequiredFieldValidator>
                  </div>
                     
                     
                     <div class="form-group">
                      <label> State </label>
                    



<asp:TextBox ID="txtstate" runat="server" MaxLength="50" cssclass="form-control" placeholder="State"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtstate" ErrorMessage="Enter State" 
                        Display="None" ValidationGroup="VGEnquiry" InitialValue="Type State*"> </asp:RequiredFieldValidator>
                  </div>
                     
                     
                     	
                
                  <div class="form-group">
                  <label> Author's email </label>
                    


                      <asp:TextBox ID="TxtEmailID" runat="server" MaxLength="75"  CssClass="form-control"  placeholder="EMAIL ID"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVEmailId" runat="server" 
                    ControlToValidate="TxtEmailID" Display="None" ErrorMessage="Enter Email Id" ValidationGroup="VGEnquiry" InitialValue="Type Email*"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="REVEmailId" runat="server" 
                    ControlToValidate="TxtEmailID" Display="None" 
                    ErrorMessage="Invalid Email ID" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="VGEnquiry"> </asp:RegularExpressionValidator>
      
                  </div>
                  
                    <div class="form-group">
                    <label> Phone </label>
                    

                        <asp:TextBox ID="TxtTelephone" runat="server" cssclass="form-control"  placeholder="YOUR CONTACT NUMBER" ></asp:TextBox>
          <asp:RequiredFieldValidator ID="RFVTelephone" runat="server" Display="None"  ErrorMessage="Enter Telephone Number" ControlToValidate="TxtTelephone" ValidationGroup="VGEnquiry" InitialValue="Type Telephone*"></asp:RequiredFieldValidator>
                  </div>	
                  
               
                    <div class="form-group">
                    <label> Full Postal Address </label>
                   

                        <asp:TextBox ID="txtlinkedin" runat="server" Rows="4" TextMode="MultiLine" Columns="25"  placeholder="Full Postal Address" CssClass="form-control" ></asp:TextBox>
        
                  </div>	
                
                  <div class="form-group">
                    <label for="exampleInputFile"><strong>Upload Abstract</strong></label>
                   

                      <asp:FileUpload id="FUNewsImage" runat="server" _></asp:FileUpload>
                  
                  </div>
                  <asp:Button ID="btnSave" runat="server" Text="Submit" ValidationGroup="VGEnquiry" />
                 <asp:Button ID="btncancell" runat="server" Text="cancel"/>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEnquiry" />
           <%-- <asp:ImageButton ID="btncancel" runat="server" ImageUrl="~/care/_images/cancel-button.jpg" />--%>
           
            </div>
                     </ContentTemplate>
                   </asp:UpdatePanel>


    </div>
