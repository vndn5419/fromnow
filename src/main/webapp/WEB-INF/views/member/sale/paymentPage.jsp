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

<style type="text/css">
.line{
	border-bottom:2px solid grey;
	border-top: 2px solid grey;
}
td{
	height: 60px;
}
</style>

<script src="assets/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
        
        
		
 		 <div class="content-area recent-property" style="background-color: #FFF; width: 106%;">
            <div class="container">   
				<div class="section clear fadeInLeft animated animated" style="text-align: center; visibility: visible; animation-name: fadeInLeft; margin-bottom: 40px; margin-top: 50px;">
           			 <h3 class="page-title"style="border-bottom: solid 3px #FDC600; padding-bottom: 10px; color: #333; display: inline; letter-spacing: 0.198em; text-transform: uppercase;">Payment</h3>
           		</div>
                <div class="row fadeInLeft animated animated">
                    <div class="col-md-9 pr-30 padding-top-40 properties-page user-properties" style="padding-top: 0px;">

                            <div id="list-type" class="proerty-th-list">
                                           
                                <div class="col-md-4 p0" style="left: 16%; margin-top: 10px;">
                                    <div class="box-two proerty-item">
                                        <div class="item-thumb">
                                            <img src="showProjectImg?project_num=${project.project_num}"></a>
                                        </div>

                                        <div class="item-entry overflow">
                                            <h5><a href="detailedProject1?project_num=${project.project_num}">
                                 				${project.project_title} </a></h5>
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
				                               
                                                
                                        </div>
                                    </div>
                                </div> 
                            </div>
                    </div>       
                </div>
            
					<div class="row" id="order_container" style="padding-left: 13.5%; padding-top: 25px;">
					<a style="font-size: 20px; text-transform: uppercase;">Buyer</a>
					 <br><br>
					 
					 <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
					 <input type="hidden" name="cmd" value="_xclick">
					 <input type="hidden" name="business" value="book0328@naver.com">
					
						<table>
						<tr>
							<td class="line" width="200px" align="center" style="background-color: #E6E6E6"> Firstname </td>
							<td class="line" width="600px" style="padding-left: 40px;"><input type="text" id="order_firstname" value="${username}" readonly="readonly"> </td>
						</tr>	
						<tr>
							<td class="line" width="200px" align="center" style="background-color: #E6E6E6"> Lastname </td>
							<td class="line" width="600px" style="padding-left: 40px;"><input type="text" id="order_lastname" value="${lastname}" readonly="readonly"> </td>
						</tr>	
						
						<tr>
							<td class="line" width="200px" align="center" style="background-color: #E6E6E6">Email</td>
							<td class="line" width="600px" style="padding-left: 40px;"><input type="text" id="order_email" value="${email}" readonly="readonly"></td>
						</tr>
						
						<tr>
							<td class="line" width="200px" align="center" style="background-color: #E6E6E6" >Phone </td>
							<td class="line" width="600px" style="padding-left: 40px;"><input type="text" id="order_phone" value="${phone}" readonly="readonly"></td>
						</tr>
					</table>
					
					<br>
					<br>
					<a style="font-size: 20px; text-transform: uppercase;">Recipient information</a> &nbsp; &nbsp;&nbsp;&nbsp; Same as buyer information &nbsp;&nbsp;
					<input id="checkboxinfo" type="checkbox" onclick="checking()">
					<br>
					<br>            
            

		

		
		<script type="text/javascript">
		
		$(function() {
			
			var zipcode = "${zipcode}";
			var state = "${state}";
			var city = "${city}";
			var address1= "${address1}";
			var address2= "${address2}";
			var country = "${country}";
			
			 $('#checkboxinfo').on('ifChecked',function(){
				//var classname = $("#checkboxinfo").closest("div").attr("class");
				//alert(classname);
				document.getElementById("info_firstname").value = document.getElementById("order_firstname").value;
				document.getElementById("info_lastname").value = document.getElementById("order_lastname").value;
				document.getElementById("info_phone").value = document.getElementById("order_phone").value;
				document.getElementById("info_email").value = document.getElementById("order_email").value;
				document.getElementById("info_zipcode").value = zipcode;
				document.getElementById("info_state").value = state;
				document.getElementById("info_city").value = city;
				document.getElementById("info_address1").value = address1;
				document.getElementById("info_address2").value = address2;
				document.getElementById("info_country").value=country;			
			 });
			
			 $('#checkboxinfo').on('ifUnchecked',function(){
					//var classname = $("#checkboxinfo").closest("div").attr("class");
					//alert(classname);
					document.getElementById("info_firstname").value = null;
					document.getElementById("info_lastname").value = null;
					document.getElementById("info_phone").value = null;
					document.getElementById("info_email").value = null;
					document.getElementById("info_country").value=null;
					document.getElementById("info_zipcode").value =null;
					document.getElementById("info_state").value =null;
					document.getElementById("info_city").value =null;
					document.getElementById("info_address1").value =null;
					document.getElementById("info_address2").value =null;
					document.getElementById("info_country").value=null;
					
			});
		});
		</script>
		
			<table>
			<tr>
				<td class="line" width="200px" align="center" style="background-color: #E6E6E6"> Firstname </td>
				<td class="line" style="padding-left: 40px;"><input type="text" id="info_firstname" placeholder="Please enter a firstname"> </td>
			</tr>	
				<tr>
				<td class="line" width="200px" align="center" style="background-color: #E6E6E6"> Lastname </td>
				<td class="line" style="padding-left: 40px;"><input type="text" id="info_lastname" placeholder="Please enter a lastname"> </td>
			</tr>
			
			<tr>
				<td class="line" width="200px" align="center" style="background-color: #E6E6E6">Postal code / Zip code</td>
				<td class="line" width="600px" style="padding-left: 40px;"><input type="text" id="info_zipcode" placeholder="Please enter a zipcode"></td>
			</tr>
			<tr>
				<td class="line" width="200px" align="center" style="background-color: #E6E6E6">Country</td>
				<td class="line" width="600px" style="padding-left: 50px;">
				<select class="select" id="info_country" style="padding-left: 10px;"><option data-title="Australia" value="Australia">Australia</option><option data-title="Austria" value="Austria">Austria</option><option data-title="Belarus" value="Belarus">Belarus</option><option data-title="Belgium" value="Belgium">Belgium</option><option data-title="Bosnia &amp; Herzegovina" value="Bosnia">Bosnia Herzegovina</option><option data-title="Brunei" value="Brunei">Brunei</option><option data-title="Bulgaria" value="Bulgaria">Bulgaria</option>
				<option data-title="Canada" value="Canada">Canada</option><option data-title="China" value="China">China</option><option data-title="Croatia" value="Croatia">Croatia</option><option data-title="Cyprus" value="Cyprus">Cyprus</option><option data-title="Czech Republic" value="CzechRepublic">Czech Republic</option><option data-title="Denmark" value="Denmark">Denmark</option><option data-title="Estonia" value="Estonia">Estonia</option><option data-title="Finland" value="Finland">Finland</option><option data-title="France" value="France">France</option><option data-title="Georgia" value="Georgia">Georgia</option>
				<option data-title="Germany" value="Germany">Germany</option><option data-title="Greece" value="Greece">Greece</option><option data-title="Hungary" value="Hungary">Hungary</option><option data-title="Iceland" value="Iceland">Iceland</option><option data-title="India" value="India">India</option><option data-title="Indonesia" value="Indonesia">Indonesia</option><option data-title="Ireland" value="Ireland">Ireland</option>
				<option data-title="Israel" value="Israel">Israel</option><option data-title="Italy" value="Italy">Italy</option><option data-title="Japan" value="Japan">Japan</option><option data-title="Jordan" value="Jordan">Jordan</option><option data-title="Kuwait" value="Kuwait">Kuwait</option><option data-title="Laos" value="Laos">Laos</option><option data-title="Latvia" value="Latvia">Latvia</option><option data-title="Lebanon" value="Lebanon">Lebanon</option><option data-title="Lithuania" value="Lithuania">Lithuania</option><option data-title="Luxembourg" value="Luxembourg">Luxembourg</option>
				<option data-title="Malaysia" value="Malaysia">Malaysia</option><option data-title="Netherlands" value="Netherlands">Netherlands</option><option data-title="New Zealand" value="NewZealand">New Zealand</option><option data-title="Nigeria" value="Nigeria">Nigeria</option><option data-title="Norway" value="Norway">Norway</option><option data-title="Philippines" value="Philippines">Philippines</option><option data-title="Poland" value="Poland">Poland</option>
				<option data-title="Portugal" value="Portugal">Portugal</option><option data-title="Qatar" value="Qatar">Qatar</option><option data-title="Romania" value="Romania">Romania</option><option data-title="Russia" value="Russia">Russia</option><option data-title="Saudi Arabia" value="SaudiArabia">Saudi Arabia</option><option data-title="Serbia" value="Serbia">Serbia</option><option data-title="Slovakia" value="Slovakia">Slovakia</option><option data-title="Slovenia" value="Slovenia">Slovenia</option><option data-title="South Africa" value="SouthAfrica">South Africa</option><option data-title="South Korea" value="SouthKorea">South Korea</option>
				<option data-title="Spain" value="Spain">Spain</option><option data-title="Sweden" value="Sweden">Sweden</option><option data-title="Switzerland" value="Switzerland">Switzerland</option><option data-title="Taiwan" value="Taiwan">Taiwan</option><option data-title="Thailand" value="Thailand">Thailand</option><option data-title="Turkey" value="Turkey">Turkey</option><option data-title="Ukraine" value="Ukraine">Ukraine</option><option data-title="United Arab Emirates" value="UnitedArabEmirates">United Arab Emirates</option><option data-title="United Kingdom" value="UnitedKingdom">United Kingdom</option><option data-title="United States" value="UnitedStates">United States</option></select>
				</td>
			</tr>
			<tr>
				<td class="line" width="200px" align="center" style="background-color: #E6E6E6">State/Province/Region</td>
				<td class="line" width="600px" style="padding-left: 40px;"><input type="text" id="info_state" placeholder="Please enter a state"></td>
			</tr>
			<tr>
				<td class="line" width="200px" align="center" style="background-color: #E6E6E6">City</td>
				<td class="line" width="600px" style="padding-left: 40px;"><input type="text" id="info_city" placeholder="Please enter a city"></td>
			</tr>
			<tr>
				<td class="line" width="200px" align="center" style="background-color: #E6E6E6">Address1</td>
				<td class="line" width="600px" style="padding-left: 40px;"><input type="text" id="info_address1" placeholder="Please enter a address1"></td>
			</tr>
			<tr>
				<td class="line" width="200px" align="center" style="background-color: #E6E6E6">Address2</td>
				<td class="line" width="600px" style="padding-left: 40px;"><input type="text" id="info_address2" placeholder="Please enter a address2"></td>
			</tr>
			<tr>
				<td class="line" width="200px" align="center" style="background-color: #E6E6E6" >Email </td>
				<td class="line" width="600px" style="padding-left: 40px;"><input type="text" id="info_email" placeholder="Please enter a email"></td>
			</tr>
			<tr>
				<td class="line" width="200px" align="center" style="background-color: #E6E6E6" >Phone </td>
				<td class="line" width="600px" style="padding-left: 40px;"><input type="text" id="info_phone" placeholder="Please enter a phonenumber"></td>
			</tr>
			
		</table>
		<br>
		<br>
		<a style="font-size: 20px; text-transform: uppercase;">Payment information</a>
		<br>
		<br>
			
			<table>
			<tr>
				<td class="line" width="200px" align="center" style="background-color: #E6E6E6"> Product Price </td>
				<td class="line"  style="padding-left: 40px;"><input type="text" id="totalprice" value="${project.reward_price}" readonly="readonly"> </td>
			</tr>	
			<tr>
				<td class="line" width="200px" align="center" style="background-color: #E6E6E6"> amount </td>
				<td class="line"  style="padding-left: 40px;"><input type="number" id="amount" value="${amount}"> </td>
			</tr>	
			
			
			<tr>
		
				<td class="line" width="200px" align="center" style="background-color: #E6E6E6" >Product Name </td>
				<td class="line" width="600px" style="padding-left: 40px;"><input type="text" id="productname" name="item_name" value="${project.project_title}" readonly="readonly" >
			</tr>
			
			<tr>
				<td class="line" width="200px" align="center" style="background-color: #E6E6E6">Coupon</td>
				<td class="line" width="600px" style="padding-left: 50px;">
					<select id="coupon" name="lang">
						<option value="0" selected="selected">choice your coupon</option>
						<c:if test="${!empty coupon}">
						<c:forEach var="onecoupon" items="${coupon}" varStatus="status">
						<c:if test="${status.index eq 0}"><%-- 0, 1, 2, 3, 4, 5 중 index 1번째 --%>
						<option value="${onecoupon.coupon_discountrate}">${onecoupon.coupon_discountrate}%</option>
						<input type="hidden" value="${onecoupon.coupon_num}" id="coupon_num"> 
						</c:if>
						</c:forEach>
						</c:if>
			         </select>
 				 </td>
			</tr>
			
			
			<tr>
				<td class="line" width="200px" align="center" style="background-color: #E6E6E6" >Total Price(dollar/$) </td>
				<td class="line" width="600px" style="padding-left: 40px;"><input type="text" id="totalpaymentprice" value="${project.reward_price*amount}" name="amount" readonly="readonly"></td>
				<!-- 결제후 이동되는 페이지 : --> <input type="hidden" id="paypalReturn" name="return" value="http://localhost:8088/cryptokick/orderComplete"/>
            	<!-- IPN메세지 받을 페이지 : --> <input type="hidden" name="notify_url" value="http://localhost/paypal/complete.asp"  />
            	<!-- 결제 취소 페이지 : --> <input type="hidden" name="cancel_return" value="http://localhost:8088/cryptokick/Projects?project_category=All"  />
            	<!-- 인코딩 : --> <input type="hidden" name="charset" value="UTF-8" size="50" />
           		 <input type="hidden" name="currency_type" value="USD" size="50" />
				
				</td>
			</tr>
			
		</table>
		<script>
				 	/* function changeSelect(){
						
						var div = document.createElement('del');
							var totalprice = document.getElementById("totalprice").value
							var all = totalprice-(totalprice*(document.getElementById("coupon").value/100));
						
							div.after($('#totalprice'));
							div.before($('#totalprice'));
							document.getElementById("totalpaymentprice").value= all
						
					} */
					
					/* $(function() {
						 var userid = '123';
							var project_num = 77;
							var sendData={
									"userid" : userid
									,"project_num" : project_num
							}
							
						 $('#favorite').on('ifChecked',function(){
							
								alert("체크됨");
								alert(userid);
								alert(project_num);
								$.ajax({
						    		method : 'post'
						    		,url : 'favoriteInsert'
						    		,data : JSON.stringify(sendData)
						    		,contentType : 'application/json; charset:utf-8'
						    		,success : function(){
						    			
						    			alert("성공");
						    		}
									,error : function(){
										alert("에러");
									}
						    		
						    	});
						 });
						
						 $('#favorite').on('ifUnchecked',function(){
							 alert("체크해제됨");
							 alert(userid);
							 alert(project_num);
							 $.ajax({
						    		method : 'post'
						    		,url : 'favoriteDelete'
						    		,data : JSON.stringify(sendData)
						    		,contentType : 'application/json; charset:utf-8'
						    		,success : function(){
						    			alert("체크해제성공");
						    		}
									,error : function(){
										alert("체크해제에러");
									}
						    	});
						});
					}); */
					
					$('#amount').change(function() {
						var totalprice = ${project.reward_price}*$('#amount').val();
						var all = parseFloat(totalprice-(totalprice*(document.getElementById("coupon").value/100)));
						
						
						document.getElementById("totalpaymentprice").value= all
					
					})
					
					$('#coupon').change(function() {
						//alert("쿠폰으로 들어옴");
						var totalprice = ${project.reward_price}*$('#amount').val();
						var all = parseFloat(totalprice-(totalprice*(document.getElementById("coupon").value/100)));
					
						document.getElementById("totalpaymentprice").value= all;
					
					});
		</script>
	
		
		<div align="center" style="padding-right: 19%; margin-bottom: 60px; margin-top: 50px; width: 100%; margin-left: 0px; margin-right: 0px;"><button class="navbar-btn nav-button wow fadeInRight animated" onclick="location.href='Projects?project_category=All'" type="button" >Back to List</button>
		<button class="navbar-btn nav-button wow bounceInRight login animated" id="check_module" type="button" >Payment</button>
		<div><button style="width:170px; height:33px; background-image: url('https://www.paypalobjects.com/webstatic/en_AU/i/buttons/btn_paywith_primary_m.png')" id="pay" type="submit" ></button></div>
		</div>
		
		
		</form>
		</div>
		
		<script>
		
	$("#pay").click(function () {
    	var totalpaymentprice = document.getElementById("totalpaymentprice").value;
    	var firstname = document.getElementById("info_firstname").value;
    	var lastname = document.getElementById("info_lastname").value;
    	var zipcode  = document.getElementById("info_zipcode").value;
    	var country	 = document.getElementById("info_country").value;
    	var city	 = document.getElementById("info_city").value;
    	var province = document.getElementById("info_state").value;
    	var address1 = document.getElementById("info_address1").value;
    	var address2 = document.getElementById("info_address2").value;
    	var phone = document.getElementById("info_phone").value;
    	var email = document.getElementById("info_email").value;
    	var productname = document.getElementById("productname").value;
    	var amount = document.getElementById("amount").value;
    	var project_num = '${project.project_num}';
    	if($('#coupon_num').val() > 0){
    		var coupon_num = document.getElementById("coupon_num").value;
    	} else{
    		var coupon_num = 0;
    	}
    	var returnUrl = 'http://localhost:8088/cryptokick/orderComplete?coupon_num='+coupon_num;
		$('#paypalReturn').val(returnUrl);    	
    	
    	//alert(firstname);
    	var sendData = {
    			
    			"sale_firstname" : firstname
    			,"sale_lastname" : lastname
    			,"sale_zipcode" : zipcode
    			,"sale_country" : country
    			,"sale_city" : city
    			,"sale_province" : province
    			,"sale_address1" : address1
    			,"sale_address2" : address2
    			, "sale_phone" : phone
    			, "sale_email" : email
    			, "sale_totalprice" : totalpaymentprice
    			//, "productname" : productname
    			, "sale_amount" : amount
    			, "project_num" : project_num
    			
    	}
    
    	$.ajax({
    		method : 'post'
    		,url : 'orderInfo'
    		,data : JSON.stringify(sendData)
    		, contentType : 'application/json; charset:utf-8'
    		
    	});
	});
		
		
	
    $("#check_module").click(function () {
    	var totalpaymentprice = document.getElementById("totalpaymentprice").value;
    	var firstname = document.getElementById("info_firstname").value;
    	var lastname = document.getElementById("info_lastname").value;
    	var zipcode  = document.getElementById("info_zipcode").value;
    	var country	 = document.getElementById("info_country").value;
    	var city	 = document.getElementById("info_city").value;
    	var province = document.getElementById("info_state").value;
    	var address1 = document.getElementById("info_address1").value;
    	var address2 = document.getElementById("info_address2").value;
    	var phone = document.getElementById("info_phone").value;
    	var email = document.getElementById("info_email").value;
    	var productname = document.getElementById("productname").value;
    	var amount = document.getElementById("amount").value;
    	var project_num = '${project.project_num}';
    	if($('#coupon_num').val() > 0){
    		var coupon_num = document.getElementById("coupon_num").value;
    	} else{
    		var coupon_num = 0;
    	}
    	
    	//alert(totalpaymentprice);
    	
    	var sendData = {
    			
    			"sale_firstname" : firstname
    			,"sale_lastname" : lastname
    			,"sale_zipcode" : zipcode
    			,"sale_country" : country
    			,"sale_city" : city
    			,"sale_province" : province
    			,"sale_address1" : address1
    			,"sale_address2" : address2
    			, "sale_phone" : phone
    			, "sale_email" : email
    			, "sale_totalprice" : parseInt(totalpaymentprice)
    			//, "productname" : productname
    			, "sale_amount" : amount
    			, "project_num" : project_num
    			
    	}
    	
    	//alert(JSON.stringify(sendData));
    
    	$.ajax({
    		method : 'post'
    		,url : 'orderInfo'
    		,data : JSON.stringify(sendData)
    		, contentType : 'application/json; charset:utf-8'
    		
    	});
    	
        var IMP = window.IMP; // 생략가능
        IMP.init('imp56739933'); 
        // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
        IMP.request_pay({
            pg: 'html5_inicis', // version 1.1.0부터 지원.
            /* 
                'kakao':카카오페이, 
                html5_inicis':이니시스(웹표준결제)
                    'nice':나이스페이
                    'jtnet':제이티넷
                    'uplus':LG유플러스
                    'danal':다날
                    'payco':페이코
                    'syrup':시럽페이
                    'paypal':페이팔
                */
            pay_method: 'card',
            /* 
                'samsung':삼성페이, 
                'card':신용카드, 
                'trans':실시간계좌이체,
                'vbank':가상계좌,
                'phone':휴대폰소액결제 
            */
            merchant_uid: 'merchant_' + new Date().getTime(),
            /* 
                merchant_uid에 경우 
                https://docs.iamport.kr/implementation/payment
                위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
                참고하세요. 
                나중에 포스팅 해볼게요.
             */
            name: productname,
            //결제창에서 보여질 이름
            amount: parseInt(parseFloat($('#totalpaymentprice').val())*${currency}), 
            //가격 
            buyer_email: email,
            buyer_name: firstname+" "+lastname,
            buyer_tel: phone,
            buyer_addr: address1+" "+address2,
           // buyer_postcode: '123-456',
            m_redirect_url: '/orderComplete?coupon_num='+coupon_num
            /*  
                모바일 결제시,
                결제가 끝나고 랜딩되는 URL을 지정 
                (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
                */
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.';
                msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid;
                msg += '결제 금액 : ' + rsp.paid_amount;
                msg += '카드 승인번호 : ' + rsp.apply_num;
                //redirect_url: '/orderComplete'
                location.href="orderComplete?coupon_num="+coupon_num;
            } else {
                var msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                alert(msg);
            }
           
        });
    });
	</script>
		
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