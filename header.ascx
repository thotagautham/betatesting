<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="header.ascx.vb" Inherits="betatesting.header" %>

                
            <header>
                <div class="logo">
                    <h2 title="VMoksha">VMOKSHA</h2>      
                </div>
                <div class="header-nav">
                
                       <ul class="nav-links">
                            <li> <a href="/" title="Home">Home</a> </li>
                            <li> <a href="../contact.aspx" title="Contact Us">Contact Us</a> </li>
                            <li><br></li>
                            <% If Session("UserName") <> "" Then%>
                            <li> Welcome <%# Session("UserName") %></li>
                            <li> <a  href="/users/change-password.aspx" class="login-bg" title="Sign In">Change Password</a></li>
                            <li> <a  href="/users/edit-profile.aspx" class="login-bg" title="Register">Edit Profile </a></li>
                            <li> <asp:ImageButton ID="ImgBtnLogOut" runat="server" ImageUrl="~/resources/images/logout.jpg" CausesValidation="False" style="position: relative; top: -10px"/> </li>

                            <% Else%>
                            <li> <a  href="/sign-in.aspx" class="login-bg" title="Sign In">Sign In </a></li>
                            <li> <a  href="/sign-up.aspx"/sign-up.aspx" class="login-bg" title="Register">Register </a></li>
                            <% End If%>
                        </ul>
                </div>
               
                
            </header>
            <div class="header-bottom"></div>
            
           <div> 
                <% If Request.Url.ToString().ToLower().Contains("handymanservices") Then%>
               <div id="handyman-banner"><!--<img src="resources/images/thinkbeyondageing-banner.jpg" width="1900" height="240"  alt=""/>-->
                <div id="handyman-banner-inner">
                	<!--<table border="0">
                    	<tr>
                        	<td>
                            	<img src="resources/images/Health-1.jpg" alt="Health Service Image" />
                            </td>
                            <td>
                            	<h1 style="font-family: Myriad Pro; color:#fff;">HEALTH</h1> 
                            </td>
                         </tr>
                       </table>-->
                </div>
            </div>
                <% ElseIf Request.Url.ToString().ToLower().Contains("social") Then%>
                <div id="social-banner"><!--<img src="resources/images/thinkbeyondageing-banner.jpg" width="1900" height="240"  alt=""/>-->
                <div id="social-banner-inner">
                	<!--<table border="0">
                    	<tr>
                        	<td>
                            	<img src="resources/images/Health-1.jpg" alt="Health Service Image" />
                            </td>
                            <td>
                            	<h1 style="font-family: Myriad Pro; color:#fff;">HEALTH</h1> 
                            </td>
                         </tr>
                       </table>-->
                </div>
            </div>
            
                <% ElseIf Request.Url.ToString().ToLower().Contains("financial") Then%>
                <div id="financial-banner"><!--<img src="resources/images/thinkbeyondageing-banner.jpg" width="1900" height="240"  alt=""/>-->
                <div id="financial-banner-inner">
                	<!--<table border="0">
                    	<tr>
                        	<td>
                            	<img src="resources/images/Health-1.jpg" alt="Health Service Image" />
                            </td>
                            <td>
                            	<h1 style="font-family: Myriad Pro; color:#fff;">HEALTH</h1> 
                            </td>
                         </tr>
                       </table>-->
                </div>
            </div>
                <% ElseIf Request.Url.ToString().ToLower().Contains("volunteer") Then%>
                <div id="volunteer-banner"><!--<img src="resources/images/thinkbeyondageing-banner.jpg" width="1900" height="240"  alt=""/>-->
                <div id="volunteer-banner-inner">
                	<!--<table border="0">
                    	<tr>
                        	<td>
                            	<img src="resources/images/Health-1.jpg" alt="Health Service Image" />
                            </td>
                            <td>
                            	<h1 style="font-family: Myriad Pro; color:#fff;">HEALTH</h1> 
                            </td>
                         </tr>
                       </table>-->
                </div>
            </div>

                <% ElseIf Request.Url.ToString().ToLower().Contains("adopt") Then%>
               <div id="adopt-banner"><!--<img src="resources/images/thinkbeyondageing-banner.jpg" width="1900" height="240"  alt=""/>-->
                <div id="adopt-banner-inner">
                	<!--<table border="0">
                    	<tr>
                        	<td>
                            	<img src="resources/images/Health-1.jpg" alt="Health Service Image" />
                            </td>
                            <td>
                            	<h1 style="font-family: Myriad Pro; color:#fff;">HEALTH</h1> 
                            </td>
                         </tr>
                       </table>-->
                </div>
            </div>

                <% ElseIf Request.Url.ToString().ToLower().Contains("pilgrimtourism") Then%>
                <div id="pilgrims-banner"><!--<img src="resources/images/thinkbeyondageing-banner.jpg" width="1900" height="240"  alt=""/>-->
                <div id="pilgrims-banner-inner">
                	<!--<table border="0">
                    	<tr>
                        	<td>
                            	<img src="resources/images/Health-1.jpg" alt="Health Service Image" />
                            </td>
                            <td>
                            	<h1 style="font-family: Myriad Pro; color:#fff;">HEALTH</h1> 
                            </td>
                         </tr>
                       </table>-->
                </div>
            </div>

                <% ElseIf Request.Url.ToString().ToLower().Contains("astrospiritual") Then%>
               <div id="astro-banner"><!--<img src="resources/images/thinkbeyondageing-banner.jpg" width="1900" height="240"  alt=""/>-->
                <div id="astro-banner-inner">
                   	<!--<table border="0">
                    	<tr>
                        	<td>
                            	<img src="resources/images/Health-1.jpg" alt="Health Service Image" />
                            </td>
                            <td>
                            	<h1 style="font-family: Myriad Pro; color:#fff;">HEALTH</h1> 
                            </td>
                         </tr>
                       </table>-->
                </div>
            </div>

                <% ElseIf Request.Url.ToString().ToLower().Contains("legal") Then%>
            <div id="legal-banner"><!--<img src="resources/images/thinkbeyondageing-banner.jpg" width="1900" height="240"  alt=""/>-->
                <div id="legal-banner-inner">
                
                	
                	<!--<table border="0">
                    	<tr>
                        	<td>
                            	<img src="resources/images/Health-1.jpg" alt="Health Service Image" />
                            </td>
                            <td>
                            	<h1 style="font-family: Myriad Pro; color:#fff;">HEALTH</h1> 
                            </td>
                         </tr>
                       </table>-->
                </div>
            </div>

                <% ElseIf Request.Url.ToString().ToLower().Contains("health") Then%>
                <div id="health-banner"><!--<img src="resources/images/thinkbeyondageing-banner.jpg" width="1900" height="240"  alt=""/>-->
                <div id="health-banner-inner">
                	<!--<table border="0">
                    	<tr>
                        	<td>
                            	<img src="resources/images/Health-1.jpg" alt="Health Service Image" />
                            </td>
                            <td>
                            	<h1 style="font-family: Myriad Pro; color:#fff;">HEALTH</h1> 
                            </td>
                         </tr>
                       </table>-->
                </div>
            </div>

               

                <% Else %>
               <div id="banner"><!--<img src="resources/images/thinkbeyondageing-banner.jpg" width="1900" height="240"  alt=""/>-->
                <div class="baverly-quotation"><p>"IN YOUTH WE RUN INTO DIFFICULTIES. <br>
      &nbsp;&nbsp;IN OLD AGE DIFFICULTIES RUN INTO US."<br>
       - Beverly Sills</p></div>
            </div>
                 <% End If%>
           </div>

            
            <div class="container" style="margin:0 auto; width:1000px;">
            
            
            	<div class="service-navs">
                	<ul class="nav nav-pills">
                    
                    	<li>
                        	<% If Request.Url.ToString().ToLower().Contains("health") Then%>
                            <a class="active" title="HEALTH">HEALTH</a>
                        	<% Else %>
                        	<a href="../health" title="Health">HEALTH</a>
                            <% End If%>
                        </li>
                       	<li>
                        	<% If Request.Url.ToString().ToLower().Contains("legal") Then%>
                            <a class="active" title="LEGAL">LEGAL</a>
                        	<% Else %>
                        	<a href="../legal/" title="LEGAL">LEGAL</a>
                            <% End If%>
                        </li>
                    	<li>
                        	<% If Request.Url.ToString().ToLower().Contains("astrospiritual") Then%>
                        		<a class="active" title="HANDYMAN SERVICES">ASTRO & SPIRITUAL</a>
                        	<% Else %>
                        	<a href="../astrospiritual/" title="ASTRO & SPIRITUAL">ASTRO & SPIRITUAL</a>
                            <% End If%>
                        </li>
                    	<li>
                        	<% If Request.Url.ToString().ToLower().Contains("pilgrimtourism") Then%>
                        		<a class="active" title="PILGRIM TOURISM">PILGRIM TOURISM</a>
                        	<% Else %>
                        	<a href="../pilgrimtourism/" title="PILGRIM TOURISM">PILGRIM TOURISM</a>
                        	<% End If%>
                        </li>
                    	<li>
                        	<% If Request.Url.ToString().ToLower().Contains("adopt") Then%>
                        		<a class="active" title="ADOPT">ADOPT</a>
                        	<% Else %>
                        	<a href="../adopt/" title="ADOPT">ADOPT</a>
                            <% End If%>
                        </li>
                    	<li>
                        	<% If Request.Url.ToString().ToLower().Contains("volunteer") Then%>
                        		<a class="active" title="VOLUNTEER">VOLUNTEER</a>
                        	<% Else %>
                        	<a href="../volunteer/" title="VOLUNTEER">VOLUNTEER</a>
                            <% End If%>
                         </li>
                    	<li>
                        	<% If Request.Url.ToString().ToLower().Contains("financial") Then%>
                        		<a class="active" title="FINANCIAL">FINANCIAL</a>
                        	<% Else %>
                        	<a href="../financial/" title="FINANCIAL">FINANCIAL</a>
                            <% End If%>
                        </li>
                    	<li>
                        	<% If Request.Url.ToString().ToLower().Contains("social") Then%>
                        		<a class="active" title="SOCIAL">SOCIAL</a>
                        	<% Else %>
                        	<a href="../social/"  title="SOCIAL">SOCIAL</a>
                            <% End If%>
                        </li>   
                 		<li> 
							<% If Request.Url.ToString().ToLower().Contains("handymanservices") Then%>
                        		<a class="active" title="HANDYMAN SERVICES">HANDYMAN SERVICES</a>
                        	<% Else %>
                        	<a href="../handymanservices/"  title="HANDYMAN SERVICES">HANDYMAN SERVICES</a></li> 
                        	<% End If%>
                        </li>   
           	       </ul>
                </div>
                <br>
</div>