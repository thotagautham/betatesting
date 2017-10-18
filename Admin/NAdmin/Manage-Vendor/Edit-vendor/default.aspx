<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/AdminBasePage.master" CodeBehind="default.aspx.vb" Inherits="betatesting._default9" %>
<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
<Triggers>
                        <asp:PostBackTrigger ControlID="UpdateDoctors" />
                    </Triggers>
                <ContentTemplate>
<DIV align=center><asp:Label id="LblMsg" runat="server"></asp:Label>&nbsp;</DIV><BR /><BR />
<TABLE style="BORDER-COLLAPSE: collapse" cellSpacing=0 cellPadding=0 align=center border=1><TBODY><TR><TD>
<TABLE cellSpacing=5 cellPadding=0 align=center>
<TBODY>
   
        	<TR>
                <TD class="HeaderStyle" align=center colSpan=4>EDIT EXPERT DETAILS</TD>
            </TR>
            <TR><td>
                                        <asp:Image ID="ImgPhoto" runat="server" Visible="False" /></td></TR>
            <TR class="RowStyle">
             	<TD class="tdStyle">PHOTO</TD>
                <TD>  <asp:FileUpload ID="FUPhoto" runat="server" /></TD>
             </TR>
             
         	<tr>
            	<TD class="tdStyle">Email Id</TD>
                <TD><asp:TextBox id="EmailId" runat="server" MaxLength="30"></asp:TextBox> 
                            <asp:RegularExpressionValidator id="RegularExpressionValidator1" runat="server" Display="None" ControlToValidate="EmailId" ErrorMessage="Invalid Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator> 
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="EmailId" Display="None" ErrorMessage="Enter Email Id"></asp:RequiredFieldValidator>
                 </TD>
            </tr>
            
            <tr>
            	<TD class="tdStyle">FIRST NAME</TD>
                <TD><asp:TextBox id="txtfirstname" runat="server" MaxLength="100" Width="50"></asp:TextBox></TD>
            </tr>
            
            <tr>
            	<TD class="tdStyle">LAST NAME</TD>
                <TD><asp:TextBox id="txtlastname" runat="server" MaxLength="100" Width="50"></asp:TextBox></TD>
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
            
            <TR>
            	<TD vAlign=top class="tdStyle">CITY</TD>
                <TD><asp:TextBox id="txtcity" runat="server" MaxLength="800" Rows="3" TextMode="MultiLine"></asp:TextBox></TD></TD>
            </TR>
            
            <tr>
            	<TD vAlign=top class="tdStyle">STATE</TD>
                <TD><asp:TextBox id="TXTSTATE" runat="server" MaxLength="800" Rows="3" TextMode="MultiLine"></asp:TextBox></TD></TD>
            </tr>
            
            <TR class="AlternateRowStyle">
            	<TD vAlign=top class="tdStyle">COUNTRY</TD>
                <TD><asp:DropDownList id="ddlCountry" runat="server" AutoPostBack="True" ></asp:DropDownList></TD>
                
			</TR>
            
            <TR class="RowStyle">
            	
				<TD vAlign=top class="tdStyle">ZIP</TD><TD><asp:TextBox id="Zip" runat="server" MaxLength="10"></asp:TextBox> <asp:RegularExpressionValidator id="RegularExpressionValidator2" runat="server" Display="None" ControlToValidate="Zip" ErrorMessage="Only Numerics Are Allowed for Zip Code in Permanent Address" ValidationExpression="[0-9]*"></asp:RegularExpressionValidator></TD>
            </TR>
                
                       
             <TR>
             	<TD class="boldgray" colSpan=4>CONTACT DETAILS</TD>
             </TR>
             
             <TR class="RowStyle">
                <TD class="tdStyle">MOBILE PHONE</TD>
                <TD><asp:TextBox id="MobPh" runat="server" MaxLength="15"></asp:TextBox> <asp:RegularExpressionValidator id="RegularExpressionValidator3" runat="server" Display="None" ControlToValidate="MobPh" ErrorMessage="Only Numbers Are Allowed For Mobile Phone Number" ValidationExpression="[0-9]*"></asp:RegularExpressionValidator></TD>
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
        <TR><td vAlign=top> Brief Profile</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="Txtbriefprofile" runat="server" Height="500px" Width="800px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Present Position</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="Txtpresentposition" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Qualifications</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="TxtQualifications" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>


    <TR><td vAlign=top> Special Training</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtsepcialtraining" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>


    <TR><td vAlign=top> Experience</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtexperience" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Expertise</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtexpertise" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Achievements/Breakthrough Cases</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtachievements" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Publications</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtpublications" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Awards And Honors</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtawardsandhonours" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

   
    
     <TR><td vAlign=top> Academic Exposure</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtacademicexposure" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

     <TR><td vAlign=top> Talk Delivered</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txttalkdelivered" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Other</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtothers" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>

    <TR><td vAlign=top> Media</td><td vAlign=top>&nbsp;</td>
            <td>
             <FCKeditorV2:FCKeditor ID="txtmedia" runat="server" Height="250px" Width="1000px">
                        </FCKeditorV2:FCKeditor>
    </td></TR>
   
                     <tr>
                        <td align="center" colspan="6">
                            <asp:Button ID="UpdateDoctors" runat="server" onclick="UpdateDoctors_Click" 
                                Text="Save" />
                            &nbsp;&nbsp;
                            <input id="Reset1" tabindex="0" type="reset" value="Clear" />
                            <br />
                            <asp:RequiredFieldValidator ID="RFVDoctorName" runat="server" 
                                ControlToValidate="txtfirstname" Display="None" 
                                ErrorMessage="FIRST Name Should Not Be Empty"></asp:RequiredFieldValidator>
                            <br />
                            <br />
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                ShowMessageBox="True" ShowSummary="False" />
                            <br />
                            <asp:Label ID="LblDocPhoto" runat="server" __designer:wfdid="w2" 
                                Visible="False"></asp:Label>
                            <asp:Label ID="LblProfile" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    </TBODY></TABLE></TD></TR></TBODY></TABLE>
</ContentTemplate>
                   </asp:UpdatePanel>
</asp:Content>

