<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
});
</script>
<style type="text/css">
@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100);

body {
  background-color: white;
  font-family: "Roboto", helvetica, arial, sans-serif;
  font-size: 14px;
  font-weight: 300;
  text-rendering: optimizeLegibility;
}

div.table-title {
  display: block;
  margin: auto;
  max-width: 500px;
  padding:5px;
  width: 100%;
}

.table-title h3 {
   color: #FDC600;
   font-size: 25px;
   font-weight: 400;
   font-style:normal;
   font-family: "Roboto", helvetica, arial, sans-serif;
   text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
   text-transform:uppercase;
}

/*** Table Styles **/

.table-fill {
  background: white;
  border-radius:3px;
  border-collapse: collapse;
  height: 200px;
  margin: auto;
  max-width: 400px;
  padding:5px;
  width: 100%;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
  animation: float 5s infinite;
}
 
th {
  text-align: center;
  color: white;
  background:#ccc;
  border-bottom:4px solid #f5f5f5;
  border-right: 1px solid #f5f5f5;
  font-size: 16px;
  font-weight: 100;
  padding: 20px;
  text-align:center;
  text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
  vertical-align:middle;
  text-transform: uppercase;
  font-weight: 500;
}

th:first-child {
  border-top-left-radius:3px;
  height: 50px;
}
 
th:last-child {
  border-top-right-radius:3px;
  border-right:none;
}
  
tr {
  border-top: 1px solid #C1C3D1;
  border-bottom-: 1px solid #C1C3D1;
  color: #666B85;
  font-size:16px;
  font-weight:normal;
  text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
}
 
tr:hover td {
  background-color: #f5f5f5;
}
tr:hover{
  box-shadow: 0px 2px 18px 0px rgba(0,0,0,0.5);
  cursor: pointer;
}
tr:first-child {
  border-top:none;
}

tr:last-child {
  border-bottom:none;
}
 
tr:nth-child(odd) td {
}
 
tr:nth-child(odd):hover {
}

tr:last-child td:first-child {
  border-bottom-left-radius:3px;
}
 
tr:last-child td:last-child {
  border-bottom-right-radius:3px;
}
 
td {
  background:#FFFFFF;
  padding:20px;
  text-align:left;
  vertical-align:middle;
  font-weight:300;
  font-size:17px;
  text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.1);
  border-right: 1px solid #C1C3D1;
}

td:last-child {
  border-right: 0px;
}

th.text-left {
  text-align: left;
}

th.text-center {
  text-align: center;
}

th.text-right {
  text-align: right;
}

td.text-left {
  text-align: left;
}

td.text-center {
  text-align: center;
}

td.text-right {
  text-align: right;
}
</style>
        
   
        
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
	                                   <a href="projectsList?co_id=${sessionScope.userid}">projects</a>
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

        <!-- End page header -->

        <!-- property area -->
        
        <div class="content-area recent-property" style="background-color: #fcfcfc;"  >
            <div class="container" style="padding-top: 50px; background-color: white;">  
            <div style="text-align: center;">
            <h3 class="page-title"style="border-bottom: solid 3px #FDC600; padding-bottom: 10px; color: #333; display: inline; letter-spacing: 0.198em; text-transform: uppercase;">Buyer List</h3>
            </div>
                <div class="row" align="center">

                    <div class="col-md-9 pr-30 padding-top-40 properties-page user-properties" style="width: 100%; margin-bottom: 100px; padding-right: 10px;">
                        <div class="section" > 
                            <div class="section additional-details">

                                <div align="center">
                                    <div class="row fadeInLeft animated animated" style="margin-bottom: 60px;">
				                    <div class="col-md-9 pr-30 padding-top-40 properties-page user-properties" style="padding-top: 0px;">
				
				                            <div id="list-type" class="proerty-th-list">
				                                           
				                                <div class="col-md-4 p0" style="left: 16%; margin-top: 10px;">
							                        <div class="box-two proerty-item">
							                           <div class="item-thumb">
							                              <div class="clearfix">
							                                 <div class="lSSlideWrapper usingCss"
							                                    style="transition-duration: 500ms; transition-timing-function: ease;">
							                                     <a href="detailedProject1?project_num=${project.project_num}">
							                                     <img src="showProjectImg?project_num=${project.project_num}">
							                                     </a>
							                                 </div>
							                              </div>
							                           </div>
							                           
							                           <div class="item-entry overflow">
							                              <h5 style="text-align: left; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
							                                 <a href="detailedProject1?project_num=${project.project_num}">${project.project_title}</a>
							                              </h5>
							                              <div class="dot-hr"></div>
							                              
							                              <div class="progress-card" align="center">
							                                 <div class="d-flex justify-content-between mb-1">
							                                    <div class="progress mb-2" style="height: 15px; width: 100%">
							                                       <div class="progress-bar bg-success" role="progressbar"
							                                          style="width: ${(project.project_nowfundprice/project.project_goalfundprice)*100}%" aria-valuenow="${(project.project_nowfundprice/project.project_goalfundprice)*100}" aria-valuemin="0"
							                                          aria-valuemax="100" data-toggle="tooltip" data-placement="top"
							                                          title="${project.project_nowfundprice}" data-original-title="${project.project_nowfundprice}%"></div>
							                                    </div>
							                                 </div>
							                              </div>
							                              
							                              <div style="width: 100%; height: 30px;">
							                              <span class="pull-left"><b>${fn:substring(project.project_goaldate, 0, 10)}</b>  
							                              </span> 
							                              <span class="proerty-price pull-right"><span>$</span> ${project.project_goalfundprice}</span>                              
							                              </div>
							                               
							                              <div style="width : 100%; text-align: right;">
							                              	<input type="button" class="ConsumerReport" value="ConsumerReport" width="100px" height="30px" style="width: 50%; margin-top: 10px; color: white; background-color: #ddd; font-size: 18px; text-shadow: #aaa8a8 1px 1px;" onclick="location.href='getReport?project_num=${project.project_num}'">
							                              </div>
							                           </div>
							                        </div>
				                                </div> 
				                            </div>
				                    </div>       
				                	</div>
                                
                                
                                
						            <c:if test="${empty buyerList}">
						         		<h2> No Data Found... </h2>
						         	</c:if>
						         	<c:if test="${not empty buyerList}">
										<div style="width: 100%;">
										<table class="table-style-one">
						    				<thead style="background-color: #FDC600; color: white;">
						   				 		<tr>
						        					<th>Userid</th><th>Name</th><th>Total price</th><th>Amount</th><th>Address</th><th>Date</th>
						    					</tr>
						    				</thead>
						    			<tbody>
						       
						        
									   <c:forEach items="${buyerList}" var="buyerList">
									    <tr>
									    <td width="150" style="text-align: center;">${buyerList.userid}</td>
									    <td width="100" style="text-align: center;">${buyerList.sale_firstname}</td>
									    <td width="200" style="text-align: right;">$${buyerList.sale_totalprice}</td>
								        <td width="80" style="text-align: right;">${buyerList.sale_amount} </td>
								        <td width="600" style="text-align: left;">${buyerList.sale_country} ${buyerList.sale_zipcode} ${buyerList.sale_province} ${buyerList.sale_city} ${buyerList.sale_address1}${buyerList.sale_address2}</td>
								        <td width="250" style="text-align: center;">${buyerList.sale_date}</td>
									    </tr>
									       </c:forEach>
									    </tbody>
										</table>
										</div>
									</c:if>
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

    </body>
</html>