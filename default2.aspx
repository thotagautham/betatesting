<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="default2.aspx.vb" Inherits="betatesting._default6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body >
      <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div class="container-fluid top-strip">
<div class="container">
<div class="col-lg-offset-9 col-lg-3  col-sm-offset-7 col-sm-5 ">
<ul class="nav-pills hidden-xs">
      <li><a href="media.html">Media</a></li>
      <li><a href="events.html">Events</a></li>
      
      <!-- <li><a href="careers.html">Careers</a></li> -->
      <li class="active"><a href="contact.html">Contact</a></li>
    </ul>

</div>
</div>
</div>

<div class="container main-nav">
  <div class="col-lg-7 col-md-6 col-sm-5"> <a href="index.html"><img src="kfrc-files/images/journallogo.jpg" class="img-responsive kfrdlogo" /></a> </div>
  <div class="col-lg-5 col-sm-7 col-md-6 col-xs-12"> <br />
    
    <div id="custom-search-input">
      <div class="input-group col-lg-offset-3 col-lg-7 col-md-offset-3 col-md-7 col-sm-offset-3 col-sm-7 inputright">
        <input type="text" class="  search-query form-control" placeholder="Search" />
        
        <span class="input-group-btn ">
        <button class="btn btn-danger" type="button"> <span class=" glyphicon glyphicon-search small"></span> </button>
        
        </span> </div>
    </div>
  </div>
</div>
<nav class="navbar navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <!-- <a class="navbar-brand" href="#">KFRC</a>--> 
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li ><a href="index.html">Home</a></li>
        <li><a href="about-journal.html">About Journal</a></li>
        <li><a href="editorial-board-members.html">Editorial Board</a></li>
        <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Instructions <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="authors.html">For Authors</a></li>
            <li><a href="reviewers.html">For Reviewers</a></li>
            <li><a href="editorial-board-members.html">For Editors</a></li>
          </ul>
        </li>
        <li><a href="current-issue.html">Current Issue</a></li><li><a href="archive.html">Archive</a></li><li><a href="authors-journal.html">Submit Manuscript</a></li>
       <!-- <li><a href="abstracts.html">Abstracts</a></li>-->
        <li><a href="call-for-papers.html" class="btn red" style="color:#fff">Call For Papers</a></li>
      </ul>
    </div>
    <!--/.nav-collapse --> 
  </div>
</nav>

<!--<img src="kfrc-files/kfrc-files/images/Journal-Banner.jpg" class="img-responsive" width="100%" />-->

