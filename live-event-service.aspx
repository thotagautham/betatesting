<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="live-event-service.aspx.vb" Inherits="betatesting.live_event_service" %>

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

--------------
 <!-- Google Analytics -->

<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date(); a = s.createElement(o),
        m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-71065735-1', 'auto');
    ga('send', 'pageview');

</script>
</head>


<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>



<div class="container-fluid heading">
    <div class="container">
    <p align="right"> <a href="https://www.facebook.com/letsconnectchennai/" target="_blank"><img src="_images/facebook-square.png"/></a><a href="https://twitter.com/letshelpchennai" target="_blank"><img src="_images/twitter.png"/></a></p>
<h2 align="center" ><a href="/" class="header-left-text" style="text-decoration:none; color:#000;">LET'S CONNECT CHENNAI</a></h2>
    </div>

</div>

 
 <div class="container-fluid specialcontent">
  	
    <div class="col-md-4 main-box-ad">
      <div class="title"><asp:Label ID="LblMsg" runat="server"></asp:Label></div>
    </div>
  </div>
 
 
 <div class="container-fluid heading">
      
      <div class="container">
      <div class="box">
       <b style="color:#000;"><!--CHOOSE SUBCATEGORY--></b></p>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
        <p><table width="100%" runat="server" visible="false">
  <tr>
    <td width="95%"><asp:DropDownList ID="ddlsub" runat="server" CssClass="form-a" AppendDataBoundItems="true" AutoPostBack="true">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                      </asp:DropDownList></td>
    
  </tr>
</table>
</p>

<p><br> <b style="color:#000;">CHOOSE AREA</b></p>
        <p><table width="100%">
  <tr>
    <td width="95%"><asp:DropDownList ID="ddlarea" runat="server"  CssClass="form-a" AppendDataBoundItems="true" AutoPostBack="true">
                        <asp:ListItem Value="0">All</asp:ListItem>
                      </asp:DropDownList></td>
    <!-- <td width="5%"><img src="_images/arrow.jpg" /></td>-->
  </tr>
</table>
</p>

            <p><table width="100%">
  <tr>
    <td width="95%">
          <asp:Button ID="btnSave" runat="server" CssClass="submit" Text="SUBMIT" Visible="false"  /></td>
    <!-- <td width="5%"><img src="_images/arrow.jpg" /></td>-->
  </tr>
</table>
</p>

           
 </ContentTemplate>
            </asp:UpdatePanel>
        </div>
      
      </div>

</div>
 
 
 
 <div class="container-fluid service">
    <div class="container">
    <div class="box">
    
     <asp:Repeater ID="repimage" runat="server">
         
         <ItemTemplate>
      
		 <div class="col-md-4 service-provider">
         <a href="#" title="Description & Area " data-toggle="popover" data-trigger="hover" data-content=" <%# Eval("description")%>  "> <b style="color:#000;"><%# Eval("NAME")%>  </b></a>
</div>
 
 <div class="col-md-4 service-provider"><b style="color:#000;"> <%# Eval("mobile") %></b></div>
 <div class="col-md-4 service-provider" runat="server" visible="false"><b style="color:#000;"><asp:Label ID="lblarea" runat="server" Text=''></asp:Label></b></div>
 

 
 
 
   </ItemTemplate>
     </asp:Repeater>
 </div></div></div>
 
 
  

<div class="container-fluid heading">
    <div class="container">
    <div class="box">
		 <div class="col-md-4 main-box-gd"><b style="color:#000;" >I WISH TO HELP</b></div>
         <div  class="col-md-4 main-box-gda" ><b><a href="post-my-service.aspx" style=" color:#fff; text-decoration:none;">POST MY SERVICE</a></b></div>
      </div>
      </div>



       

       
       


    <div class="container">
    <div class="box">
		 <div class="col-md-4 main-box-gd">
         <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal" style="color:#000;" >DISCLAIMER</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title" align="center"><strong style="color:#000;">DISCLAIMER</strong></h3>
        </div>
        <div class="modal-body">
          <p style="text-align:justify; padding:10px;">Let’s Connect Chennai is a non-commercial social initiative undertaken by a concerned enterprise of India, in view of the recent events in Tamil Nadu. The sole purpose of this initiative is to assist the affected in every possible manner. The information/contacts provided herein are aggregated from available sources from world wide web and media.  If you have any issues with the contacts provided here, please feel free to write to us at info@mokshamedia.co.in (Or) call us at +91 7842926925. We do not take responsibility for any misinformation. We truly regret any inconvenience occurring due to misinformation.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  <div class="container">
 <!-- <h3>Popover Example</h3>-->


</div>



  
  </div>
      <div class="col-md-4 main-box-gd"><span style="font-size:12px;">An Initiative by </span><a target="-blank" style="text-decoration:none;" href="http://www.mokshamedia.co.in/"><span style="color:#ec046a;font-weight:bold;font-size:12px;"> moksha</span><span style="color:#a4d845;font-weight:bold;font-size:12px;">media</span></a></div>
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

    <script>
        $(document).ready(function () {
            $('[data-toggle="popover"]').popover();
        });
</script>    </form>


</body>

</html>