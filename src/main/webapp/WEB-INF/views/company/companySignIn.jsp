<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html class="no-js">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>CryptoKick</title>
<style>
span#idcheck {
	color: red;
}
</style>
<script src="resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function formcheck() {

		var co_id = $("#co_id");
		var co_name = $("#co_name");
		var co_address = $("#co_address");
		var co_phone = $("#co_phone");
		var co_ceo = $("#co_ceo");
		var co_email = $("#co_email");
		var co_website = $("#co_website");

		if (co_id.val().trim() == null) {
			alert("Check Company Id");
		}
		if (co_name.val().trim() == null) {
			alert('Check Company name');
		}
		if (co_address.val().trim() == null) {
			alert('Check Company address');
		}
		if (co_phone.val().trim() == null) {
			alert('Check Company phone');
		}
		if (co_ceo.val().trim() == null) {
			alert('Check CEO Name');
		}
		if (co_email.val().trim() == null) {
			alert('Check CEO Email');
		}
		if (co_website.val().trim() == null) {
			alert('Check Company Website');
		}

		var co_pwd1 = $("#co_pwd1");
		var co_pwd2 = $("#co_pwd2");

		if (co_pwd1.val() != co_pwd2.val()) {
			alert('Check password');
			co_pwd1.select();
		}

		return false;
	}
</script>
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
<link href="css/animate.css" rel="stylesheet" media="screen">
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
</head>
<script src="resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	
	$('#wizard-picture').on('change', function(){
	        var reader = new FileReader();
	        reader.onload = function () {
	           $('#wizardPicturePreview').attr('src', URL.createObjectURL($("input[type=file]")[0].files[0])).fadeIn('slow');
	   		}
	    reader.readAsDataURL($("input[type=file]")[0].files[0]);
	});	
	
	$("#co_id").keyup(function() {
		var userid=$(this).val();
		if(userid.length<3 || userid.length>11){
			$('#idcheck').text('UserID must be at 3~10 characters');
			return false;
		}
		
			var sendData={'userid':userid};
			
			$.ajax({
				method:'post'
				,url:"duplicateCheck"
				,data:JSON.stringify(sendData)
				,dataType:'json'
				,contentType:'application/json; charset=utf-8'
				,success:function(r){
					if(r==1){
						$('#idcheck').text('duplicated ID');
					}else{
						$('#idcheck').text('You can use Id');
					}
				}
			});
		
	});
	
	});