<div class="container theme-showcase" role="main">
  <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12"> <br />
    <div id="myCarousel" class="carousel slide" data-ride="carousel"> 
      
      <!-- Wrapper for slides -->
      <div class="carousel-inner">
        <div class="item active"> <a href="#"> <img src="kfrc-files/images/Journal-Banner.jpg"> </a> 
          <!--<div class="carousel-caption">
            <h3>Headline</h3>
           <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr.</p></div>--> 
        </div>
        <!-- End Item -->
        
        <div class="item"> <a href="#"> <img src="kfrc-files/images/Journal-Banner.jpg"> </a> </div>
        <!-- End Item -->
        
        <div class="item"> <a href="#"> <img src="kfrc-files/images/Journal-Banner.jpg"> </a> </div>
        <!-- End Item -->
        
        <div class="item"> <a href="#"> <img src="kfrc-files/images/Journal-Banner.jpg"> </a> </div>
        <!-- End Item -->
        <div class="item"> <a href="#"> <img src="kfrc-files/images/Journal-Banner.jpg"> </a> </div>
        <!-- End Item -->
        <div class="item"> <a href="#"> <img src="kfrc-files/images/Journal-Banner.jpg"> </a> </div>
        <!-- End Item --> 
        
      </div>
      <!-- End Carousel Inner -->
      
      <div class="carousel slide" id="myCarousel"> 
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-slide-to="0" data-target="#myCarousel" class="active"></li>
          <li data-slide-to="1" data-target="#myCarousel"></li>
          <li data-slide-to="2" data-target="#myCarousel"></li>
          <li data-slide-to="3" data-target="#myCarousel"></li>
          <li data-slide-to="4" data-target="#myCarousel"></li>
        </ol>
      </div>
    </div>
    <!-- End Carousel -->
    
    <h3 class="graycolor">About the Journal</h3>
    <p> Journal of Medical and Scientific Research (JMSR) is an institutional journal published quarterly by the KIMS Foundation and Research Centre. The journal encourages submission of manuscripts with relevance to (but not limited to) clinical medicine, basic medical sciences, physiotherapy, pathology, biochemistry, surgical research, public health and epidemiology, pharmacology and traditional Indian medicine. The Journal also contains original research, review articles, case reports, editorials, news & commentary and letters to the editor. <br />
      The publication is developed under the direction of the JMSR Editorial Board. Contributors are invited to submit their manuscripts in English to the Editor for critical review. Manuscripts are electronically submitted. </p>
    <p> Journal of Medical and Scientific Research (JMSR) is an institutional journal published quarterly by the KIMS Foundation and Research Centre. The journal encourages submission of manuscripts with relevance to (but not limited to) clinical medicine, basic medical sciences, physiotherapy, pathology, biochemistry, surgical research, public health and epidemiology, pharmacology and traditional Indian medicine. The Journal also contains original research, review articles, case reports, editorials, news & commentary and letters to the editor. <br />
      The publication is developed under the direction of the JMSR Editorial Board. Contributors are invited to submit their manuscripts in English to the Editor for critical review. Manuscripts are electronically submitted. </p>
    <a href="about-journal.html" class="btn btn-sm btn-primary pull-right">Read more</a>
    <div class="clearfix"></div>
    <h3 class="graycolor">Latest Articles</h3>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 articles">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <h6>Research Article</h6>
        <a href="#">
        <h4>Effect of Low-Dose Aspirin on Candidate Biomarkers in the Urine Proteome</h4>
        </a> </div>
      <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
        <h5><a href="#">Journal of Lung, Pulmonary & Respiratory Research </a>- March 20, 2014</h5>
      </div>
      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"> <a href="#" class="btn btn-link Read more2">Read more</a> </div>
    </div>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 articles">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <h6>Research Article</h6>
        <a href="#">
        <h4>World Tuberculosis Day 2016</h4>
        </a> </div>
      <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
        <h5><a href="#">Journal of Lung, Pulmonary & Respiratory Research </a>- March 20, 2014</h5>
      </div>
      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"> <a href="#" class="btn btn-link Read more2">Read more</a> </div>
    </div>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 articles">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <h6>Research Article</h6>
        <a href="#">
        <h4>Colonic Tuberculosis</h4>
        </a> </div>
      <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
        <h5><a href="#">Journal of Lung, Pulmonary & Respiratory Research </a>- March 20, 2014</h5>
      </div>
      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"> <a href="#" class="btn btn-link Read more2">Read more</a> </div>
    </div>
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 articles">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <h6>Research Article</h6>
        <a href="#">
        <h4>Determination of Reaction Progress in the Enzymatic Hydrolysis of Seafood Processing Byproducts: A Simple Alternative to the Degree of Hydrolysis</h4>
        </a> </div>
      <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12">
        <h5><a href="#">Journal of Lung, Pulmonary & Respiratory Research </a>- March 20, 2014</h5>
      </div>
      <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"> <a href="#" class="btn btn-link Read more2">Read more</a> </div>
    </div>
    <a href="#" class="btn btn-link pull-right viewall">View All</a> </div>
  <!-- /.col-sm-4 -->
  
  <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
    <div class="list-group"> <a href="kfrc-files/images/kfrc-book.pdf" target="_blank"> <img src="kfrc-files/images/flyer.jpg" class="img-responsive" alt="flyer" width="769" height="440" /> </a></div><!-- <div class="row author"> <a href="authors-journal.html">
      <h3 class="graycolor">Authors Journal</h3>
      <h5>Click here to know more</h5>
      </a> </div> -->
      <h3 class="graycolor">Testimonials</h3>
      <div class="row testimonials">
        <div class="col-lg-4 col-md-4 col-sm-2 col-xs-12"><img src="kfrc-files/images/icon-img.jpg" class="img-responsive" /></div>
        <div class="col-lg-8 col-md-8 col-sm-10 col-xs-12">
          <p class="paramonials">Journal of Medical and Scientific Research (JMSR) is an institutional journal published</p>
          <a href="#" class="btn btn-link pull-right readmore">Read more</a> </div>
      </div>
      <div class="row testimonials">
        <div class="col-lg-4 col-md-4 col-sm-2 col-xs-12"><img src="kfrc-files/images/icon-img.jpg" class="img-responsive" /></div>
        <div class="col-lg-8 col-md-8 col-sm-10 col-xs-12">
          <p class="paramonials">Journal of Medical and Scientific Research (JMSR) is an institutional journal published</p>
          <a href="#" class="btn btn-link pull-right readmore">Read more</a> </div>
        <br />
        </div>
        <a href="#" class="btn btn-link pull-right viewall">
        View All</a> 
      <div class="clearfix"></div>
       <h3 class="graycolor">Subscription </h3>
      <form class="well2 form-horizontal" action=" " method="post"  id="contact_form">
        <fieldset>
          
          <!-- Form Name -->
          <legend>
         
          </legend>
          
          <!-- Text input-->
          
          <div class="form-group">
            <div class="col-md-12 inputGroupContainer">
              <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                <input  name="first_name" placeholder="Name" class="form-control"  type="text">
              </div>
            </div>
          </div>
          
          <!-- Text input-->
          <div class="form-group">
            <div class="col-md-12 inputGroupContainer">
              <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                <input name="email" placeholder="E-Mail Address" class="form-control"  type="text">
              </div>
            </div>
          </div>
          
          <!-- Text input-->
          
          
          
          <!-- Success message -->
          <div class="alert alert-success" role="alert" id="success_message">Success <i class="glyphicon glyphicon-thumbs-up"></i> Thanks for contacting us, we will get back to you shortly.</div>
          
          <!-- Button -->
          <div class="form-group">
            <div class="col-md-12">
              <button type="submit" class="btn btn-warning  center-block" >Submit <span class="glyphicon glyphicon-envelope"></span></button>
            </div>
          </div>
        </fieldset>
      </form>
    </div>
  </div>
  <!-- /.col-sm-4 --> 
  

