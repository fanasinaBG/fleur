<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>
<%@ page import="fleur.Fonction" %>
<%@ page import="connection.DatabaseConnection" %>



<!DOCTYPE html>
<html lang="en">
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <!-- mobile metas -->

      <!-- site metas -->
      <title>Greeno</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" href="assets/css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" href="assets/css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="assets/css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="assets/images/fevicon.png" type="image/gif" />
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="assets/css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
      <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
   </head>
   <!-- body -->
   <body class="main-layout">
      <!-- loader  -->
   
      <!-- end loader -->
      <!-- header -->
       <h1>Liste des fleurs et leurs prix</h1>
    <%
        // Instancier la classe pour récupérer les données
        Fonction fonction = new Fonction();
        List<String> fleurs = fonction.fetchFleursCategories();
    %>
    <ul>
        <%              
            for (String fleur : fleurs) {
        %>
            <li><%= fleur %></li>
        <% 
            }
        %>
    </ul>
      <header>
         <!-- header inner -->
         <div class="header">
            <div class="container">
               <div class="row">
                  <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                     <div class="full">
                        <div class="center-desk">
                           <div class="logo"> <a href="index.html"><img src="assets/logo.png" alt="#"></a> </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                     <div class="menu-area">
                        <div class="limit-box">
                           <nav class="main-menu">
                              <ul class="menu-area-main">
                                 <li class="active"> <a href="#">Home</a> </li>
                                 <li> <a href="#about">About</a> </li>
                                 <li><a href="#plant">Plant</a></li>
                                 <li><a href="#gallery">Gallery</a></li>
                                 <li><a href="#contact">Contact Us</a></li>
                                 <li class="last"><a href="#"><img src="assets/search_icon.png" alt="icon"/></a></li>
                              </ul>
                           </nav>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         <!-- end header inner -->
      </header>
      <!-- end header -->
      <section >
         <div id="main_slider" class="carousel slide banner-main" data-ride="carousel">
            <ol class="carousel-indicators">
               <li data-target="#main_slider" data-slide-to="0" class="active"></li>
               <li data-target="#main_slider" data-slide-to="1"></li>
               <li data-target="#main_slider" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
               <div class="carousel-item active">
                  <div class="container">
                     <div class="row marginii">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                           <div class="carousel-caption ">
                              <h1>Welcome To The <strong class="color">Nutrients Plants</strong></h1>
                              <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using</p>
                              <a class="btn btn-lg btn-primary" href="#" role="button">About</a>
                              <a class="btn btn-lg btn-primary" href="#" role="button">Contact US</a>
                           </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                           <div class="img-box">
                              <figure><img src="assets/gyufyufyu.png" alt="img"/></figure>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container">
                     <div class="row marginii">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                           <div class="carousel-caption ">
                              <h1>Welcome To The <strong class="color">Nutrients Plants</strong></h1>
                              <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using</p>
                              <a class="btn btn-lg btn-primary" href="#" role="button">About</a>
                              <a class="btn btn-lg btn-primary" href="#" role="button">Contact US</a>
                           </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                           <div class="img-box ">
                              <figure><img src="assets/gyufyufyu.png" alt="img"/></figure>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="carousel-item">
                  <div class="container">
                     <div class="row marginii">
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                           <div class="carousel-caption ">
                              <h1>Welcome To The <strong class="color">Nutrients Plants</strong></h1>
                              <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using</p>
                              <a class="btn btn-lg btn-primary" href="#" role="button">About</a>
                              <a class="btn btn-lg btn-primary" href="#" role="button">Contact US</a>
                           </div>
                        </div>
                        <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12">
                           <div class="img-box">
                              <figure><img src="assets/gyufyufyu.png" alt="img"/></figure>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <a class="carousel-control-prev" href="#main_slider" role="button" data-slide="prev">
            <i class='fa fa-angle-left'></i></a>
            <a class="carousel-control-next" href="#main_slider" role="button" data-slide="next">
            <i class='fa fa-angle-right'></i>
            </a>
         </div>
      </section>
      <!-- plant -->
      <div id="plant" class="plants">
         <div class="container">
            <div class="row">
               <div class="col-md-12 ">
                  <div class="titlepage">
                     <h2>Our Wonderful plants</h2>
                     <span>looking at its layout. The point of using Lorem Ipsumletters, as opposed to usingl</span>
                  </div>
               </div>
            </div>
         </div>
         <div class="container">
            <div class="row">
               <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
                  <div class="plants-box">
                     <figure><img src="assets/plant1.jpg" alt="img"/></figure>
                     <h3> Floral Vibrant</h3>
                     <p>It is a long established fact that a reader will be distracted by the readable content of a page   when looking at its layout. The point of using Lorem Ipsumletters, as opposed to using</p>
                  </div>
               </div>
               <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
                  <div class="plants-box">
                     <figure><img src="assets/plant2.jpg" alt="img"/></figure>
                     <h3> Floral Vibrant</h3>
                     <p>It is a long established fact that a reader will be distracted by the readable content of a page   when looking at its layout. The point of using Lorem Ipsumletters, as opposed to using</p>
                  </div>
               </div>
               <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
                  <div class="plants-box">
                     <figure><img src="assets/plant3.jpg" alt="img"/></figure>
                     <h3> Floral Vibrant</h3>
                     <p>It is a long established fact that a reader will be distracted by the readable content of a page   when looking at its layout. The point of using Lorem Ipsumletters, as opposed to using</p>
                  </div>
               </div>
               <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
                  <div class="plants-box">
                     <figure><img src="assets/plant1.jpg" alt="img"/></figure>
                     <h3> Floral Vibrant</h3>
                     <p>It is a long established fact that a reader will be distracted by the readable content of a page   when looking at its layout. The point of using Lorem Ipsumletters, as opposed to using</p>
                  </div>
               </div>
               <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
                  <div class="plants-box">
                     <figure><img src="assets/plant2.jpg" alt="img"/></figure>
                     <h3> Floral Vibrant</h3>
                     <p>It is a long established fact that a reader will be distracted by the readable content of a page   when looking at its layout. The point of using Lorem Ipsumletters, as opposed to using</p>
                  </div>
               </div>
               <div class="col-xl-4 col-lg-4 col-md-6 col-sm-12">
                  <div class="plants-box">
                     <figure><img src="assets/plant3.jpg" alt="img"/></figure>
                     <h3> Floral Vibrant</h3>
                     <p>It is a long established fact that a reader will be distracted by the readable content of a page   when looking at its layout. The point of using Lorem Ipsumletters, as opposed to using</p>
                  </div>
               </div>
            </div>
         </div>
      </div>  
      <footer>
         <div id="contact" class="footer">
            <div class="container">
               <div class="row pdn-top-30">
                  <div class="col-md-12 ">
                     <div class="footer-box">
                        <div class="headinga">
                           <h3>Address</h3>
                           <span>Demo Store .New York  United States</span>
                           <p>(+71 98765348)</p>
                        </div>
                        <ul class="location_icon">
                           <li> <a href="#"><img src="icon/facebook.png"></a></li>
                           <li> <a href="#"><img src="icon/Twitter.png"></a></li>
                           <li> <a href="#"><img src="icon/linkedin.png"></a></li>
                           <li> <a href="#"><img src="icon/instagram.png"></a></li>
                        </ul>
                        <div class="menu-bottom">
                           <ul class="link">
                              <li> <a href="#">Home</a></li>
                              <li> <a href="#">About</a></li>
                              <li> <a href="#"> Plant</a></li>
                              <li> <a href="#">Gallery</a></li>
                              <li> <a href="#"> Contact us</a></li>
                           </ul>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="copyright">
               <div class="container">
                  <p>Copyright 2019 All Rights Reserved Design By  <a href="https://html.design/">Free Html Templates</a></p>
               </div>
            </div>
         </div>
      </footer>
      <!-- end footer -->
      <!-- Javascript files-->
      <script src="assets/js/jquery.min.js/script"></script>
      <script src="assets/js/popper.min.js"></script>
      <script src="assets/js/jquery-3.0.0.min.js"></script>
      <script src="assets/js/plugin.js"></script>
      <!-- sidebar -->
      <script src="assets/js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="assets/js/custom.js"></script>
      <!-- javascript --> 
      <script src="assets/js/owl.carousel.js"></script>
      <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
      <script>
         $(document).ready(function(){
         $(".fancybox").fancybox({
         openEffect: "none",
         closeEffect: "none"
         });
         
         $(".zoom").hover(function(){
         
         $(this).addClass('transition');
         }, function(){
         
         $(this).removeClass('transition');
         });
         });
         
      </script> 
   </body>
</html>