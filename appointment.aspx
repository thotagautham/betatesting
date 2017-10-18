<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="appointment.aspx.vb" Inherits="betatesting.appointment" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>



<link rel="icon" href="/favicon.png">

<!-- Bootstrap -->
<!-- Bootstrap -->
<link href="/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="/css/bootstrap.css" rel='stylesheet' type='text/css' />
<meta name="viewport" content="width=device-width, initial-scale=1">

<!----font-Awesome----->
<link rel="stylesheet" type="text/css" href="/fonts/stylesheet.css">
<link rel="stylesheet" type="text/css" href="/css/srihamsastyle.css">
<link rel="stylesheet" type="text/css" href="/font-awesome/css/font-awesome.css">
<!----font-Awesome----->
<link rel="stylesheet" type="text/css" href="/css/jquery.smartmenus.bootstrap.css">




    <link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet"
        type="text/css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

    <script type="text/javascript">
        //disable sunday
        function detect_sunday(sender, args) {
            if (sender._selectedDate.getDay() == 0) {
                sender._selectedDate = new Date();
                // set the date back to the current date
                sender._textbox.set_Value(sender._selectedDate.format(sender._format));
                alert("You can't select sunday!");
            }
        }
    </script>




    <script language="javascript">
        $(document).ready(function () {
            $("#txtdate1").datepicker({
                minDate: 1,
                maxDate: 90,
                beforeShowDay: noSunday
            });
            function noSunday(date) {
                var day = date.getDay();
                return [(day > 0), ''];
            };
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


    
 

        
 <div>
   

<div class="container-fluid logoboxbg">
<div class="container">
<div class="col-md-8 co1-xs-12 col-sm-9 logobox"> <a href="/"><img src="../images/link-logo-img-main.png" class="img-responsive site-logo" style="float:left" /> <span>Sri Hamsa Advanced Skin, Laser & Hair Clinic</span> </a></div>
<div class="col-md-4 co1-xs-12 col-sm-3"> <h4 class="contactnum">Call: +91 95534 56788</h4></div>
</div>
</div>

<div class="clearfix"></div><div class="container-fluid ">
  <div class="container logoboxbg" style="margin-top:20px;">
  
    <div class="row">
      <nav class="navbar navbar-default">
        <div class="container"> 
          <!-- Brand and toggle get grouped for better mobile display -->
          
          <div class="navbar-header center-block">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
          </div>
          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    	 
            <ul class="nav navbar-nav"> 
			<li> <a href="/">HOME</a></li>
			<li> <a href="/aboutus/">ABOUT SRIHAMSA </a></li>
              <li class="dropdown">
              <a style="cursor:pointer;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">SERVICES <span class="caret" ></span></a>
              <ul class="dropdown-menu instdep3">
                <div class="container">
                  <li class="co-xs-12 col-sm-4 col-md-4">
                    <ul>
                      <li class="dropdown-header"><br />
                      </li>
                      <h4>COSMETIC DERMATOLOGY</h4>
                      <li><a href="/skin-procedures/" style="color:#a5216c"> SKIN PROCEDURES </a></li>
                      <li><a href="/hair-procedures/" style="color:#a5216c"> HAIR PROCEDURES </a></li>
                      <h4>DIAGNOSTIC DERMATOLOGY</h4>
                      <li><a href="/patch-test/" style="color:#a5216c"> PATCH TEST</a></li>
                      <li><a href="/skin-biopsy/" style="color:#a5216c"> SKIN BIOPSY</a></li>
                      
                    </ul>
                  </li>
                  <li class="co-xs-12 col-sm-4 col-md-4">
                    <ul>
                      <li class="dropdown-header"><br />
                      </li>
                     
                       <h4>LASER</h4>
                      <li><a href="/laser-for-acne-scar/" style="color:#a5216c"> LASERS FOR ACNE SCARS </a></li>
                      <li><a href="/laser-hair-removal/" style="color:#a5216c"> LASER HAIR REMOVAL </a></li>
                      <li><a href="/Lasers-therapy-for-hair-loss/" style="color:#a5216c"> LASER THERAPY FOR HAIR LOSS </a></li>
                      
                      <li><a href="/lasers-for-rejuvenation/" style="color:#a5216c"> LASERS FOR REJUVENATION </a></li>
                     
                      
                     
                    </ul>
                  </li>
                  <li class="co-xs-12 col-sm-4 col-md-4">
                  <li class="dropdown-header"><br />
                  </li>
                   <h4>DERMATOSURGERY</h4>
                  <li><a href="/radiofrequency-surgery/" style="color:#a5216c">RADIOFREQUENCY SURGERY</a></li>
                  <li><a href="/electrosurgery/" style="color:#a5216c"> ELECTROSURGERY</a></li>
                  <li><a href="/Intralesional-therapy/" style="color:#a5216c"> INTRALESIONAL THERAPY</a></li>
                  
                  
                   <h4><a href="/medical-dermatology/" style="color:#424242;"> MEDICAL DERMATOLOGY </a></h4>
                  </li>
                </div>
              </ul>
              </li>
              <li class="dropdown">
              <a style="cursor:pointer;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">PROCEDURES <span class="caret"></span></a>
              <ul class="dropdown-menu instdep5">
                <div class="container">
                  <li class="co-xs-12 col-sm-4 col-md-4">
                    <ul>
                      <li class="dropdown-header"><br />
                      </li>
                      <li><a href="/chemical-peels/">CHEMICAL PEELS</a></li>
                      <li><a href="/microdermabrsion/">MICRODERMABRASION (SKIN POLISHING)</a></li>
                      <li><a href="/laser-hair-removal/">LASER HAIR REMOVAL</a></li>
                      <li><a href="/laser-for-acne-scar/">LASERS FOR ACNE SCARS</a></li>
                      <li><a href="/tca-cross-technique/">TCA CROSS FOR ACNE SCARS </a></li>
                      <li><a href="/radiofrequency-surgery/">RADIOFREQUENCY SURGERY</a></li>
                      <li><a href="/lasers-for-rejuvenation/">LASERS FOR REJUVENATION</a></li>
                    </ul>
                  </li>
                  <li class="co-xs-12 col-sm-4 col-md-4">
                    <ul>
                      <li class="dropdown-header"><br />
                      </li>
                      <li><a href="/subcision/"> SUBCISION</a></li>
                      <li><a href="/electrosurgery/">ELECTROSURGERY</a></li>
                      <li><a href="/mesotherapy/"> MESOTHERAPY</a></li>
                      <li><a href="/platelet-rich-plasma-therapy/"> PLATELET RICH PLASMA THERAPY </a></li>
                      
                      <li><a href="/mesobotox/"> MESOBOTOX </a></li>
                      <li><a href="/microneedling/"> MICRONEEDLING (DERMAROLLER) </a></li>
                    </ul>
                  </li>
                  <li class="co-xs-12 col-sm-4 col-md-4">
                  <li class="dropdown-header"><br />
                  </li>
                  <li><a href="/Intralesional-therapy/">INTRALESIONAL THERAPY </a></li>
                  <li><a href="/Periorbital-rejuvenation/"> PERIORBITAL REJUVENATION </a></li>
                  <li><a href="/fillers/">FILLERS</a></li>
                  <li><a href="/botox/">  BOTULINUM TOXIN - A (BOTOX) </a></li>
                  <li><a href="/skin-biopsy/">SKIN BIOPSY</a></li>
                  <li><a href="/patch-test/">PATCH TEST</a></li>
                  <li><a href="/Lasers-therapy-for-hair-loss/">LASER THERAPY FOR HAIR LOSS </a></li>
                  </li>
                </div>
              </ul>
              </li>
               <li><a href="/media/">MEDIA</a></li>
              <li><a href="/gallery/">GALLERY</a></li>
              <li><a href="/blogs/">BLOGS</a></li>
              <li><a href="/contactus/">CONTACT US</a></li>

            </ul>
          </div>
          <!-- /.navbar-collapse --> 
        </div>
        <!-- /.container-fluid --> 
      </nav>
    </div>
  </div>
</div>
<div class="clearfix"></div>
<div class="container-fluid well">
  <div class="container skinbannerdesktop">
    <div class="row">
      <div class="well"> 
        <!-- Carousel
            ================================================== -->
        <div id="myCarousel" class="carousel slide">
          <div class="carousel-inner">
            <div class="item active">
              <div class="row">
			  <div class="col-md-2">
                  <a href="/chemical-peels/"> <div class="thumbnail"> <img src="../images/Chemical-Peel-3.png" alt="Slide11" class="img-circle"> 
                    <div class="caption">
                      <h4>Chemical Peel</h4>
                    </div> 
                  </div> </a>
                </div>
			  <div class="col-md-2">
                  <a href="/microdermabrsion/"> <div class="thumbnail"> <img src="../images/Microdermabrasion-6.png" alt="Slide11" class="img-circle">
                    <div class="caption">
                      <h4>Microdermabrasion (Skin Polishing)</h4>
                    </div>
                  </div> </a>
                </div>
			  <div class="col-md-2">
                 <a href="/laser-hair-removal/">  <div class="thumbnail"> <img src="../images/Laser Hair Removal-4.png" alt="Slide11" class="img-circle">
                    <div class="caption">
                      <h4>Laser Hair Removal</h4>
                    </div>
                  </div> </a>
                </div>
				
						
				<div class="col-md-2">
                 <a href="/laser-for-acne-scar/">  <div class="thumbnail"> <img src="../images/acne-scars-12.png" alt="Slide11" class="img-circle">
                    <div class="caption">
                      <h4>Lasers For Acne scars</h4>
                    </div>
                  </div> </a>
                </div>
				
                <div class="col-md-2">
                 <a href="/laser-hair-removal/">  <div class="thumbnail"> <img src="../images/periorbital-rejuvination.png" alt="Slide11" class="img-circle"> <div class="caption">
                      <h4>Periorbital Rejuvenation</h4>
                    </div>
                  </div> </a>
                </div>
                
                
                <div class="col-md-2">
                  <a href="/lasers-for-rejuvenation/"> <div class="thumbnail"> <img src="../images/Anti-Ageing-Rejuvination-1.png" alt="Slide11" class="img-circle">
                    <div class="caption">
                      <h4>Lasers  For Rejuvenation</h4>
                    </div>
                  </div></a>
                </div>
				
				
				
				
              </div>
            </div>
            <div class="item">
              <div class="row">
                <div class="col-md-2">
                 <a href="/subcision/">  <div class="thumbnail"> <img src="../images/Subcision.png" alt="Slide11" class="img-circle">
                    <div class="caption">
                      <h4>Subcision</h4>
                    </div>
                  </div> </a>
                </div>
				
				 <div class="col-md-2">
                <a href="/electrosurgery/">   <div class="thumbnail"> <img src="../images/Electrosurgery.png" alt="Slide11" class="img-circle">
                    <div class="caption">
                      <h4>Electrosurgery</h4>
                    </div>
                  </div> </a>
                </div>
				
				 <div class="col-md-2">
                 <a href="/mesotherapy/">  <div class="thumbnail"> <img src="../images/Medical-Dermatology.png" alt="Slide11" class="img-circle">
                    <div class="caption">
                      <h4>Mesotherapy</h4>
                    </div>
                  </div> </a>
                </div>
				 <div class="col-md-2">
                 <a href="/platelet-rich-plasma-therapy/">  <div class="thumbnail"> <img src="../images/PRP-10.png" alt="Slide11" class="img-circle">
                    <div class="caption">
                      <h4>Platelet Rich Plasma Therapy</h4>
                    </div>
                  </div> </a>
                </div>
				<div class="col-md-2">
                <a href="/fillers/">   <div class="thumbnail"> <img src="../images/Depositphotos1.png" alt="Slide11" class="img-circle">
                    <div class="caption">
                      <h4>Fillers</h4>
                    </div>
                  </div> </a>
                </div>
                <div class="col-md-2">
                 <a href="/botox/">  <div class="thumbnail"> <img src="../images/Botox-2.png" alt="Slide11" class="img-circle">
                    <div class="caption">
                      <h4>  BOTULINUM TOXIN - A (BOTOX) </h4>
                    </div>
                  </div> </a>
                </div>
                
               
                
              </div>
            </div>
            <div class="item">
              <div class="row">
                <div class="col-md-2">
                 <a href="/microneedling/">  <div class="thumbnail"> <img src="../images/Depositphotos.png" alt="Slide11" class="img-circle">
                    <div class="caption">
                      <h4>Microneedling (Dermaroller)</h4>
                    </div>
                  </div> </a>
                </div>
                <div class="col-md-2">
                <a href="/Lasers-therapy-for-hair-loss/">   <div class="thumbnail"> <img src="../images/Hair-loss.png" alt="Slide11" class="img-circle">
                    <div class="caption">
                      <h4>Laser Therapy For Hair Loss</h4>
                    </div>
                  </div> </a>
                </div>
                  <div class="col-md-2">
                <a href="/botox/">   <div class="thumbnail"> <img src="../images/Botulinum-Toxin-8.png" alt="Slide11" class="img-circle">
                    <div class="caption">
                      <h4>TCA Cross for Acne Scars</h4>
                    </div>
                  </div> </a>
                </div>
                
                
                <div class="col-md-2">
                 <a href="/skin-biopsy/">  <div class="thumbnail"> <img src="../images/Skin-Biopsy-new.png" alt="Slide11" class="img-circle">
                    <div class="caption">
                      <h4>Skin Biopsy</h4>
                    </div>
                  </div> </a>
                </div>
				
				 <div class="col-md-2">
                 <a href="/patch-test/">  <div class="thumbnail"> <img src="../images/Skin-Patch-11.png" alt="Slide11" class="img-circle">
                    <div class="caption">
                      <h4>Patch Test</h4>
                    </div>
                  </div> </a>
                </div>
				
                
                <div class="col-md-2">
                <a href="/medical-dermatology/">   <div class="thumbnail"> <img src="../images/Skin-Biopsy-7.png" alt="Slide11" class="img-circle">
                    <div class="caption">
                      <h4>Medical Dermatology</h4>
                    </div>
                  </div> </a>
                </div>
                
               
                
				
				
				
             
               
                
              </div>
            </div>
          </div>
          <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
          </ol>
		   <div class="carousel-controls"> <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="fa fa-chevron-right"></span></a> <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="fa fa-chevron-left"></span></a> </div>
        </div>
        <!-- End Carousel --> 
      </div>
      <!-- End Well --> 
    </div>
  </div>
</div>
<!---end banner desktop ---> 




<!---start small screen --->
<div class="container skinbanner">
  <div class="row">
    <div class="col-md-3"> 
      <!-- Carousel
            ================================================== -->
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="item active">
            <div class="thumbnail"> <img src="../images/Anti Ageing Rejuvination-1.png" alt="Slide11" class="img-circle">
                    <div class="caption">
                      <h4>Anti Ageing Rejuvination</h4>
              </div>
            </div>
          </div>
          <!-- End Item -->
          <div class="item">
            <div class="thumbnail"> <img src="../images/Botox-2.png" alt="Slide11" class="img-circle">
                    <div class="caption">
                      <h4>  BOTULINUM TOXIN - A (BOTOX) </h4>
              </div>
            </div>
          </div>
          <!-- End Item -->
          <div class="item">
            <div class="thumbnail"> <img src="../images/Botox-2.png" alt="Slide11" class="img-circle">
                    <div class="caption">
                      <h4>  BOTULINUM TOXIN - A (BOTOX) </h4>
              </div>
            </div>
          </div>
          <!-- End Item --> 
        </div>
        <!-- End Carousel Inner -->
        <div class="carousel-controls"> <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="fa fa-chevron-right"></span></a> <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="fa fa-chevron-left"></span></a> </div>
      </div>
      <!-- /.carousel --> 
    </div>
  </div>
</div>
<!---end small screen --->
<div class="container">
<a href="/book-an-appointment/"><div class="col-xs-12 col-sm-4 col-md-4 btntextheader"> 
    <h3> BOOK AN APPOINTMENT </h3>
    
    <div class="link-logo-img"></div>
  </div></a>
  
  <a href="/testimonials/"> <div class="col-xs-12 col-sm-4 col-md-4 btntextheader">
    <h3> TESTIMONIALS </h3>
  
    <div class="link-logo-img"></div>
  </div>
    </a>
 
  <a href="/clinic-locator/"><div class="col-xs-12 col-sm-4 col-md-4 btntextheader"> 
    <h3> CLINIC LOCATOR </h3>
  
    <div class="link-logo-img"></div>
  </div>  </a>
</div>
<div class="clearfix"></div>

    
    
    <div class="container welcomebg" style="margin-top:20px;"> 
  <!--  <div class="welcomebgimg"></div>-->
  <div class="col-xs-12 col-sm-12 col-md-12">
 <h2 align="center"> Book  An Appointment</h2>
      <div class="col-xs-12 col-sm-12 col-md-2"></div> 
      <div class="col-xs-12 col-sm-12 col-md-8"><div>
     
<asp:TextBox ID="TxtName" runat="server" MaxLength="50" CssClass="form-control" Text="Type Name*" autocomplete="off" onfocus="Trim(this);this.value == 'Type Name*' ? this.value='' : Trim(this);" onblur="Trim(this);this.value == '' ? this.value='Type Name*' : Trim(this);"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVName" runat="server" 
                        ControlToValidate="TxtName" ErrorMessage="Enter Name" 
                        Display="None" ValidationGroup="VGEnquiry" InitialValue="Type Name*"> </asp:RequiredFieldValidator>
                        
                        
                        
                        
  <asp:TextBox ID="TxtEmailID" runat="server" MaxLength="75"  CssClass="form-control" Text="Type Email*" autocomplete="off" onfocus="Trim(this);this.value == 'Type Email*' ? this.value='' : Trim(this);" onblur="Trim(this);this.value == '' ? this.value='Type Email*' : Trim(this);"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVEmailId" runat="server" 
                    ControlToValidate="TxtEmailID" Display="None" ErrorMessage="Enter Email Id" ValidationGroup="VGEnquiry" InitialValue="Type Email*"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="REVEmailId" runat="server" 
                    ControlToValidate="TxtEmailID" Display="None" 
                    ErrorMessage="Invalid Email ID" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="VGEnquiry"> </asp:RegularExpressionValidator>
                    
                    
                    
<asp:TextBox id="TxtTelephone"  runat="server" Text="Type Mobile Number*" autocomplete="off" onfocus="Trim(this);this.value == 'Type Mobile Number*' ? this.value='' : Trim(this);" onblur="Trim(this);this.value == '' ? this.value='Type Mobile Number*' : Trim(this);" CssClass="form-control"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RFVMobile" runat="server" 
                  ControlToValidate="TxtTelephone" Display="None" ErrorMessage="Please Enter Mobile Number" 
                  ValidationGroup="VGEnquiry" InitialValue="Type Mobile Number*"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="REVMobile" runat="server" 
                  ControlToValidate="TxtTelephone" Display="None" 
                  ErrorMessage="Invalid Mobile Number" ValidationExpression="[0-9]*" 
                  ValidationGroup="VGEnquiry"></asp:RegularExpressionValidator> 
                  
                  
                  

<asp:TextBox ID="TxtCountry" runat="server" MaxLength="50" CssClass="form-control" Text="Type Country*" autocomplete="off" onfocus="Trim(this);this.value == 'Type Country*' ? this.value='' : Trim(this);" onblur="Trim(this);this.value == '' ? this.value='Type Country*' : Trim(this);"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVCountry" runat="server" 
                        ControlToValidate="TxtCountry" ErrorMessage="Type Country" 
                        Display="None" ValidationGroup="VGEnquiry" InitialValue="Type Country*"> </asp:RequiredFieldValidator>   
                        
                        
                        
 <asp:TextBox ID="TxtState" runat="server" MaxLength="50" CssClass="form-control" Text="Type State*" autocomplete="off" onfocus="Trim(this);this.value == 'Type State*' ? this.value='' : Trim(this);" onblur="Trim(this);this.value == '' ? this.value='Type State*' : Trim(this);"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RFVState" runat="server" 
                        ControlToValidate="TxtState" ErrorMessage="Type Country" 
                        Display="None" ValidationGroup="VGEnquiry" InitialValue="Type State*"> </asp:RequiredFieldValidator>  
                        
                        
       <asp:TextBox ID="txtdate1" runat="server" CssClass="form-control" placeholder="mm/dd/year" Width="100%"></asp:TextBox>
      <%-- <asp:TextBox id="AppointmentDate"  runat="server"></asp:TextBox>
                <asp:ImageButton id="Image1" runat="Server" ImageUrl="~/images/Calendar_scheduleHS.png" AlternateText="Click to show calendar" CausesValidation="False"></asp:ImageButton>
                      <cc1:calendarextender id="CalendarExtender1" runat="server" PopupButtonID="Image1" 
                  TargetControlID="AppointmentDate" onclientdateselectionchanged="checkDate"></cc1:calendarextender>
                      <asp:RequiredFieldValidator ID="RFVDate" runat="server" 
                  ControlToValidate="AppointmentDate" Display="None" 
                  ErrorMessage="Please Enter Appointment Date" ValidationGroup="Appointment"></asp:RequiredFieldValidator>
                      <asp:CompareValidator ID="CVCheckInDate" runat="server" 
                        ErrorMessage="Invalid Check In Date" ControlToValidate="AppointmentDate" 
                        Display="None" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                        --%>
                        
                                                              
<asp:TextBox ID="TxtComments" runat="server" Rows="2" TextMode="MultiLine" Columns="25" Text="Type Message" CssClass="form-control" autocomplete="off" onfocus="Trim(this);this.value == 'Type Message' ? this.value='' : Trim(this);" onblur="Trim(this);this.value == '' ? this.value='Type Message' : Trim(this);" ></asp:TextBox >
        <asp:RequiredFieldValidator ID="RFVComments" runat="server" ControlToValidate="TxtComments" Display="None" ValidationGroup="VGEnquiry" ErrorMessage="Enter Comments" InitialValue="Type Message"></asp:RequiredFieldValidator>                                     

             <img src="/jpegimage.aspx" width="180" style="margin-top:5px" />
            
              <asp:TextBox ID="TxtKeyValue" class="forminputtextfieldapp" runat="server" Text="Enter Key Value" autocomplete="off" onfocus="Trim(this);this.value == 'Enter Key Value' ? this.value='' : Trim(this);" onblur="Trim(this);this.value == '' ? this.value='Enter Key Value' : Trim(this);"></asp:TextBox>
         
            
          <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>



 <asp:Button ID="btnSave" runat="server" Text="SUBMIT" ValidationGroup="VGEnquiry"  CssClass="btn btn-default center-block submit" />
          <asp:Button ID="btnreset" runat="server" Text="RESET"  CssClass="btn btn-default center-block submit" />
      
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" ValidationGroup="VGEnquiry" />

    </div></div>
       
   
    <div class="col-xs-12 col-sm-12 col-md-2"></div>

   
    </div>
 
</div>
<div class="clearfix"></div>



  
</div>
<div class="clearfix"></div>


<div class="viedobg">
  <div class="container">
    <div class="row">
      <div class="col-xs-12 col-sm-6 col-md-6">
        <h2>Sri Hamsa Location Map</h2>
        <!-- Carousel
            ================================================== --> <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3807.04901790358!2d78.48559431539213!3d17.409435106749914!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bcb99e8bee0d13d%3A0xbc9cf191c1451ce4!2sSri+Hamsa+Advanced+Skin%2C+Laser+%26+Hair+Clinic!5e0!3m2!1sen!2sin!4v1464849054311" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
        <br>
        <small><a style="color:#fff;text-align:left" href="https://www.google.co.in/maps/place/Sri+Hamsa+Advanced+Skin,+Laser+%26+Hair+Clinic/@17.4165257,78.5038545,14.25z/data=!4m5!3m4!1s0x0:0xbc9cf191c1451ce4!8m2!3d17.40943!4d78.487783">View Larger Map</a></small> 
        <!-- End Carousel --> 
      </div>
      <div class="col-xs-12 col-sm-6 col-md-6 ">
        <h2>Contact Us</h2>
        <address>
        Sri Hamsa Advanced Skin, Laser & Hair Clinic<br />
        First Floor, Above Bakezone Bakery,<br />
        Aishwarya Towers, Indira Park- Ramakrishna Mutt Main Road,<br />
        Opp. NTR Stadium,<br />
        Ashok Nagar,<br />
        Hyderabad-500029<br />
        Telangana<br />
        INDIA<br /><br />T: <a  href="tel:+919553456788 " style=" color:#fff;"> 95534 56788</a><br />
E: <a  href="mailto: drshakuntala@srihamsaskinclinic.com " style=" color:#fff;"> drshakuntala@srihamsaskinclinic.com </a><br /> </address>
      </div>
    </div>
  </div>
</div>
        <div class="clearfix"></div>
<div class="container-fluid footerbg">
  <div class="container">
    <div class="col-xs-12 col-sm-4 col-md-6 textleft">
      Copyright &copy; Sri Hamsa. All Rights Reserved.
    </div>
    <div class="col-xs-12 col-sm-4 col-md-2"><a href="/disclaimer/" class="footerlink">Disclaimer</a> </div>
    <div class="col-xs-12 col-sm-4 col-md-4 textright">
      Designed & Developed by <a href="http://www.mokshamedia.co.in/" target="_blank"> moksha<span>media</span></a>
    </div>
    
  </div>

</div>
        <div class="clearfix"></div>

        

   <script language="javascript" type="text/javascript">

       function search() {
           location.href = '/search.aspx?search=' + document.getElementById("txtSearch").value;
       }
    
       function checkDate(sender, args) 
       {
           var today = new Date();
           if (sender._selectedDate < today.setDate(today.getDate() + 1)) {
               alert("You can select a day after 1 days from now!..");
               var date = new Date();
               date.setDate(date.getDate() + 1);
               sender._selectedDate = date;
               // set the date back to the current date
               document.getElementById('<%= txtdate1.ClientID%>').value = sender._selectedDate.format(sender._format);
            //sender._textbox.set_Value(sender._selectedDate.format(sender._format))
        }
    }
    
  <%--  function ValidateKeyValue(source, args)
    {
        if(document.getElementById('<%= TxtKeyValue.ClientID %>').value == <%= Session("CaptchaImageText") %>)
        {
            args.IsValid = true; 
    }
    else
    {
            args.IsValid = false;
    }
    } 

    function getEmergencyNumber(ctl) {
        document.getElementById("showEmergencyNumber").innerHTML = ctl.options[ctl.options.selectedIndex].value;
    }
--%>

    


</script>


    </form>
</body>
</html>