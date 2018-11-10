<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
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
        <script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>  
  		<script src="https://cdnjs.cloudflare.com/ajax/libs/bodymovin/4.13.0/bodymovin.js"></script>     
  		
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<style>
.youtube{
	text-align: center;
}
#upload:hover, #add_country:hover{
	color: white;
    background-color: #FDC600;
	-webkit-transition: all 0.4s ease;
    -moz-transition: all 0.4s ease;
    -ms-transition: all 0.4s ease;
    transition: all 0.4s ease;
}
#add_country{
	width: 500px;
	height: 30px;
	color: white;
}
#inputarea {
	position: relative;
	border: #a3a3a357;
	border-style: dotted;
	height: 322px;
	width: 570px;
}

.deleteVideo{
	z-index: 1;
    position: absolute;
    top: 77%;
    left: 79%;
    width: 50px;
    height: 30px;
    background-color: #7a7a7a;
    text-align: center;
    color: white;
    opacity: 0.5;    
}
.deleteVideo:hover{
	opacity: 1;
	-webkit-transition: all 0.4s ease;
    -moz-transition: all 0.4s ease;
    -ms-transition: all 0.4s ease;
    transition: all 0.4s ease;
}
.input form-control{
	width: 50%;
	display: inline-block;
	background-color: red;
}
.btn btn-danger remove-me{
	display: inline-block;
}

.tab-content ul li {
        height: unset;
        width: unset;
}
    	
