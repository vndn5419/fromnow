<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> 
<html class="no-js"> <!--<![endif]-->
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
        <link rel="stylesheet" href="assets/css/wizard.css"> 
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
        
        <link rel="stylesheet" href="resources/maps/css/ready.css">
        
        <style>
		.circle {
			display: inline-block;
			margin: 1em;
		}
 		.circles-decimals {
			font-size: .4em;
		}
		@media (min-width: 768px)
.col-md-7 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 33.333333%;
    flex: 0 0 50%;
    max-width: 50%;
}

#line-chart{
	width: 550px !important;
	height: unset !important;
}

.nav-pills > li > a:hover {
     background: #FDC600; 
}
	</style>
        
	<script type="text/javascript" src="resources/jquery-3.3.1.min.js"></script>
	<script src="https://static.anychart.com/js/8.0.1/anychart-core.min.js"></script>
	<script src="https://static.anychart.com/js/8.0.1/anychart-pie.min.js"></script>
	<script type="text/javascript">
anychart.onDocumentReady(function() {
		$(".anychart-credits").remove();

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
        <!-- End of nav bar -->

        <!-- End page header -->

        <!-- property area -->
        <div class="content-area submit-property" style="background-color: #FCFCFC;">&nbsp;
            <div class="container">
                <div class="clearfix" > 
                    <div class="wizard-container"> 
                        <div class="wizard-card ct-wizard-orange" id="wizardProperty">
                                <div class="wizard-header">
                                    <h3 style="margin-bottom: 30px;">
                                        <b>STATISTICS</b> For Your Project <br>
                                    </h3>
                                </div>

                                <ul>
                                    <li><a id="Investors" class="d">Investors </a></li>
                                    <li><a id="viewer" class="d">Potential Investors </a></li>
                                </ul>

                                <div class="container-fluid">
                                
                <input id="project_num" type="hidden" value="${project_num}">
                <br/>
                <div class="row">
               		<div class="col-md-12" id="investerComment">
                		<div class="card" style="text-align: center;font-size: 24px;font-weight: 500;text-shadow: 1px 1px #ccc;">
                			Investments
                			 were mostly made in  
                			 <span style="color: #fdc600;">${analysis.best_month}</span> 
                			around 
                			<span style="color: #fdc600;">$</span>
                			<span style="color: #fdc600;">${analysis.best_price}</span>
                			by 
                			<span style="color: #fdc600;">${analysis.best_gender}</span> 
                			on
                			<span style="color: #fdc600;">${analysis.best_age}</span>
                			's 
                			from
                			<span style="color: #fdc600;">${analysis.best_country}</span>
                		</div>
                	</div>
                	<div class="col-md-12" id="potentialComment">
                		<div class="card" style="text-align: center;font-size: 24px;font-weight: 500;text-shadow: 1px 1px #ccc;">
                			Potential Investors are 
                			<span style="color: #fdc600;">${potentialAnalysis.best_gender}</span> 
                			on
                			<span style="color: #fdc600;">${potentialAnalysis.best_age}</span>
                			's 
                			from
                			<span style="color: #fdc600;">${potentialAnalysis.best_country}</span>
                		</div>
                	</div>
                </div>
                  <div class="row">
                     <div class="col-md-9">
                        <div class="card">
                           <div class="card-header">
                              <h4 class="card-title">World Map</h4>
                              <p class="card-category" style="max-width: 50%;display: inline;">
                              Map of the distribution of users around the world</p>
                           <p  id="country-name" class="card-category" style="display: inline;text-align: right;position: absolute;right: 37px;font-size: 25px;/* bottom: 226px; */top: 29px;font-weight: 600;text-shadow: 1px 1px #ccc;color: #333;">
                              </p></div>
                           <div class="card-body">
                              <div class="mapcontainer">
                                 <div class="map">
                                    <span>Alternative content for the map</span>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     	
							<div class="col-md-3">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Distribution by gender</h4>
									</div>
									<div class="card-body">
									<div class="row">
										<div id="container"></div>
										<div id="canvas-holder" style="width:100%"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
<canvas id="chart-pie" width="506" height="252" class="chartjs-render-monitor" style="display: block; width: 253px; height: 126px;"></canvas>
	</div>
									</div>

										
								</div>
								<div class="card-header" id="distribution"></div>
								<div class="card-header" id="distribution-header">
										<h4 class="card-title">Distribution by each Sale</h4>
									</div>
								<div class="card-body" style="text-align:  center;" id="distribution-body">
								<img src="resources/sales.png"style="width: 40%;">
								<br/>
								<div id="hidde" style="font-weight: 900;margin-top: 8px;"></div>
								</div>
									</div>
							</div>
                  </div>
                                
<div class="col-md-7">
								<div class="card">
								<div class="card-header">
										<h4 class="card-title">Distribution by Months</h4>
									</div>
									<div class="card-body">
										<p class="demo">
										<canvas id="line-chart" ></canvas>
										</p>
									</div>
								</div>
							</div>
						
							<div class="col-md-5">
								<div class="card">
									<div class="card-header">
										<h4 class="card-title">Distribution by Ages</h4>
									</div>
									
									<div class="card-body">
									
									<div id="canvas-holder" style="width:100%"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
<canvas id="chart-area" width="860" height="430" class="chartjs-render-monitor" style="display: block; width: 430px; height: 215px;"></canvas>
</div>
										</div>
								</div>
							</div>

                                </div>

                        </div>
                        <!-- End submit form -->
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

    </body>
        <script src="assets/js/vendor/modernizr-2.6.2.min.js"></script>
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
        
<script src="resources/maps/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
        <script src="resources/maps/js/core/popper.min.js"></script>
<script src="resources/maps/js/core/bootstrap.min.js"></script>
        <script src="resources/maps/js/plugin/chartist/chartist.min.js"></script>
<script src="resources/maps/js/plugin/chartist/plugin/chartist-plugin-tooltip.min.js"></script>
        <script src="resources/maps/js/plugin/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<script src="resources/maps/js/plugin/jquery-mapael/jquery.mapael.min.js"></script>
        <script src="resources/maps/js/plugin/jquery-mapael/maps/world_countries.min.js"></script>
<script src="resources/maps/js/plugin/chart-circle/circles.min.js"></script>
        <script src="resources/maps/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script src="resources/maps/js/ready.min.js"></script>
<script src="resources/maps/Chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script>

var flag = 0;

 function saleByCountries(resp){
	 $(".mapcontainer").mapael({
		   map : {
		      name : "world_countries",
		      zoom: {
		         enabled: true,
		         maxLevel: 10,
		      },
		      defaultPlot: {
		         attrs: {
		            fill: "#e5e5e5"
		            , opacity: 0.6
		         }
		      }, 
		      defaultArea: {
		         attrs: {
		            fill: "#e5e5e5"
		            , stroke: "#fafafa"
		         }
		         , attrsHover: {
		            fill: "#e5e5e5"
		         }
		          , text: {
		            attrs: {
		               fill: "#505444"
		            }
		            , attrsHover: {
		               fill: "#000"
		            }
		         } 
		      }
		   },
		   areas: {
			      "AU": {
			         tooltip: {content: "<b>Australia</b>"},
			         attrs: {
			            title : "Australia",
			            fill: (resp.Australia!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Australia!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "BY": {
			         tooltip: {content: "<b>Belarus</b>"},
			         attrs: {
			            title : "Belarus",
			            fill: (resp.Belarus!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Belarus!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "BE": {
			         tooltip: {content: "<b>Belgium</b>"},
			         attrs: {
			            title : "Belgium",
			            fill: (resp.Belgium!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Belgium!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "BA": {
			         tooltip: {content: "<b>Bosnia</b>"},
			         attrs: {
			            title : "Bosnia",
			            fill: (resp.Bosnia!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Bosnia!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "BN": {
			         tooltip: {content: "<b>Brunei</b>"},
			         attrs: {
			            title : "Brunei",
			            fill: (resp.Brunei!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Brunei!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "BG": {
			         tooltip: {content: "<b>Bulgaria</b>"},
			         attrs: {
			            title : "Bulgaria",
			            fill: (resp.Bulgaria!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Bulgaria!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "CA": {
			         tooltip: {content: "<b>Canada</b>"},
			         attrs: {
			            title : "Canada",
			            fill: (resp.Canada!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Canada!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "CN": {
			         tooltip: {content: "<b>China</b>"},
			         attrs: {
			            title : "China",
			            fill: (resp.China!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.China!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "HR": {
			         tooltip: {content: "<b>Croatia</b>"},
			         attrs: {
			            title : "Croatia",
			            fill: (resp.Croatia!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill:(resp.Croatia!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "CY": {
			         tooltip: {content: "<b>Cyprus</b>"},
			         attrs: {
			            title : "Cyprus",
			            fill: (resp.Cyprus!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Cyprus!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "CZ": {
			         tooltip: {content: "<b>Czech Republic</b>"},
			         attrs: {
			            title : "CzechRepublic",
			            fill: (resp.CzechRepublic!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill:  (resp.CzechRepublic!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "DK": {
			         tooltip: {content: "<b>Denmark</b>"},
			         attrs: {
			            title : "Denmark",
			            fill:  (resp.Denmark!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Denmark!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "EE": {
			         tooltip: {content: "<b>Estonia</b>"},
			         attrs: {
			            title : "Estonia",
			            fill: (resp.Estonia!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Estonia!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "FI": {
			         tooltip: {content: "<b>Finland</b>"},
			         attrs: {
			            title : "Finland",
			            fill: (resp.Finland!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill:(resp.Finland!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "FR": {
			         tooltip: {content: "<b>France</b>"},
			         attrs: {
			            title : "France",
			            fill: (resp.France!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.France!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "GE": {
			         tooltip: {content: "<b>Georgia</b>"},
			         attrs: {
			            title : "Georgia",
			            fill: (resp.Georgia!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Georgia!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "DE": {
			         tooltip: {content: "<b>Germany</b>"},
			         attrs: {
			            title : "Germany",
			            fill: (resp.Germany!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Germany!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "GR": {
			         tooltip: {content: "<b>Greece</b>"},
			         attrs: {
			            title : "Greece",
			            fill: (resp.Greece!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Greece!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "HU": {
			         tooltip: {content: "<b>Hungary</b>"},
			         attrs: {
			            title : "Hungary",
			            fill: (resp.Hungary!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Hungary!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "IS": {
			         tooltip: {content: "<b>Iceland</b>"},
			         attrs: {
			            title : "Iceland",
			            fill: (resp.Iceland!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Iceland!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "IN": {
			         tooltip: {content: "<b>India</b>"},
			         attrs: {
			            title : "India",
			            fill: (resp.India!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.India!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "ID": {
			         tooltip: {content: "<b>Indonesia</b>"},
			         attrs: {
			            title : "Indonesia",
			            fill: (resp.Indonesia!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Indonesia!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "IE": {
			         tooltip: {content: "<b>Ireland</b>"},
			         attrs: {
			            title : "Ireland",
			            fill: (resp.Ireland!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Ireland!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "IL": {
			         tooltip: {content: "<b>Israel</b>"},
			         attrs: {
			            title : "Israel",
			            fill: (resp.Israel!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: $(resp.Israel!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "IT": {
			         tooltip: {content: "<b>Italy</b>"},
			         attrs: {
			            title : "Italy",
			            fill: (resp.Italy!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Italy!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "JP": {
			         tooltip: {content: "<b>Japan</b>"},
			         attrs: {
			            title : "Japan",
			            fill: (resp.Japan!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Japan!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "JO": {
			         tooltip: {content: "<b>Jordan</b>"},
			         attrs: {
			            title : "Jordan",
			            fill: (resp.Jordan!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Jordan!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "KW": {
			         tooltip: {content: "<b>Kuwait</b>"},
			         attrs: {
			            title : "Kuwait",
			            fill: (resp.Kuwait!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Kuwait!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "LA": {
			         tooltip: {content: "<b>Laos</b>"},
			         attrs: {
			            title : "Laos",
			            fill: (resp.Laos!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Laos!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "LV": {
			         tooltip: {content: "<b>Latvia</b>"},
			         attrs: {
			            title : "Latvia",
			            fill: (resp.Latvia!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Latvia!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "LB": {
			         tooltip: {content: "<b>Lebanon</b>"},
			         attrs: {
			            title : "Lebanon",                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
			            fill: (resp.Lebanon!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Lebanon!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "LT": {
			         tooltip: {content: "<b>Lithuania</b>"},
			         attrs: {
			            title : "Lithuania", 
			            fill: (resp.Lithuania!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Lithuania!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "LU": {
			         tooltip: {content: "<b>Luxembourg</b>"},
			         attrs: {
			            title : "Luxembourg", 
			            fill: (resp.Luxembourg!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Luxembourg!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "MY": {
			         tooltip: {content: "<b>Malaysia</b>"},
			         attrs: {
			            title : "Malaysia", 
			            fill: (resp.Malaysia!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Malaysia!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "NL": {
			         tooltip: {content: "<b>Netherlands</b>"},
			         attrs: {
			            title : "Netherlands", 
			            fill: (resp.Netherlands!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Netherlands!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "NZ": {
			         tooltip: {content: "<b>New Zealand</b>"},
			         attrs: {
			            title : "NewZealand", 
			            fill: (resp.NewZealand!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.NewZealand!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "NG": {
			         tooltip: {content: "<b>Nigeria</b>"},
			         attrs: {
			            title : "Nigeria", 
			            fill: (resp.Nigeria!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Nigeria!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "NO": {
			         tooltip: {content: "<b>Norway</b>"},
			         attrs: {
			            title : "Norway", 
			            fill: (resp.Norway!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Norway!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "PH": {
			         tooltip: {content: "<b>Philippines</b>"},
			         attrs: {
			            title : "Philippines", 
			            fill: (resp.Philippines!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Philippines!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "PL": {
			         tooltip: {content: "<b>Poland</b>"},
			         attrs: {
			            title : "Poland", 
			            fill: (resp.Poland!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Poland!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "PT": {
			         tooltip: {content: "<b>Portugal</b>"},
			         attrs: {
			            title : "Portugal", 
			            fill: (resp.Portugal!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Portugal!=null?"#fdc600":"#e5e5e5")
			         }               
			      },         
			      "QA": {
			         tooltip: {content: "<b>Qatar</b>"},
			         attrs: {
			            title : "Qatar", 
			            fill: (resp.Qatar!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Qatar!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "RO": {
			         tooltip: {content: "<b>Romania</b>"},
			         attrs: {
			            title : "Romania", 
			            fill: (resp.Romania!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Romania!=null?"#fdc600":"#e5e5e5")
			         }               
			      },         
			      "RU": {
			         tooltip: {content: "<b>Russia</b>"},
			         attrs: {
			            title : "Russia", 
			            fill: (resp.Russia!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Russia!=null?"#fdc600":"#e5e5e5")
			         }               
			      },         
			      "SA": {
			         tooltip: {content: "<b>Saudi Arabia</b>"},
			         attrs: {
			            title : "SaudiArabia", 
			            fill: (resp.SaudiArabia!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.SaudiArabia!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "RS": {
			         tooltip: {content: "<b>Serbia</b>"},
			         attrs: {
			            title : "Serbia", 
			            fill: (resp.Serbia!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Serbia!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "SK": {
			         tooltip: {content: "<b>Slovakia</b>"},
			         attrs: {
			            title : "Slovakia", 
			            fill: (resp.Slovakia!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Slovakia!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "SI": {
			         tooltip: {content: "<b>Slovenia</b>"},
			         attrs: {
			            title : "Slovenia", 
			            fill: (resp.Slovenia!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Slovenia!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "ZA": {
			         tooltip: {content: "<b>South Africa</b>"},
			         attrs: {
			            title : "SouthAfrica", 
			            fill: (resp.SouthAfrica!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.SouthAfrica!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "KR": {
			         tooltip: {content: "<b>South Korea</b>"},
			         attrs: {
			            title : "SouthKorea", 
			            fill: (resp.SouthKorea!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.SouthKorea!=null?"#fdc600":"#e5e5e5")
			         }               
			      },         
			      "ES": {
			         tooltip: {content: "<b>Spain</b>"},
			         attrs: {
			            title : "Spain", 
			            fill: (resp.Spain!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Spain!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "SE": {
			         tooltip: {content: "<b>Sweden</b>"},
			         attrs: {
			            title : "Sweden", 
			            fill: (resp.Sweden!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Sweden!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "CH": {
			         tooltip: {content: "<b>Switzerland</b>"},
			         attrs: {
			            title : "Switzerland", 
			            fill: (resp.Switzerland!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Switzerland!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "TW": {
			         tooltip: {content: "<b>Taiwan</b>"},
			         attrs: {
			            title : "Taiwan",
			            fill: (resp.Taiwan!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Taiwan!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "TH": {
			         tooltip: {content: "<b>Thailand</b>"},
			         attrs: {
			            title : "Thailand",
			            fill: (resp.Thailand!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Thailand!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "TR": {
			         tooltip: {content: "<b>Turkey</b>"},
			         attrs: {
			            title : "Turkey",
			            fill: (resp.Turkey!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Turkey!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "UA": {
			         tooltip: {content: "<b>Ukraine</b>"},
			         attrs: {
			            title : "Ukraine",
			            fill: (resp.Ukraine!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Ukraine!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "AE": {
			         tooltip: {content: "<b>United Arab Emirates</b>"},
			         attrs: {
			            title : "UnitedArabEmirates",
			            fill: (resp.UnitedArabEmirates!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.UnitedArabEmirates!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "GB": {
			         tooltip: {content: "<b>United Kingdom</b>"},
			         attrs: {
			            title : "UnitedKingdom",
			            fill: (resp.UnitedKingdom!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.UnitedKingdom!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "US": {
			         tooltip: {content: "<b>United States</b>"},
			         attrs: {
			            title : "UnitedStates",
			            fill: (resp.UnitedStates!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.UnitedStates!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "VN": {
			         tooltip: {content: "<b>Vietnam</b>"},
			         attrs: {
			            title : "Vietnam",
			            fill: (resp.Vietnam!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.Vietnam!=null?"#fdc600":"#e5e5e5")
			         }               
			      }   
			   },
		});
 };
 
 
 function viewedByCountries(resp){
	 $(".mapcontainer").mapael({
		   map : {
		      name : "world_countries",
		      zoom: {
		         enabled: true,
		         maxLevel: 10,
		      },
		      defaultPlot: {
		         attrs: {
		            fill: "#e5e5e5"
		            , opacity: 0.6
		         }
		      }, 
		      defaultArea: {
		         attrs: {
		            fill: "#e5e5e5"
		            , stroke: "#fafafa"
		         }
		         , attrsHover: {
		            fill: "#e5e5e5"
		         }
		          , text: {
		            attrs: {
		               fill: "#505444"
		            }
		            , attrsHover: {
		               fill: "#000"
		            }
		         } 
		      }
		   },
		   areas: {
			      "AU": {
			         tooltip: {content: "<b>Australia</b>"},
			         attrs: {
			            title : "Australia",
			            fill: (resp.AU!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.AU!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "BY": {
			         tooltip: {content: "<b>Belarus</b>"},
			         attrs: {
			            title : "Belarus",
			            fill: (resp.BY!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.BY!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "BE": {
			         tooltip: {content: "<b>Belgium</b>"},
			         attrs: {
			            title : "Belgium",
			            fill: (resp.BE!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.BE!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "BA": {
			         tooltip: {content: "<b>Bosnia</b>"},
			         attrs: {
			            title : "Bosnia",
			            fill: (resp.BA!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.BA!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "BN": {
			         tooltip: {content: "<b>Brunei</b>"},
			         attrs: {
			            title : "Brunei",
			            fill: (resp.BN!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.BN!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "BG": {
			         tooltip: {content: "<b>Bulgaria</b>"},
			         attrs: {
			            title : "Bulgaria",
			            fill: (resp.BG!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.BG!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "CA": {
			         tooltip: {content: "<b>Canada</b>"},
			         attrs: {
			            title : "Canada",
			            fill: (resp.CA!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.CA!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "CN": {
			         tooltip: {content: "<b>China</b>"},
			         attrs: {
			            title : "China",
			            fill: (resp.CN!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.CN!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "HR": {
			         tooltip: {content: "<b>Croatia</b>"},
			         attrs: {
			            title : "Croatia",
			            fill: (resp.HR!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill:(resp.HR!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "CY": {
			         tooltip: {content: "<b>Cyprus</b>"},
			         attrs: {
			            title : "Cyprus",
			            fill: (resp.CY!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.CY!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "CZ": {
			         tooltip: {content: "<b>Czech Republic</b>"},
			         attrs: {
			            title : "CzechRepublic",
			            fill: (resp.CZ!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill:  (resp.CZ!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "DK": {
			         tooltip: {content: "<b>Denmark</b>"},
			         attrs: {
			            title : "Denmark",
			            fill:  (resp.DK!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.DK!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "EE": {
			         tooltip: {content: "<b>Estonia</b>"},
			         attrs: {
			            title : "Estonia",
			            fill: (resp.EE!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.EE!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "FI": {
			         tooltip: {content: "<b>Finland</b>"},
			         attrs: {
			            title : "Finland",
			            fill: (resp.FI!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill:(resp.FI!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "FR": {
			         tooltip: {content: "<b>France</b>"},
			         attrs: {
			            title : "France",
			            fill: (resp.FR!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.FR!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "GE": {
			         tooltip: {content: "<b>Georgia</b>"},
			         attrs: {
			            title : "Georgia",
			            fill: (resp.GE!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.GE!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "DE": {
			         tooltip: {content: "<b>Germany</b>"},
			         attrs: {
			            title : "Germany",
			            fill: (resp.DE!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.DE!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "GR": {
			         tooltip: {content: "<b>Greece</b>"},
			         attrs: {
			            title : "Greece",
			            fill: (resp.GR!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.GR!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "HU": {
			         tooltip: {content: "<b>Hungary</b>"},
			         attrs: {
			            title : "Hungary",
			            fill: (resp.HU!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.HU!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "IS": {
			         tooltip: {content: "<b>Iceland</b>"},
			         attrs: {
			            title : "Iceland",
			            fill: (resp.IS!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.IS!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "IN": {
			         tooltip: {content: "<b>India</b>"},
			         attrs: {
			            title : "India",
			            fill: (resp.IN!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.IN!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "ID": {
			         tooltip: {content: "<b>Indonesia</b>"},
			         attrs: {
			            title : "Indonesia",
			            fill: (resp.ID!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.ID!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "IE": {
			         tooltip: {content: "<b>Ireland</b>"},
			         attrs: {
			            title : "Ireland",
			            fill: (resp.IE!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.IE!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "IL": {
			         tooltip: {content: "<b>Israel</b>"},
			         attrs: {
			            title : "Israel",
			            fill: (resp.IL!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: $(resp.IL!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "IT": {
			         tooltip: {content: "<b>Italy</b>"},
			         attrs: {
			            title : "Italy",
			            fill: (resp.IT!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.IT!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "JP": {
			         tooltip: {content: "<b>Japan</b>"},
			         attrs: {
			            title : "Japan",
			            fill: (resp.JP!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.JP!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "JO": {
			         tooltip: {content: "<b>Jordan</b>"},
			         attrs: {
			            title : "Jordan",
			            fill: (resp.JO!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.JO!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "KW": {
			         tooltip: {content: "<b>Kuwait</b>"},
			         attrs: {
			            title : "Kuwait",
			            fill: (resp.KW!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.KW!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "LA": {
			         tooltip: {content: "<b>Laos</b>"},
			         attrs: {
			            title : "Laos",
			            fill: (resp.LA!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.LA!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "LV": {
			         tooltip: {content: "<b>Latvia</b>"},
			         attrs: {
			            title : "Latvia",
			            fill: (resp.LV!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.LV!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "LB": {
			         tooltip: {content: "<b>Lebanon</b>"},
			         attrs: {
			            title : "Lebanon",                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
			            fill: (resp.LB!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.LB!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "LT": {
			         tooltip: {content: "<b>Lithuania</b>"},
			         attrs: {
			            title : "Lithuania", 
			            fill: (resp.LT!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.LT!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "LU": {
			         tooltip: {content: "<b>Luxembourg</b>"},
			         attrs: {
			            title : "Luxembourg", 
			            fill: (resp.LU!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.LU!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "MY": {
			         tooltip: {content: "<b>Malaysia</b>"},
			         attrs: {
			            title : "Malaysia", 
			            fill: (resp.MY!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.MY!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "NL": {
			         tooltip: {content: "<b>Netherlands</b>"},
			         attrs: {
			            title : "Netherlands", 
			            fill: (resp.NL!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.NL!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "NZ": {
			         tooltip: {content: "<b>New Zealand</b>"},
			         attrs: {
			            title : "NewZealand", 
			            fill: (resp.NZ!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.NZ!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "NG": {
			         tooltip: {content: "<b>Nigeria</b>"},
			         attrs: {
			            title : "Nigeria", 
			            fill: (resp.NG!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.NG!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "NO": {
			         tooltip: {content: "<b>Norway</b>"},
			         attrs: {
			            title : "Norway", 
			            fill: (resp.NO!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.NO!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "PH": {
			         tooltip: {content: "<b>Philippines</b>"},
			         attrs: {
			            title : "Philippines", 
			            fill: (resp.PH!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.PH!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "PL": {
			         tooltip: {content: "<b>Poland</b>"},
			         attrs: {
			            title : "Poland", 
			            fill: (resp.PL!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.PL!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "PT": {
			         tooltip: {content: "<b>Portugal</b>"},
			         attrs: {
			            title : "Portugal", 
			            fill: (resp.PT!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.PT!=null?"#fdc600":"#e5e5e5")
			         }               
			      },         
			      "QA": {
			         tooltip: {content: "<b>Qatar</b>"},
			         attrs: {
			            title : "Qatar", 
			            fill: (resp.QA!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.QA!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "RO": {
			         tooltip: {content: "<b>Romania</b>"},
			         attrs: {
			            title : "Romania", 
			            fill: (resp.RO!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.RO!=null?"#fdc600":"#e5e5e5")
			         }               
			      },         
			      "RU": {
			         tooltip: {content: "<b>Russia</b>"},
			         attrs: {
			            title : "Russia", 
			            fill: (resp.RU!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.RU!=null?"#fdc600":"#e5e5e5")
			         }               
			      },         
			      "SA": {
			         tooltip: {content: "<b>Saudi Arabia</b>"},
			         attrs: {
			            title : "SaudiArabia", 
			            fill: (resp.SA!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.SA!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "RS": {
			         tooltip: {content: "<b>Serbia</b>"},
			         attrs: {
			            title : "Serbia", 
			            fill: (resp.RS!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.RS!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "SK": {
			         tooltip: {content: "<b>Slovakia</b>"},
			         attrs: {
			            title : "Slovakia", 
			            fill: (resp.SK!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.SK!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "SI": {
			         tooltip: {content: "<b>Slovenia</b>"},
			         attrs: {
			            title : "Slovenia", 
			            fill: (resp.SI!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.SI!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "ZA": {
			         tooltip: {content: "<b>South Africa</b>"},
			         attrs: {
			            title : "SouthAfrica", 
			            fill: (resp.ZA!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.ZA!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "KR": {
			         tooltip: {content: "<b>South Korea</b>"},
			         attrs: {
			            title : "SouthKorea", 
			            fill: (resp.KR!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.KR!=null?"#fdc600":"#e5e5e5")
			         }               
			      },         
			      "ES": {
			         tooltip: {content: "<b>Spain</b>"},
			         attrs: {
			            title : "Spain", 
			            fill: (resp.ES!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.ES!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "SE": {
			         tooltip: {content: "<b>Sweden</b>"},
			         attrs: {
			            title : "Sweden", 
			            fill: (resp.SE!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.SE!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "CH": {
			         tooltip: {content: "<b>Switzerland</b>"},
			         attrs: {
			            title : "Switzerland", 
			            fill: (resp.CH!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.CH!=null?"#fdc600":"#e5e5e5")
			         }               
			      },
			      "TW": {
			         tooltip: {content: "<b>Taiwan</b>"},
			         attrs: {
			            title : "Taiwan",
			            fill: (resp.TW!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.TW!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "TH": {
			         tooltip: {content: "<b>Thailand</b>"},
			         attrs: {
			            title : "Thailand",
			            fill: (resp.TH!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.TH!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "TR": {
			         tooltip: {content: "<b>Turkey</b>"},
			         attrs: {
			            title : "Turkey",
			            fill: (resp.TR!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.TR!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "UA": {
			         tooltip: {content: "<b>Ukraine</b>"},
			         attrs: {
			            title : "Ukraine",
			            fill: (resp.UA!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.UA!=null?"#fdc600":"#e5e5e5")
			         }               
			      },      
			      "AE": {
			         tooltip: {content: "<b>United Arab Emirates</b>"},
			         attrs: {
			            title : "UnitedArabEmirates",
			            fill: (resp.AE!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.AE!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "GB": {
			         tooltip: {content: "<b>United Kingdom</b>"},
			         attrs: {
			            title : "UnitedKingdom",
			            fill: (resp.GB!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.GB!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "US": {
			         tooltip: {content: "<b>United States</b>"},
			         attrs: {
			            title : "UnitedStates",
			            fill: (resp.US!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.US!=null?"#fdc600":"#e5e5e5")
			         }               
			      },   
			      "VN": {
			         tooltip: {content: "<b>Vietnam</b>"},
			         attrs: {
			            title : "Vietnam",
			            fill: (resp.VN!=null?"#fdc600":"#e5e5e5")
			         }
			         , attrsHover: {
			            fill: (resp.VN!=null?"#fdc600":"#e5e5e5")
			         }               
			      }   
			   },
		});
 };

		$(document).on('click', 'path', function(){
			
		   var project_num = $('#project_num').val();
		   var sale_country = '';
		   
		   if($(this.attributes)[0].nodeValue=='#fdc600' & flag ==0){
			   
			   var country_title =  $(this)[0].firstElementChild.textContent;
		    	$("#country-name").show(); 
			  		
		      $("#country-name").text(country_title); 
			   
			      console.log($(this));
			      sale_country = JSON.stringify($(this)[0].textContent);
			      sale_country = sale_country.substring(1, sale_country.length-1);
			      var data = {"sale_country" : sale_country, "project_num" : project_num}
			       $.ajax({
			         url : 'countryReport'
			         , method : 'post'
			         , dataType : 'JSON'
			         , contentType : 'application/json; charset=UTF-8'
			         , data : JSON.stringify(data)
			         , success : function(resp){
			            window.myMixedChart.destroy();
				 		window.myDoughnut.destroy();
				 		window.myPie.destroy();
				 		saleByMonths(resp);
				 		 saleByAges(resp);
				 		saleByGender(resp);		
				 	
				 		var average = resp.p.sale_totalprice;
				 		$("#hidde").text("Average price per each sale is " + average); 
				 		console.log(chartData);
			         }
			      }); 
			   } 
		   
		   if($(this.attributes)[0].nodeValue=='#fdc600' & flag ==1){
		      /* 여기 수정함 바꿈 9월 19 */
		    	var country_title =  $(this)[0].firstElementChild.textContent;
		    	$("#country-name").show(); 
			  		
		      $("#country-name").text(country_title); 
			  	
		      console.log($(this)[0].firstElementChild.textContent);
		      sale_country = JSON.stringify($(this)[0].dataset.id);
		      
 		      sale_country = sale_country.substring(1, sale_country.length-1);
		      var data = {"sale_country" : sale_country, "project_num" : project_num}
		       $.ajax({
		         url : 'countryReport1'
		         , method : 'post'
		         , dataType : 'JSON'
		         , contentType : 'application/json; charset=UTF-8'
		         , data : JSON.stringify(data)
		         , success : function(resp){
		            window.myMixedChart.destroy();
			 		window.myDoughnut.destroy();
			 		window.myPie.destroy();
			 		viewedByMonths(resp);
			 		 saleByAges(resp);
			 		saleByGender(resp);		
			 	
			 		$("#hidde").text(""); 
			 		console.log(chartData);
		         }
		      }); 
		   } 
		})

	 $(function(){
	 
	startPage();
/* 	$(document).on('click', '#hidde', function(){
		var country = "Australia";
		var num = 70;
		$.ajax({
		 	method : 'get',
		 	url : 'clicked',
		 	data : 'sale_country='+country+"&project_num="+70,
			contentType : 'application/text; charset=UTF-8',
		 	dataType : 'JSON',
		 	success : function(resp) {
		 		window.myMixedChart.destroy();
		 		window.myDoughnut.destroy();
		 		window.myPie.destroy();
		 		saleByMonths(resp);
		 		 saleByAges(resp);
		 		saleByGender(resp);		
		 	
		 		 console.log(resp.s[0]);
		 		 console.log(resp.s[1]);
		 		 
		 		var average = resp.p.sale_totalprice;
		 		$("#hidde").text("구매당 평균가격은 " + average + "입니다."); 
		 		console.log(chartData);
		 		
		 	}
		})	
		
	}); */
	$(document).on('click', '#viewer', function(){
		 $("#potentialComment").show();
		 $("#investerComment").hide();
		 $("#distribution-header").hide();
		 $("#distribution-body").hide();
		 $("#distribution").hide();
		 $("#country-name").hide();
		 

		$("#Investors").css("background", "#999");
		 $("#viewer").css("background", "#fdc600");
		
		 var project_num = $('#project_num').val();

		 flag = 1;
		$.ajax({
		 	method : 'get',
		 	url : 'viewedStat',
		 	data : "project_num="+project_num,
			contentType : 'application/text; charset=UTF-8',
		 	dataType : 'JSON',
		 	success : function(resp) {
		 		window.myPie.destroy();
		 		window.myDoughnut.destroy();
		 	   window.myMixedChart.destroy();
		 		saleByGender(resp);		
		 		viewedByCountries(resp);
		 		saleByAges(resp);
		 		viewedByMonths(resp);
		 		$("#hidde").text(""); 
		 	}
		})	
		
	});
	
	$(document).on('click', '#Investors', function(){
		 $("#potentialComment").hide();
		 $("#investerComment").show();
		 $("#distribution-header").show();
		 $("#distribution-body").show();
		 $("#distribution").show();
		 $("#country-name").hide();

		$("#Investors").css("background", "#fdc600");
		 $("#viewer").css("background", "#999");
		 var project_num = $('#project_num').val();
		   
		flag = 0;
		$.ajax({
		 	method : 'get',
		 	url : 'startPage1',
		 	data : "project_num="+project_num,
			contentType : 'application/text; charset=UTF-8',
		 	dataType : 'JSON',
		 	success : function(resp) {
		 		window.myPie.destroy();
		 		window.myDoughnut.destroy();
		 	   window.myMixedChart.destroy();
		 		saleByGender(resp);		
		 		saleByCountries(resp);
		 		saleByAges(resp);
		 		saleByMonths(resp);
		 		var average = resp.p.sale_totalprice;
		 		$("#hidde").text("Average price per each sale is " + average); 
		 	
				 	}
		})	
		
	});
		
}); 
 
 
 
 function startPage(){
	 $("#potentialComment").hide();
	 $("#investerComment").show();
	 $("#distribution-body").show();
	 $("#distribution-header").show();
	 $("#distribution").show();
	 $("#country-name").hide();

	 $("#Investors").css("background", "#fdc600");
	 $("#viewer").css("background", "#999");

	 var project_num = $('#project_num').val();
	 
	 flag = 0;
	 $.ajax({
		 	method : 'get',
		 	url : 'startPage',
		 	data : "project_num="+project_num,
			contentType : 'application/text; charset=UTF-8',
		 	dataType : 'JSON',
		 	success : function(resp) {
		 		saleByMonths(resp);
		 		saleByAges(resp);
		 		saleByGender(resp);	
		 		saleByCountries(resp);
		 		var average = resp.p.sale_totalprice;
		 		$("#hidde").text("Average price per each sale is " + average); 
		 	
				 	}
		})
};

function viewedByMonths(resp){
	
	 var months = [];	
		var amounts = [];	
		var prices = [];	
		var templist = [];
		console.log(resp.m[0]);
		var month = Number(resp.m[0].sale_date.substr(3,2));
		var i = 0;
		var mon = 0;
		
		for(var j = 0; j < 12; j++) {
			if(month >12) {
				month = 1;
			}
			
			if(j == 0) {
				mon = Number(resp.m[i].sale_date.substr(3,2));	
			}
			
			if(mon == month) {
				templist.push({
					"sale_date" : Number(resp.m[i].sale_date.substr(3,2))
					, "sale_amount" : resp.m[i].sale_amount
				});
				i++
				if(i < resp.m.length) {
					mon = Number(resp.m[i].sale_date.substr(3,2));
				}
				
			} else if(mon != month) {
				templist.push({
					"sale_date" : month
					, "sale_amount" : 0
				});
			}
			
			month++;
		}
		
		for(var j = 0; j<12; j++){
			months[j] = templist[j].sale_date;
			amounts[j] = templist[j].sale_amount;
		}
		
		
//Sales By Months

var ctx = document.getElementById('line-chart').getContext('2d');
window.myMixedChart = new Chart(ctx, {
		  type: 'line',
	  data: {
	    labels: [months[0],months[1],months[2],months[3],months[4],months[5],months[6],months[7],months[8],months[9],months[10],months[11]],
	    datasets: [{ 
	        data: [amounts[0],amounts[1],amounts[2],amounts[3],amounts[4],amounts[5],amounts[6],amounts[7],amounts[8],amounts[9],amounts[10],amounts[11]],
	        label: "Number of views",
	        borderColor: "#FDC600",
	        fill: false,
	        hidden: false
	      }
	    ]
	  },
	  options: {
	    title: {
	      display: true,
	    }
	  }
	});
		
	console.log(chartData);
}
 
	function saleByMonths(resp){
		
		 var months = [];	
			var amounts = [];	
			var prices = [];	
			var templist = [];
			var month = Number(resp.m[0].sale_date.substr(3,2));
			var i = 0;
			var mon = 0;
			
			for(var j = 0; j < 12; j++) {
				if(month >12) {
					month = 1;
				}
				
				if(j == 0) {
					mon = Number(resp.m[i].sale_date.substr(3,2));	
				}
				
				if(mon == month) {
					templist.push({
						"sale_date" : Number(resp.m[i].sale_date.substr(3,2))
						, "sale_amount" : resp.m[i].sale_amount
						, "sale_totalprice" : resp.m[i].sale_totalprice
					});
					i++
					if(i < resp.m.length) {
						mon = Number(resp.m[i].sale_date.substr(3,2));
					}
					
				} else if(mon != month) {
					templist.push({
						"sale_date" : month
						, "sale_amount" : 0
						, "sale_totalprice" : 0
					});
				}
				
				month++;
			}
			
			for(var j = 0; j<12; j++){
				months[j] = templist[j].sale_date;
				prices[j] = templist[j].sale_totalprice;
				amounts[j] = templist[j].sale_amount;
			}
			
			
	//Sales By Months
		chartData = {
			    labels: [months[0],months[1],months[2],months[3],months[4],months[5],months[6],months[7],months[8],months[9],months[10],months[11]],
			    datasets: [{ 
			        data: [amounts[0],amounts[1],amounts[2],amounts[3],amounts[4],amounts[5],amounts[6],amounts[7],amounts[8],amounts[9],amounts[10],amounts[11]],
			        type: 'line',
			        label: "Number of Sales",
			        borderColor: "#FDC600",
			        borderWidth: 4,
			        fill: false,
			        hidden: false
			      }, {
					type: 'bar',
					label: 'Total Sales',
					backgroundColor: 'green',
					data: [prices[0],prices[1],prices[2],prices[3],prices[4],prices[5],prices[6],prices[7],prices[8],prices[9],prices[10],prices[11]],
					borderColor: 'white',
					borderWidth: 2
				}]
			  };
		var ctx = document.getElementById('line-chart').getContext('2d');
		window.myMixedChart = new Chart(ctx, {
			type: 'bar',
			data: chartData,
			options: {
				responsive: true,
				title: {
					display: true,
				},
				tooltips: {
					mode: 'index',
					intersect: true
				}
			}
		});
			
		console.log(chartData);
	}
	
function saleByAges(resp){
		
		var ageList = [];
		i = 10;
		var k = 0;
		var j = 1;
		
		while(true){
			i =i*j;

			if(resp.a[k]==null){
				ageList[j] = 0;
			}
			console.log(resp.a[0]);
			if(resp.a[k]!=null){
				if(i!=resp.a[k].sale_date){
					ageList[j] = 0;
				}
				if(i==resp.a[k].sale_date){
					ageList[j] = resp.a[k].sale_amount;
					++k;
				}
			};
			
			if(i==60){
				if(resp.a[k]!=null){
					ageList[6] += resp.a[k].sale_amount;
				} else{
					break;
				}
			}
				
			i = 10;
			j++;
		};
		
		console.log(ageList);
		
		var config = {
				type: 'doughnut',
				data: {
					datasets: [{
						data: [ageList[1],ageList[2],ageList[3],ageList[4],ageList[5],ageList[6]],
						backgroundColor: ["#64b5f6","#1976d2","#ef6c00","#ffd54f","#455a64","#455a64"],
						label: 'Dataset 1'
					}],
					labels: [
						"10","20","30","40","50","60+"
					]
				},
				options: {
					responsive: true,
					legend: {
						position: 'top',
					},
					title: {
						display: true
					},
					animation: {
						animateScale: true,
						animateRotate: true
					}
				}
			};

			var ctx = document.getElementById('chart-area').getContext('2d');
			window.myDoughnut = new Chart(ctx, config);
		
		
/* 		var myDoughnutChart = new Chart(document.getElementById("chartjs-4"),{"type":"doughnut","data":{"labels":["10","20","30","40","50","60+"],"datasets":[{"label":"My First Dataset","data":[ageList[1],ageList[2],ageList[3],ageList[4],ageList[5],ageList[6]],"backgroundColor":["#64b5f6","#1976d2","#ef6c00","#ffd54f","#455a64","#455a64"]}]}});
 */
}
	
	
function saleByGender(resp){
	var men = 0;
	var women = 0;
	
	if(resp.s[0]!= null&&resp.s[1] !=null){
		men = resp.s[0].sale_amount
		women = resp.s[1].sale_amount
	}else if(resp.s[0]== null&&resp.s[1] ==null){
		men = 0;
		women = 0;
	}else if(resp.s[1] == null){
		if(resp.s[0].userid=="man"){
			men =  resp.s[0].sale_amount;
		}
		if(resp.s[0].userid=="woman"){
			women =  resp.s[0].sale_amount;
		}
	}
	
	
	/* 
	if(resp.s[0]!= null&&resp.s[1] !=null){
		 var data = [
		      {x: "Men", value: resp.s[0].sale_amount},
		      {x: "Women", value: resp.s[1].sale_amount}
	 	 ];
	}
	
	if(resp.s[0]== null||resp.s[1] ==null){
		 var data = [
		      {x: resp.s[0].userid, value: resp.s[0].sale_amount},
	 	 ];
	} */
	
	var config = {
			type: 'pie',
			data: {
				datasets: [{
					data: [
						men, women
					],
					backgroundColor: [
						"#64b5f6","#1976d2"
					],
					label: 'Dataset 1'
				}],
				labels: [
					'Men',
					'Women'
				]
			},
			options: {
				responsive: true
			}
		};

		var ctx = document.getElementById('chart-pie').getContext('2d');
		window.myPie = new Chart(ctx, config);
	
	
	  /* // create the chart
	  var chart = anychart.pie();

	  // set the chart title
	  chart.title("카테고리별 분포도");

	  // add the data
	  chart.data(data);

	  // display the chart in the container
	  chart.container('container');
	  chart.draw();
	  
	  $(".anychart-credits").remove(); */
	 }
	
 


	

/* 
 var chartData = {
	    labels: [months[0],months[1],months[2],months[3],months[4],months[5],months[6],months[7],months[8],months[9],months[10],months[11]],
	    datasets: [{ 
	        data: [values[0],values[1],values[2],values[3],values[4],values[5],values[6],values[7],values[8],values[9],values[10],values[11]],
	        type: 'line',
	        label: "Mental Health",
	        borderColor: "#64b5f6",
	        fill: false,
	        hidden: false
	      }, {
			type: 'bar',
			label: 'Dataset 2',
			backgroundColor: 'green',
			data: [${a==13?a:"15"},${11<10?"2":"20"},${11<10?"2":"25"},${11<10?"2":"15"},${11<10?"2":"20"},${11<10?"2":"25"},${11<10?"2":"33"},${11<10?"2":"12"},${11<10?"2":"32"},${11<10?"2":"25"},${11<10?"2":"28"},${11<10?"2":"29"}],
			borderColor: 'white',
			borderWidth: 2
		}, {
			type: 'bar',
			label: 'Dataset 3',
			backgroundColor: 'red',
			data: [
				12,11,10,9,8,7,6,5,4,3,2,1
			]
		}]
	  };
	
window.onload = function() {
	var ctx = document.getElementById('line-chart').getContext('2d');
	window.myMixedChart = new Chart(ctx, {
		type: 'bar',
		data: chartData,
		options: {
			responsive: true,
			title: {
				display: true,
				text: '올해의 월별 성취량 (아래의 색을 클릭하시면 타입별로 볼 수 있습니다.)'
			},
			tooltips: {
				mode: 'index',
				intersect: true
			}
		}
	});
};
 */

 
 
</script>


</html>