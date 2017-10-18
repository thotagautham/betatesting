<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="expertsteam.ascx.vb" Inherits="betatesting.expertsteam" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

<div  style="float:left; position:relative; margin-left:10px; ">
    <div class="styled-select2">
        <asp:DropDownList ID="DDLSpecialisation" runat="server" AutoPostBack="true" onchange="showImage();" style="width:100%; background-color: #8a73ad; color: #fff; height: 38px; font-family:myriad pro;" >
            <asp:ListItem Value="0">All Specialities</asp:ListItem>
        </asp:DropDownList>
    </div>
</div>

<div id="divdoctors" style="padding-top:30px;"> 
    <asp:Repeater ID="RptTeam" runat="server">
        <HeaderTemplate>
        	<table width="100%" border="0" cellspacing="0" cellpadding="0"></HeaderTemplate>
        		<ItemTemplate>
 					<tr class="doctor_porfilestwo_border">
        				<td valign="top" width="130" >
        					<img src="/expertphotos/<%# Eval("PHOTO")%>" width="115" height="127" class="doctor_img">
                        </td>
                        
        				<td>
        					<table>
                            	<tr valign="top">
        							<td  width="255" align="left">
                                    	<div style="font-size:15px; color:#03ABD4;"><%# Eval("Firstname")%> <%# Eval("Lastname")%>  </div>
                       						<strong><%# Eval("QUALIFICATION")%></strong><br>
                        					<span><%# Eval("Designation")%></span><br>
                                    </td>
                        			
                                    <td valign="top">
                                    	<div class="drpmiddle"> 
                           
                                            <div class="appdrpofile">
                                                <a target="_blank" href="/patientcare<%# Eval("VENDORID", "/expert.aspx?DOCTORID={0}")%>" style="color:#000;">View Profile</a>
                                            </div>
                           
                        				</div>
                                    </td>
        						</tr>
                                
                				<tr>
                    				<td colspan="2" align="left" ><span></span>
            							<p><asp:Label ID="LblSpeciality" runat="server" Text='<%# Eval("VendorSPECIALISATION")%>' CssClass="specialtext"></asp:Label></p>
                                   	</td>
                      			</tr>
               
                				<tr>
                    				<td colspan="2" valign="top" height="40"><asp:Label ID="LblBranch" runat="server" Text='<%# Eval("vendortype")%>' CssClass=""></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
        <!--div class="doctor_porfilestwo"></div-->
        
              </tr>
        	  </ItemTemplate>
        	  <FooterTemplate>
           </table></FooterTemplate>
	</asp:Repeater>

</div>
<asp:Label ID="LblHospitalId" runat="server" Text="0" Visible="false"></asp:Label>
        </ContentTemplate>
     </asp:UpdatePanel>
 <script language="javascript">
     function showImage() {
         document.getElementById('divdoctors').innerHTML = "<img src='/images/ajax-loader.gif' />"
     }
  </script>