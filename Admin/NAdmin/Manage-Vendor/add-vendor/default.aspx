<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="default.aspx.vb" Inherits="betatesting._default6" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>--%>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
				<Triggers>
               		 <asp:PostBackTrigger ControlID="AddDoctors" />
                 </Triggers>
                 
                 
                 
     <ContentTemplate>
	<DIV align=center><BR />
    	<asp:Label id="LblMsg" runat="server" __designer:wfdid="w1">
        </asp:Label><BR /><BR />
    </DIV>
    
    
    <TABLE style="BORDER-COLLAPSE: collapse" cellSpacing=0 cellPadding=0 align=center border=1><TBODY><TR><TD><TABLE cellSpacing=5 cellPadding=0 align=center>
    	<TBODY>
        
        	
        	<TR>
                <TD class="HeaderStyle" align=center colSpan=4>EXPERT REGISTRATION</TD>
            </TR>
            
            <TR class="RowStyle">
             	<TD class="tdStyle">PHOTO</TD>
                <TD><asp:FileUpload id="Photo" runat="server" __designer:wfdid="w2"></asp:FileUpload></TD>
             </TR>
             
         	<tr>
            	<TD class="tdStyle">Email Id</TD>
                <TD><asp:TextBox id="EmailId" runat="server" MaxLength="30"></asp:TextBox> 
                            <asp:RegularExpressionValidator id="REVEmailID" runat="server" Display="None" ControlToValidate="EmailId" ErrorMessage="Invalid Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator> 
                        <asp:RequiredFieldValidator ID="RFVEmailId" runat="server" 
                            ControlToValidate="EmailId" Display="None" ErrorMessage="Enter Email Id"></asp:RequiredFieldValidator>
                 </TD>
            </tr>
            
            <tr>
            	<TD class="tdStyle">FIRST NAME</TD>
                <TD><asp:TextBox id="txtfirstName" runat="server" MaxLength="100" Width="50"></asp:TextBox></TD>
            </tr>
            
            <tr>
            	<TD class="tdStyle">LAST NAME</TD>
                <TD><asp:TextBox id="txtlastName" runat="server" MaxLength="100" Width="50"></asp:TextBox></TD>
            </tr>
            
            <tr class="RowStyle">
            	<td class="tdStyle">Password</td>
                <td class="tdStyle">
					<asp:TextBox ID="txtpassword" type="password" runat="server"></asp:TextBox>
				</td>
            </tr>

			<tr class="RowStyle">
            	<td class="tdStyle">Re Enter Password</td>
                <td class="tdStyle">
					<asp:TextBox ID="txtreenterpassword" type="password" runat="server"></asp:TextBox>
				</td>
            </tr>
            
                    
            <TR class="RowStyle">
            	<TD vAlign=top class="tdStyle">DESIGNATION</TD>
                <TD><asp:TextBox id="DoctorCode" runat="server" MaxLength="100" Width="50"></asp:TextBox></TD>
                
             </TR>
             
             <TR class="AlternateRowStyle">
             	<TD class="tdStyle">Salutation</TD>
                <TD><asp:DropDownList id="Salutation" runat="server">            
                    	<asp:ListItem>Mr</asp:ListItem>
                    	<asp:ListItem>Ms</asp:ListItem>
                    	<asp:ListItem>Mrs</asp:ListItem>
            		</asp:DropDownList></TD>
            	
              </TR>
              
              <TR class="RowStyle">
              	<TD vAlign=top class="tdStyle">AGE</TD>
                <TD><asp:TextBox id="Age" runat="server" MaxLength="2"></asp:TextBox> </TD>
              </TR>
               
             
            <TR class="RowStyle">
            	<!--<TD class="tdStyle">Blood Group</TD>
                <TD><asp:DropDownList id="DDLBG" runat="server">
                		<asp:ListItem Value="0">-- Select Blood Group --</asp:ListItem>
					</asp:DropDownList></TD>-->
                <TD vAlign=top class="tdStyle" >QUALIFICATION</TD>
                <td><asp:TextBox ID="TxtQualification" runat="server"></asp:TextBox></td>
             </TR>
          	
            
           <TR>
            	<TD class="boldgray" colSpan="4">PERMANENT ADDRESS</TD>
            </TR>
            
            <TR class="RowStyle">
            	<TD vAlign=top class="tdStyle">ADDRESS</TD>
                <TD colspan="3"><asp:TextBox id="Address" runat="server" MaxLength="800" Rows="3" TextMode="MultiLine"></asp:TextBox></TD>
            </TR>
            
           <%-- <TR>
            	<TD vAlign=top class="tdStyle">CITY</TD>
                <TD><asp:TextBox id="txtcity" runat="server" MaxLength="800" Rows="3" TextMode="MultiLine"></asp:TextBox></TD></TD>
            </TR>
            
            <tr>
            	<TD vAlign=top class="tdStyle">STatE</TD>
                <TD><asp:TextBox id="Txtstate" runat="server" MaxLength="800" Rows="3" TextMode="MultiLine"></asp:TextBox></TD></TD>
            </tr>--%>
            
            <TR class="AlternateRowStyle">
            	<TD vAlign=top class="tdStyle">COUNTRY</TD>
                <TD><asp:DropDownList id="ddlCountry" runat="server" AutoPostBack="True" ></asp:DropDownList></TD>
                
			</TR>
            
            <TR class="RowStyle">
            	
				<TD vAlign=top class="tdStyle">ZIP</TD><TD><asp:TextBox id="Zip" runat="server" MaxLength="10"></asp:TextBox> <asp:RegularExpressionValidator id="REVZip" runat="server" Display="None" ControlToValidate="Zip" ErrorMessage="Only Numerics Are Allowed for Zip Code in Permanent Address" ValidationExpression="[0-9]*"></asp:RegularExpressionValidator></TD>
            </TR>
                
                       
             <TR>
             	<TD class="boldgray" colSpan=4>CONTACT DETAILS</TD>
             </TR>
             
             <TR class="RowStyle">
                <TD class="tdStyle">MOBILE PHONE</TD>
                <TD><asp:TextBox id="MobPh" runat="server" MaxLength="15"></asp:TextBox> <asp:RegularExpressionValidator id="REVMobph" runat="server" Display="None" ControlToValidate="MobPh" ErrorMessage="Only Numbers Are Allowed For Mobile Phone Number" ValidationExpression="[0-9]*"></asp:RegularExpressionValidator></TD>
              </TR>
              
              <TR class="AlternateRowStyle">
               	<TD vAlign=top class="tdStyle">EXPERT TYPE</TD>
                <TD>
                  <asp:ListBox ID="LBBranch" runat="server" Rows="3" SelectionMode="Multiple"></asp:ListBox>
				 </TD>
			</TR>            
                         
             <TR>
            	<td class="boldgray" vAlign="top" style="height: 8px">SPECIALITIES</td>
                
               	<td vAlign="top" style="height: 89px"><asp:ListBox ID="LBSpecialities" runat="server" SelectionMode="Multiple" Height="500"></asp:ListBox>
                </td>
                
            
           </TR>
           
           <TR>
            	<td vAlign=top> BRIEF PROFILE</td>
            	<td>
                    <FCKeditorV2:FCKeditor ID="Txtbriefprofile" runat="server" Height="600" Width="900">
                    </FCKeditorV2:FCKeditor>
    			</td>
            </TR>

    		<TR>
            	<td vAlign=top> PRESENT POSITION</td>
            	<td>
                 <FCKeditorV2:FCKeditor ID="Txtpresentprofile" runat="server" Height="600" Width="900">
                 </FCKeditorV2:FCKeditor>
    			</td>
            </TR>

 			<TR>
            	<td vAlign=top> QUALIFICATIONS</td>
            	<td>
             		<FCKeditorV2:FCKeditor ID="TxtQualifications" runat="server" Height="600px" Width="900px">
                    </FCKeditorV2:FCKeditor>
    			</td>
            </TR>
            
    		<TR>
            	<td vAlign=top> SPECIAL TRAINING</td>
            	<td>
             		<FCKeditorV2:FCKeditor ID="txtsepcialtraining" runat="server" Height="600" Width="900">
                    </FCKeditorV2:FCKeditor>
    			</td>
            </TR>


    		<TR>
            	<td vAlign=top> EXPERIENCE</td>
            	<td>
             		<FCKeditorV2:FCKeditor ID="txtexperience" runat="server" Height="600" Width="900">
                    </FCKeditorV2:FCKeditor>
    			</td>
             </TR>

    		<TR>
            	<td vAlign=top> EXPERTISE</td>
            	<td>
             		<FCKeditorV2:FCKeditor ID="txtexpertise" runat="server" Height="600" Width="900">
                    </FCKeditorV2:FCKeditor>
    			</td>
            </TR>

    		<TR>
            	<td vAlign=top> ACHIEVEMENTS/BREAKTHROUGH CASES</td>
            	<td>
             		<FCKeditorV2:FCKeditor ID="txtachievements" runat="server" Height="600" Width="900">
                    </FCKeditorV2:FCKeditor>
    			</td>
            </TR>

    		<TR>
                <td vAlign=top> PUBLICATIONS</td>
                <td>
            		<FCKeditorV2:FCKeditor ID="txtpublications" runat="server" Height="600" Width="900">
                    </FCKeditorV2:FCKeditor>
    			</td>
            </TR>

   			<TR>
            <td vAlign=top> AWARDS AND HONORS</td>
                <td>
                 <FCKeditorV2:FCKeditor ID="txtawardsandhonours" runat="server" Height="600" Width="900">
                  </FCKeditorV2:FCKeditor>
    			</td>
            </TR>

   
    	  <TR><td vAlign=top> Academic Exposure</td>
            <td>
            	<FCKeditorV2:FCKeditor ID="txtacademicexposure" runat="server" Height="600" Width="900">
                </FCKeditorV2:FCKeditor>
    		</td>
          </TR>

     	<TR>
        	<td vAlign=top> Talk Delivered</td>
            <td>
             	<FCKeditorV2:FCKeditor ID="txttalkdelivered" runat="server" Height="600" Width="900">
                </FCKeditorV2:FCKeditor>
   			</td>
        </TR>

    	<TR>
        	<td vAlign=top> Other</td>
            <td>
             	<FCKeditorV2:FCKeditor ID="txtothers" runat="server" Height="600" Width="900">
                </FCKeditorV2:FCKeditor>
    		</td>
         </TR>

    	<TR>
        	<td vAlign=top> Media</td>
            <td>
             	<FCKeditorV2:FCKeditor ID="txtmedia" runat="server" Height="600" Width="900">
                </FCKeditorV2:FCKeditor>
    		</td>
        </TR>

        <TR>
        	<TD align=center colSpan=4><asp:Button id="AddDoctors" runat="server" Text="Save"></asp:Button>&nbsp;&nbsp; <BR /><BR /><BR /><%--<asp:RequiredFieldValidator id="RFVDoctorName" runat="server" Display="None" ControlToValidate="DoctorName" ErrorMessage="Doctor Name Should Not Be Empty"></asp:RequiredFieldValidator>--%><BR /><BR /> <asp:ValidationSummary id="ValidationSummary1" runat="server" ShowSummary="False" ShowMessageBox="True"></asp:ValidationSummary></TD>
        </TR>
      </TBODY>
    </TABLE>
  </TD>
 </TR>
</TBODY>
</TABLE>
</ContentTemplate>
                   </asp:UpdatePanel>
</asp:Content>
