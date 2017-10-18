<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="clicnidefault.aspx.vb" Inherits="betatesting.clicnidefault" %>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title></title>

    <link href="_css/bootstrap.min.css" rel="stylesheet">

	<link rel="stylesheet" type="text/css" href="_css/clinic.css">
	<link rel="stylesheet" type="text/css" href="font/stylesheet.css">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="_css/menu.css">

</head>


<body>
      <form id="form1" runat="server">
     
     
     
       
       
       
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div class="container-fluid header">
    <div class="container">
		<div class="col-sm-12 col-xs-12 col-md-6">
        	<img src="_images/logo.png" class="img-responsive logo_img">
           <!-- <h4 class="header-left-text">Heading</h4> -->
       	 
        </div>
        
        <div class="col-sm-12 col-xs-12 col-md-6">
        <div class="social_img2">
       <a href="#"> <img src="_images/googleplus.png" class="img-responsive social_img"> </a>
             <a href="#"> <img src="_images/youtube.png" class="img-responsive social_img"> </a>
             <a href="#"> <img src="_images/twitter.png" class="img-responsive social_img"> </a>
         <a href="#"> <img src="_images/facebook.png" class="img-responsive social_img"> </a>
        
         
        </div><br />
        <h4 class="header-right-text"> Helpline: xxxx xxx xxx </h4>
        </div>  
            
    </div>

</div>

 
<div class="container-fluid login">
  	<div class="container">
  <a href="index.html">Login</a> / <a href="register.html">Register</a></div>
  </div>
 
 
<!-- login page form --> 
 
   <div class="container-fluid maincontentbox">
 
 
 <div class="container-fluid maincontent">
    <div class="container">
    	
        <div class="col-sm-12 col-xs-12 col-md-6">
        	 <div class="col-sm-12 col-xs-12 col-md-12">
        	<p class="paragraph"><b>Login Into Your Account</b></p>
        </div>
        <div><asp:Label ID="LblMsg" runat="server" Font-Bold="True" 
        Font-Size="Medium"></asp:Label></div>
         <div class="col-sm-12 col-xs-12 col-md-12">
        	  	  <asp:TextBox ID="TxtEmailId" runat="server" placeholder="Enter existing email-id" CssClass="email"></asp:TextBox>
            		<asp:RegularExpressionValidator ID="REVEmailID" runat="server" 
                	ControlToValidate="TxtEmailId" Display="None" ErrorMessage="Invalid Email ID" 
                	ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            	
<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="TxtEmailId" Display="None" ErrorMessage="Email Id Required!"></asp:RequiredFieldValidator>
        </div>
        
         <div class="col-sm-12 col-xs-12 col-md-12">
        <asp:TextBox ID="txtpassword" type="password" runat="server" placeholder="Enter password" CssClass="email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtpassword" Display="None" ErrorMessage="Password Required!"></asp:RequiredFieldValidator>
        </div>
        
         <div class="col-sm-12 col-xs-12 col-md-12">
        	<asp:Button ID="BtnSave" runat="server" Text="SIGN IN" style="background-color: #03abd4; color:#fff;width: 100px; height: 35px; font-family: 'allerregular'; margin-right:5px; border:1px solid #ccc;" />
        			
        			<asp:ValidationSummary ID="ValidationSummary1" runat="server" 
            		ShowMessageBox="True" ShowSummary="False" />
        </div>
        
         <div class="col-sm-12 col-xs-12 col-md-12">
      <a href="#">Forgot Password ?</a> <b>/</b> <a href="#">Change Password</a></div>
        </div>



<!-- social icons -->
        
    	 <div class="col-sm-12 col-xs-12 col-md-6">
        	 
        
     
         <div class="col-sm-12 col-xs-12 col-md-12">
        	<img src="_images/doctor.png" width="100%" />
        </div>
        
        
        </div>

    
    </div>
 </div>
 
 
 </div>
 
 
 
 
 
<div class="container-fluid footer">
  	<div class="container">
    	Copyrights © 2015 Clinic. All Rights Reserved.
      
    </div>
    
  </div>
<div class="container-fluid copyright">

<div class="container">

    Designed &amp; Developed by<a target="-blank" style="text-decoration:none;" href="http://www.mokshamedia.co.in/"><span style="color:#ec046a;font-weight:bold;font-size:12px;"> moksha</span><span style="color:#a4d845;font-weight:bold;font-size:12px;">media</span></a>
    </div>
</div>


    
 <div id="fb-root"></div>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
 
<script src="_js/jquery-1.10.2.min.js"></script>
<script src="_js/arrow88.js"></script>
<script src="_js/bootstrap.min.js"></script>

<script>
    $('#myCarousel').carousel({
        interval: 4000
    });
</script>



          </form>
</body>

</html>