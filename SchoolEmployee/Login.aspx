<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SchoolWeb.Login" %>
<!DOCTYPE html>

<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>SmartEDU - Education Responsive HTML5 Template</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="style.css">
    <!-- ALL VERSION CSS -->
    <link rel="stylesheet" href="css/versions.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">

    <!-- Modernizer for Portfolio -->
    <script src="js/modernizer.js"></script>
    
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body class="host_version">
    <form runat="server">
        
        <!-- Start header -->
        <header class="top-navbar">
           
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">
                    <a class="navbar-brand" href="index.html">
                        <img src="images/logo.png" alt="" />
                    </a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbars-host" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbars-host">
                        <ul class="navbar-nav ml-auto">
                            <li class="nav-item active"><a class="nav-link" href="index.html">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="about.html">About Us</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">Course </a>
                                <div class="dropdown-menu" aria-labelledby="dropdown-a">
                                    <a class="dropdown-item" href="course-grid-2.html">Course Grid 2 </a>
                                    <a class="dropdown-item" href="course-grid-3.html">Course Grid 3 </a>
                                    <a class="dropdown-item" href="course-grid-4.html">Course Grid 4 </a>
                                </div>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="dropdown-a" data-toggle="dropdown">Blog </a>
                                <div class="dropdown-menu" aria-labelledby="dropdown-a">
                                    <a class="dropdown-item" href="blog.html">Blog </a>
                                    <a class="dropdown-item" href="blog-single.html">Blog single </a>
                                </div>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="teachers.html">Teachers</a></li>
                            <li class="nav-item"><a class="nav-link" href="pricing.html">Pricing</a></li>
                            <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <!-- End header -->
        <div id="carouselExampleControls" class="carousel slide bs-slider box-slider" data-ride="carousel" data-pause="hover" data-interval="false">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleControls" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleControls" data-slide-to="1"></li>
                <li data-target="#carouselExampleControls" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
                <div class="carousel-item active">
                    <div id="home" class="first-section" style="background-image: url('images/slider-01.jpg');">
                        <div class="dtab">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 text-right">
                                        <div class="big-tagline">
                                            <h2><strong>SmartEDU </strong>education College</h2>
                                            <p class="lead">With Landigoo responsive landing page template, you can promote your all hosting, domain and email services. </p>
                                            <a href="#" class="hover-btn-new"><span>Contact Us</span></a>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<a href="#" class="hover-btn-new"><span>Read More</span></a>
                                        </div>
                                    </div>
                                </div>
                                <!-- end row -->
                            </div>
                            <!-- end container -->
                        </div>
                    </div>
                    <!-- end section -->
                </div>
                <div class="carousel-item">
                    <div id="home" class="first-section" style="background-image: url('images/slider-02.jpg');">
                        <div class="dtab">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 text-left">
                                        <div class="big-tagline">
                                            <h2 data-animation="animated zoomInRight">SmartEDU <strong>education school</strong></h2>
                                            <p class="lead" data-animation="animated fadeInLeft">With Landigoo responsive landing page template, you can promote your all hosting, domain and email services. </p>
                                            <a href="#" class="hover-btn-new"><span>Contact Us</span></a>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<a href="#" class="hover-btn-new"><span>Read More</span></a>
                                        </div>
                                    </div>
                                </div>
                                <!-- end row -->
                            </div>
                            <!-- end container -->
                        </div>
                    </div>
                    <!-- end section -->
                </div>
                <div class="carousel-item">
                    <div id="home" class="first-section" style="background-image: url('images/slider-03.jpg');">
                        <div class="dtab">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 text-center">
                                        <div class="big-tagline">
                                            <h2 data-animation="animated zoomInRight"><strong>VPS Servers</strong> Company</h2>
                                            <p class="lead" data-animation="animated fadeInLeft">
                                                1 IP included with each server 
											Your Choice of any OS (CentOS, Windows, Debian, Fedora)
											FREE Reboots
                                            </p>
                                            <a href="#" class="hover-btn-new"><span>Contact Us</span></a>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<a href="#" class="hover-btn-new"><span>Read More</span></a>
                                        </div>
                                    </div>
                                </div>
                                <!-- end row -->
                            </div>
                            <!-- end container -->
                        </div>
                    </div>
                    <!-- end section -->
                </div>
                <!-- Left Control -->
                <a class="new-effect carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="fa fa-angle-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>

                <!-- Right Control -->
                <a class="new-effect carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="fa fa-angle-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <div id="overviews" class="section wb">
            <div class="container">

                <div class="form-group">
                    <div class="col-sm-12">
                        <input id="txtUserName" class="form-control" runat="server" placeholder="Username" type="text">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-12">
                        <input id="txtPassword" class="form-control" runat="server" placeholder="Password" type="password">
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-10">
                        <asp:Button CssClass="btn btn-light btn-radius btn-brd grd1" ID="myBtn" runat="server" Text="Submit" OnClick="myBtn_Click" UseSubmitBehavior="false" />

                    </div>
                </div>

            </div>
            <!-- end container -->
        </div>
        <!-- end section -->
    </form>
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-xs-12">
                    <div class="widget clearfix">
                        <div class="widget-title">
                            <h3>About US</h3>
                        </div>
                        <p>Integer rutrum ligula eu dignissim laoreet. Pellentesque venenatis nibh sed tellus faucibus bibendum. Sed fermentum est vitae rhoncus molestie. Cum sociis natoque penatibus et magnis dis montes.</p>
                        <div class="footer-right">
                            <ul class="footer-links-soi">
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-github"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-dribbble"></i></a></li>
                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                            </ul>
                            <!-- end links -->
                        </div>
                    </div>
                    <!-- end clearfix -->
                </div>
                <!-- end col -->

                <div class="col-lg-4 col-md-4 col-xs-12">
                    <div class="widget clearfix">
                        <div class="widget-title">
                            <h3>Information Link</h3>
                        </div>
                        <ul class="footer-links">
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">Pricing</a></li>
                            <li><a href="#">About</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                        <!-- end links -->
                    </div>
                    <!-- end clearfix -->
                </div>
                <!-- end col -->

                <div class="col-lg-4 col-md-4 col-xs-12">
                    <div class="widget clearfix">
                        <div class="widget-title">
                            <h3>Contact Details</h3>
                        </div>

                        <ul class="footer-links">
                            <li><a href="mailto:#">info@yoursite.com</a></li>
                            <li><a href="#">www.yoursite.com</a></li>
                            <li>PO Box 16122 Collins Street West Victoria 8007 Australia</li>
                            <li>+61 3 8376 6284</li>
                        </ul>
                        <!-- end links -->
                    </div>
                    <!-- end clearfix -->
                </div>
                <!-- end col -->

            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </footer>
    <!-- end footer -->

    <div class="copyrights">
        <div class="container">
            <div class="footer-distributed">
                <div class="footer-center">
                    <p class="footer-company-name">All Rights Reserved. &copy; 2018 <a href="#">SmartEDU</a> Design By : <a href="https://html.design/">html design</a></p>
                </div>
            </div>
        </div>
        <!-- end container -->
    </div>
    <!-- end copyrights -->

    <a href="#" id="scroll-to-top" class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>

    <!-- ALL JS FILES -->
    <script src="js/all.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/custom.js"></script>
    <script src="js/timeline.min.js"></script>
    <script>
        timeline(document.querySelectorAll('.timeline'), {
            forceVerticalMode: 700,
            mode: 'horizontal',
            verticalStartPosition: 'left',
            visibleItems: 4
        });
    </script>
</body>
</html>
