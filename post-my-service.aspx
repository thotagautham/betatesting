<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="post-my-service.aspx.vb" Inherits="betatesting.post_my_service" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>LET'S CONNECT CHENNAI</title>

    <link href="_css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="_css/style.css">
	<link rel="stylesheet" type="text/css" href="font1/stylesheet.css">
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="_css/menu.css">

</head>


<body>
     <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        
<div class="container-fluid heading">
    <div class="container">
     <p align="right"> <img src="_images/facebook-square.png"/><img src="_images/twitter.png"/></p>
	<h2 class="header-left-text" align="center" >LET'S CONNECT CHENNAI</h2>
      </div>

</div>


  <div class="container-fluid specialcontent">
  	
    <div class="col-md-4 main-box-ad">
      <div class="title"><strong>POST MY SERVICE</strong></div>
    </div>
  </div>
         
               <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>

 
 <div class="container">
    <div class="col-sm-12 col-xs-12 col-md-9">
    
        <div class="box">
            <div style="margin:5px 0;"> <asp:Label ID="LblMsg" runat="server"></asp:Label></div>
<div style="margin:5px 0;"><asp:TextBox ID="TxtName" runat="server" CssClass="form-a"  MaxLength="50" placeholder="TYPE NAME"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVName" runat="server" 
                        ControlToValidate="TxtName" ErrorMessage="Enter Name" 
                        Display="None" ValidationGroup="VGEnquiry2" InitialValue="Type Name*"> </asp:RequiredFieldValidator></div>
  <div  style="margin:10px 0;"> <asp:TextBox ID="TxtTelephone" runat="server" CssClass="form-a" placeholder="TYPE NUMBER" MaxLength="50" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TxtTelephone" ErrorMessage="Enter Number" 
                        Display="None" ValidationGroup="VGEnquiry2" InitialValue="Type Number*"> </asp:RequiredFieldValidator></div>
  <div  style="margin:10px 0;"><asp:TextBox ID="TxtEmailID" runat="server" MaxLength="75"   CssClass="form-a" placeholder="ENTER YOUR EMAIL ID"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVEmailId" runat="server" 
                    ControlToValidate="TxtEmailID" Display="None" ErrorMessage="Enter Email Id" ValidationGroup="VGEnquiry2" InitialValue="Type Email*"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="REVEmailId" runat="server" 
                    ControlToValidate="TxtEmailID" Display="None" 
                    ErrorMessage="Invalid Email ID" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="VGEnquiry2"> </asp:RegularExpressionValidator></div>
  
   <div  style="margin:10px 0;"> <asp:TextBox ID="TxtComments" runat="server" Rows="2" TextMode="MultiLine" Columns="25" CssClass="form-a" placeholder="TYPE MESSAGE"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVComments" runat="server" ControlToValidate="TxtComments" Display="None" ValidationGroup="VGEnquiry2" ErrorMessage="Enter Comments" InitialValue="Type Message"></asp:RequiredFieldValidator></div>


   <p><br><br><b>I'M ALSO AVAILABLE ON</b></p>
   
        </div>
        </div>
    </div>
    
    <div class="container-fluid heading">

       
    <div class="container">
    <div class="box">
<div class="col-md-4 box-fieldbox"><b><table width="100%">
  <tr>
    <td><input type="checkbox" style="width:20px; height:20px;"></td>
    <td>WHATSAPP</td>
  </tr>
</table>
 </b></div>
<div><b><asp:TextBox ID="txtwatsapp" runat="server" MaxLength="50" CssClass="inputtextfield" Text="Whatsapp Number*" autocomplete="off" onfocus="Trim(this);this.value == 'Type Name*' ? this.value='' : Trim(this);" onblur="Trim(this);this.value == '' ? this.value='Type Name*' : Trim(this);"></asp:TextBox>
       </div></b>

<div class="col-md-4 box-fieldbox"><b><table width="100%">
  <tr>
    <td><input type="checkbox" style="width:20px; height:20px;"></td>
    <td>FACEBOOK</td>
  </tr>