<!-- /container -->

<div class="container-fluid panel-footer">
  <div class="container">
    
      <div class="col-lg-9 col-md-9 col-sm-12 col-xs-12 ">
      <ul class="row footer-nav">
        <li class="active"><a href="index.html">Home</a></li>
        <li><a href="about-journal.html">About Journal</a></li>
        
        
        <li><a href="current-issue.html">Current Issue</a></li><li><a href="archive.html">Archive</a></li><li><a href="authors-journal.html">Submit Manuscript</a></li>
       <!-- <li><a href="abstracts.html">Abstracts</a></li>-->
        <li><a href="call-for-papers.html">Call For Papers</a></li>
        <li><a href="media.html">Media</a></li>
      <li><a href="events.html">Events</a></li>
      
      <!-- <li><a href="careers.html">Careers</a></li> -->
      <li><a href="contact.html">Contact</a></li>
      </ul>
      
       </div>
      <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12 socialbg">
       
          <div class="social-network"><a href="#" class="icoFacebook" title="Facebook"><img src="kfrc-files/images/facebook.png" /></a>
          <a href="#" class="icoTwitter" title="Twitter"><img src="kfrc-files/images/linkedin.png" /></a>
          <a href="#" class="icoLinkedin" title="Linkedin"><img src="kfrc-files/images/twitter.png" /></a></div>
       
      </div>
   
  
  </div>
