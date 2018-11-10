<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html class="no-js">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>CryptoKick</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>

        <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">

        <link rel="stylesheet" href="assets/css/normalize.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/fontello.css">
        <link href="assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
        <link href="assets/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
        <link href="assets/css/animate.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" href="assets/css/bootstrap-select.min.css"> 
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/icheck.min_all.css">
        <link rel="stylesheet" href="assets/css/price-range.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.css">  
        <link rel="stylesheet" href="assets/css/owl.theme.css">
        <link rel="stylesheet" href="assets/css/owl.transitions.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">

<script type="text/javascript" src="resources/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	$('.ConsumerReport').hover(function(){
		$(this).css('background-color', '#9b9b9b');
	}, function(){
		$(this).css('background-color', '#ddd');
	});
	$('.BuyerList').hover(function(){
		$(this).css('background-color', '#9b9b9b');
	}, function(){
		$(this).css('background-color', '#ddd');
	});	
});
</script>
</head>

    <body>
        <div id="preloader">
            <div id="status">&nbsp;</div>
        </div>
        <!-- Body content -->
		<div class="header-connect">
            <div class="container">
                <div class="row">
                    <div class="col-md-5 col-sm-8  col-xs-12">
                        <div class="header-half header-call">
                            <p>
                                <span><i class="pe-7s-call"></i> +1 234 567 7890</span>
                                <span><i class="pe-7s-mail"></i> cryptokick@scitmaster.com</span>
                            </p>
                        </div>
                    </div>
                    <div class="col-md-2 col-md-offset-5  col-sm-3 col-sm-offset-1  col-xs-12">
                        <div class="header-half header-social">
                            <ul class="list-inline">
								<!-- 로그인 사용자 아이디 입력란  -->
								<c:if test="${not empty sessionScope.userid}">
									<span style="color: white;">Welcome! &nbsp;&nbsp;</span><span style="color: white; font-size: x-large; font-weight: 400;">${sessionScope.userid}</span>
								</c:if>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End top header -->
     <!--End top header -->

         <nav class="navbar navbar-default ">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img src="assets/img/logo.png" alt=""></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse yamm" id="navigation">
                    <div class="button navbar-right">
                       
                    <c:if test="${empty sessionScope.userid}">
						<button class="navbar-btn nav-button wow bounceInRight login"
							onclick="location.href='logIn'" data-wow-delay="0.4s">Log
							In</button>
						<button class="navbar-btn nav-button wow fadeInRight"
							onclick="location.href='signIn'" data-wow-delay="0.5s">Sign
							In</button>
					</c:if>
				    <c:if test="${not empty sessionScope.userid}">
						<button class="navbar-btn nav-button wow bounceInRight login"
							onclick="location.href='logOut'" data-wow-delay="0.4s">Log
							Out</button>