.form-control.valid:focus{
	border-color: #9A9A9A;
	color: #9A9A9A;
}
.modal-body text-center iframe{
	background-color: #fdc600;	
}
#logout{
	width: 20%;
    margin-bottom: 10px;
    background-color: #ddd;
    color: white;
}
#logout:hover{
    background-color: #FDC600;
	-webkit-transition: all 0.4s ease;
    -moz-transition: all 0.4s ease;
    -ms-transition: all 0.4s ease;
    transition: all 0.4s ease;    
}
.post-sign-ins {
	margin-left: 13%;
	margin-right: 13%;
    text-align: -webkit-left;
}
.post-sign-ins label{
	width: 100px;
}
.post-sign-ins #title, #description, #privacy-status{
	width: 100%;
}
.custom-file-input{
	padding: 10px 0px 0px 0px;
}
.post-sign-ins #title{
	 width: 100%; 
	 border: 1px solid; 
	 border-color: #a2a2a2; 
	 border-radius: unset;	
}
#bm{
    position: relative;
    top: 50%;
    transform: translateY(-50%);
    width: 150px;
    height: 150x;
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
                            <a href="${pageContext.request.contextPath}/" class="dropdown-toggle active" >Home </b></a>
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
        <div class="content-area submit-property" style="background-color: #FCFCFC;">&nbsp;
            <div class="container">
                <div class="clearfix" > 
                    <div class="wizard-container"> 

                        <div class="wizard-card ct-wizard-orange" style="background-color: white; border-color: white;" id="wizardProperty">
                            <form action="" method="">                        
                                <div class="wizard-header">
                                    <h3 style="color: #333; padding-bottom: 50px;">
                                        <b>CREATE</b> YOUR PROJECT <br>
                                        <!-- <small>Lorem ipsum dolor sit amet, consectetur adipisicing.</small> -->
                                    </h3>
                                </div>

                                <ul>
                                    <li><a href="#step1" data-toggle="tab">Step 1 </a></li>
                                    <li><a href="#step2" data-toggle="tab">Step 2 </a></li>
                                    <li><a href="#step3" data-toggle="tab">Step 3 </a></li>
                                    <li><a href="#step4" data-toggle="tab">Finished </a></li>
                                </ul>

                                <div class="tab-content">

                                    <div class="tab-pane" id="step1" style="padding-left: 120px; padding-right: 120px;">
                                        <div class="row p-b-15  ">
                                            <h4 class="info-text"> Let's start with the basic information </h4>
                                            <div class="col-sm-4 col-sm-offset-1">
                                                <div class="picture-container">
                                                    <div class="picture">
                                                        <img src="assets/img/default-property.jpg" class="picture-src" id="wizardPicturePreview" title=""/>
                                                        <input type="file" id="project_coverImage" name="project_coverImage">
                                                    	<input type="hidden" id="filetext"/>
                                                    </div> 
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="form-group">
                                                    <label>Project title <small>(required)</small></label>
                                                    <input id="project_title" name="project_title" type="text" class="form-control" placeholder="Mini Sketchbook...">
                                                </div>

                                                <div class="form-group">
                                                    <label>Project category <small>(required)</small></label>
                                                        <select id="project_category" name="project_category" class="selectpicker" data-live-search="true" data-live-search-style="begins" title="Select your category">
                                                            <option value="Media">Media</option>
                                                            <option value="Technology">Technology</option>
                                                            <option value="Arts">Arts</option>
                                                            <option value="Publishing">Publishing</option>
                                                            <option value="Performance">Performance</option>
                                                            <option value="Food">Food</option>
                                                            <option value="Fashion">Fashion</option>
                                                            <option value="Others">Others</option>
                                                        </select>
                                                </div> 
                                                <div class="form-group">
                                                    <label>Project Location <small>(required)</small></label>
                                                    <input id="project_location" name="project_location" type="text" class="form-control" placeholder="South Korea...">
                                                </div>
                                                <div class="form-group">
                                                   	<label>Funding start <small>(required)</small></label>
                                                    <input id="project_startdate" name="project_startdate" type="date" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                   	<label>Funding end <small>(required)</small></label>
                                                    <input id="project_goaldate" name="project_goaldate" type="date" class="form-control">
                                                </div>
                                                <div class="form-group">
                                                   	<label>Funding goal <small>(required)</small></label>
                                                    <input id="project_goalfundprice" name="project_goalfundprice" type="text" class="form-control" placeholder="$10">
                                                </div>                                            	
                                            </div>
                                        </div>
                                    </div>
                                    <!--  End step 1 -->

                                    <div class="tab-pane" id="step2" style="padding-left: 120px; padding-right: 120px;">
                                        <h4 class="info-text"> Set your project rewards and shipping costs </h4>
                                        <div class="row" id="row">

                                            <div class="col-sm-12">
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                   		<label>Reward title <small>(required)</small></label>
                                                    	<input id="reward_title" name="reward_title" type="text" class="form-control" placeholder="Standard Package...">
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <div class="col-sm-12"> 
                                                <div class="col-sm-12"> 
                                                    <div class="form-group">
                                                        <label>Reward price :</label>
                                                        <input id="reward_price" name="reward_price" type="text" class="form-control" placeholder="$10">
                                                    </div> 
                                                </div> 
                                            </div>
                                            <div class="col-sm-12"> 
                                                <div class="col-sm-12"> 
                                                    <div class="form-group">
                                                        <label>Reward Description :</label>
                                                        <textarea id="reward_description" name="reward_description" class="form-control"  maxlength="212" style="resize: none;"></textarea>
                                                    	<div style="text-align: right;"><label id="discription_length"></label><label>/212</label></div>
                                                    </div> 
                                                </div> 
                                            </div>

                                            <div id="shipping_form" class="col-sm-12" style="width: 100%">
                                                <div class="col-sm-3" style="width: 50%;">
                                                    <div class="form-group">
                                                   		<label>Estimated delivery <small>(required)</small></label>
                                                    	<input id="reward_deliverydate" name="reward_deliverydate" type="date" class="form-control">                                                    </div>
                                                </div>
                                                <div class="col-sm-3" style="width: 50%;">
                                                    <div class="form-group">
                                                   		<label>Shipping detail <small>(required)</small></label>
                                                        <select id="shipping_detail" name="shipping_detail" class="selectpicker" data-live-search="true" data-live-search-style="begins" title="Select your shipping">
                                                            <option value="no_shipping">No shipping involved</option>
                                                            <option value="shipping_certain">Only ships to certain countries</option>
                                                            <option value="shipping_anywhere">Ships anywhere in the world</option>
                                                        </select>                                                   		
                                                    </div>
                                                </div>
                                            </div>
                                            
                                          
                                        	
                                        </div>
                                    </div>
                                    <!-- End step 2 -->

                                    <div class="tab-pane" id="step3" style="padding-left: 120px; padding-right: 120px;">                                        
                                        <h4 class="info-text">Tell us about your project! </h4>
                                        <div class="row" style="width: 100%; margin: 0 auto; padding-top: 10px; text-align: -webkit-center;"> 
                                        
                                        <!-- youtube 동영상 업로드 -->
                                        
				           
							            <!-- youtube upload 잘라내기 -->
							            <label>Upload video <small>(required)</small></label></br>
					                    <label><small>Have fun – add a video! Projects with a video have a much higher chance of success.</small></label>
							            <div style="margin-top:5px; margin-bottom: 20px; margin-left: 0; margin-right: 0; text-align: center;">
								            <input type="button" id="upload" data-toggle="modal" data-target="#modalUpdate" value="Upload Video" style="width: 456px; height: 30px;">		            
					   						<!-- <button id="upload" data-toggle="modal" data-target="#modalUpdate" style="width: 500px; height: 30px;">Upload Video</button> --> 
					   					</div>
    
    
										<div style="text-align: -webkit-center; margin-bottom: 30px;">
                                        <div id="inputarea" style="width: 456px; height: 258px;">
                                        	<div id="bm" style="visibility: hidden; z-index: 1;"></div>
                                        </div>
                                        </div>
                                        <!-- ckeditor 넣기 -->
                                        	<label>Project description <small>(required)</small></label></br>
                                        	<label><small>Use your project description to share more about what you’re raising funds to do and how you plan to pull it off.</small></label>
											<textarea name="editor1" id="editor1" rows="67" cols="200" style="margin: 0 auto;">
						           			</textarea>
						            		<script>
												CKEDITOR.replace( 'editor1', {
													width:'760px',
										            height:'700px',
										            filebrowserImageUploadUrl: 'ckeditorImageUpload'
												});
											
											</script>                                        
                                        </div>
                                    </div>
                                    <!--  End step 3 -->


                                    <div class="tab-pane" id="step4" style="padding-left: 120px; padding-right: 120px;">                                        
                                        <h4 class="info-text"> Finished and submit </h4>
                                        <div class="row">  
                                            <div class="col-sm-12">
                                                <div class="">
                                                    <p>
                                                        <label><strong>Terms and Conditions</strong></label>w
                                                        By accessing or using  Crypto Kick services, such as 
                                                        posting your project with your personal 
                                                        information on our website you agree to the
                                                        collection, use and disclosure of your personal information 
                                                        in the legal proper manner
                                                    </p>

                                                    <div class="checkbox">
                                                        <label>
                                                            <input type="checkbox" /> <strong>Accept termes and conditions.</strong>
                                                        </label>
                                                    </div> 

                                                </div> 
                                            </div>
                                            <div class="col-sm-12">
                                               <div style="width: 100%; margin-top:5px; margin-bottom: 20px; margin-left: 0; margin-right: 0; text-align: center;">
 				          				  			<input type="button" data-toggle="modal" data-target="#preview" value="Preview" style="width: 100%; height: 30px; margin-top: 30px;">		            
     											</div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--  End step 4 -->

                                </div>

                                <div class="wizard-footer">
                                    <div class="pull-right">
                                        <input type='button' class='btn btn-next btn-primary' name='next' value='Next' />
                                        <input id='submit' type='button' class='btn btn-finish btn-primary ' name='finish' value='Finish'/>
                                    </div>

                                    <div class="pull-left">
                                        <input type='button' class='btn btn-previous btn-default' name='previous' value='Previous' />
                                    </div>
                                    <div class="clearfix"></div>                                            
                                </div>	
                            </form>
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
        
        <!-- 동영상 업로드 modal -->
        
        <div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog"
		aria-labelledby="modalUpdatePro" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header bg-primary" style="background-color: #fdc600;">
					<button type="button" id="closeUploadModal" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>					
					<h6 class="modal-title">
						Upload Video
					</h6>
				</div>
				<div class="modal-body text-center">
