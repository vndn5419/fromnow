<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" session="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>CryptoKick</title>
<meta name="description" content="GARO is a real-estate template">
<meta name="author" content="Kimarotec">
<meta name="keyword"
   content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
   href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800'
   rel='stylesheet' type='text/css'>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

<link rel="stylesheet" href="assets/css/normalize.css">
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/fontello.css">
<link href="assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css"
   rel="stylesheet">
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

<style type="text/css">

section{padding:5% 0}
.alizarin{background:#FDC600}
.amethyst{background:#FDC600}
.emerald{background:#FDC600}
.midnight-blue{background:#2c3e50}
.peter-river{background:#3498db}
.dl{background:#f0f0f0;padding:30px 0;border-radius:20px;position:relative}
.dl:before{content:" ";height:20px;width:20px;background:#ddd;border-radius:20px;position:absolute;left:50%;top:20px;margin-left:-10px}
.dl .brand{text-transform:uppercase;letter-spacing:3px;padding:10px 15px;margin-top:10px;text-align:center;min-height:100px}
.dl .discount{min-height:50px;position:relative;font-size:80px;line-height:80px;text-align:center;font-weight:700;padding:20px 15px 0;color:black;}
.dl .discount:after{content:" ";border-right:20px solid transparent;border-left:20px solid transparent;position:absolute;bottom:-20px;left:20%}
.dl .discount.alizarin:after{border-top:20px solid #FDC600}
.dl .discount.peter-river:after{border-top:20px solid #3498db}
.dl .discount.emerald:after{border-top:20px solid #2ecc71}
.dl .discount.amethyst:after{border-top:20px solid #9b59b6}
.dl .discount .type{font-size:20px;letter-spacing:1px;text-transform:uppercase;margin-top:-30px}
.dl .descr{color:#999;margin-top:10px;padding:20px 15px}
.dl .ends{padding:0 15px;color:#f1c40f;margin-bottom:10px}
.dl .coupon{min-height:50px;text-align:center;text-transform:uppercase;font-weight:700;font-size:18px;padding:20px 15px}
.dl .coupon a.open-code{color:#16a085}
.dl .coupon .code{letter-spacing:1px;border-radius:4px;margin-top:10px;padding:10px 15px;color:#f1c40f;background:#f0f0f0}

</style>


</head>

<body>

   <div id="preloader">
      <div id="status">&nbsp;</div>
   </div>

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
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

   <!--End top header -->

   <nav class="navbar navbar-default ">
      <div class="container">
         <!-- Brand and toggle get grouped for better mobile display -->
         <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
               data-toggle="collapse" data-target="#navigation">
               <span class="sr-only">Toggle navigation</span> <span
                  class="icon-bar"></span> <span class="icon-bar"></span> <span
                  class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/"><img
               src="assets/img/logo.png" alt=""></a>
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
                  <%--                      <c:if test="${category=='member'}">
                  <button class="navbar-btn nav-button wow bounceInRight login"
                     onclick="location.href='memberProfile'" data-wow-delay="0.4s">Profile</button></c:if>
                     <c:if test="${category=='company'}">
                  <button class="navbar-btn nav-button wow bounceInRight login"
                     onclick="location.href='companyProfile'" data-wow-delay="0.4s">Profile</button></c:if>
                  <div >Hello ${category} ${username} </div> --%>
               </c:if>


            </div>
            <ul class="main-nav nav navbar-nav navbar-right">
               <li class="dropdown ymm-sw " data-wow-delay="0.1s"><a
                  href="${pageContext.request.contextPath}/"
                  class="dropdown-toggle active">Home</a>
                  <ul class="dropdown-menu navbar-nav">
                     <li><a href="index-2.html">Home Style 2</a></li>
                     <li><a href="index-3.html">Home Style 3</a></li>
                     <li><a href="index-4.html">Home Style 4</a></li>
                     <li><a href="index-5.html">Home Style 5</a></li>

                  </ul></li>

               <li class="dropdown ymm-sw" data-wow-delay="0.1s"><a
                  href="index.html" class="dropdown-toggle active"
                  data-toggle="dropdown" data-hover="dropdown" data-delay="200">Projects
                     <b class="caret"></b>
               </a>
                  <ul class="dropdown-menu navbar-nav">
                     <li><a href="Projects?project_category=All">All</a></li>
                     <li><a href="Projects?project_category=Media">Media</a></li>
                     <li><a href="Projects?project_category=Technology">Technology</a>
                     </li>
                     <li><a href="Projects?project_category=Arts">Arts</a></li>
                     <li><a href="Projects?project_category=Publishing">Publishing</a>
                     </li>
                     <li><a href="Projects?project_category=Performance">Performance</a>
                     </li>
                     <li><a href="Projects?project_category=Food">Food</a></li>
                     <li><a href="Projects?project_category=Fashion">Fashion</a>
                     </li>
                     <li><a href="Projects?project_category=Others">Others</a></li>
                  </ul></li>
               <c:if test="${mCategory=='company'}">
                  <li class="wow fadeInDown" data-wow-delay="0.4s"><a
                     href="${pageContext.request.contextPath}/createProject">CreateProject</a>
                  </li>
                  <li class="dropdown ymm-sw" data-wow-delay="0.1s"><a href=""
                     class="dropdown-toggle active" data-toggle="dropdown"
                     data-hover="dropdown" data-delay="200">MyPage <b
                        class="caret"></b></a>
                     <ul class="dropdown-menu navbar-nav">
                        <li><a href="companyProfile">Profile</a></li>
                        <li><a href="myProjectsList?co_id=${sessionScope.userid}">MyProjects</a>
                        </li>
                     </ul></li>
               </c:if>
               <c:if test="${mCategory=='member'}">
                  <li class="dropdown ymm-sw" data-wow-delay="0.1s"><a href=""
                     class="dropdown-toggle active" data-toggle="dropdown"
                     data-hover="dropdown" data-delay="200">MyPage <b
                        class="caret"></b></a>
                     <ul class="dropdown-menu navbar-nav">
                        <li><a href="memberProfile">Profile</a></li>
                        <li><a href="favoritePage?userid=${sessionScope.userid}">Favorite</a>
                        </li>
                        <li><a href="orderList?userid=${sessionScope.userid}">OrderList</a>
                        </li>
                        <li><a href="myCoupon?userid=${sessionScope.userid}">MyCoupon</a>
						</li>
                     </ul></li>
               </c:if>
               <c:if test="${mCategory=='admin'}">
                  <li class="dropdown ymm-sw" data-wow-delay="0.1s"><a href=""
                     class="dropdown-toggle active" data-toggle="dropdown"
                     data-hover="dropdown" data-delay="200">MyPage <b
                        class="caret"></b></a>
                     <ul class="dropdown-menu navbar-nav">
                        <li><a href="adminProjects">Projects</a></li>
                     </ul></li>
               </c:if>
               <li class="wow fadeInDown" data-wow-delay="0.4s"><a
                  href="${pageContext.request.contextPath}/contact">Contact</a></li>
            </ul>
         </div>
         <!-- /.navbar-collapse -->
      </div>
      <!-- /.container-fluid -->
   </nav>
   <!-- End of nav bar -->


      <!-- 본문 시작  -->
      <section id="labels">
      
  		<div class="container">
  		    <div style="text-align: center;">
            <h3 class="page-title"style="border-bottom: solid 3px #FDC600; padding-bottom: 10px; color: #333; display: inline; letter-spacing: 0.198em; text-transform: uppercase;">My Coupon List</h3>
            </div>
		   	<div class="row" style="margin-top: 100px;">	
		   		<c:forEach items="${coupon}" var="coupon" >
			        <div class="col-sm-6 col-md-3 fadeInRight animated" style="margin-bottom: 30px;">
			          <div class="dl">
			            <div class="brand" style="overflow: hidden; text-overflow: ellipsis; color: #333; font-size: larger; font-weight: 500; min-height: 100px; max-height: 100px; letter-spacing: unset; text-transform: unset;">
			                ${coupon.project_title}
			            </div>
			            <div class="discount alizarin" style="-webkit-text-stroke: 1.5px #eee;">${coupon.coupon_discountrate}%
			                <div class="type">off</div>
			            </div>
			            <div class="descr" style="color: #333; text-align: center; font-size: 20px; text-shadow: 1.5px 1.5px #ccc;">
			                <strong>End date : ${coupon.coupon_date}</strong> 
			            </div>
			          </div>
			        </div>
		        </c:forEach>
	        </div>
        </div>
      
       </section>


   <!-- Footer area-->
   <div class="footer-area">

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

   <script src="assets/js/jquery-1.10.2.min.js"></script>
   <script src="bootstrap/js/bootstrap.min.js"></script>
   <script src="assets/js/bootstrap-select.min.js"></script>
   <script src="assets/js/bootstrap-hover-dropdown.js"></script>

   <script src="assets/js/easypiechart.min.js"></script>
   <script src="assets/js/jquery.easypiechart.min.js"></script>

   <script src="assets/js/owl.carousel.min.js"></script>
   <script src="assets/js/wow.js"></script>

   <script src="assets/js/icheck.min.js"></script>
   <script src="assets/js/price-range.js"></script>

   <script src="assets/js/main.js"></script>

</body>
</html>