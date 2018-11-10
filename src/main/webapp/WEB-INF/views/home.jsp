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
					<li class="dropdown ymm-sw " data-wow-delay="0.1s"><a
						href="${pageContext.request.contextPath}/"
						class="dropdown-toggle active">Home </b></a>
					</li>

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


	<div class="slider-area">
		<div class="slider">
			<div id="bg-slider" class="owl-carousel owl-theme">
				<div class="item">
					<img src="assets/img/slide1/main.jpg" alt="Mirror Edge">
				</div>
				<div class="item">
					<img src="assets/img/slide1/slider-image-2.jpg"
						alt="The Last of us">
				</div>
				<div class="item">
					<img src="assets/img/slide1/slider-image-4.jpg" alt="GTA V">
				</div>

			</div>
		</div>
		<div class="container slider-content" style="top: 30%;">
			<div class="row">

				<div class="row">
				</div>

			</div>
		</div>
	</div>
	
	<div class="count-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
                        <!-- /.feature title -->
                        <h2>You can trust Us </h2> 
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 col-xs-12 percent-blocks m-main" data-waypoint-scroll="true">
                        <div class="row">
                            <div class="col-sm-3 col-xs-6">
                                <div class="count-item">
                                    <div class="count-item-circle">
                                        <span class="pe-7s-users"></span>
                                    </div>
                                    <div class="chart" data-percent="5000">
                                        <h2 class="percent" id="counter">0</h2>
                                        <h5>CUSTOMER </h5>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3 col-xs-6">
                                <div class="count-item">
                                    <div class="count-item-circle">
                                        <span class="pe-7s-home"></span>
                                    </div>
                                    <div class="chart" data-percent="5000">
                                        <h2 class="percent" id="counter1">0</h2>
                                        <h5>Partner Company</h5>
                                    </div>
                                </div> 
                            </div> 
                            <div class="col-sm-3 col-xs-6">
                                <div class="count-item">
                                    <div class="count-item-circle">
                                        <span class="pe-7s-flag"></span>
                                    </div>
                                    <div class="chart" data-percent="5000">
                                        <h2 class="percent" id="counter2">0</h2>
                                        <h5>Funding Project </h5>
                                    </div>
                                </div> 
                            </div> 
                            <div class="col-sm-3 col-xs-6">
                                <div class="count-item">
                                    <div class="count-item-circle">
                                        <span class="pe-7s-graph2"></span>
                                    </div>
                                    <div class="chart" data-percent="5000">
                                        <h2 class="percent" id="counter3">0</h2>
                                        <h5>Shipping Country</h5>
                                    </div>
                                </div> 

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

	<!-- property area -->
	<div class="content-area recent-property"
		style="padding-bottom: 60px; background-color: rgb(252, 252, 252);">
		<div class="container">
			<div class="row">
				<div class="col-md-12  padding-top-40 properties-page">
					<!-- 추천 상품 or 베스트 상품  -->
					<div class="content-area recent-property"
						style="background-color: #FCFCFC; padding-bottom: 55px;">
						<div class="container">
							<div class="row">
								<div
									class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
									<!-- /.feature title -->
									<h2>Recommended Projects</h2>
									<p>Recommended based on profile information and numbers of sales.</p>
								</div>
							</div>

							<div class="row">
								<div class="proerty-th">
									
									<!-- 회원일 경우 회원정보에 맞는 추천 상품 리스트 보여주기 -->
									<c:if test="${mCategory=='member'}">
									<c:forEach items="${recommendList}" var="project">
									<div class="col-sm-6 col-md-3 p0">
										<div class="box-two proerty-item">
											<div class="item-thumb">
												<a class="imageAtag"  href="detailedProject1?project_num=${project.project_num}"><img class="imageImgtag" src="showProjectImg?project_num=${project.project_num}"></a>
											</div>
											<div class="item-entry overflow">
												<h5 style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
													<a href="detailedProject1?project_num=${project.project_num}">${project.project_title} </a>
												</h5>
												<div class="dot-hr"></div>
											
												<div class="progress-card" style="margin-bottom: 5px;">
													<div class="d-flex justify-content-between mb-1">
														<div class="progress mb-2" style="height: 10px; margin-bottom: 0px;">
															<div class="progress-bar bg-success" role="progressbar"
																style="width: ${(project.project_nowfundprice/project.project_goalfundprice)*100}%" aria-valuenow="${(project.project_nowfundprice/project.project_goalfundprice)*100}" aria-valuemin="0"
																aria-valuemax="100" data-toggle="tooltip" data-placement="top"
																title="${project.project_nowfundprice}" data-original-title="${project.project_nowfundprice}%">
															</div>
														</div>
													</div>
												</div>
												
												<span class="pull-left"><b>${project.project_goaldate}</b></span> 
												<span class="proerty-price pull-right"><b>$</b>${project.project_goalfundprice}</span>												
											
											</div>
										</div>
									</div>
									</c:forEach>
									</c:if>
									
									<!-- 비회원 및 company, admin인 경우 베스트셀러 보여주기 -->
									<c:if test="${mCategory!='member'}">
									<c:forEach items="${bestList}" var="project">
									<div class="col-sm-6 col-md-3 p0">
										<div class="box-two proerty-item">
											<div class="item-thumb">
												<a class="imageAtag"  href="detailedProject1?project_num=${project.project_num}"><img class="imageImgtag" src="showProjectImg?project_num=${project.project_num}"></a>
											</div>
											<div class="item-entry overflow">
												<h5 style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
													<a href="detailedProject1?project_num=${project.project_num}">${project.project_title} </a>
												</h5>
												<div class="dot-hr"></div>
											
												<div class="progress-card" style="margin-bottom: 5px;">
													<div class="d-flex justify-content-between mb-1">
														<div class="progress mb-2" style="height: 10px; margin-bottom: 0px;">
															<div class="progress-bar bg-success" role="progressbar"
																style="width: ${(project.project_nowfundprice/project.project_goalfundprice)*100}%" aria-valuenow="${(project.project_nowfundprice/project.project_goalfundprice)*100}" aria-valuemin="0"
																aria-valuemax="100" data-toggle="tooltip" data-placement="top"
																title="${project.project_nowfundprice}" data-original-title="${project.project_nowfundprice}%">
															</div>
														</div>
													</div>
												</div>
												
												<span class="pull-left"><b>${project.project_goaldate}</b></span> 
												<span class="proerty-price pull-right"><b>$</b>${project.project_goalfundprice}</span>												
											
											</div>
										</div>
									</div>
									</c:forEach>
									</c:if>	
																	
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	
<div class="Welcome-area">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 Welcome-entry  col-sm-12">
                        <div class="col-md-5 col-md-offset-2 col-sm-6 col-xs-12">
                            <div class="welcome_text wow fadeInLeft animated" data-wow-delay="0.3s" data-wow-offset="100" style="visibility: visible; animation-delay: 0.3s;">
                                <div class="row">
                                    <div class="col-md-10 col-md-offset-1 col-sm-12 text-center page-title">
                                        <!-- /.feature title -->
                                        <h2>Crypto Kick </h2>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 col-sm-6 col-xs-12">
                            <div class="welcome_services wow fadeInRight animated" data-wow-delay="0.3s" data-wow-offset="100" style="visibility: visible; animation-delay: 0.3s;">
                                <div class="row">
                                    <div class="col-xs-6 m-padding">
                                        <div class="welcome-estate">
                                            <div class="welcome-icon">
                                                <i class="pe-7s-shopbag pe-4x"></i>
                                            </div>
                                            <h3>Any projects</h3>
                                        </div>
                                    </div>
                                    <div class="col-xs-6 m-padding">
                                        <div class="welcome-estate">
                                            <div class="welcome-icon">
                                                <i class="pe-7s-users pe-4x"></i>
                                            </div>
                                            <h3>More Clients</h3>
                                        </div>
                                    </div>


                                    <div class="col-xs-12 text-center">
                                        <i class="welcome-circle"></i>
                                    </div>

                                    <div class="col-xs-6 m-padding">
                                        <div class="welcome-estate">
                                            <div class="welcome-icon">
                                                <i class="pe-7s-film pe-4x"></i>
                                            </div>
                                            <h3>Watch promo video</h3>
                                        </div>
                                    </div>
                                    <div class="col-xs-6 m-padding">
                                        <div class="welcome-estate">
                                            <div class="welcome-icon">
                                                <i class="pe-7s-key pe-4x"></i>
                                            </div>
                                            <h3>Decryption discount code</h3>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


		<div class="boy-sale-area">
            <div class="container">
                <div class="row">

                    <div class="col-md-6 col-sm-10 col-sm-offset-1 col-md-offset-0 col-xs-12">
                        <div class="asks-first">
                            <div class="asks-first-circle">
                                <span class="fa fa-search"></span>
                            </div>
                            <div class="asks-first-info">
                                <h2>ARE YOU LOOKING FOR A Funding Projects?</h2>
                                <p> varius od lio eget conseq uat blandit, lorem auglue comm lodo nisl no us nibh mas lsa</p>                                        
                            </div>
                            <div class="asks-first-arrow">
                                <a href="properties.html"><span class="fa fa-angle-right"></span></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-10 col-sm-offset-1 col-xs-12 col-md-offset-0">
                        <div class="asks-first">
                            <div class="asks-first-circle">
                                <span class="fa fa-usd"></span>
                            </div>
                            <div class="asks-first-info">
                                <h2>DO YOU WANT TO SELL A Funding Projects?</h2>
                                <p> varius od lio eget conseq uat blandit, lorem auglue comm lodo nisl no us nibh mas lsa</p>
                            </div>
                            <div class="asks-first-arrow">
                                <a href="properties.html"><span class="fa fa-angle-right"></span></a>
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