</table>
 </b></div>
<div><b><asp:TextBox ID="txtfacebook" runat="server" MaxLength="50" CssClass="inputtextfield" Text="Facebook ID" autocomplete="off" onfocus="Trim(this);this.value == 'Type Name*' ? this.value='' : Trim(this);" onblur="Trim(this);this.value == '' ? this.value='Type Name*' : Trim(this);"></asp:TextBox>
       </div>

<div class="col-md-4 box-fieldbox"><b><table width="100%">
  <tr>
    <td><input type="checkbox" style="width:20px; height:20px;"></td>
    <td>TWITTER</td>
  </tr>
</table>
 </b></div>
<div><b><asp:TextBox ID="txttwitter" runat="server" MaxLength="50" CssClass="inputtextfield" Text="Facebook ID" autocomplete="off" onfocus="Trim(this);this.value == 'Type Name*' ? this.value='' : Trim(this);" onblur="Trim(this);this.value == '' ? this.value='Type Name*' : Trim(this);"></asp:TextBox>
       </div>


</div>
      </div>
      
      <div class="container">
      <div class="box">
        <b><br><br>CHOOSE CATEGORY</b></p><p><table width="100%">
  <tr>
    <td width="95%"> <asp:DropDownList ID="ddlrequest" runat="server" AppendDataBoundItems="true" AutoPostBack="true" >
           <asp:ListItem Value="0">Select Category</asp:ListItem>
                     </asp:DropDownList></td>
    <td width="5%"><img src="_images/arrow.jpg" /></td>
  </tr>
</table>
</p>
<p><asp:TextBox ID="Txtother" runat="server" CssClass="form-a"  MaxLength="50" placeholder="FOR OTHERS TYPE HERE"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVother" runat="server" 
                        ControlToValidate="Txtother" ErrorMessage="FOR OTHERS TYPE HERE" 
                        Display="None" ValidationGroup="VGEnquiry2" InitialValue="Type Name*"> </asp:RequiredFieldValidator></p>

<asp:Label ID="Lblother" runat="server"></asp:Label>
        <p><br><br><b>CHOOSE AREA</b></p>
        <p><table width="100%">
  <tr>
    <td width="95%"> <asp:DropDownList ID="ddlarea" runat="server"  AppendDataBoundItems="true" AutoPostBack="true" >
           <asp:ListItem Value="0">Select Area</asp:ListItem>
                     </asp:DropDownList>
        <p><asp:TextBox ID="txtotherarea" runat="server" CssClass="form-a"  MaxLength="50" placeholder="FOR OTHERS TYPE HERE"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="Txtother" ErrorMessage="FOR OTHERS TYPE HERE" 
                        Display="None" ValidationGroup="VGEnquiry2" InitialValue="Type Name*"> </asp:RequiredFieldValidator></p>


    </td>
    <td width="5%"><img src="_images/arrow.jpg" /></td>
  </tr>
</table>
</p>



        </div>
      
      </div>
 
</div>



<div class="container-fluid heading">
    <div class="container">
    <div class="box">
		 <div class="col-md-4 main-box-gd"><b>I WISH TO HELP</b></div>
         <div class="col-md-4 main-box-gda"><b> <asp:Button ID="btnsave" runat="server" Text="Save" ValidationGroup="VGEnquiry2" /> &nbsp;&nbsp;
            
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEnquiry2" /></b></div>
         </div>
      </div>

<div class="container" align="center">
       <span style="font-size:12px;">Designed &amp; Developed by </span><a target="-blank" style="text-decoration:none;" href="http://www.mokshamedia.co.in/"><span style="color:#ec046a;font-weight:bold;font-size:12px;"> moksha</span><span style="color:#a4d845;font-weight:bold;font-size:12px;">media</span></a>
       
       </div>

</div>

           </b></b>

</ContentTemplate>
   </asp:UpdatePanel>
    
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