</script>
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
	<div class="content-area user-profiel"
		style="background-color: #FCFCFC;">
		&nbsp;
		<div class="container">
			<div class="row">
				<div class="col-sm-10 col-sm-offset-1 profiel-container">

					<form action="companySignIn" method="post" enctype="multipart/form-data">
						<div class="profiel-header">
							<h3>
								<b>Enterprise</b> Membership SignIn<br> <small>This
									information will let us know more about you.</small>
							</h3>
							<hr>
						</div>
						<div class="clear">
							<div class="col-sm-3" style=" margin-left: 40px;">
								<div class="picture-container">
									<div class="picture">
										<img src="assets/img/avatar.png" class="picture-src"
											id="wizardPicturePreview" title="" /> <input type="file"
											id="wizard-picture" name="upload">
									</div>
									<h6>Choose Picture</h6>
								</div>
							</div>

							<div class="col-sm-7" style="width: 62.333333%;margin-top:  30px;">
                         		 <div class="row" style="margin-right: 40px;margin-left: 40px;width: 100%;">
							    	<div class="col-md-5" style="width: 50%;">
										<label>Company ID <small>(required)</small></label> <input
										name="co_id" type="text" class="form-control" id="co_id"
										placeholder="Smith..." >
									</div>
									<div class="col-md-5" style="width: 50%;">
										<label>Company Name <small>(required)</small></label> <input
										name="co_name" type="text" class="form-control"
										placeholder="Smith..." >
								 	</div>
								</div>
								<div class="row" style="margin-right: 40px;margin-left: 40px;width:  100%;margin-top: 20px;">
							    	<div class="col-md-5" style="width: 50%;">
										<label>Company Website <small>(required)</small></label> <input
										name="co_website" type="text" class="form-control" >
																	</div>
									<div class="col-md-5" style="width: 50%;">
										<label>Company Password :<small>(required)</small></label> <input
										name="co_pwd" type="password" class="form-control" 
										id="co_pwd1">
									</div>
								</div>
								
								<div style="margin-right: 40px;margin-left: 40px;width:  100%;margin-top: 20px;">
							    		
									<div class="col-md-5" style="width: 50%;">
										<label>Phone : <small>(required)</small></label> <input
										type="text" name="co_phone" class="form-control"> 
									</div>
									<div class="col-md-5" style="width: 50%;">
										<label>Confirm password : <small>(required)</small></label> <input
										type="password" class="form-control" id="co_pwd2" placeholder="confirm your password">
									</div>
							</div>
							        <div id="idcheck" value=""></div>
						</div>
						<div class="clear">
							<br>
							<hr>
							<br>
							
								<div class="row" style="margin-right: 40px;margin-left: 40px;">
							    	<div class="col-md-5" style="width: 50%;">
										<label>CEO First Name :</label> <input name="co_ceo_firstname" placeholder="Smith" value="" type="text" class="form-control">
									</div>
									<div class="col-md-5" style="width: 50%;">
										<label>CEO Last Name :</label> <input name="co_ceo_lastname" placeholder="Hello" value="" type="text" class="form-control">
								 	</div>
								</div>
				               <div class="row" style="margin-right: 40px;margin-left: 40px; margin-top: 30px;">
							    	<div class="col-md-5" style="width: 50%;">
										<label>CEO Email :</label> <input name="co_email"
										type="emali" class="form-control">
									</div>
									<div class="col-md-5" style="width: 50%;">
										<label>Postal code / Zip code :</label> <input name="co_zipcode" 
										type="text" class="form-control"
										placeholder="0000365">
									</div>
								</div>
				               <div class="row" style="margin-right: 40px;margin-left: 40px; margin-top: 40px;">
							    	<div class="col-md-5" style="width: 50%;">
										<label>Country :</label> <select  name="co_country" class="select" id="info_country" style="padding-left: 10px;"><option data-title="Australia" value="Australia">Australia</option><option data-title="Austria" value="Austria">Austria</option><option data-title="Belarus" value="Belarus">Belarus</option><option data-title="Belgium" value="Belgium">Belgium</option><option data-title="Bosnia &amp; Herzegovina" value="Bosnia">Bosnia Herzegovina</option><option data-title="Brunei" value="Brunei">Brunei</option><option data-title="Bulgaria" value="Bulgaria">Bulgaria</option>