</div>
<div class="container-fluid panel-footer2">
  <div class="container">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
      <p class="companytext">Copyrights © 2016. All Rights Reserved. <a href="#" style="color:#fff; text-align:center;"> <u>Privacy Policy</u></a></p>
      <p class="companytext">Designed & Developed by <a href="http://www.mokshamedia.co.in/" target="_blank" style="text-align:center;">moksha<span>media</span></a></p>
    </div>
  </div>
</div>

<!-- Bootstrap core JavaScript
    ================================================== --> 
<!-- Placed at the end of the document so the pages load faster --> 
<script src="kfrc-files/js/jquery.min.js"></script> 
<script>window.jQuery || document.write('<script src="kfrc-files/js/vendor/jquery.min.js"><\/script>')</script> 
<script src="kfrc-files/js/bootstrap.min.js"></script> 
<script src="kfrc-files/js/docs.min.js"></script> 
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug --> 
<script src="kfrc-files/js/ie10-viewport-bug-workaround.js"></script> 
<script>
    (function blink() {
        $('.blink_text').fadeOut(500).fadeIn(500, blink);
    })();

</script>

<script>
    $('#myCarousel').carousel({
        interval: 4000
    });

    var clickEvent = false;
    $('#myCarousel').on('click', '.nav a', function () {
        clickEvent = true;
        $('.nav li').removeClass('active');
        $(this).parent().addClass('active');
    }).on('slid.bs.carousel', function (e) {
        if (!clickEvent) {
            var count = $('.nav').children().length - 1;
            var current = $('.nav li.active');
            current.removeClass('active').next().addClass('active');
            var id = parseInt(current.data('slide-to'));
            if (count == id) {
                $('.nav li').first().addClass('active');
            }
        }
        clickEvent = false;
    });
</script> 
<script>

    $(document).ready(function () {
        $('#contact_form').bootstrapValidator({
            // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                first_name: {
                    validators: {
                        stringLength: {
                            min: 2,
                        },
                        notEmpty: {
                            message: 'Please supply your first name'
                        }
                    }
                },
                last_name: {
                    validators: {
                        stringLength: {
                            min: 2,
                        },
                        notEmpty: {
                            message: 'Please supply your last name'
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            message: 'Please supply your email address'
                        },
                        emailAddress: {
                            message: 'Please supply a valid email address'
                        }
                    }
                },
                phone: {
                    validators: {
                        notEmpty: {
                            message: 'Please supply your phone number'
                        },
                        phone: {
                            country: 'US',
                            message: 'Please supply a vaild phone number with area code'
                        }
                    }
                },
                address: {
                    validators: {
                        stringLength: {
                            min: 8,
                        },
                        notEmpty: {
                            message: 'Please supply your street address'
                        }
                    }
                },
                city: {
                    validators: {
                        stringLength: {
                            min: 4,
                        },
                        notEmpty: {
                            message: 'Please supply your city'
                        }
                    }
                },
                state: {
                    validators: {
                        notEmpty: {
                            message: 'Please select your state'
                        }
                    }
                },
                zip: {
                    validators: {
                        notEmpty: {
                            message: 'Please supply your zip code'
                        },
                        zipCode: {
                            country: 'US',
                            message: 'Please supply a vaild zip code'
                        }
                    }
                },
                comment: {
                    validators: {
                        stringLength: {
                            min: 10,
                            max: 200,
                            message: 'Please enter at least 10 characters and no more than 200'
                        },
                        notEmpty: {
                            message: 'Please supply a description of your project'
                        }
                    }
                }
            }
        })
            .on('success.form.bv', function (e) {
                $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                $('#contact_form').data('bootstrapValidator').resetForm();

                // Prevent form submission
                e.preventDefault();

                // Get the form instance
                var $form = $(e.target);

                // Get the BootstrapValidator instance
                var bv = $form.data('bootstrapValidator');

                // Use Ajax to submit form data
                $.post($form.attr('action'), $form.serialize(), function (result) {
                    console.log(result);
                }, 'json');
            });
    });


    </script>
          </form>
</body>
</html>
