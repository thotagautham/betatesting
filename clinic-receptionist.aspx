<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="clinic-receptionist.aspx.vb" Inherits="betatesting.clinic_receptionist" %>

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
         <!--<a href="#"> <img src="_images/search.png" class="img-responsive social_img"> </a>-->
         
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
 
   <div class="container-fluid formbox">
 
 
 <div class="container-fluid maincontent">
    <div class="container">
    
    <div class="col-sm-12 col-xs-12 col-md-6">
        	 <div class="col-sm-12 col-xs-12 col-md-12">
        	<p class="paragraph"><b> Old Patient Login Id</b></p>
        </div>
        
        <div class="col-sm-12 col-xs-12 col-md-12">
        	<input type="Patient" class="form" placeholder="Patient id / Contact Number" requireds>
        </div>
       
        
        <div class="col-sm-12 col-xs-12 col-md-12">
        	<input type="email" class="form" placeholder="Email id">
        </div>
        
        <div class="col-sm-12 col-xs-12 col-md-12">
        	<input type="submit" class="submit">
        </div>
          <div class="col-sm-12 col-xs-12 col-md-12">
      <a href="#" class="font">Forgot Password ?</a> <b>/</b> <a href="#" class="font">Change Password</a></div>
        
      </div>
        
        <div class="col-sm-12 col-xs-12 col-md-6">
       <img src="_images/image.png" width="100%" /> 
               </div>
    	
        <div class="col-sm-12 col-xs-12 col-md-12">
        	 <div class="col-sm-12 col-xs-12 col-md-12">
        	<p class="paragraph"><b>RECEPTIONIST</b></p>
        </div>
        
        <div class="col-sm-12 col-xs-12 col-md-6">
        	<input type="name" class="form" placeholder="dd/mm/year">
        </div>

        <div class="col-sm-12 col-xs-12 col-md-6">
        	<input type="login" class="form" placeholder="Patient Login Id">
        </div>
        
        
         <div class="col-sm-12 col-xs-12 col-md-12">
        	<input type="name" class="form" placeholder="First Name">
        </div>
        
         <div class="col-sm-12 col-xs-12 col-md-12">
        	<input type="middle name" class="form" placeholder="Middle  Name">
        </div>
        <div class="col-sm-12 col-xs-12 col-md-12">
        	<input type="last name" class="form" placeholder="Last  Name">
        </div>
        
         <div class="col-sm-12 col-xs-12 col-md-12">
        	<input type="name" class="form" placeholder="F/o S/o W/o H/o M/o">
        </div>
        
         <div class="col-sm-12 col-xs-12 col-md-6">
        	<input type="age" class="form" placeholder="Age">
        </div>

<div class="col-sm-12 col-xs-12 col-md-6">
<select  size="1" name="select" class="form">
<option value="select">Select</option>
<option value="male">Male</option>
<option value="female">Female</option>
</select> 
 </div>

 <div class="col-sm-12 col-xs-12 col-md-12">
<textarea class="form"  placeholder="Address"></textarea>
 </div>
        
        
         <div class="col-sm-12 col-xs-12 col-md-6">
        	<input type="contact" class="form" placeholder="Contact Number">
        </div>
        
        
         <div class="col-sm-12 col-xs-12 col-md-6">
  
        	<input type="email" class="form" placeholder="Email id">
        </div>
        
        
          <div class="col-sm-12 col-xs-12 col-md-12">
        	<input type="doctor" class="form" placeholder="Referral Doctor">
        </div>
        
          <div class="col-sm-12 col-xs-12 col-md-6">
        	<input type="hospital" class="form" placeholder="Contact Number">
        </div>
        
          <div class="col-sm-12 col-xs-12 col-md-6">
        	<input type="contact" class="form" placeholder="Mob. no. / Sms / Whatsapp">
        </div>
        
        <div class="col-sm-12 col-xs-12 col-md-12">
<select  size="1" name="select" class="form">
<option value="select">Purpose of Visit</option>
<option value="male">To See Doctor</option>
<option value="female">Consultation Fee</option>
<option value="male">Laboratory / Diagnostic</option>
<option value="female">Bill Generation</option>
</select> 
 </div>
        
         <div class="col-sm-12 col-xs-12 col-md-12">
        	<input type="submit" class="submit">
        </div>
        
       
        
        
        </div>

<div class="col-sm-12 col-xs-12 col-md-12">
        	 <div class="col-sm-12 col-xs-12 col-md-12">
        	<p class="paragraph"><b>Add New</b></p>
        </div>
        
        <div class="col-sm-12 col-xs-12 col-md-6">
<textarea class="form" style="height:100px;"  placeholder="Brief History"></textarea>
 </div>
 
 
 <div class="col-sm-12 col-xs-12 col-md-6">
<textarea class="form" style="height:100px;"   placeholder="Examinations"></textarea>
 </div>
        
        
<div class="col-sm-12 col-xs-12 col-md-6">
<select  size="1" name="select" class="form">
<option value="select">Investigations</option>
<option value="heading">heading 1</option>
<option value="heading">heading 2</option>
</select> 
 </div>
 
     <div class="col-sm-12 col-xs-12 col-md-6">
        	<input type="diagnosis" class="form" placeholder="Probable Diagnosis Treatment">
        </div>
        
        
        <div class="col-sm-12 col-xs-12 col-md-12">
        	<input type="submit" class="submit">
        </div>
        
               
        </div>

<!-- social icons -->
        
    	 

    
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