<!-- 				youtube 로그인 붙여넣기
 -->				
				 <span id="signinButton" class="pre-sign-ins">
				            <!-- IMPORTANT: Replace the value of the <code>data-clientid</code>
				            attribute in the following tag with your project's client ID. -->
				              <span
				                class="g-signin"
				                data-callback="signinCallback"
				                data-clientid="811659979623-l1arsgl8gap4sue96vuj3s82uu94mbr6.apps.googleusercontent.com" 
				                data-cookiepolicy="single_host_origin"
				                data-scope="https://www.googleapis.com/auth/youtube.upload https://www.googleapis.com/auth/youtube">
				              </span>
				            </span>
				
					<div class="post-sign-ins" id="signoutButton">
						
      					<div style="text-align: -webkit-center;">
					       	<img id="channel-thumbnail" src="https://yt3.ggpht.com/a-/ACSszfH5cclsP-pPERmK8VKjhHCeyLQAy6Ls7X-luQ=s88-mo-c-c0xffffffff-rj-k-no">
				    	</div>
				    	<div style="text-align: -webkit-center; margin-bottom: 10px;">
					       	<span id="channel-name">name</span>
					    </div>   	
				      	<div>
					        <label for="title">Title</label>
					        <input id="title" type="text" value="" aria-invalid="false" class="valid">
				      </div>
				      <div> 
					        <label for="description">Description</label>
					        <textarea id="description" style="width: 100%; resize: none;"></textarea>
					      </div>
					      <div>
					        <label for="privacy-status">Privacy Status</label>
					        <select id="privacy-status">
					          <option>public</option>
					        </select>
					      </div>
				            <input type="file" class="custom-file-input" id="file-youtube" accept="video/*" onchange="$('label[for=file-youtube]').text($(this).val().split('\\').pop())">
						        <div class="form-group text-right">
						            <button id="btn-ytb-upload" class="btn btn-outline-primary">Upload</button>
						        <button id="btn-ytb-delete" class="btn btn-outline-primary" onclick="deleteVideo()">Delete</button>
						        <input type="hidden" id="video-id" value="">
						        <input type="hidden" id="key" value="">
						       </div>
					         <div class="during-upload">
				               	<div class="progress">
			                    <div id="progressbar" class="progress-bar" role="progressbar" style="width: 0%; background-color: #FDC600; box-shadow: inset 0 1px 3px rgba(0, 0, 0, .2); " aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
				             	</div>
				             <div style="text-align: -webkit-right;">
				             <span id="bytes-transferred"></span>/<span id="total-bytes"></span> bytes
				             </div>  
				           </div>
				           	<div style="text-align: -webkit-center;">
								<input type="button" id="logout" value="Logout" onclick="logout()">
							</div>
						</div>
				
				</div>
				<div class="modal-footer">
					<button id="closeUploadModal" type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
		</div>
		
		<!-- Preview 모달창  -->
		<div class="modal fade" id="preview" tabindex="-1" role="dialog"
		aria-labelledby="modalUpdatePro" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered" role="document" style="width: 760px;">
			<div class="modal-content">
				<div class="modal-header bg-primary" style="background: #fdc600;">
					<button type="button" id="closeUploadModal" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h6 class="modal-title">
						Preview
					</h6>
					
				</div>
				<div class="modal-body text-center">
					<div class="col-md-8 single-property-content prp-style-1 " style="max-width: 100%;width: 100%;text-align: left;">
                        <div class="row">
                            <div class="light-slide-item">            
                                 <div class="clearfix" id="previewVideoUrl">
                                 
									<!-- 유투브 동영상 넣기 test -->
									<!-- <p class="youtube"><iframe style=" margin-bottom: 50px;" frameborder="0" allowfullscreen="1" width="720px" height="405px" src="https://www.youtube.com/embed/ZRlmJxh1frs" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe><p> -->
									<!-- <iframe id="player" class="content-media content-media--video" style="width: 720px; height: 405px; margin-bottom: 50px;" frameborder="0" allowfullscreen="1" allow="autoplay; encrypted-media" title="YouTube video player" width="640" height="360" src="https://www.youtube.com/embed/ZRlmJxh1frs?enablejsapi=1&amp;origin=http%3A%2F%2Flocalhost%3A8081&amp;widgetid=1"></iframe> -->
                                </div>
                            </div>
                        </div>

                        <div class="single-property-wrapper" id="previewVideo" style="word-break: break-all;">
                            <div class="single-property-header">                                          
                            </div>
                        </div>
                            
                            <!-- .property-meta -->
                            </div>
                            </div>

				<div class="modal-footer">
					<button id="closeUploadModal" type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
		</div>
		<!-- modal -->
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
        <script src="assets/js/jquery.bootstrap.wizard.js" type="text/javascript"></script>
        <script src="assets/js/jquery.validate.min.js"></script>
        <script src="assets/js/wizard.js"></script>

        <script src="assets/js/main.js"></script>
		<script type="text/javascript" src="//apis.google.com/js/client:plusone.js"></script>
  		<script type="text/javascript" src="resources/youtube/cors_upload.js"></script>
  		<script type="text/javascript" src="resources/youtube/upload_video.js"></script>
  		<script type="text/javascript" src="resources/youtube/auth.js"></script>
 		
