<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
<style>
#favorite {
   right: unset;
}

.label-primary.label-fill, .progress-bar, .progress-bar-primary {
    background-color: #fdc600;
}

.text-field {
    -moz-box-sizing: border-box;
    border: 1px solid #EEEEEE;
    font-family: "Source Sans Pro",Arial,sans-serif;
    font-size: 0.73684em;
    font-weight: 600;
    height: 37px;
    margin: 0;
    padding: 5px;
    width: 100%;
}
.autocomplete-suggestion {
    overflow: hidden;
    padding: 2px 5px;
    white-space: nowrap;
    background-color: white;
    border: 1px solid;
}
.autocomplete-suggestions strong {
    color: #3399FF;
    font-weight: normal;
}
.autocomplete-selected{
  background:#F0F0F0;
  
}

/* #autocomplete,.close-icon{
   position: relative;
}
.close-icon {
   border:1px solid transparent;
   vertical-align: middle;
}
.close-icon:after {
   content: "X";
   display: block;
   width: 15px;
   height: 15px;
   position: absolute;
   z-index:1;
   right: 35px;
   top: 0;
   bottom: 0;
   margin: auto;
   padding: 2px;
   text-align: center;
   color: black;
   font-weight: normal;
   font-size: 12px;
   cursor: pointer;
}
 */
 
 </style>

     <script src="http://code.jquery.com/jquery-1.9.1.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.devbridge-autocomplete/1.2.24/jquery.autocomplete.min.js"></script>
<script type="text/javascript">

$(function(){
   $(window).scroll(scrollDown);
   
   $("#autocomplete").val('${search}');
   
   var category = '${category}';
    $('#category').find('option').each( function() {
         var $this = $(this);
         if ($this.text() == category) {
            $this.attr('selected','selected');
         }
    });
   
   var sort = '${sort}';
    $('#sort').find('option').each( function() {
         var $this = $(this);
         if ($this.text() == sort) {
            $this.attr('selected','selected');
         }
    });
    $(document).on('click', '.clickSubmit', function(){
      $(this).parent().parent().find("form").submit();
       
    });

});
   /* 
   $('#autocomplete').autocomplete({
      delimiter: /(,|;)\s/,
      lookup: 'Andorra,Azerbaijan,Bahamas,Bahrain,Bangladesh,Barbados,Belarus,Belgium,Belize,Benin,Bhutan,Bolivia,Bosnia Herzegovina,Botswana,Brazil,Brunei,Bulgaria,Burkina, Burundi,Cambodia,Cameroon,Canada,Cape Verde,Central African Rep,Chad,Chile,China,Colombia,Comoros,Congo,Congo {Democratic Rep},Costa Rica,Croatia,Cuba,Cyprus,Czech Republic,Denmark,Djibouti,Dominica,Dominican Republic,East Timor,Ecuador,Egypt,El Salvador,Equatorial Guinea,Eritrea,Estonia,Ethiopia,Fiji,Finland,France,Gabon,Gambia,Georgia,Germany,Ghana,Greece,Grenada,Guatemala,Guinea,Guinea-Bissau,Guyana,Haiti,Honduras,Hungary,Iceland,India,Indonesia,Iran,Iraq,Ireland {Republic},Israel,Italy,Ivory Coast,Jamaica,Japan,Jordan,Kazakhstan,Kenya,Kiribati,Korea North,Korea South,Kosovo,Kuwait,Kyrgyzstan,Laos,Latvia,Lebanon,Lesotho,Liberia,Libya,Liechtenstein,Lithuania,Luxembourg,Macedonia,Madagascar,Malawi,Malaysia,Maldives,Mali,Malta,Marshall Islands,Mauritania,Mauritius,Mexico,Micronesia,Moldova,Monaco,Mongolia,Montenegro,Morocco,Mozambique,Myanmar, {Burma},Namibia,Nauru,Nepal,Netherlands,New Zealand,Nicaragua,Niger,Nigeria,Norway,Oman,Pakistan,Palau,Panama,Papua New Guinea,Paraguay,Peru,Philippines,Poland,Portugal,Qatar,Romania,Russian Federation,Rwanda,St Kitts & Nevis,St Lucia,Saint Vincent & the Grenadines,Samoa,San Marino,Sao Tome & Principe,Saudi Arabia,Senegal,Serbia,Seychelles,Sierra Leone,Singapore,Slovakia,Slovenia,Solomon Islands,Somalia,South Africa,South Sudan,Spain,Sri Lanka,Sudan,Suriname,Swaziland,Sweden,Switzerland,Syria,Taiwan,Tajikistan,Tanzania,Thailand,Togo,Tonga,Trinidad & Tobago,Tunisia,Turkey,Turkmenistan,Tuvalu,Uganda,Ukraine,United Arab Emirates,United Kingdom,United States,Uruguay,Uzbekistan,Vanuatu,Vatican City,Venezuela,Vietnam,Yemen,Zambia,Zimbabwe'.split(',')
      }); 
   }); 
   */