<option data-title="Canada" value="Canada">Canada</option><option data-title="China" value="China">China</option><option data-title="Croatia" value="Croatia">Croatia</option><option data-title="Cyprus" value="Cyprus">Cyprus</option><option data-title="Czech Republic" value="CzechRepublic">Czech Republic</option><option data-title="Denmark" value="Denmark">Denmark</option><option data-title="Estonia" value="Estonia">Estonia</option><option data-title="Finland" value="Finland">Finland</option><option data-title="France" value="France">France</option><option data-title="Georgia" value="Georgia">Georgia</option>
<option data-title="Germany" value="Germany">Germany</option><option data-title="Greece" value="Greece">Greece</option><option data-title="Hungary" value="Hungary">Hungary</option><option data-title="Iceland" value="Iceland">Iceland</option><option data-title="India" value="India">India</option><option data-title="Indonesia" value="Indonesia">Indonesia</option><option data-title="Ireland" value="Ireland">Ireland</option>
<option data-title="Israel" value="Israel">Israel</option><option data-title="Italy" value="Italy">Italy</option><option data-title="Japan" value="Japan">Japan</option><option data-title="Jordan" value="Jordan">Jordan</option><option data-title="Kuwait" value="Kuwait">Kuwait</option><option data-title="Laos" value="Laos">Laos</option><option data-title="Latvia" value="Latvia">Latvia</option><option data-title="Lebanon" value="Lebanon">Lebanon</option><option data-title="Lithuania" value="Lithuania">Lithuania</option><option data-title="Luxembourg" value="Luxembourg">Luxembourg</option>
<option data-title="Malaysia" value="Malaysia">Malaysia</option><option data-title="Netherlands" value="Netherlands">Netherlands</option><option data-title="New Zealand" value="NewZealand">New Zealand</option><option data-title="Nigeria" value="Nigeria">Nigeria</option><option data-title="Norway" value="Norway">Norway</option><option data-title="Philippines" value="Philippines">Philippines</option><option data-title="Poland" value="Poland">Poland</option>
<option data-title="Portugal" value="Portugal">Portugal</option><option data-title="Qatar" value="Qatar">Qatar</option><option data-title="Romania" value="Romania">Romania</option><option data-title="Russia" value="Russia">Russia</option><option data-title="Saudi Arabia" value="SaudiArabia">Saudi Arabia</option><option data-title="Serbia" value="Serbia">Serbia</option><option data-title="Slovakia" value="Slovakia">Slovakia</option><option data-title="Slovenia" value="Slovenia">Slovenia</option><option data-title="South Africa" value="SouthAfrica">South Africa</option><option data-title="South Korea" value="SouthKorea">South Korea</option>
<option data-title="Spain" value="Spain">Spain</option><option data-title="Sweden" value="Sweden">Sweden</option><option data-title="Switzerland" value="Switzerland">Switzerland</option><option data-title="Taiwan" value="Taiwan">Taiwan</option><option data-title="Thailand" value="Thailand">Thailand</option><option data-title="Turkey" value="Turkey">Turkey</option><option data-title="Ukraine" value="Ukraine">Ukraine</option><option data-title="United Arab Emirates" value="UnitedArabEmirates">United Arab Emirates</option><option data-title="United Kingdom" value="UnitedKingdom">United Kingdom</option><option data-title="United States" value="UnitedStates">United States</option>
<option data-title="Vietnam" value="Vietnam">Vietnam</option></select>
			</div>
								</div>
								<div class="row" style="margin-right: 40px;margin-left: 40px; margin-top: 20px;">
							    	<div class="col-md-5" style="width: 50%;">
										<label>State/ Province/Region :</label> <input name="co_province" placeholder="North Carolina" 
										type="text" class="form-control">
								</div>
									<div class="col-md-5" style="width: 50%;">
										<label>City :</label> <input name="co_city" type="text" placeholder="Carrboro" 
										class="form-control">
								</div>
								</div>
								<div class="row" style="margin-right: 40px;margin-left: 40px; margin-top: 30px;">
							    	<div class="col-md-5" style="width: 50%;">
										<label>Address1 :</label> <input name="co_address1" type="text" placeholder="370 East Main Street" 
										class="form-control">
								</div>
									<div class="col-md-5" style="width: 50%;">
										<label>Address2 :</label> <input name="co_address2" type="text" placeholder="Apartment 100"
										class="form-control">
								</div>
								</div>
						</div>

						<div class="profiel-header" style="text-align: center;">
							<hr>
							<br>
							<button type="submit" class="btn btn-default"
								onsubmit="return formcheck()">Submit</button>
						<br>
						<br>
						</div>
					</form>

				
			</div>
			<!— end row —>

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
	<script src="assets/js/jquery.bootstrap.wizard.js"
		type="text/javascript"></script>
	<script src="assets/js/jquery.validate.min.js"></script>
	<script src="assets/js/wizard.js"></script>

	<script src="assets/js/main.js"></script>


</body>
</html>