<%-- 							<c:if test="${category=='member'}">
						<button class="navbar-btn nav-button wow bounceInRight login"
							onclick="location.href='memberProfile'" data-wow-delay="0.4s">Profile</button></c:if>
							<c:if test="${category=='company'}">
						<button class="navbar-btn nav-button wow bounceInRight login"
							onclick="location.href='companyProfile'" data-wow-delay="0.4s">Profile</button></c:if>
						<div >Hello ${category} ${username} </div> --%>
					</c:if>
                       
                       
                    </div>
                    <ul class="main-nav nav navbar-nav navbar-right">
                        <li class="dropdown ymm-sw " data-wow-delay="0.1s">
                            <a href="index.html" class="dropdown-toggle active" >Home </b></a>
                        </li>

                        <li class="dropdown ymm-sw" data-wow-delay="0.1s">
                            <a href="index.html" class="dropdown-toggle active" data-toggle="dropdown" data-hover="dropdown" data-delay="200">Projects <b class="caret"></b></a>
                            <ul class="dropdown-menu navbar-nav">
                                <li>
                                    <a href="Projects?project_category=All">All</a>
                                </li>
                                <li>
                                    <a href="Projects?project_category=Media">Media</a>
                                </li>
                                <li>
                                    <a href="Projects?project_category=Technology">Technology</a>
                                </li>
                                <li>
                                    <a href="Projects?project_category=Arts">Arts</a>
                                </li>
                                <li>
                                    <a href="Projects?project_category=Publishing">Publishing</a>
                                </li>
                                <li>
                                    <a href="Projects?project_category=Performance">Performance</a>
                                </li>
                                <li>
                                    <a href="Projects?project_category=Food">Food</a>
                                </li>
                                <li>
                                    <a href="Projects?project_category=Fashion">Fashion</a>
                                </li>
                                <li>
                                    <a href="Projects?project_category=Others">Others</a>
                                </li>
                            </ul>
                        </li>
                        <c:if test="${mCategory=='company'}">
							<li class="wow fadeInDown" data-wow-delay="0.4s">
								<a href="${pageContext.request.contextPath}/createProject">CreateProject</a>
							</li>
	                        <li class="dropdown ymm-sw" data-wow-delay="0.1s">
	                           <a href="" class="dropdown-toggle active" data-toggle="dropdown" data-hover="dropdown" data-delay="200">MyPage <b class="caret"></b></a>
	                           <ul class="dropdown-menu navbar-nav">
	                               <li>
	                                   <a href="companyProfile">Profile</a>
	                               </li>
	                               <li>
	                                   <a href="myProjectsList?co_id=${sessionScope.userid}">MyProjects</a>
	                               </li>
	                           </ul>
	                       </li>                        
                        </c:if>
                        <c:if test="${mCategory=='member'}">
                        <li class="dropdown ymm-sw" data-wow-delay="0.1s">
                            <a href="" class="dropdown-toggle active" data-toggle="dropdown" data-hover="dropdown" data-delay="200">MyPage <b class="caret"></b></a>
                            <ul class="dropdown-menu navbar-nav">
                                <li>
                                    <a href="memberProfile">Profile</a>
                                </li>
                                <li>
                                    <a href="favoritePage?userid=${sessionScope.userid}">Favorite</a>
                                </li>
                                <li>
                                    <a href="orderList?userid=${sessionScope.userid}">OrderList</a>
                                </li>
                                <li>
                                	<a href="myCoupon?userid=${sessionScope.userid}">MyCoupon</a>
								</li>
                            </ul>
                        </li>
                        </c:if>
                        <c:if test="${mCategory=='admin'}">
                        <li class="dropdown ymm-sw" data-wow-delay="0.1s">
                            <a href="" class="dropdown-toggle active" data-toggle="dropdown" data-hover="dropdown" data-delay="200">MyPage <b class="caret"></b></a>
  								<ul class="dropdown-menu navbar-nav">
                               	 <li>
                               	     <a href="adminProjects">Projects</a>
                                </li>
                            	</ul>
                        </li>
                        </c:if>                        
                        <li class="wow fadeInDown" data-wow-delay="0.4s"><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
        <!-- End of nav bar -->


   <!-- property area -->
   <div class="properties-area recent-property"
      style="background-color: #FFF;">
      <div class="container">
         <div class="row">
            <div class="col-md-9 padding-top-40 properties-page">
               <div class="section clear fadeInLeft animated animated" style="visibility: visible; animation-name: fadeInLeft; margin-bottom: 40px;">
               
               <h3 class="page-title"style="border-bottom: solid 3px #FDC600; padding-bottom: 10px; color: #333; display: inline; letter-spacing: 0.198em; text-transform: uppercase;">My Projects</h3>
                  
                  <!--/ .layout-switcher-->
               </div>

               <div class="section clear">
                  <div id="list-type" class="proerty-th-list">


                  <c:forEach items="${myProject}" var="myProject">
                     <div class="col-sm-6 col-md-4 p0">
                        <div class="box-two proerty-item">
                           <div class="item-thumb">
                              <div class="clearfix">
                                 <div class="lSSlideWrapper usingCss"
                                    style="transition-duration: 500ms; transition-timing-function: ease;">
                                     <a href="detailedProject1?project_num=${myProject.project_num}">
                                     <img src="showProjectImg?project_num=${myProject.project_num}">
                                     </a>
                                 </div>
                              </div>
                           </div>
                           
                           <div class="item-entry overflow">
                              <h5 style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                 <a  href="detailedProject1?project_num=${myProject.project_num}">
                                 ${myProject.project_title} </a>
                              </h5>
                              <div class="dot-hr"></div>
                              
                              <div class="progress-card" align="center">
                                 <div class="d-flex justify-content-between mb-1">
                                    <div class="progress mb-2" style="height: 15px; width: 100%">
                                       <div class="progress-bar bg-success" role="progressbar"
                                          style="width: ${(myProject.project_nowfundprice/myProject.project_goalfundprice)*100}%" aria-valuenow="${(myProject.project_nowfundprice/project.project_goalfundprice)*100}" aria-valuemin="0"
                                          aria-valuemax="100" data-toggle="tooltip" data-placement="top"
                                          title="${myProject.project_nowfundprice}" data-original-title="${myProject.project_nowfundprice}%"></div>
                                    </div>
                                 </div>
                              </div>
                              
                              <div style="width: 100%; height: 30px;">
                              <span class="pull-left"><b>${fn:substring(myProject.project_goaldate, 0, 10)}</b>  
                              </span> 
                              <span class="proerty-price pull-right"><span>$</span> ${myProject.project_goalfundprice}</span>                              
                              </div>
                               
                              <c:if test="${myProject.project_checked=='checked'}">
                              <div style="width : 100%; text-align: right;">
                              	<input type="button" class="ConsumerReport" value="ConsumerReport" width="100px" height="30px" style="width: 50%; margin-top: 10px; color: white; background-color: #ddd; font-size: 18px; text-shadow: #aaa8a8 1px 1px;" onclick="location.href='getReport?project_num=${myProject.project_num}'">
                                <input type="button" class="BuyerList" value="BuyerList" width="100px" height="30px" style="width: 50%; margin-top: 10px; color: white; background-color: #ddd; font-size: 18px; text-shadow: #aaa8a8 1px 1px;" onclick="location.href='buyerList?project_num=${myProject.project_num}'">
                              </div>
                              </c:if>
                              <c:if test="${myProject.project_checked!='checked'}">
                              <div style="width : 100%;text-align: right;margin-top: 65px;margin-right: 60px;">
									<span style="font-weight: 500;font-size: large;margin-right: 10px;">This project has not been approved</span>                              	
                              </div>
                              </c:if>
                           </div>
                        </div>
                        
                     </div>
                  </c:forEach>

                     
                  </div>
               </div>
               <div class="section">
                  <div class="pull-right">
                  </div>
               </div>
            </div>
            <div class="col-md-3 pl0 padding-top-40" style="padding-top: 174px;">
               <div class="blog-asside-right pl0">
                     <div class="dealer-widget fadeInRight animated" style="width: 100%; color: #555;">
                                <div class="dealer-content">
                                    <div class="inner-wrapper">

                                        <div class="clear" style="text-align: center;">
                                            <div class="col-xs-4 col-sm-4 dealer-face" style="width: 100%;">
                                                <a href="companyProfile">
                                                    <img src="showCompanyImg?co_id=${company.co_id}" class="img-circle" style="width: 93px;height: 99px;margin-top: 5px;">
                                                </a>
                                            </div>
                                                <p style="padding-left: 0px; padding-bottom: 0px; font-size: x-large; font-weight: 600;">${company.co_id}</p>
                                                <!-- <h6 style="text-transform: unset;">sally.com</h6> -->
                                       			<p>${company.co_ceo_firstname}&nbsp${company.co_ceo_lastname}</p>
                                        </div>
										<div style="width:100%; height: 1px; background-color: #ccc;"></div>
                                        <div class="clear">
                                            <ul class="dealer-contacts" style="font-size: 13px; padding-top: 10px;">                                       
                                                <li><i class="pe-7s-map-marker strong" style="margin-left: 5px; margin-right: 20px;"></i>${company.co_country}</li>
                                                <li><i class="pe-7s-mail strong" style="margin-left: 5px; margin-right: 20px;"></i>${company.co_website}</li>
                                                <li><i class="pe-7s-call strong" style="margin-left: 5px; margin-right: 20px;"></i>${company.co_phone}</li>
                                            </ul>
                                        </div>

                                    </div>
                                </div>
                            </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>


          <!-- Footer area-->
        <div class="footer-area" style="position: fixed !important; left: 0 !important; bottom: 0 !important; width: 100% !important;">

		<div class="footer-copy text-center">
			<div class="container">
				<div class="row">
					<div class="pull-left">
						<span> (C) <a href="http://www.KimaroTec.com">CryptoKick</a>
							, SCIT MASTER 35th 2018
						</span>
					</div>
					<div class="bottom-menu pull-right">
						<ul>
							<li><a class="wow fadeInUp animated" href="#"
								data-wow-delay="0.2s">Home</a></li>
							<li><a class="wow fadeInUp animated" href="#"
								data-wow-delay="0.3s">Property</a></li>
							<li><a class="wow fadeInUp animated" href="#"
								data-wow-delay="0.4s">Faq</a></li>
							<li><a class="wow fadeInUp animated" href="#"
								data-wow-delay="0.6s">Contact</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

        </div>
          

        <script src="assets/js/modernizr-2.6.2.min.js"></script>
        <script src="assets/js//jquery-1.10.2.min.js"></script>
        <script src="bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/bootstrap-select.min.js"></script>
        <script src="assets/js/bootstrap-hover-dropdown.js"></script>
        <script src="assets/js/easypiechart.min.js"></script>
        <script src="assets/js/jquery.easypiechart.min.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/wow.js"></script>
        <script src="assets/js/icheck.min.js"></script>

        <script src="assets/js/price-range.js"></script> 
        <script src="assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/wizard.js"></script>

        <script src="assets/js/main.js"></script>

    </body>
</html>