

<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default-bck.aspx.vb" Inherits="betatesting._Default" %>


<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Chennai</title>

    <link href="_css/bootstrap.min.css" rel="stylesheet">

	<link rel="stylesheet" type="text/css" href="_css/chi-style.css">
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
        	<h2 class="header-left-text"><b>LET'S CONNECT CHENNAI</b></h2>
       	 
        </div>
        
                  
    </div>

</div>

 
 
 
 
 
 
 <div class="container-fluid maincontent">
    <div class="container">
    	<div class="col-sm-12 col-xs-12 col-md-9">
           <div class="col-sm-12 col-xs-12 col-md-12" style="padding:0px;">
         <div class="col-md-4 main-box-ad"><br><br><br></div>
   <div class="col-md-4 main-box-ad">
   <div class="box"><strong>I'M LOOKING FOR HELP</strong></div>

       
   </div>

               
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
          <Triggers>
            <asp:PostBackTrigger ControlID="btnSave" />
          </Triggers>
          <ContentTemplate>
      <div class="col-md-4 main-box-ad">
      <div class="box">
      <table width="100%">
  <tr>
    <td width="90%" align="right"> 
        <asp:DropDownList ID="ddlrequest" runat="server" AppendDataBoundItems="true" AutoPostBack="true" Width="198" Height="30">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                      </asp:DropDownList>
       

    </td>
    <td width="10%" align="left"><img src="_images/arrow.jpg" style="margin-top:-8px;"/></td>
  </tr>
</table>
</div>
      
      
     </div>
               
               <asp:Label ID="LblMsg" runat="server"></asp:Label>
         <div class="col-md-4 main-box-ad"><div class="submit"><strong><asp:Button ID="btnSave" runat="server" Text="Submit"  /></strong></div></div>
         
  </ContentTemplate>
            </asp:UpdatePanel>
    
          
          </div>
            
            
      </div>
    	
    
    </div>
 </div>
 
 
 
 <div class="container-fluid bottom">
    <div class="container">
		       
     
   <div class="col-md-4 main-box-gd"><b>I WISH TO HELP</b></div>
     <div class="col-md-4 post"><b>POST MY SERVICE</b></div>

   
                  
    </div>

</div>

           
<!-- <div class="container-fluid footer">
    <div class="container">
		<p>Footer</p>
       	 
        </div>
      
            
    </div>

</div>
-->
    
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