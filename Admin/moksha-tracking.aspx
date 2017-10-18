<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="moksha-tracking.aspx.vb" Inherits="betatesting.moksha_tracking" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<html lang="en">

<head runat="server">

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Moksha  ADMINISTRATOR CONTROL PANEL</title>

    <link href="admin-files/_css/bootstrap.min.css" rel="stylesheet">

	<link rel="stylesheet" type="text/css" href="admin-files/_css/kimsstyle.css">
<link rel="stylesheet" type="text/css" href="../../kimsfonts/stylesheet.css">
    <link href="admin-files/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="admin-files/_css/menu.css">
    
   


</head>


<body>

       <form id="form1" runat="server">
    	
    <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>

 <asp:UpdatePanel ID="UpdatePanel2" runat="server">
       <ContentTemplate>
<div class="container-fluid header">
<div class="container">

<div class="col-sm-12 col-xs-12 col-md-3">
<img src="admin-files/_images/logo.png" class="img-responsive" />
</div>

<div class="col-sm-12 col-xs-12 col-md-9">
<h3 class="headertextcolor">Moksha Media ADMINISTRATOR CONTROL PANEL</h3>

</div>


</div>

</div>


<div class="container-fluid headerbottom">
<div class="container">
<div class="col-sm-12 col-xs-12 col-md-8"></div>
<div class="col-sm-12 col-xs-12 col-md-4">
<div  class="box1"><a href="#" style="color:#0075ad;">Home</a> / <a href="#" style="color:#0075ad;">Logout</a></div>
</div>