<script>

$(function(){
	
	//lottie 객체 불러오기
	var animation = bodymovin.loadAnimation({
		  container: document.getElementById('bm'),
		  renderer: 'svg',
		  loop: true,
		  autoplay: true,
		  path: 'assets/js/videoLoading.json'
	});
	
	//discription 글자수 체크
	$('#reward_description').on('keyup', function(){
		var length = $(this).val().length;
		$('#discription_length').html(length);
	});
	
	$('#shipping_detail').on('change', function(){
		var select = $('#shipping_detail option:selected').val();
		if(select == 'no_shipping'){ //배송 안함 선택시
			$(".col-sm-12-shipping").remove();
			$(".col-sm-12-button").remove();
			$("#anywhere").remove();
			return;
		}
		if(select == 'shipping_certain'){ //특정 나라만 배송 선택시
			$("#anywhere").remove();
			addcountry();
		}	
		if(select == 'shipping_anywhere'){ //전세계 배송 선택시
			$(".col-sm-12-shipping").remove();
			$(".col-sm-12-button").remove();
			anywhere();
		}	
	});	
	
	$(document).on('click','#add_country', function(){
		$(this).parent().parent().remove();
		addcountry();
	});
	
	$(document).on('click','#remove_country', function(){
		$(this).parent().parent().parent().parent().remove();
	});
	
	$("#preview").on('shown.bs.modal', function(){
		var content = CKEDITOR.instances['editor1'].getData();
		$("#previewVideo").html(content);
		var video = '';
		if($("#video-id").val()==''){
			video = '<p class="youtube"><iframe style=" margin-bottom: 50px;" frameborder="0" allowfullscreen="1" width="720px" height="405px" src="https://www.youtube.com/embed/ZRlmJxh1frs" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe><p>';
		} else{
			video = '<p class="youtube"><iframe style=" margin-bottom: 50px;" frameborder="0" allowfullscreen="1" width="720px" height="405px" src="https://www.youtube.com/embed/' + $("#video-id").val() + '"frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe><p>';
		}
		$('#previewVideoUrl').html(video);
	})
	
	//Modal의 id값 + hidden.bs.modal 모달 꺼질때 event명
	
	//전체 데이터 submit
	$('#submit').on('click', makeData);
	
	$('#project_coverImage').on('change', function(){
		//통합 객체 생성 및 데이터 담기 
		//var createProject = {"project" : project , "shippingList" : shippingList};

		var formData = new FormData();
		formData.append("myFile", $("input[type=file]")[0].files[0]);
		
		//formData.append("createProject", JSON.stringify(createProject));
		
		//console.log(JSON.stringify(createProject));
		
		  // construct an HTTP request
	/* 	  var xhr = new XMLHttpRequest();
		  xhr.open("POST", "createProject", true);
		  xhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
		
		  // send the collected data as JSON
		  //xhr.send(JSON.stringify(createProject));	
		
		  xhr.send(formData); */
		  
	   	$.ajax({
	  		type : 'post'
	  		, url : 'coverImage'
	  		, data : formData
	  		, dataType : 'text'
	  		, contentType : false
	  		, processData:false
	  		, cache : false
	  		, success : function(fileUrl){
	  			$('#wizardPicturePreview').attr('src', fileUrl);
	  			//alert(fileUrl.substring(9));
	  			$('#project_coverImage').attr('value', fileUrl.substring(9));
	  			//alert('커버이미지등록 완료!'+fileUrl.substring(9));
	  			//alert($('#project_coverImage').val().substring(12));
	  		}
	  	});		
	});
});