function scrollDown(){
   if($(window).scrollTop() == $(document).height() - $(window).height()) {
       $.ajax({
            method : "get",
            url : "scrolldown",
            data : "project_category=${category}&project_content=${sort}&project_title=${search}",
            success : output,
            error : function(resp){
               //alert(JSON.stringify(resp));
            }
         });
    }
}

function output(resp){
         var text = "";
      $.each(resp, function(index, project){
         text += '<div id="newdiv" class="col-sm-6 col-md-4 p0"><div class="box-two proerty-item"><div class="item-thumb"><div class="clearfix"><div class="lSSlideWrapper usingCss"';
         text += 'style="transition-duration: 500ms; transition-timing-function: ease;"><a href="detailedProject"><img src="showProjectImg?project_num='+project.project_num+'"></a></div></div></div>';
         text += '<div class="item-entry overflow"><h5><a href="detailedProject">'+project.project_title+'</a></h5><div class="dot-hr"></div><span class="pull-left"><b>';
         text += project.project_goaldate+'</b>  </span> <span class="proerty-price pull-right"> $'+project.project_goalfundprice+'</span><p style="display: none;">';
         text += project.project_content+'</p><div class="progress-card"><div class="d-flex justify-content-between mb-1"><div class="progress mb-2" style="height: 7px;">';
         text += '<div class="progress-bar bg-success" role="progressbar" style="width: '+(project.project_nowfundprice/project.project_goalfundprice)*100+'%" aria-valuenow="'+(project.project_nowfundprice/project.project_goalfundprice)*100+'" aria-valuemin="0"';
         text += 'aria-valuemax="100" data-toggle="tooltip" data-placement="top" title="'+project.project_nowfundprice+'" data-original-title="'+project.project_nowfundprice+'%"></div></div></div></div></div></div></div>';
      });
      $("#list-type").append(text);
         /* $("#list-type").append(text).hide().fadeIn('slow'); */
};

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
                        <c:if test="${cmCategory=='member'}">
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
   <div class="properties-area recent-property"
      style="background-color: #FFF;">
      <div class="container">
         <div class="row">
            <div class="col-md-9 padding-top-40 properties-page">
               <div class="section clear">
               
               <h1 class="page-title"style="color: black;display: inline;">${category}</h1>
                  <div class="col-xs-2 layout-switcher" style="float: right;">
                     <a class="layout-list" href="javascript:void(0);"> <i
                        class="fa fa-th-list"></i>
                     </a> <a class="layout-grid active" href="javascript:void(0);"> <i
                        class="fa fa-th"></i>
                     </a>
                  </div>
                  <!--/ .layout-switcher-->
               </div>

               <div class="section clear">
                  <div id="list-type" class="proerty-th">


                  <c:forEach items="${pList}" var="project">
                     <div class="col-sm-6 col-md-4 p0">
                        <div class="box-two proerty-item">
                           <div class="item-thumb">
                              <div class="clearfix">
<!--                                  <div class="favorite-and-print" id="favorite">
                                    <a class="add-to-fav" href="#login-modal" data-toggle="modal"> 
                                    <i class="fa fa-star-o"></i>
                                    </a>
                                 </div>
 -->                                 <div class="lSSlideWrapper usingCss"
                                    style="transition-duration: 500ms; transition-timing-function: ease;">
                                     <a href="detailedProject1?project_num=${project.project_num}">
                                     <img src="showProjectImg?project_num=${project.project_num}">
                                     </a>
                                 </div>
                              </div>
                           </div>
                           
                           <div class="item-entry overflow">
                              <h5 style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                 <a  href="detailedProject1?project_num=${project.project_num}">
                                 ${project.project_title} </a>
                              </h5>
                              <div class="dot-hr"></div>
                              
                              <div class="progress-card" style="margin-bottom: 5px;">
                                 <div class="d-flex justify-content-between mb-1">
                                    <div class="progress mb-2" style="height: 10px; margin-bottom: 5px;">
                                       <div class="progress-bar bg-success" role="progressbar"
                                          style="width: ${(project.project_nowfundprice/project.project_goalfundprice)*100}%" aria-valuenow="${(project.project_nowfundprice/project.project_goalfundprice)*100}" aria-valuemin="0"
                                          aria-valuemax="100" data-toggle="tooltip" data-placement="top"
                                          title="${project.project_nowfundprice}" data-original-title="${project.project_nowfundprice}%"></div>
                                    </div>
                                 </div>
                              </div>
							<span class="pull-left"><b>${project.project_goaldate}</b></span> 
							<span class="proerty-price pull-right"><b>$</b>${project.project_goalfundprice}</span>                        
                           </div>
                        </div>
                     </div>
                  </c:forEach>

                     
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