</div></div>
 
 
 
 <div class="container-fluid maincontent">
    <div class="container">
    

      <div class="clearfix"></div>
    	<div class="col-sm-12 col-xs-12 col-md-12">
        	<div class="col-sm-12 col-xs-12 col-md-12" style="background:#eee;"><h3>PRIMARY ENQUIRY </h3></div>
            
           <div class="col-sm-12 col-xs-12 col-md-12"  style="border:1px #ccc solid;">
        
          <div class="clearfix"></div>
        <div class="col-sm-12 col-xs-12 col-md-6" style="padding: 10px 0; background: #eee;">
        <div class="col-sm-12 col-xs-12 col-md-4"><span class="fontcolor" >ENQUIRER NAME</span></div>
        
          <div class="col-sm-12 col-xs-12 col-md-8">`
               <asp:Label ID="Lblname" runat="server" Text='<span><%# Eval("Name")%></span>'>Name</asp:Label>
          </div>
          </div>
          
           
           <div class="col-sm-12 col-xs-12 col-md-6" style="padding: 10px 0; background: #dadada;">
        <div class="col-sm-12 col-xs-12 col-md-4"><span class="fontcolor" >RESPONSE STATUS</span></div>
        
          <div class="col-sm-12 col-xs-12 col-md-8">
              <asp:Label ID="responsetime" runat="server" Text="">Response Time </asp:Label>
          </div>
          </div>
          
  <div class="clearfix"></div>
          
              <div class="col-sm-12 col-xs-12 col-md-6" style="padding: 10px 0; background: #eee;">
          <div class="col-sm-12 col-xs-12 col-md-4"><span class="fontcolor" >DATE / TIME</span></div>
          
          <div class="col-sm-12 col-xs-12 col-md-8">

              
                

               <asp:Label ID="lbltime" runat="server" Text='<%# FormatDateTime(Eval("QUERYDATETIME"), 1)%>'></asp:Label>
          </div>
          </div>
          
     
         
          
              <div class="col-sm-12 col-xs-12 col-md-6" style="padding: 10px 0; background: #dadada;">
          
          <div class="col-sm-12 col-xs-12 col-md-4"><span class="fontcolor" >MOBILE NUMBER</span></div>
          
          <div class="col-sm-12 col-xs-12 col-md-8">

               <asp:Label ID="Lblphonenumber" runat="server" Text='<span><%# Eval("PhoneNumber")%></span>'>'Number</asp:Label>
           
          </div>
          </div>
          
          
          <div class="clearfix"></div>
          
          
         


          
              <div class="col-sm-12 col-xs-12 col-md-6" style="padding: 10px 0; background: #eee;">
          <div class="col-sm-12 col-xs-12 col-md-4"><span class="fontcolor" >EMAIL ID</span></div>
          
          <div class="col-sm-12 col-xs-12 col-md-8">
               <asp:Label ID="Lblemail" runat="server" Text='<span><%# Eval("EmailId")%></span>'>'Email</asp:Label>
          </div>
          
          </div>
          
          
          
          
           
          
              
          <div class="clearfix"></div>
          
          <div class="col-sm-12 col-xs-12 col-md-6" style="padding: 10px 0; background: #eee;">
          <div class="col-sm-12 col-xs-12 col-md-4"><span class="fontcolor" >QUERY</span></div>
          
          <div class="col-sm-12 col-xs-12 col-md-8"> 

                <asp:Label ID="LBlquery" runat="server" Text='<span><%# Eval("QUERYDESC")%></span>'>'Description </asp:Label>
          </div>
          </div>
          
            

              

             


            </div>
            
            
            
           
        </div>
    
<div class="clearfix"></div>
    </div>
 </div>
 
 <div runat="server">


 </div>
  
 <div class="container-fluid maincontent">
    <div class="container">
    
    
            
            
            
    <div class="col-sm-12 col-xs-12 col-md-12">             
            <div class="col-sm-12 col-xs-12 col-md-12" style="background:#eee;"> 
             <h3>STATUS</h3></div>
             
             <div class="col-sm-12 col-xs-12 col-md-12" style="border:1px #ccc solid;"> 
          <div class="clearfix"></div>
      <div class="col-sm-12 col-xs-12 col-md-2"></div>
            
           <div class="col-sm-12 col-xs-12 col-md-12" >
       

<div class="clearfix"></div>

          
              <div class="col-sm-12 col-xs-12 col-md-12">
          <div class="col-sm-12 col-xs-12 col-md-4 fontcolor">STATUS</div>
          
          <div class="col-sm-12 col-xs-12 col-md-8">
              <asp:Label ID="LblMsg" runat="server" Text=""></asp:Label>
              <asp:DropDownList ID="DDLstatus" CssClass="form-control" runat="server"   AutoPostBack="true"   >
            <asp:ListItem Value="0">&nbsp;&nbsp;Select Status</asp:ListItem>
        </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RFVDoctor" runat="server" 
                  ErrorMessage="Please Select Status" ControlToValidate="DDLstatus" Display="None" 
                  InitialValue="0" ValidationGroup="Appointmentinner"></asp:RequiredFieldValidator>

          </div>
          </div>
          
 <div class="clearfix"></div>
  <div class="col-sm-12 col-xs-12 col-md-12">
          <div class="col-sm-12 col-xs-12 col-md-4 fontcolor">CONVERSION TYPE</div>
          
          <div class="col-sm-12 col-xs-12 col-md-8">

               <asp:DropDownList ID="ddltype" runat="server" CssClass="form-control"   AutoPostBack="true"  onchange="showImage();" >
            <asp:ListItem Value="0">&nbsp;&nbsp;Status Type</asp:ListItem>
        </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                  ErrorMessage="Please Select Status" ControlToValidate="DDLstatus" Display="None" 
                  InitialValue="0" ValidationGroup="Appointmentinner"></asp:RequiredFieldValidator>

          </div>
          </div>
          
 <div class="clearfix"></div>

<div class="col-sm-12 col-xs-12 col-md-12">
          
          <div class="col-sm-12 col-xs-12 col-md-4 fontcolor">PROBABILITY</div>
          
          <div class="col-sm-12 col-xs-12 col-md-8"><div id="sel1">
   <asp:DropDownList ID="ddlrating" runat="server" CssClass="form-control"   AutoPostBack="true"  onchange="showImage();" >
            <asp:ListItem Value="0">&nbsp;&nbsp;Select Rating</asp:ListItem>
                    <asp:ListItem Value="1">1</asp:ListItem>
                     <asp:ListItem Value="2">2</asp:ListItem>
                     <asp:ListItem Value="3">3</asp:ListItem>
                     <asp:ListItem Value="4">4</asp:ListItem>
                     <asp:ListItem Value="5">5</asp:ListItem>
                     

        </asp:DropDownList>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                  ErrorMessage="Please Select Status" ControlToValidate="DDLstatus" Display="None" 
                  InitialValue="0" ValidationGroup="Appointmentinner"></asp:RequiredFieldValidator>
  </div></div>
          </div>
          
 <div class="clearfix"></div>
          
              <div class="col-sm-12 col-xs-12 col-md-12 fontcolor">
          <div class="col-sm-12 col-xs-12 col-md-4">NEXT TRACKING DATE</div>
          <div class="col-sm-12 col-xs-12 col-md-8">
              
              <div id="omegatext" style="z-index:2;position:relative">
          
          <asp:TextBox id="txtdate" CssClass="form-control" placeholder="Click to show calendar" runat="server"></asp:TextBox><asp:ImageButton id="ImgBtnFromDate" runat="Server" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" CausesValidation="False"></asp:ImageButton><BR />
                        <cc1:CalendarExtender id="CEFromDate" runat="server" PopupButtonID="ImgBtnFromDate" TargetControlID="txtdate"></cc1:CalendarExtender>
                   
          
          </div>
          
          </div>
                  </div>
          
 <div class="clearfix"></div>
          
              <div class="col-sm-12 col-xs-12 col-md-12">
          <div class="col-sm-12 col-xs-12 col-md-4 fontcolor"> DESCRIPTION</div>
          
          <div class="col-sm-12 col-xs-12 col-md-8">
              
              <asp:TextBox ID="txtDescription" runat="server" placeholder="Please Enter Description" CssClass="form-control"  TextMode="MultiLine" Rows="4" Columns="50"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RFVName" runat="server" 
                  ControlToValidate="txtDescription" Display="None" ErrorMessage="Please Enter Description" 
                  ValidationGroup="Appointmentinner"></asp:RequiredFieldValidator></div>
          </div>
          
 <div class="clearfix"></div>
  <div class="col-sm-12 col-xs-12 col-md-12"  align="center" >         
        

              <asp:Button ID="btnstatus" runat="server" CssClass="btn btn-info" Text="Submit"  ValidationGroup="Appointmentinner" />
      <%--   <asp:ImageButton ID="ImgBtnSubmit" runat="server" ImageUrl="~/images/btn_submit.jpg" ValidationGroup="Appointmentinner" />--%>
                      <asp:ValidationSummary ID="ValidationSummary2" runat="server" 
                          ShowMessageBox="True" ShowSummary="False" ValidationGroup="Appointmentinner" />
        
            
          
            </div>

                 <div class="clearfix"></div>

               
            </div>
            
            <div class="col-sm-12 col-xs-12 col-md-12" >         
          
         <div class="col-sm-12 col-xs-12 col-md-12" > 

<div class="col-sm-12 col-xs-12 col-md-12" > 

 <div class="col-sm-12 col-xs-12 col-md-2 text-bg2"><b>STATUS</b></div>
     <div class="col-sm-12 col-xs-12 col-md-2 text-bg1"><b>SUB-STATUS</b></div>

  <div class="col-sm-12 col-xs-12 col-md-2 text-bg1"><b>ENTRY DATE / TIME</b></div>
  <div class="col-sm-12 col-xs-12 col-md-2 text-bg"><b>TRAKING DATE</b></div>
    <div class="col-sm-12 col-xs-12 col-md-4 text-bg2"><b>MESSAGE</b></div>

</div>
               <asp:Repeater ID="rptconversation" runat="server">

                    <itemtemplate>
                
               <div class="col-sm-12 col-xs-12 col-md-12" style="margin:10px 0;" > 
                    <div class="col-sm-12 col-xs-12 col-md-2 text-bg2"> <%# Eval("UMRNUMBER") %></div>
                    <div class="col-sm-12 col-xs-12 col-md-2 text-bg1"> <%# Eval("assignedto") %></div>
                    
               
               <div class="col-sm-12 col-xs-12 col-md-2 text-bg5"><asp:Label ID="lblentrydate" runat="server" Text='<%# Eval("TIME") %>'></asp:Label></div>
               <div class="col-sm-12 col-xs-12 col-md-2 text-bg6"><asp:Label ID="lblnexttrackingdate" runat="server" Text='<%# Eval("TRACKINGDATE") %>'></asp:Label></div>
               <div class="col-sm-12 col-xs-12 col-md-4 text-bg4"> <%# Eval("MESSAGE") %></div>  

    								 </div>
              </itemtemplate> 
    </asp:Repeater>

       
     <%--    <asp:GridView ID="GvBannerImages" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" DataKeyNames="ENQUIRYCONVERSATIONID" CellPadding="10" AlternatingRowStyle-BorderStyle="Outset" PageSize="100">
                        <RowStyle CssClass="GridRowStyle" />
                        <AlternatingRowStyle />
                        <HeaderStyle CssClass="GridHeaderStyle" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                </asp:TemplateField> 
                        <asp:BoundField DataField="TIME" HeaderText="Entry  Date / Time" 
                            SortExpression="TIME" />
                       
                        
                        <asp:BoundField DataField="MESSAGE" HeaderText="MESSAGE" 
                            SortExpression="MESSAGE" />
                         <asp:BoundField DataField="TRACKINGDATE" HeaderText="Next Tracking Date" 
                            SortExpression="TRACKINGDATE" />
                        
                    </Columns>
                </asp:GridView>
--%>


          </div>
             <asp:Label ID="filename" runat="server" Text="" Visible="False"></asp:Label>
      <asp:Label ID="fileId" runat="server" Text="" Visible="False"></asp:Label>
    
    <asp:Label ID="LblGridDataSource" runat="server" Text="" Visible="False"></asp:Label>
   
          
            </div>
            
            </div>
            
          
      </div>
      
       <div class="clearfix"></div>
       
              
                
                
           
        </div>
       

    </div>
  </div>

 
 
 
 
 
 
 
   </ContentTemplate>
   </asp:UpdatePanel>
   <div class="container-fluid footer">
<div class="container">

<div class="col-sm-12 col-xs-12 col-md-6">
All Rights Reserved @ KIMS Hospitals

</div>


<div class="col-sm-12 col-xs-12 col-md-6">
Designed & Developed by <a target="-blank" style="text-decoration:none;" href="http://www.mokshamedia.co.in/"><span style="color:#ec046a;font-weight:bold;font-size:12px;"> moksha</span><span style="color:#a4d845;font-weight:bold;font-size:12px;">media</span></a>

</div>


</div>

</div>
 
          </form>
 
    
 <div id="fb-root"></div>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
 
<script src="admin-files/_js/jquery-1.10.2.min.js"></script>
<script src="admin-files/_js/arrow88.js"></script>
<script src="admin-files/_js/bootstrap.min.js"></script>

<script>
    $('#myCarousel').carousel({
        interval: 4000
    });
</script>

    
    <script type="text/javascript">
        function toggleChevron(e) {
            $(e.target)
                .prev('.panel-heading')
                .find("i.indicator")
                .toggleClass('glyphicon-chevron-down glyphicon-chevron-up');
        }
        $('#accordion').on('hidden.bs.collapse', toggleChevron);
        $('#accordion').on('shown.bs.collapse', toggleChevron);
    </script>

</body>

</html>