function addcountry(){
	var add = '<div class="col-sm-12-shipping" style="width: 100%" id="select_shipping"><div class="col-sm-12">';
	add += '<div class="form-group"><div class="col-sm-3" style="width: 50%;">';
	add += '<label>Select country <small>(required)</small></label>';
	add += '<select name="shipping_country" class="form-control" data-live-search="true" data-live-search-style="begins" title="Select country">';
	add += '<option data-title="Australia" value="Australia">Australia</option><option data-title="Austria" value="Austria">Austria</option><option data-title="Belarus" value="Belarus">Belarus</option><option data-title="Belgium" value="Belgium">Belgium</option><option data-title="Bosnia &amp; Herzegovina" value="Bosnia">Bosnia Herzegovina</option><option data-title="Brunei" value="Brunei">Brunei</option><option data-title="Bulgaria" value="Bulgaria">Bulgaria</option>';
	add += '<option data-title="Canada" value="Canada">Canada</option><option data-title="China" value="China">China</option><option data-title="Croatia" value="Croatia">Croatia</option><option data-title="Cyprus" value="Cyprus">Cyprus</option><option data-title="Czech Republic" value="CzechRepublic">Czech Republic</option><option data-title="Denmark" value="Denmark">Denmark</option><option data-title="Estonia" value="Estonia">Estonia</option><option data-title="Finland" value="Finland">Finland</option><option data-title="France" value="France">France</option><option data-title="Georgia" value="Georgia">Georgia</option>';
	add += '<option data-title="Germany" value="Germany">Germany</option><option data-title="Greece" value="Greece">Greece</option><option data-title="Hungary" value="Hungary">Hungary</option><option data-title="Iceland" value="Iceland">Iceland</option><option data-title="India" value="India">India</option><option data-title="Indonesia" value="Indonesia">Indonesia</option><option data-title="Ireland" value="Ireland">Ireland</option>';
	add += '<option data-title="Israel" value="Israel">Israel</option><option data-title="Italy" value="Italy">Italy</option><option data-title="Japan" value="Japan">Japan</option><option data-title="Jordan" value="Jordan">Jordan</option><option data-title="Kuwait" value="Kuwait">Kuwait</option><option data-title="Laos" value="Laos">Laos</option><option data-title="Latvia" value="Latvia">Latvia</option><option data-title="Lebanon" value="Lebanon">Lebanon</option><option data-title="Lithuania" value="Lithuania">Lithuania</option><option data-title="Luxembourg" value="Luxembourg">Luxembourg</option>';
	add += '<option data-title="Malaysia" value="Malaysia">Malaysia</option><option data-title="Netherlands" value="Netherlands">Netherlands</option><option data-title="New Zealand" value="NewZealand">New Zealand</option><option data-title="Nigeria" value="Nigeria">Nigeria</option><option data-title="Norway" value="Norway">Norway</option><option data-title="Philippines" value="Philippines">Philippines</option><option data-title="Poland" value="Poland">Poland</option>';
	add += '<option data-title="Portugal" value="Portugal">Portugal</option><option data-title="Qatar" value="Qatar">Qatar</option><option data-title="Romania" value="Romania">Romania</option><option data-title="Russia" value="Russia">Russia</option><option data-title="Saudi Arabia" value="SaudiArabia">Saudi Arabia</option><option data-title="Serbia" value="Serbia">Serbia</option><option data-title="Slovakia" value="Slovakia">Slovakia</option><option data-title="Slovenia" value="Slovenia">Slovenia</option><option data-title="South Africa" value="SouthAfrica">South Africa</option><option data-title="South Korea" value="SouthKorea">South Korea</option>';
	add += '<option data-title="Spain" value="Spain">Spain</option><option data-title="Sweden" value="Sweden">Sweden</option><option data-title="Switzerland" value="Switzerland">Switzerland</option><option data-title="Taiwan" value="Taiwan">Taiwan</option><option data-title="Thailand" value="Thailand">Thailand</option><option data-title="Turkey" value="Turkey">Turkey</option><option data-title="Ukraine" value="Ukraine">Ukraine</option><option data-title="United Arab Emirates" value="UnitedArabEmirates">United Arab Emirates</option><option data-title="United Kingdom" value="UnitedKingdom">United Kingdom</option><option data-title="United States" value="UnitedStates">United States</option>';
	add += '<option data-title="Vietnam" value="Vietnam">Vietnam</option>';
	add += '</select>';
	add += '</div>';
	add += '<div class="col-sm-3" style="width: 40%;">';
	add += '<div class="form-group">';
	add += '<label>Shipping cost <small>(required)</small></label>';
	add += '<input name="shipping_price" type="text" class="form-control" placeholder="$10">';
	add += '</div>';
	add += '</div>';
	add += '<div class="col-sm-3" style="width: 10%;">';
	add += '<div class="form-group">';
	add += '<label>&nbsp<small>&nbsp</small></label>';
	add += '<input id="remove_country" type="button" name="add" value="-"/>';
	add += '</div>';
	add += '</div>';
	add += '</div>';
	add += '</div></div>';
	add += '<div class="col-sm-12-button"id="add_country_button"><div class="col-sm-12">';
	add += '<div class="form-group" style="text-align: center;">';
	add += '<input id="add_country" style="max-width:  100%;" type="button" name="add" value="add country"/>';
	add += '</div>';
	add += '</div></div>';
	
	
	$('#row').append(add);
	
}

