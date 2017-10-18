<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="career.ascx.vb" Inherits="betatesting.career" %>

   <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
				<Triggers>
               		 <asp:PostBackTrigger ControlID="btnSave" />
                 </Triggers>
                 
                 <ContentTemplate>
            
  
                    
              <asp:Label style="color:#F00;" ID="LblMsg" runat="server"></asp:Label>
    
                	  	

                   
                  
                   
                   

                      
        
                 
                    
                  
                
                
                      
                   

                
    
                <div class="row">
                  <div class="col-xs-12 col-sm-12 col-md-6 col-xs-12">
                    <div class="form-group">
                    

                        
<asp:TextBox ID="TxtName" runat="server" MaxLength="50" class="form-control input-sm" placeholder="First Name"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVName" runat="server" 
                        ControlToValidate="TxtName" ErrorMessage="Enter Name" 
                        Display="None" ValidationGroup="VGEnquiry" InitialValue="Type Name*"> </asp:RequiredFieldValidator>
                 
                
                  

                    </div>
                  </div>
                  <div class="col-xs-12 col-sm-12 col-md-6 col-xs-12">
                    <div class="form-group">
                  

                        
<asp:TextBox ID="txtlastname" runat="server" MaxLength="50" class="form-control input-sm" placeholder="Last Name"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TxtName" ErrorMessage="Enter Name" 
                        Display="None" ValidationGroup="VGEnquiry" InitialValue="Type Name*"> </asp:RequiredFieldValidator>
                 
                
                  

                    </div>
                  </div>
                </div>


                <div class="row">
                  <div class="col-xs-12 col-sm-12 col-md-6 col-xs-12">
                    <div class="form-group">
                  


                           <asp:TextBox ID="TxtEmailID" runat="server" MaxLength="75"  class="form-control input-sm" placeholder="Email Address"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVEmailId" runat="server" 
                    ControlToValidate="TxtEmailID" Display="None" ErrorMessage="Enter Email Id" ValidationGroup="VGEnquiry" InitialValue="Type Email*"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="REVEmailId" runat="server" 
                    ControlToValidate="TxtEmailID" Display="None" 
                    ErrorMessage="Invalid Email ID" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="VGEnquiry"> </asp:RegularExpressionValidator>
      
                 
                    </div>
                  </div>
                  <div class="col-xs-12 col-sm-12 col-md-6 col-xs-12">
                    <div class="form-group">
                    


                        
                        <asp:TextBox ID="TxtTelephone" runat="server" class="form-control input-sm" placeholder="Mobile " ></asp:TextBox>
          <asp:RequiredFieldValidator ID="RFVTelephone" runat="server" Display="None"  ErrorMessage="Enter Telephone Number" ControlToValidate="TxtTelephone" ValidationGroup="VGEnquiry" InitialValue="Type Telephone*"></asp:RequiredFieldValidator>
                 	
                  
                  
                 
                  
                    </div>
                  </div>
                </div>
                  <div class="row">
                  <div class="col-xs-12 col-sm-12 col-md-6 col-xs-12">
                    <div class="form-group">
                    

 <asp:DropDownList ID="ddlpost" runat="server" AppendDataBoundItems="true" class="form-control input-sm" >
                        <asp:ListItem Value="0">Select</asp:ListItem>
                          <asp:ListItem Value="1">Surgeon</asp:ListItem>
                          <asp:ListItem Value="2">Critical Care</asp:ListItem>
                          <asp:ListItem Value="3">Gastroenterologist/ Hepatologist</asp:ListItem>
                          <asp:ListItem Value="4">Staff Nurse</asp:ListItem>
                          <asp:ListItem Value="5">Resident Doctors</asp:ListItem>
                          <asp:ListItem Value="6">Business Development (Marketing)</asp:ListItem>
                         
                      </asp:DropDownList>
                        
 <%--                       
<asp:TextBox ID="txtpost" runat="server" MaxLength="50" class="form-control input-sm" placeholder="Post Applying For"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="TxtName" ErrorMessage="Enter Name" 
                        Display="None" ValidationGroup="VGEnquiry" InitialValue="Type Name*"> </asp:RequiredFieldValidator>--%>
                 
                    </div>
                  </div>
                  <div class="col-xs-12 col-sm-12 col-md-6 col-xs-12">
                    <div class="form-group">
                  


                        
                        
<asp:TextBox ID="txtqualification" runat="server" MaxLength="50" class="form-control input-sm" placeholder="Qualification"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="TxtName" ErrorMessage="Enter Name" 
                        Display="None" ValidationGroup="VGEnquiry" InitialValue="Type Name*"> </asp:RequiredFieldValidator>
                 
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-xs-12 col-sm-12 col-md-3 col-xs-12">
                  <h4 style="color:#fff;font-family: 'futura_hv_btheavy'; text-transform: uppercase;"> Upload Resume Here </h4> 
                  </div>
                    
                  <div class="col-xs-12 col-sm-12 col-md-3 col-xs-12" style="padding:15px;">
                       
                      <asp:FileUpload ID="FUNewsImage" runat="server" />
                  </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-xs-12">
                    <div class="form-group">
                          <asp:TextBox ID="txtlinkedin" runat="server" Rows="2" TextMode="MultiLine" Columns="25"  class="form-control input-sm" placeholder="Linkedin Profile URL" ></asp:TextBox>
                  
                    </div>
                  </div>
                </div>
        
                
               <div>

                      
                    <asp:Button ID="btnSave" runat="server" Text="Submit" class="btn btn-info btn-sm register" ValidationGroup="VGEnquiry" />
                 <asp:Button ID="btncancell" runat="server"  class="btn btn-info btn-sm cancel2" Text="Cancel"/>  
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEnquiry" />


               </div>
              
          
           




           
                     </ContentTemplate>
                   </asp:UpdatePanel>
           
           