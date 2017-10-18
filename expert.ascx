<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="expert.ascx.vb" Inherits="betatesting.expert" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

    <div class="styled-select2" style="float:right; position:relative; width:210px; top:-30px;" >
        <asp:DropDownList ID="DDLBRanch" runat="server"   AutoPostBack="true"  onchange="showImage();" >
            <asp:ListItem Value="0">&nbsp;&nbsp;All Specialities</asp:ListItem>
        </asp:DropDownList>
    </div>

<div id="divdoctors" style="padding-top:30px;"> 
<asp:Repeater ID="RptTeam" runat="server">
<HeaderTemplate><table width="600" border="0" cellspacing="0" cellpadding="0"></HeaderTemplate>
        <ItemTemplate>
      <tr class="doctor_porfilestwo_border">
        <td valign="top" width="130" >
        <img src="/expertphotos/<%# Eval("PHOTO")%>" width="115" height="127" class="doctor_img"></td>
        <td>
        <table ><tr valign="top">
        			<td  width="255" align="left"><div style="font-size:15px; color:#03ABD4;"><%# Eval("Firstname")%> </div>
                        <strong><%# Eval("QUALIFICATION")%></strong><br>
                        <span><%# Eval("Designation")%></span><br></td>
                        <td valign="top"><div class="drpmiddle"> 
                            <div class="appdrpofile">
                                <a target="_blank" href="/patientcare<%# Eval("VENDORID", "/Expertprofile.aspx?vendorid={0}")%>">View Profile</a>
                            </div>
                        </div></td>
        		</tr>
                <tr>
                    <td colspan="2" align="left" ><span><asp:Label ID="LblBranch" runat="server" Text='<%# Eval("VendorSPECIALISATION")%>' CssClass="specialtext2"></asp:Label></span>
            </td>
                    
                </tr>
               
                <tr>
                    <td colspan="2" valign="top" height="40"><asp:Label ID="LblSpeciality" runat="server" Text='<%# Eval("vendortype")%>' CssClass="htagtext"></asp:Label></td>
                    
                </tr>
        </table>
        <!--div class="doctor_porfilestwo"></div-->
        
              </tr>
        </ItemTemplate>
        <FooterTemplate></table></FooterTemplate>
</asp:Repeater>
        </div>
<asp:Label ID="LblDeptId" runat="server" Text="0" Visible="false"></asp:Label>
        </ContentTemplate>
     </asp:UpdatePanel>
 <script language="javascript">
     function showImage() {
         document.getElementById('divdoctors').innerHTML = "<img src='/images/ajax-loader.gif' />"
     }
  </script>