function anywhere(){
	
    
	var add = '<div class="col-sm-12" id="anywhere"><div class="col-sm-12"><div class="form-group"><label>Shipping cost :</label><input id="shipping_price" name="shipping_price" type="text" class="form-control" placeholder="$10"></div></div></div>';
	$('#row').append(add);
}

function makeData(){
	
	//project 객체 정보 수집
	var project_title = $('#project_title').val();					
	var project_category = $('#project_category').val();
	var project_location = $('#project_location').val();
	var project_startdate = $('#project_startdate').val();
	var project_goaldate = $('#project_goaldate').val();
	var project_goalfundprice = $('#project_goalfundprice').val();
	var project_coverImage = $('#project_coverImage').val().substring(12);
 	var reward_title = $('#reward_title').val();
	var reward_price = $('#reward_price').val();
	var reward_description = $('#reward_description').val();
	var reward_deliverydate = $('#reward_deliverydate').val();
	var project_video = $('#video-id').val();
	var project_content = CKEDITOR.instances['editor1'].getData();
	
	var project = {"project_title" : project_title, 
					"project_coverImage" : project_coverImage, 
					"project_content" : project_content, 
					"project_goalfundprice" : project_goalfundprice,
					"project_startdate" : project_startdate,
					"project_goaldate" : project_goaldate,
					"project_location" : project_location,
					"project_category" : project_category,
					"project_video" : project_video,
					"reward_title" : reward_title,
					"reward_price" : reward_price,
					"reward_description" : reward_description,
					"reward_deliverydate" : reward_deliverydate
	};
	
	//shipping 객체 정보 수집
	var shippingList = [];
	var shipping_detail = $('#shipping_detail').val();
	//배송하지 않을 때
	if(shipping_detail == 'no_shipping'){
		//no_shipping shipping 정보가 없을 경우 null값 전송
	} 
	//전세계 배송시 shipping 객체는 하나
	if(shipping_detail == 'shipping_anywhere'){
		var shipping = {"shipping_country" : "anywhere" , "shipping_price" : $('#shipping_price').val()};
		shippingList.push(shipping);
	}
	//특정 국가만 배송할 때
	var shipping_countryList = [];
	var shipping_priceList = [];
	if(shipping_detail == 'shipping_certain'){
		$('select[name=shipping_country]').each(function(index, item){
			shipping_countryList.push($(this).val());
		});
		$('input[name=shipping_price]').each(function(index, item){
			shipping_priceList.push($(this).val());
		});
		for(var i = 0; i < shipping_priceList.length; i++){
			var shipping = {"shipping_country" :  shipping_countryList[i], "shipping_price" : shipping_priceList[i]};
			shippingList.push(shipping);
		}
	}

	
	//통합 객체 생성 및 데이터 담기 
	var createProject = {"project" : project , "shippingList" : shippingList};

	//var formData = new FormData();
	//formData.append("myFile", $("input[type=file]")[0].files[0]);
	
	//formData.append("createProject", JSON.stringify(createProject));
	
	//console.log(JSON.stringify(createProject));
	
	  // construct an HTTP request
 	  //var xhr = new XMLHttpRequest();
	  //xhr.open("POST", "createProject", true);
	  //xhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
	
	  // send the collected data as JSON
	  //xhr.send(JSON.stringify(createProject));	
	
	  //xhr.send(JSON.stringify(createProject));
	  
    	$.ajax({
  		method : 'post'
  		, url : 'createProject'
  		, data : JSON.stringify(createProject)
  		, contentType : 'application/json; charset=utf-8'
  		, dataType : 'JSON'
  		, success : function(project){
  			alert('Success!');
  			window.location.href = "${pageContext.request.contextPath}/Projects?project_category=All";
  		}
        ,beforeSend:function(){
            $('#status').fadeIn();
        }
        ,complete:function(){
            $('#status').fadeOut();
            $('#preloader').delay(350).fadeOut('slow');
            $('body').delay(350).css({'overflow': 'visible'})
        }
        ,error:function(e){
            $('#status').fadeOut();
            $('#preloader').delay(350).fadeOut('slow');
            $('body').delay(350).css({'overflow': 'visible'})        	
			alert('error!');
        }
  	});  
}
</script>
  		
    </body>
</html>