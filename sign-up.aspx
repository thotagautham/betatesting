<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sign-up.aspx.vb" Inherits="betatesting._default4" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>VMOKSHA :: REGISTER </title>
    
    <link rel="stylesheet" type="text/css" href="../resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/responsive-style.css">
    
    <!--<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">-->
    <!--<link rel="stylesheet" type="text/css" href="resources/css/bootstrap-theme.min.css">-->
        
    <link data-require="bootstrap@*" data-semver="3.2.0" rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.css" />
    <link data-require="bootstrap-css@*" data-semver="3.2.0" rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" />
    <script data-require="jquery@*" data-semver="2.0.3" src="http://code.jquery.com/jquery-2.0.3.min.js"></script>
    <script data-require="bootstrap@*" data-semver="3.2.0" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.js"></script>
    <script data-require="angular.js@*" data-semver="1.3.0" src="//code.angularjs.org/1.3.0/angular.js"></script>
    <script data-require="jquery@*" data-semver="2.1.1" src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    
</head>
<body>
	<div ng-controller="vmokshaNgCtrl">	
    	<header>
                <div class="logo">
                    <h2 title="VMoksha">VMOKSHA </h2>            
                </div>
                <div class="header-nav">
                
                        <ul class="nav-links">
                            <li> <a href="/" title="Home">Home</a> </li>
                            <li> <a href="contactus.html" title="Contact Us">Contact Us</a> </li>
                            <li> <a href="sign-in.aspx" class="login-bg" title="Sign In">Sign In </a></li>
                        </ul>
                </div>
               
                
          </header>
          
           <div class="header-bottom"></div>
            <div id="banner"><!--<img src="resources/images/thinkbeyondageing-banner.jpg" width="1900" height="240"  alt=""/>-->
                <div class="baverly-quotation"><p>"IN YOUTH WE RUN INTO DIFFICULTIES. <br>
      &nbsp;&nbsp;IN OLD AGE DIFFICULTIES RUN INTO US."<br>
       - Beverly Sills</p></div>
            </div>
            
            <div class="container" style="margin:0 auto; width:1000px; min-height:550px;">
            	
                <div class="service-navs">
                	<ul class="nav nav-pills">
                    	<li><a href="../health/" title="Health">HEALTH</a></li>
                       	<li><a href="../legal" title="LEGAL">LEGAL</a></li>
                    	<li><a href="../astrospiritual/" title="ASTRO & SPIRITUAL">ASTRO & SPIRITUAL</a></li>
                    	<li><a href="../pilgrimtourism/" title="PILGRIM TOURISM">PILGRIM TOURISM</a></li>
                    	<li><a href="../adopt/" title="ADOPT">ADOPT</a></li>
                    	<li><a href="../volunteer/" title="VOLUNTEER">VOLUNTEER</a></li>
                    	<li><a href="../financial/" title="FINANCIAL">FINANCIAL</a></li>
                    	<li><a href="../social/" title="SOCIAL">SOCIAL</a></li>   
                 		<li><a href="../handymanservices/" title="HANDYMAN SERVICES">HANDYMAN SERVICES</a></li>  
                        
                    </ul>
                </div>
                
                <br>


                <form id="form1" runat="server" style="width:500px; margin:0 auto; background-color: #8a73ad; padding: 0 50px 50px 50px;">
                    <div>
                    	<h3 style="font-family: Myriad Pro; color:#fff;">Registration Form</h3>
                        <table>
                        
                            <tr>
                                <td colspan="2" align="center"><asp:Label ID="LblMsg" runat="server" Font-Bold="False" Font-Size="Medium" style="color:red;"></asp:Label></td>
                            </tr>
                            
                            <tr class="RowStyle">
                                <td class="tdStyle" width="136" style="padding:10px;">First Name</td>
                                <td class="tdStyle">
                                    <asp:TextBox ID="txtfirstname" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFVName" runat="server" 
                                        ControlToValidate="txtfirstname" Display="None" ErrorMessage="Enter First Name"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            
                            <tr class="RowStyle">
                                <td class="tdStyle" style="padding:10px;">Last Name</td>
                                <td class="tdStyle">
                                    <asp:TextBox ID="txtlastname" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="txtlastname" Display="None" ErrorMessage="Enter Last Name"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            
                            <tr class="AlternateRowStyle">
                                <td class="tdStyle" style="padding:10px;">Email Id</td>
                                <td class="tdStyle">
                                	<asp:TextBox ID="TxtEmailId" runat="server" CssClass="form-control" placeholder="Email Id"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="REVEmailID" runat="server" 
                                        ControlToValidate="TxtEmailId" Display="None" ErrorMessage="Invalid Email ID" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="TxtEmailId" Display="None" ErrorMessage="Email Id Required!"></asp:RequiredFieldValidator>
                    
                            <tr class="RowStyle">
                                <td class="tdStyle" style="padding:10px;">Password</td>
                                <td class="tdStyle">
                                    <asp:TextBox ID="txtpassword" type="password" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="txtpassword" Display="None" ErrorMessage="Enter Password"></asp:RequiredFieldValidator>
                        
                                </td>
                            </tr>
                
                            <tr class="RowStyle">
                                <td class="tdStyle" style="padding:10px;">Re Enter Password</td>
                                <td class="tdStyle">
                                    <asp:TextBox ID="txtreenterpassword" type="password" runat="server" CssClass="form-control" placeholder="Re Enter Password"></asp:TextBox>
                        
                                </td>
                            </tr>
                           
                            <tr class="RowStyle">
                                <td colspan="2" align="center" style="padding:10px;"><asp:Button ID="BtnSave" runat="server" Text="REGISTER"  style="background-color: #5a5a90; color:#fff;width: 95px; height: 30px; font-family:Myriad Pro; margin-right:5px;"/>
                                    &nbsp;
                                    <asp:Button ID="BtnCancel" runat="server" Text="CANCEL" style="background-color: #5a5a90; color:#fff;width: 95px; height: 30px; font-family:Myriad Pro; margin-right:5px;" />
                                    <br />
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                                        ShowMessageBox="True" ShowSummary="False" />
                                </td>
                            </tr>
                            
                            <tr>
                                <td align="right" valign="top" class="tdStyle"><p style="color:#fff; font-family: Myriad Pro; text-align:right;">* Note : </p></td>
                                <td><p style="color:#fff; font-family: Myriad Pro; padding-left:5px;">
                                    Your Email Id will receive login details. Password will be auto generated by the system</p>
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
                
</div> <!-- end of container -->
            
            <footer>
                <p>© Think Beyond Ageing® </p>
            </footer>
         
    	</div> <!-- end of en-controller div-->
	</body>
</html>

