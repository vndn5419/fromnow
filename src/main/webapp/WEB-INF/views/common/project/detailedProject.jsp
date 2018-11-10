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
	<meta name="description" content="company is a real-estate template">
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
	<link rel="stylesheet" href="assets/css/lightslider.min.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/responsive.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css">
</head>
<script type="text/javascript" src="resources/jquery-3.3.1.min.js"></script>

<script>


$(function(){
	
	var category = '${mCategory}';
	if(category =='member'){
		$("#announce").modal('show');
	}
	
    $('.count').prop('disabled', true);
		$(document).on('click','.plus',function(){
		$('.count').val(parseInt($('.count').val()) + 1 );
	});
	$(document).on('click','.minus',function(){
		$('.count').val(parseInt($('.count').val()) - 1 );
			if ($('.count').val() == 0) {
				$('.count').val(1);
			}
    });
	
	reply();
	$("#addReply").on('click', sendReply);
	$(document).on('click',".rereply", changeRereply);
	$(document).on('click',"#cancel", showRereply);
	$(document).on('click',"#addRereply", sendRereply);
	
	/* purchase 버튼  */
	$('#purchase').on('click', function(){
		location.href = "paymentPage?project_num="+${project.project_num}+"&sale_amount="+$('#sale_amount').val();
	});
	
	/* member 좋아요 버튼 처리 */
	$('a.like-button').on('click', function() {
		  $(this).toggleClass('liked');
	});
	
	/* admin 승인버튼 클릭 처리 */
	$("#updateChecked").on('click',function(){
	      
	      $.ajax({
	         method : 'get',
	         url : 'updateChecked',
	         data :  'project_num='+${project.project_num},
	         dataType : 'json',
	         success : function(resp){
	            console.log("ddd");
	            if(resp==1){
	               alert("Approved");
	               $("#updateChecked").hide();
	               window.location.href="${pageContext.request.contextPath}/adminProjects";
	            };
	            if(resp!=1){

	               alert("Not approved");
	            };
	         }
	      });
	      
	   });
	
	$('#myCoupon').on('click', function(){
		location.href="myCoupon";
	});
	$('#buyNow').on('click', function(){
		location.href = "paymentPage?project_num="+${project.project_num}+"&sale_amount="+$('#sale_amount').val();
	});	
});

function changeRereply(){
	$(this).hide();
	var rereply = '';
	rereply += '<section id="comment-form" class="add-comments"><form>';
	rereply += '<div id="sibling" class="row wow fadeInLeft animated animated animated" style="visibility: visible; animation-name: fadeInLeft;">';
	rereply += '<div class="col-sm-12"><div class="form-group">';
	rereply += '<textarea class="form-control" rows="4"></textarea>';
	rereply += '</div></div></div><div class="row wow fadeInLeft animated animated animated" style="visibility: visible; animation-name: fadeInLeft;">';
	rereply += '<div class="col-sm-12 text-right"><input type="button" id="cancel" class="btn btn-primary" value="Cancel" style="width: 20%;"> ';
    rereply += '<input type="button" id="addRereply" class="btn btn-primary" value="Submit" style="width: 20%;"></div></div></form></section>';
	$(this).parent().html(rereply);

    
}
function showRereply(){
	$(this).parent().parent().parent().parent().hide();
	var rereply = '';
	rereply += '<p class="rereply"><a><i class="fa fa-reply"></i> Reply</a></p>';
	$(this).parent().parent().parent().parent().parent().html(rereply);
}

function reply(){
	$.ajax({
		method : 'get',
		url : 'replyAll',
		data :  'project_num='+${project.project_num},
		dataType : 'json',
		success : function(resp){
			if(resp==null){
				console.log("null 값 도착");
			};
			if(resp!=null){
				addReply(resp);
			};
		}
	});
}

function sendReply(){
	
	var reply_content = $("#commentAdd").val();
	var project_num = ${project.project_num};

	
	
	var sendData = {"reply_content" : reply_content, "project_num" : project_num};
	$("#commentAdd").val('');
	
	console.log(sendData);
	
	$.ajax({
		method : 'post',
		url : 'addReply',
		data :  JSON.stringify(sendData),
		contentType : 'application/json; charset:utf-8',
		success : function(resp){
			alert("success");
			if(resp==null){
			//alert("값 입력이 안됨");	
			};
			if(resp!=null){
				addReply(resp);	
				}
		}
	});
}

function sendRereply(){
	var rereply_content = $(this).parent().parent().siblings("#sibling").children(".col-sm-12").children(".form-group").children(".form-control").val();
	var reply_num = $(this).parent().parent().parent().parent().parent().parent().parent().attr('data_num');
	var project_num = ${project.project_num};

	var sendData = {"rereply_content" : rereply_content, "project_num" : project_num, "reply_num" : reply_num};
	
	$.ajax({
		method : 'post',
		url : 'addRereply',
		data :  JSON.stringify(sendData),
		contentType : 'application/json; charset:utf-8',
		success : function(resp){
			alert("success");
			if(resp==null){
			alert("값 입력이 안됨");	
			};
			if(resp!=null){
				addReply(resp);	
				}
		}
	}); 
}
 
 function addReply(resp){
	var replyAll = '';
	if(resp.replyList[0]==null){
		return false;
	}
	$("#commentsCount").text(resp.replyList[0].count+" Comments");
		
		var rereplyList = resp.rereplyList;
		
		$.each(resp.replyList, function(i, reply){
			replyAll += '<div class="row comment" data_num="'+reply.reply_num+'"><div class="col-sm-3 col-md-2 text-center-xs"><p>';
			replyAll += '<img src="assets/img/client-face1.png" class="img-responsive img-circle" alt=""></p> </div>';
			replyAll += '<div class="col-sm-9 col-md-10"><h5 class="text-uppercase">'+reply.userid+'</h5>';
			replyAll += '<p class="posted"><i class="fa fa-clock-o"></i>'+reply.reply_date+'</p><p>';
			replyAll += reply.reply_content+'</p><div class="replyArea">';
			if(resp.rereplyList[i]==null){
				replyAll += '	<p class="rereply"><a><i class="fa fa-reply"></i> Reply</a></p></div></div></div>';
			};
			if(resp.rereplyList[i]!=null){
				replyAll += '<section id="comment-form" class="add-comments"><form>';
				replyAll += '<div id="sibling" class="row wow fadeInLeft animated animated animated" style="visibility: visible; animation-name: fadeInLeft;">';
				replyAll += '<div class="col-sm-12"><div class="form-group">';
				replyAll += '<textarea disabled="disabled" class="form-control" rows="4">'+rereplyList[i].rereply_content+'</textarea>';
				replyAll += '</div></div></div>';
				replyAll += '</form></section></div></div></div>';
			}
		});	
		$("#replyArea").html(replyAll);
 };
 
 
/* function getHash(){
	$.ajax({
		method : 'get',
		url : 'getHash',
		success : function(resp){
			alert(resp);
		}
	});
} */
	
	
var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

// 3. This function creates an <iframe> (and YouTube player)
//    after the API code downloads.
var player;

window.onYouTubePlayerAPIReady = function(){
  player = new YT.Player('player', {
     height: '360',
    width: '720',
    videoId: '${project.project_video}',
    startSeconds : '0',
    playerVars: { 'autoplay': 0, 'controls': 1,'autohide':0,'wmode':'opaque','origin':'http://localhost:8081' },
    events: {
		'onStateChange': onPlayerStateChange
    }
  });
} 



var eventSource;
function startHash(){
	eventSource = null;
	eventSource = new EventSource('http://localhost:8081/cryptokick/getHash');
	eventSource.onopen=function(){displayTextArea.value += 'Connected...\n'};
	eventSource.onmessage=function(message){
		if(message.data.includes('Congratulations')){
			console.log(message);
			var lottery = message.data.replace('Congratulations', '');
			$('#loading-text').html(lottery);
	 		eventSource.close();
			done = true;
			
			var winMessage = '<div class="col-sm-6 col-md-3 animated pulse infinite" style="margin-top: 10px; margin-bottom: 15px; width: 36%; left: 7%;">';
			winMessage += '<div class="dl">';
			winMessage += '<div class="brand" style="color: #333; font-size: larger; font-weight: 500; max-height: 104px; letter-spacing: unset; text-transform: unset;">';
			winMessage += '${project.project_title}';
			winMessage += '</div>';
			winMessage += '<div class="discount alizarin" style="-webkit-text-stroke: 1px #eee;">'+lottery+'%';
			winMessage += '<div class="type">off</div>';
			winMessage += '</div>';
			winMessage += '<div class="descr" style="color: #333; text-align: center; font-size: 20px; text-shadow: 1.5px 1.5px #ccc;">';
			winMessage += '<strong>End date : '+'${project.project_goaldate}'+'</strong>';
			winMessage += '</div>';
			winMessage += '</div>';
			winMessage += '</div>';			
			
			$('.couponArea').html(winMessage);
			$("#winCoupon").modal('show');
		} else{
			displayTextArea.value = message.data+'\n\n';
			$('#loading-text').html(message.data);
			console.log(message); 	
		}
	}

	eventSource.onerror=function(){
		displayTextArea.value += 'Error Occured...\n';
			eventSource.close();
	};
	//startButton.disabled = true;
};
function stopHash(){
	eventSource.close();
	//startButton.disabled = false;
	
};
function clear(){
	displayTextArea.value = '';
};

// 5. The API calls this function when the player's state changes.
var done = false;
var start = false; //첫 시작
var hash = false;
var check = false;
var couponCheck = ${couponCheck[0] ==null};
function onPlayerStateChange(event) {
	var category = '${mCategory}';
	if(player.getPlayerState() == 1 && !start){
		start = true;
		if(category =='member'){
			check = confirm('Do you want to use your computing power to find a coupon?');
			//getHash(); //재생 시작시 getHash함수 시작
		}
	}
	//동영상 재생 시작
	if(player.getPlayerState()==1){
		if(category =='member'){
			if(check ==true && done ==false && couponCheck==true){
				$.ajax({
					method : 'get',
					url : 'insertViewer',
					data :  "project_num="+${project.project_num},
					success : function(resp){
						if(resp == 0){
							alert("All coupon has been mined");
						};
						if(resp == 1){
							$('#loading-wrapper').css('display', 'unset');
							startHash();		
							hash = true;
						}
					}
				});
			}
			if(check == true && done == true || couponCheck == false){
				alert("You already mined a coupon!");
			}
		}
	}
	//동영상 일시정지
  	if(player.getPlayerState() == 2){
		/* alert("동영상 일시정지됨(듀레이션) : "+player.getDuration());
		alert("동영상 정지됨 : "+player.getCurrentTime());
		 */
		 if(category =='member'){
			 if(hash){
				 stopHash();
			}	
		}
  	}
  	//동영상 정지
  	if(player.getPlayerState() == 0){
		/* alert("동영상 정지됨(듀레이션) : "+player.getDuration());
		alert("동영상 정지됨 : "+player.getCurrentTime());
		 */
		 if(category =='member'){
			 if(hash){
			 stopHash(); 
			}	
		}
  	}
  	
}
function stopVideo() {
  player.stopVideo();
}	

//config vars
var lagAmount = 50;
var maxSpeed = 100;
var frameRate = 20;
var selector = '#move';

$(function(){
	/* var animation = bodymovin.loadAnimation({
		  container: document.getElementById('bm'),
		  renderer: 'svg',
		  loop: true,
		  autoplay: true,
		  path: 'assets/js/confetti.json'
	});
	 */
	//code
/* 	var scrollTop = 0;
	var pinTop = 0;
	var lastTime = void 0;
	var updatePinPosition = function updatePinPosition(time) {
		if (!lastTime)
		lastTime = time;
		var delta = time - lastTime;
		if (delta >= frameRate) {
			scrollTop = $(window).scrollTop();
			var move = (scrollTop - pinTop) * delta / (lagAmount + delta);
			var direction = move === 0 ? 0 : move / Math.abs(move);
			pinTop = pinTop + Math.min(Math.abs(move), maxSpeed) * direction;
			$(selector).css('transform', 'translateY(' + -move + 'px');
			lastTime = time;
		}
		requestAnimationFrame(updatePinPosition);
	};
	requestAnimationFrame(updatePinPosition); */
	
	//project 펀딩 마감 날짜
	var countDownDate = new Date('${project.project_goaldate}').getTime();
	
	// 1초마다 업데이트
	var x = setInterval(function() {

	    // 현재시간
	    var now = new Date().getTime();
	    
	    // 마감날짜 - 현재날짜
	    var distance = countDownDate - now;
	    
	    // 일, 시, 분, 초로 환산
	    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
	    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
	    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
	    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
        
	    minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;
	    
	    // demo div에 시간 뿌려주기
	    document.getElementById("demo").innerHTML = days + " &nbsp;&nbsp; " + hours + "&nbsp; : &nbsp;"
	    + minutes + "&nbsp; : &nbsp;" + seconds;
	    
	    //countdown 끝났을 경우
	    if (distance < 0) {
	        clearInterval(x);
	        document.getElementById("demo").innerHTML = "Funding Date EXPIRED";
	        $('#demo').css('color', '#fdc600');
	        $('#demo').css('font-weight', '500');
	        $('#demo').css('font-size', '25px');
	        $('#demo').css('text-shadow', '#ccc 1px 1px 1px');
	        $('.single-property-header').remove();
	        $('#contentDiv').css('margin-top', '0px');
	        $('#countDown').css('display', 'none');
	    }
	}, 1000);
	
	
});

//Set the date we're counting down to
var countDownDate = new Date("May 5, 2018 12:00:00").getTime();

// Update the count down every 1 second
var x = setInterval(function() {

  // Get todays date and time
  var now = new Date().getTime();

  // Find the distance between now an the count down date
  var distance = countDownDate - now;

  // Time calculations for days, hours, minutes and seconds
  var days = Math.floor(distance / (1000 * 60 * 60 * 24));
  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

  // Display the result in the element with id="demo"
  document.getElementById("demo").innerHTML = days + "d " + hours + "h "
  + minutes + "m " + seconds + "s ";

  // If the count down is finished, write some text 
  if (distance < 0) {
    clearInterval(x);
    document.getElementById("demo").innerHTML = "EXPIRED";
  }
}, 1000);

</script>

<style type="text/css">

#myCoupon:hover{
	background-color: #fdc600;
}
#buyNow:hover{
	background-color: #fdc600;
}

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

.qty .count {
    color: #000;
    vertical-align: top;
    font-size: 25px;
    font-weight: 700;
    line-height: 30px;
    padding: 0 2px
    ;min-width: 35px;
    text-align: center;
}
.qty .plus {
    cursor: pointer;
    display: inline-block;
    vertical-align: top;
    color: #fdc600;
    width: 30px;
    height: 30px;
    font: 30px/1 Arial,sans-serif;
    text-align: center;
    border-radius: 50%;
    }
.qty .minus {
    cursor: pointer;
    display: inline-block;
    vertical-align: top;
    color: #fdc600;
    width: 30px;
    height: 30px;
    font: 30px/1 Arial,sans-serif;
    text-align: center;
    border-radius: 50%;
    background-clip: padding-box;
}
.qty {
    text-align: center;
}


/*Prevent text selection*/
.plus {
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
}
.minus {
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
}
.count{  
    border: 0;
    width: 2%;
}
nput::-webkit-outer-spin-button,
.count::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
.count:disabled{
    background-color:white;
}

#loading-wrapper {
  position: fixed;
  width: 100%;
  height: 100%;
}

#loading-text {
  display: block;
  position: absolute;
  top: 50%;
  left: 50%;
  color: #333;
  height: 30px;
  margin: -28px 0 0 -43px;
  text-align: center;
  font-family: 'PT Sans Narrow', sans-serif;
  font-size: 16px;
  font-weight: 500;
}

#loading-content {
  display: block;
  position: relative;
  left: 50%;
  top: 50%;
  width: 140px;
  height: 140px;
  margin: -85px 0 0 -85px;
  border: 3px solid #F00;
}

#loading-content:after {
  content: "";
  position: absolute;
  border: 3px solid #0F0;
  left: 15px;
  right: 15px;
  top: 15px;
  bottom: 15px;
}

#loading-content:before {
  content: "";
  position: absolute;
  border: 3px solid #00F;
  left: 5px;
  right: 5px;
  top: 5px;
  bottom: 5px;
}

#loading-content {
  border: 3px solid transparent;
  border-top-color: #fdc600;
  border-bottom-color: #fdc600;
  border-radius: 50%;
  -webkit-animation: loader 2s linear infinite;
  -moz-animation: loader 2s linear infinite;
  -o-animation: loader 2s linear infinite;
  animation: loader 2s linear infinite;
}

#loading-content:before {
  border: 3px solid transparent;
  border-top-color: #ffdd66;
  border-bottom-color: #ffdd66;
  border-radius: 50%;
  -webkit-animation: loader 3s linear infinite;
    -moz-animation: loader 2s linear infinite;
  -o-animation: loader 2s linear infinite;
  animation: loader 3s linear infinite;
}

#loading-content:after {
  border: 3px solid transparent;
  border-top-color: #ffeaa0;
  border-bottom-color: #ffeaa0;
  border-radius: 50%;
  -webkit-animation: loader 1.5s linear infinite;
  animation: loader 1.5s linear infinite;
    -moz-animation: loader 2s linear infinite;
  -o-animation: loader 2s linear infinite;
}

@-webkit-keyframes loaders {
  0% {
    -webkit-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}

@keyframes loader {
  0% {
    -webkit-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}

#content-wrapper {
  color: #FFF;
  position: fixed;
  left: 0;
  top: 20px;
  width: 100%;
  height: 100%;
}

#header
{
  width: 800px;
  margin: 0 auto;
  text-align: center;
  height: 100px;
  background-color: #666;
}

#content
{
  width: 800px;
  height: 1000px;
  margin: 0 auto;
  text-align: center;
  background-color: #888;
}

.modal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
 
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}


@import url("https://fonts.googleapis.com/css?family=Ek+Mukta:400,300,500,700,800");

.coin {
  font-family: 'Ek Mukta', sans-serif;
  margin: -50px 0 0 -50px;
  width: 100px;
  height: 100px;
  -ms-transform-style: preserve-3d;
  -webkit-transform-style: preserve-3d;
  transform-style: preserve-3d;
  position: absolute;
  top: 50%;	
  left: 50%;
  animation: coin 2s linear infinite;
}

.coin .front {
  width: 100%;
  height: 100%;
  
  border-radius: 50%;
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
}

.coin .back {
  width: 100%;
  height: 100%;
  background: #f7941e;
  border-radius: 50%;
  transform: rotateY(180deg) translateZ(10px);
  -webkit-transform: rotateY(180deg) translateZ(10px);
  -ms-transform: rotateY(180deg) translateZ(10px);
  position: absolute;
  top: 0;
  left: 0;
  z-index: 1;
}

.coin .front_b {
  width: 100%;
  height: 100%;
  background: #f7941e;
  border-radius: 50%;
  transform: translateZ(-1px);
  -webkit-transform: translateZ(-1px);
  position: absolute;
  top: 0;
  left: 0;
  z-index: 2;
}

.coin .back_b {
  width: 100%;
  height: 100%;
  background: #f7941e;
  border-radius: 50%;
  transform: translateZ(-9px);
  -webkit-transform: translateZ(-9px);
  position: absolute;
  top: 0;
  left: 0;
  z-index: -2;
}

.coin:before {
  content: "";
  margin-left: -5px;
  width: 10px;
  height: 100%;
  background: #f7941e;
  position: absolute;
  top: 0;
  left: 50%;
  z-index: 1;
  -webkit-transform: rotateY(-90deg);
  -webkit-transform-origin: 100% 50%;
  transform: rotateY(-90deg);
  transform-origin: 100% 50%;
}

.coin .front_b:before {
  content: "";
  width: 100%;
  height: 100%;
  border: 10px solid #fbb041;
  border-radius: 50%;
  box-sizing: border-box;
  position: absolute;
  top: 0;
  left: 0;
  z-index: 3;
}

.coin .front_b:after {
  content: "$";
  padding: 12px 0 0 0;
  width: 100%;
  height: 100%;
  font-size: 5em;
  font-weight: bold;
  color: #fbb041;
  line-height: 1;
  text-align: center;
  box-sizing: border-box;
  position: absolute;  
  top: 0;
  left: 0;
  z-index: 4;
}

.coin .back:before {
  content: "";
  width: 100%;
  height: 100%;
  border: 10px solid #fbb041;
  border-radius: 50%;
  box-sizing: border-box;
  position: absolute;
  top: 0;
  left: 0;
  z-index: -3;
}

.coin .back:after {
  content: "100";
  padding: 27px 0 0 0;
  width: 100%;
  height: 100%;
  font-size: 3em;
  font-weight: bold;
  color: #fbb041;
  line-height: 1;
  text-align: center;
  box-sizing: border-box;
  position: absolute;
  top: 0;
  left: 0;
  z-index: -4;
}

@keyframes coin {
  0% {
    transform: rotateY(0);
  }
  100% {
    transform: rotateY(360deg);
  }
}

.player {
   background-color: #ddd;
   display: block;
   position: relative;
   padding: 0 0 56.25% 0;
}
.player video {
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 100%;
}
video {
  transition: width .2s ease-in-out, height .2s ease-in-out, transform .38s ease-in-out;
}
/** Use .sticky */
video.is-sticky {
  position: fixed;
  top: 15px;
  left: auto;
  max-width: 280px;
  max-height: 158px;
  width: 280px;
  height: 158px;
}
@media screen and (min-width: 1120px) {
   video.is-sticky {
      transform: translateX(-80%);
   }
}
@media screen and (min-width: 1300px) {
   video.is-sticky {
      transform: translateX(-115%);
   }
}

/* 좋아요 버튼  */
a {
  cursor: pointer;
}


.like-wrapper {
  display: flex;
  justify-content: space-around;
  flex-flow: row wrap;
}

.like-button {
  border: 2px solid #c7c7c7;
  color: #878787;
  font-weight: bold;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: unset;
  transition: all 0.25s cubic-bezier(0.175, 0.885, 0.32, 1.275);
  -webkit-filter: grayscale(100%);
          filter: grayscale(100%);
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none;
}
.like-button.liked {
  color: #ff6e6f;
  border-color: currentColor;
  -webkit-filter: grayscale(0);
          filter: grayscale(0);
}
.like-button:hover {
  border-color: currentColor;
}

.like-icon {
  width: 18px;
  height: 16px;
  display: inline-block;
  position: relative;
  margin-right: .25em;
  font-size: 1.5rem;
  background: url('data:image/svg+xml;utf8,<svg width="21" height="18" viewBox="0 0 21 18" xmlns="http://www.w3.org/2000/svg"><title>heart-colored</title><path d="M10.101 4.417S8.895.207 5.111.207c-4.465 0-10.967 6.846 5.082 17.592C25.237 7.03 19.665.202 15.501.202c-4.162 0-5.4 4.215-5.4 4.215z" fill="#FF6E6F" fill-rule="evenodd"/></svg>') no-repeat center;
  background-size: 100%;
  -webkit-animation: heartUnlike 0.25s cubic-bezier(0.175, 0.885, 0.32, 1.275) both;
          animation: heartUnlike 0.25s cubic-bezier(0.175, 0.885, 0.32, 1.275) both;
}

.liked .like-icon {
  -webkit-animation: heartPulse 0.25s cubic-bezier(0.175, 0.885, 0.32, 1.275) both;
          animation: heartPulse 0.25s cubic-bezier(0.175, 0.885, 0.32, 1.275) both;
}
.liked .like-icon [class^="heart-animation-"] {
  background: url('data:image/svg+xml;utf8,<svg width="21" height="18" viewBox="0 0 21 18" xmlns="http://www.w3.org/2000/svg"><title>heart-colored</title><path d="M10.101 4.417S8.895.207 5.111.207c-4.465 0-10.967 6.846 5.082 17.592C25.237 7.03 19.665.202 15.501.202c-4.162 0-5.4 4.215-5.4 4.215z" fill="#FF6E6F" fill-rule="evenodd"/></svg>') no-repeat center;
  background-size: 100%;
  display: block;
  position: absolute;
  top: 0;
  left: 0;
  width: 16px;
  height: 14px;
  opacity: 0;
}
.liked .like-icon [class^="heart-animation-"]::before, .liked .like-icon [class^="heart-animation-"]::after {
  content: '';
  background: inherit;
  background-size: 100%;
  width: inherit;
  height: inherit;
  display: inherit;
  position: relative;
  top: inherit;
  left: inherit;
  opacity: 0;
}
.liked .like-icon .heart-animation-1 {
  -webkit-animation: heartFloatMain-1 1s cubic-bezier(0.175, 0.885, 0.32, 1.275) both;
          animation: heartFloatMain-1 1s cubic-bezier(0.175, 0.885, 0.32, 1.275) both;
}
.liked .like-icon .heart-animation-1::before, .liked .like-icon .heart-animation-1::after {
  width: 12px;
  height: 10px;
  visibility: hidden;
}
.liked .like-icon .heart-animation-1::before {
  opacity: .6;
  -webkit-animation: heartFloatSub-1 1s 0.25s cubic-bezier(0.175, 0.885, 0.32, 1.275) both;
          animation: heartFloatSub-1 1s 0.25s cubic-bezier(0.175, 0.885, 0.32, 1.275) both;
}
.liked .like-icon .heart-animation-1::after {
  -webkit-animation: heartFloatSub-2 1s 0.15s cubic-bezier(0.175, 0.885, 0.32, 1.275) both;
          animation: heartFloatSub-2 1s 0.15s cubic-bezier(0.175, 0.885, 0.32, 1.275) both;
  opacity: .75;
}
.liked .like-icon .heart-animation-2 {
  -webkit-animation: heartFloatMain-2 1s 0.1s cubic-bezier(0.175, 0.885, 0.32, 1.275) both;
          animation: heartFloatMain-2 1s 0.1s cubic-bezier(0.175, 0.885, 0.32, 1.275) both;
}
.liked .like-icon .heart-animation-2::before, .liked .like-icon .heart-animation-2::after {
  width: 10px;
  height: 8px;
  visibility: hidden;
}
.liked .like-icon .heart-animation-2::before {
  -webkit-animation: heartFloatSub-3 1s 0.25s cubic-bezier(0.175, 0.885, 0.32, 1.275) both;
          animation: heartFloatSub-3 1s 0.25s cubic-bezier(0.175, 0.885, 0.32, 1.275) both;
  opacity: .25;
}
.liked .like-icon .heart-animation-2::after {
  -webkit-animation: heartFloatSub-4 1s 0.15s cubic-bezier(0.175, 0.885, 0.32, 1.275) both;
          animation: heartFloatSub-4 1s 0.15s cubic-bezier(0.175, 0.885, 0.32, 1.275) both;
  opacity: .4;
}

@-webkit-keyframes heartPulse {
  0% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
  50% {
    -webkit-transform: scale(1.5);
            transform: scale(1.5);
  }
}

@keyframes heartPulse {
  0% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
  50% {
    -webkit-transform: scale(1.5);
            transform: scale(1.5);
  }
}
@-webkit-keyframes heartUnlike {
  50% {
    -webkit-transform: scale(0.75);
            transform: scale(0.75);
  }
}
@keyframes heartUnlike {
  50% {
    -webkit-transform: scale(0.75);
            transform: scale(0.75);
  }
}
@-webkit-keyframes heartFloatMain-1 {
  0% {
    opacity: 0;
    -webkit-transform: translate(0) rotate(0);
            transform: translate(0) rotate(0);
  }
  50% {
    opacity: 1;
    -webkit-transform: translate(0, -25px) rotate(-20deg);
            transform: translate(0, -25px) rotate(-20deg);
  }
}
@keyframes heartFloatMain-1 {
  0% {
    opacity: 0;
    -webkit-transform: translate(0) rotate(0);
            transform: translate(0) rotate(0);
  }
  50% {
    opacity: 1;
    -webkit-transform: translate(0, -25px) rotate(-20deg);
            transform: translate(0, -25px) rotate(-20deg);
  }
}
@-webkit-keyframes heartFloatMain-2 {
  0% {
    opacity: 0;
    -webkit-transform: translate(0) rotate(0) scale(0);
            transform: translate(0) rotate(0) scale(0);
  }
  50% {
    opacity: .9;
    -webkit-transform: translate(-10px, -38px) rotate(25deg) scale(1);
            transform: translate(-10px, -38px) rotate(25deg) scale(1);
  }
}
@keyframes heartFloatMain-2 {
  0% {
    opacity: 0;
    -webkit-transform: translate(0) rotate(0) scale(0);
            transform: translate(0) rotate(0) scale(0);
  }
  50% {
    opacity: .9;
    -webkit-transform: translate(-10px, -38px) rotate(25deg) scale(1);
            transform: translate(-10px, -38px) rotate(25deg) scale(1);
  }
}
@-webkit-keyframes heartFloatSub-1 {
  0% {
    visibility: hidden;
    -webkit-transform: translate(0) rotate(0);
            transform: translate(0) rotate(0);
  }
  50% {
    visibility: visible;
    -webkit-transform: translate(13px, -13px) rotate(30deg);
            transform: translate(13px, -13px) rotate(30deg);
  }
}
@keyframes heartFloatSub-1 {
  0% {
    visibility: hidden;
    -webkit-transform: translate(0) rotate(0);
            transform: translate(0) rotate(0);
  }
  50% {
    visibility: visible;
    -webkit-transform: translate(13px, -13px) rotate(30deg);
            transform: translate(13px, -13px) rotate(30deg);
  }
}
@-webkit-keyframes heartFloatSub-2 {
  0% {
    visibility: hidden;
    -webkit-transform: translate(0) rotate(0);
            transform: translate(0) rotate(0);
  }
  50% {
    visibility: visible;
    -webkit-transform: translate(18px, -10px) rotate(55deg);
            transform: translate(18px, -10px) rotate(55deg);
  }
}
@keyframes heartFloatSub-2 {
  0% {
    visibility: hidden;
    -webkit-transform: translate(0) rotate(0);
            transform: translate(0) rotate(0);
  }
  50% {
    visibility: visible;
    -webkit-transform: translate(18px, -10px) rotate(55deg);
            transform: translate(18px, -10px) rotate(55deg);
  }
}
@-webkit-keyframes heartFloatSub-3 {
  0% {
    visibility: hidden;
    -webkit-transform: translate(0) rotate(0);
            transform: translate(0) rotate(0);
  }
  50% {
    visibility: visible;
    -webkit-transform: translate(-10px, -10px) rotate(-40deg);
            transform: translate(-10px, -10px) rotate(-40deg);
  }
  100% {
    -webkit-transform: translate(-50px, 0);
            transform: translate(-50px, 0);
  }
}
@keyframes heartFloatSub-3 {
  0% {
    visibility: hidden;
    -webkit-transform: translate(0) rotate(0);
            transform: translate(0) rotate(0);
  }
  50% {
    visibility: visible;
    -webkit-transform: translate(-10px, -10px) rotate(-40deg);
            transform: translate(-10px, -10px) rotate(-40deg);
  }
  100% {
    -webkit-transform: translate(-50px, 0);
            transform: translate(-50px, 0);
  }
}
@-webkit-keyframes heartFloatSub-4 {
  0% {
    visibility: hidden;
    -webkit-transform: translate(0) rotate(0);
            transform: translate(0) rotate(0);
  }
  50% {
    visibility: visible;
    -webkit-transform: translate(2px, -18px) rotate(-25deg);
            transform: translate(2px, -18px) rotate(-25deg);
  }
}
@keyframes heartFloatSub-4 {
  0% {
    visibility: hidden;
    -webkit-transform: translate(0) rotate(0);
            transform: translate(0) rotate(0);
  }
  50% {
    visibility: visible;
    -webkit-transform: translate(2px, -18px) rotate(-25deg);
            transform: translate(2px, -18px) rotate(-25deg);
  }
}

#key{
  -vendor-animation-duration: 3s;
  -vendor-animation-delay: 2s;
}

</style>

<body>
	
<div class="modal fade" id="announce" tabindex="-1" role="dialog"
		aria-labelledby="modalUpdatePro" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered" role="document" style="width: 600px;">
			<div class="modal-content">
				<div class="modal-header bg-primary" style="background: #fdc600;">
					<button type="button" id="closeUploadModal" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h6 class="modal-title">
						Guide
					</h6>
					
				</div>
				<div class="modal-body text-center">
						<div class="col-md-8 single-property-content prp-style-1 " style="max-width: 100%;width: 100%;text-align: left;">
                        <div class="row">
                            <div class="light-slide-item">            
                                 <div class="clearfix" id="previewVideoUrl" style="text-align: center;">
			                           <h4>Get a Promo Code by Watching Video! </h4>
			                           <br>
			                           	<div>
			                           		<!-- <img src="assets/img/key.png" width="200px" alt="Mirror Edge">
			                           		 -->
			                           		 <svg class="ldi-whnsbw" width="30%" height="100%" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid" style="
    position: absolute;
    bottom: 89px;
    left: 8px;
"><!--?xml version="1.0" encoding="utf-8"?--><!--Generator: Adobe Illustrator 21.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)--><svg version="1.1" id="圖層_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 100 100" style="transform-origin: 50px 50px 0px;" xml:space="preserve"><g style="transform-origin: 50px 50px 0px;"><g style="transform-origin: 50px 50px 0px; transform: scale(0.6);"><g style="transform-origin: 50px 50px 0px; animation-duration: 2s; animation-delay: -2s; animation-direction: normal;" class="ld ld-wrench"><g><style type="text/css" class="" style="transform-origin: 50px 50px 0px; animation-duration: 1s; animation-delay: -1s; animation-direction: normal;">.st0{fill:#333333;} .st1{fill:#E0E0E0;stroke:#333333;stroke-width:3.5;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;} .st2{fill:#666666;stroke:#333333;stroke-width:3.5;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;} .st3{fill:#E0E0E0;stroke:#333333;stroke-width:3.5;stroke-miterlimit:10;} .st4{fill:#F47E60;stroke:#333333;stroke-width:3.5;stroke-linejoin:round;stroke-miterlimit:10;} .st5{fill:#666666;stroke:#333333;stroke-width:3.5;stroke-miterlimit:10;opacity: unset;} .st6{opacity:0.2;} .st7{fill:#66503A;stroke:#333333;stroke-width:3.5;stroke-miterlimit:10;opacity: unset;} .st8{fill:none;stroke:#333333;stroke-width:3.5;stroke-linejoin:round;stroke-miterlimit:10;} .st9{fill:#66503A;stroke:#333333;stroke-width:3.5;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;} .st10{fill:#F5E6C8;stroke:#333333;stroke-width:3.5;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;} .st11{fill:#F8B26A;stroke:#333333;stroke-width:3.5;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;} .st12{fill:#E0E0E0;stroke:#333333;stroke-width:3.5;stroke-linejoin:round;stroke-miterlimit:10;} .st13{fill:none;stroke:#333333;stroke-width:3.5;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;} .st14{fill:#E15B64;stroke:#333333;stroke-width:3.5;stroke-miterlimit:10;} .st15{fill:none;stroke:#333333;stroke-width:3.5;stroke-miterlimit:10;} .st16{fill:none;stroke:#333333;stroke-width:3.5;stroke-linecap:round;stroke-miterlimit:10;} .st17{fill:#E15B64;stroke:#333333;stroke-width:3.5;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;} .st18{fill:#A0C8D7;stroke:#333333;stroke-width:3.5;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;} .st19{fill:#F8B26A;stroke:#333333;stroke-width:3.5;stroke-miterlimit:10;} .st20{fill:#E0E0E0;stroke:#FFFFFF;stroke-width:3.5;stroke-linecap:round;stroke-miterlimit:10;} .st21{opacity:0.2;stroke:#000000;stroke-width:3.5;stroke-miterlimit:10;} .st22{fill:none;stroke:#FFFFFF;stroke-width:3.5;stroke-linecap:round;stroke-miterlimit:10;} .st23{opacity:0.2;stroke:#000000;stroke-width:3.5;stroke-linecap:round;stroke-miterlimit:10;} .st24{fill:#FFFFFF;} .st25{opacity:0.2;stroke:#000000;stroke-width:3.5;stroke-linejoin:round;stroke-miterlimit:10;} .st26{fill:none;stroke:#FFFFFF;stroke-width:3.5;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;} .st27{opacity:0.2;stroke:#000000;stroke-width:3.5;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;} .st28{fill:#F8B26A;stroke:#FFFFFF;stroke-width:3.5;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;} .st29{fill:#666666;stroke:#333333;stroke-width:3.5;stroke-linejoin:round;stroke-miterlimit:10;} .st30{fill:#E0E0E0;} .st31{fill:#4A3827;stroke:#333333;stroke-width:3.5;stroke-miterlimit:10;} .st32{fill:#E15B64;stroke:#333333;stroke-width:3.5;stroke-linejoin:round;stroke-miterlimit:10;} .st33{fill:#FFFFFF;stroke:#333333;stroke-width:3.5;stroke-miterlimit:10;} .st34{fill:#A0C8D7;stroke:#A0C8D7;stroke-width:3.5;stroke-miterlimit:10;} .st35{fill:#A0C8D7;stroke:#333333;stroke-width:3.5;stroke-miterlimit:10;} .st36{fill:#E15B64;} .st37{fill:#983733;stroke:#333333;stroke-width:3.5;stroke-miterlimit:10;} .st38{fill:#77A4BD;stroke:#333333;stroke-width:3.5;stroke-miterlimit:10;} .st39{fill:#E0E0E0;stroke:#333333;stroke-width:3.5;stroke-linecap:round;stroke-linejoin:round;} .st40{fill:#66503A;stroke:#333333;stroke-width:3.5;stroke-linecap:round;stroke-linejoin:round;} .st41{fill:#F8B26A;stroke:#333333;stroke-width:3.5;stroke-linecap:round;stroke-linejoin:round;} .st42{opacity:0.2;stroke:#000000;stroke-width:3.5;stroke-linecap:round;stroke-linejoin:round;} .st43{opacity:0.6;fill:#FFFFFF;} .st44{opacity:0.1;stroke:#000000;stroke-width:3.5;stroke-miterlimit:10;} .st45{fill:none;stroke:#333333;stroke-width:3.5;stroke-linecap:round;stroke-linejoin:round;} .st46{fill:none;stroke:#FFFFFF;stroke-width:3.5;stroke-linecap:round;stroke-linejoin:round;}</style><g class="" style="transform-origin: 50px 50px 0px; animation-duration: 1s; animation-delay: -0.933333s; animation-direction: normal;"><path class="st7" d="M18.343,88.316L18.343,88.316c-2.412-1.393-3.26-4.463-1.904-6.896l37.438-67.029 c1.709-2.96,5.495-3.975,8.455-2.265l0,0c2.96,1.709,3.975,5.495,2.265,8.455l-39.33,65.936 C23.838,88.908,20.755,89.709,18.343,88.316z" fill="#66503a" stroke="rgb(51, 51, 51)" style="fill: rgb(102, 80, 58); stroke: rgb(51, 51, 51); opacity: unset"></path></g><g class="" style="transform-origin: 50px 50px 0px; animation-duration: 1s; animation-delay: -0.866667s; animation-direction: normal;"><path class="st5" d="M77.65,53.059l-20.8-18.243l-11.426-6.597l-26.2-8.893c-2.146-0.729-2.856-3.54-1.49-5.905l0,0 c0.957-1.657,2.683-2.619,4.28-2.386l30.741,4.486l11.426,6.597l19.256,24.38c1,1.266,1.03,3.243,0.073,4.899l0,0 C82.143,53.762,79.354,54.553,77.65,53.059z" stroke="rgb(51, 51, 51)" fill="rgb(102, 102, 102)" style="stroke: rgb(51, 51, 51); fill: rgb(102, 102, 102); opacity: unset"></path></g><g class="" style="transform-origin: 50px 50px 0px; animation-duration: 1s; animation-delay: -0.8s; animation-direction: normal;"><path class="st21" d="M83.436,46.497L64.18,22.117l-0.372-0.215l0.788-1.322c1.405-2.434,0.967-5.422-0.877-7.359L20.022,88.908 c2.02,0.35,4.133-0.53,5.245-2.391l31.029-52.021l0.553,0.319L77.65,53.059c1.704,1.495,4.493,0.703,5.859-1.662l0,0 C84.466,49.74,84.436,47.764,83.436,46.497z" fill="rgb(0, 0, 0)" stroke="rgb(0, 0, 0)" style="fill: rgb(0, 0, 0); stroke: rgb(0, 0, 0);"></path></g><g class="" style="transform-origin: 50px 50px 0px; animation-duration: 1s; animation-delay: -0.733333s; animation-direction: normal;"><line class="st22" x1="35.456" y1="18.305" x2="34.094" y2="18.029" stroke="rgb(255, 255, 255)" style="stroke: rgb(255, 255, 255);"></line></g><g class="" style="transform-origin: 50px 50px 0px; animation-duration: 1s; animation-delay: -0.666667s; animation-direction: normal;"><line class="st22" x1="48.313" y1="20.907" x2="40.177" y2="19.26" stroke="rgb(255, 255, 255)" style="stroke: rgb(255, 255, 255);"></line></g><metadata xmlns:d="https://loading.io/stock/" class="" style="transform-origin: 50px 50px 0px; animation-duration: 1s; animation-delay: -0.6s; animation-direction: normal;">
<d:name class="" style="transform-origin: 50px 50px 0px; animation-duration: 1s; animation-delay: -0.533333s; animation-direction: normal;">pickaxe</d:name>
<d:tags class="" style="transform-origin: 50px 50px 0px; animation-duration: 1s; animation-delay: -0.466667s; animation-direction: normal;">pickaxe,pick,hand tool,mine,mattock,ice axe,dig</d:tags>
<d:license class="" style="transform-origin: 50px 50px 0px; animation-duration: 1s; animation-delay: -0.4s; animation-direction: normal;">cc-by</d:license>
<d:slug class="" style="transform-origin: 50px 50px 0px; animation-duration: 1s; animation-delay: -0.333333s; animation-direction: normal;">whnsbw</d:slug>
</metadata></g></g></g></g><style type="text/css" class="" style="transform-origin: 50px 50px 0px; animation-duration: 1s; animation-delay: -0.266667s; animation-direction: normal;">path,ellipse,circle,rect,polygon,polyline,line { stroke-width: 0; }@keyframes ld-wrench {
  20%, 36%, 70%, 86% {
    -webkit-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  0%, 50%, 100% {
    -webkit-transform: rotate(45deg);
    transform: rotate(45deg);
  }
}
@-webkit-keyframes ld-wrench {
  20%, 36%, 70%, 86% {
    -webkit-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  0%, 50%, 100% {
    -webkit-transform: rotate(45deg);
    transform: rotate(45deg);
  }
}
.ld.ld-wrench {
  -webkit-animation: ld-wrench 1s infinite;
  animation: ld-wrench 1s infinite;
}
</style></svg></svg>

<svg version="1.1" id="圖層_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 100 100" style="transform-origin: 50px 50px 0px; width: 
30%;" xml:space="preserve"><g style="transform-origin: 50px 50px 0px;"><g style="transform-origin: 50px 50px 0px; transform: scale(0.6);"><g class="ld ld-static" style="transform-origin: 50px 50px 0px; animation-duration: 1s; animation-delay: -1s; animation-direction: normal;"><g><style type="text/css" style="transform-origin: 50px 50px 0px;">.st0{fill:none}.st1,.st2{fill:#a0c8d7;stroke:#333;stroke-width:3.5;stroke-linecap:round;stroke-miterlimit:10}.st2{fill:#e15b64}.st3{opacity:.2}.st4,.st5{stroke:#000;stroke-width:3.5;stroke-linecap:round;stroke-miterlimit:10}.st5{opacity:.2}.st6{fill:#e0e0e0;stroke:#333}.st6,.st7,.st8{stroke-width:3.5;stroke-miterlimit:10}.st7{opacity:.2;stroke-linejoin:round;stroke:#000}.st8{fill:#666;stroke:#333;stroke-linecap:round}.st9{fill:#333}.st10{fill:#e0e0e0;stroke:#333;stroke-width:3.5;stroke-linecap:round;stroke-miterlimit:10}.st11{fill:#fdfdfd}.st12,.st13,.st14,.st15{fill:#f5e6c8;stroke:#333;stroke-width:3.5;stroke-linecap:round;stroke-miterlimit:10}.st13,.st14,.st15{fill:url(#SVGID_1_)}.st14,.st15{fill:none}.st15{fill:url(#SVGID_2_)}.st16{fill:#666}.st17{fill:#fff;stroke:#333;stroke-width:3.5;stroke-linecap:round;stroke-miterlimit:10}.st18{fill:#e15b64}.st19{fill:#f47e60}.st20{fill:#f8b26a}.st21{fill:#abbd81}.st22{fill:#a0c8d7}.st23{fill:#ac749c}.st24{fill:#f47e60;stroke:#333;stroke-linecap:round;stroke-linejoin:round}.st24,.st25,.st26{stroke-width:3.5;stroke-miterlimit:10}.st25{opacity:.2;stroke-linecap:round;stroke-linejoin:round;stroke:#000}.st26{fill:none;stroke:#fff}.st26,.st27,.st28{stroke-linecap:round;stroke-linejoin:round}.st27{stroke:#333;stroke-width:3.5;stroke-miterlimit:10;fill:#a0c8d7}.st28{fill:#77a4bd}.st28,.st29,.st30,.st31,.st32{stroke:#333;stroke-width:3.5;stroke-miterlimit:10}.st29{stroke-linecap:round;stroke-linejoin:round;fill:#e0e0e0}.st30,.st31,.st32{fill:#fff}.st31,.st32{stroke-linejoin:round}.st32{fill:none;stroke-linecap:round}.st33{fill:#e15b64;stroke:#333}.st33,.st34,.st35,.st36{stroke-width:3.5;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10}.st34{fill:#c33737;stroke:#333}.st35,.st36{stroke:#000}.st36{fill:none;stroke:#fff;stroke-width:5}.st37{fill:#fff}.st38{fill:#333;stroke:#fff}.st38,.st39,.st40{stroke-width:3.5;stroke-miterlimit:10}.st39{opacity:.2;stroke:#000}.st40{fill:#666;stroke:#333}.st41{fill:none;stroke:#333}.st41,.st42,.st43,.st44,.st45,.st46,.st47{stroke-width:3.5;stroke-miterlimit:10}.st42{fill:none;stroke-linecap:round;stroke:#fff}.st43,.st44,.st45,.st46,.st47{stroke:#333;stroke-linejoin:round}.st43{stroke-linecap:round;fill:#849b87}.st44,.st45,.st46,.st47{fill:#e0e0e0}.st45,.st46,.st47{fill:#abbd81;stroke-linecap:round}.st46,.st47{fill:#f5e6c8}.st47{fill:#fff}.st48{fill:#f5e169}.st49{fill:#f5e6c8}.st50{fill:#666;stroke-linecap:round;stroke-linejoin:round}.st50,.st51,.st52,.st53,.st54,.st55,.st56,.st57,.st58{stroke:#333;stroke-width:3.5;stroke-miterlimit:10}.st51{stroke-linecap:round;stroke-linejoin:round;fill:#333}.st52,.st53,.st54,.st55,.st56,.st57,.st58{fill:#e15b64}.st53,.st54,.st55,.st56,.st57,.st58{fill:#f5e169}.st54,.st55,.st56,.st57,.st58{fill:#f47e60;stroke-linecap:round}.st55,.st56,.st57,.st58{fill:#f8b26a}.st56,.st57,.st58{fill:#abbd81}.st57,.st58{fill:url(#SVGID_3_)}.st58{fill:#e15b64;stroke:#fff}.st59,.st60,.st61,.st62,.st63,.st64{fill:#abbd80;stroke:#333;stroke-width:3.5;stroke-miterlimit:10}.st60,.st61,.st62,.st63,.st64{fill:#839a86}.st61,.st62,.st63,.st64{fill:#f3e5c7}.st62,.st63,.st64{fill:#333}.st63,.st64{fill:#e0e0e0;stroke:#fff;stroke-linecap:round}.st64{fill:url(#SVGID_4_);stroke:#333}.st65{fill:url(#SVGID_5_);stroke:#333;stroke-linejoin:round}.st65,.st66,.st67{stroke-width:3.5;stroke-miterlimit:10}.st66{stroke:#333;stroke-linejoin:round;fill:url(#SVGID_6_)}.st67{fill:url(#SVGID_7_)}.st67,.st68,.st69{stroke:#333;stroke-linejoin:round}.st68{stroke-width:3.5;stroke-miterlimit:10;fill:url(#SVGID_8_)}.st69{fill:url(#SVGID_9_)}.st69,.st70,.st71{stroke-width:3.5;stroke-miterlimit:10}.st70{stroke:#333;stroke-linejoin:round;fill:#c33737}.st71{fill:#e15b64}.st71,.st72,.st73{stroke:#333;stroke-linejoin:round}.st72{stroke-width:3.5;stroke-miterlimit:10;fill:#f47e60}.st73{fill:#f8b26a}.st73,.st74,.st75{stroke-width:3.5;stroke-miterlimit:10}.st74{stroke-linejoin:round;fill:#f5e6c8;stroke:#333}.st75{fill:#a0c8d7;stroke:#fff;stroke-linecap:round}.st76{fill:#abbd81;stroke:#333}.st76,.st77,.st78,.st79,.st80{stroke-width:3.5;stroke-miterlimit:10}.st77{fill:#333;stroke-linecap:round;stroke:#333}.st78,.st79,.st80{stroke:#fff}.st78{stroke-linecap:round;fill:#333}.st79,.st80{fill:none}.st80{stroke:#e15b64;stroke-linecap:round}</style><g style="transform-origin: 50px 50px 0px;"><path class="st52" d="M80.6,22.7c-20.4-2.9-40.8-2.9-61.1,0c-4.4,0.6-7.8,4-8.6,8.4C9.8,37.4,9.2,43.7,9.2,50 c0,6.3,0.5,12.6,1.6,18.9c0.7,4.3,4.2,7.8,8.6,8.4c20.4,2.9,40.8,2.9,61.1,0c4.4-0.6,7.8-4,8.6-8.4c1.1-6.3,1.6-12.6,1.6-18.9 c0-6.3-0.5-12.6-1.6-18.9C88.4,26.7,84.9,23.3,80.6,22.7z" fill="rgb(225, 91, 100)" stroke="rgb(51, 51, 51)" style="fill: rgb(225, 91, 100); stroke: rgb(51, 51, 51);"></path></g><g style="transform-origin: 50px 50px 0px;"><path class="st39" d="M89.1,31.1c-0.7-4.3-4.2-7.8-8.6-8.4c-5.4-0.8-10.8-1.3-16.1-1.7c5.7,3.9,9.6,10.2,10.2,17.4 c0.3,3.9,0.5,7.7,0.5,11.6c0,3.9-0.2,7.7-0.5,11.6C74,68.8,70.1,75.1,64.4,79c5.4-0.4,10.8-0.9,16.1-1.7c4.4-0.6,7.8-4,8.6-8.4 c1.1-6.3,1.6-12.6,1.6-18.9S90.2,37.4,89.1,31.1z" fill="rgb(0, 0, 0)" stroke="rgb(0, 0, 0)" style="fill: rgb(0, 0, 0); stroke: rgb(0, 0, 0);"></path></g><g style="transform-origin: 50px 50px 0px;"><path class="st58" d="M17.3,48c0,0.7,0,1.3,0,2" fill="rgb(225, 91, 100)" stroke="rgb(255, 255, 255)" style="fill: rgb(225, 91, 100); stroke: rgb(255, 255, 255);"></path></g><g style="transform-origin: 50px 50px 0px;"><path class="st58" d="M18.9,33.1c-0.5,2.7-0.8,5.5-1.1,8.2" fill="rgb(225, 91, 100)" stroke="rgb(255, 255, 255)" style="fill: rgb(225, 91, 100); stroke: rgb(255, 255, 255);"></path></g><g style="transform-origin: 50px 50px 0px;"><polygon class="st30" points="42,63.4 42,36.6 64,50 " stroke="rgb(51, 51, 51)" fill="rgb(255, 255, 255)" style="stroke: rgb(51, 51, 51); fill: rgb(255, 255, 255);"></polygon></g><metadata xmlns:d="https://loading.io/stock/" style="transform-origin: 50px 50px 0px;">
<d:name style="transform-origin: 50px 50px 0px;">video</d:name>
<d:tags style="transform-origin: 50px 50px 0px;">video,television,screen,movie,clip,youtube,tudou,youku,monitor</d:tags>
<d:license style="transform-origin: 50px 50px 0px;">cc-by</d:license>
<d:slug style="transform-origin: 50px 50px 0px;">umwm5d</d:slug>
</metadata></g></g></g></g><style type="text/css" style="transform-origin: 50px 50px 0px;">path,ellipse,circle,rect,polygon,polyline,line { stroke-width: 0; }</style></svg>

<svg class="ldi-8wuk6s" width="15%" height="100%" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid" style="
    margin-bottom: 45px;
"><!--?xml version="1.0" encoding="utf-8"?--><!--Generator: Adobe Illustrator 21.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)--><svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 100 100" style="transform-origin: 50px 50px 0px;" xml:space="preserve"><g style="transform-origin: 50px 50px 0px;"><g style="transform-origin: 50px 50px 0px; transform: scale(0.6);"><g style="transform-origin: 50px 50px 0px;"><g><style type="text/css" class="ld ld-breath" style="transform-origin: 50px 50px 0px; animation-duration: 2s; animation-delay: -2s; animation-direction: normal;">.st0{fill:#999998;} .st1{fill:#323232;} .st2{fill:#CCCCCB;} .st3{fill:#ACBD81;} .st4{fill:#849B87;}</style><g class="ld ld-breath" style="transform-origin: 50px 50px 0px; animation-duration: 2s; animation-delay: -1.81818s; animation-direction: normal;"><path id="XMLID_21_" class="st0" d="M44.361,90.528c0,1.713,2.036,2.608,3.298,1.451l44.203-40.528 C92.287,51.061,92.5,50.53,92.5,50c0-0.53-0.213-1.061-0.638-1.451L47.659,8.021c-1.262-1.157-3.298-0.262-3.298,1.451v28.18H10.254 c-1.521,0-2.754,1.233-2.754,2.754v19.188c0,1.521,1.233,2.754,2.754,2.754h34.107V90.528z" fill="#fdc600" stroke="rgb(248, 178, 106)" style="fill: rgb(253, 198, 0); stroke: rgb(248, 178, 106);"></path></g><metadata xmlns:d="https://loading.io/stock/" class="ld ld-breath" style="transform-origin: 50px 50px 0px; animation-duration: 2s; animation-delay: -1.63636s; animation-direction: normal;">
<d:name class="ld ld-breath" style="transform-origin: 50px 50px 0px; animation-duration: 2s; animation-delay: -1.45455s; animation-direction: normal;">right</d:name>
<d:tags class="ld ld-breath" style="transform-origin: 50px 50px 0px; animation-duration: 2s; animation-delay: -1.27273s; animation-direction: normal;">east,foward,redo,next,direction,way,turn,right,arrow</d:tags>
<d:license class="ld ld-breath" style="transform-origin: 50px 50px 0px; animation-duration: 2s; animation-delay: -1.09091s; animation-direction: normal;">cc-by</d:license>
<d:slug class="ld ld-breath" style="transform-origin: 50px 50px 0px; animation-duration: 2s; animation-delay: -0.909091s; animation-direction: normal;">8wuk6s</d:slug>
</metadata></g></g></g></g><style type="text/css" class="ld ld-breath" style="transform-origin: 50px 50px 0px; animation-duration: 2s; animation-delay: -0.727273s; animation-direction: normal;">path,ellipse,circle,rect,polygon,polyline,line { stroke-width: 0; }@keyframes ld-breath {
  0% {
    -webkit-transform: scale(0.86);
    transform: scale(0.86);
  }
  50% {
    -webkit-transform: scale(1.06);
    transform: scale(1.06);
  }
  100% {
    -webkit-transform: scale(0.86);
    transform: scale(0.86);
  }
}
@-webkit-keyframes ld-breath {
  0% {
    -webkit-transform: scale(0.86);
    transform: scale(0.86);
  }
  50% {
    -webkit-transform: scale(1.06);
    transform: scale(1.06);
  }
  100% {
    -webkit-transform: scale(0.86);
    transform: scale(0.86);
  }
}
.ld.ld-breath {
  -webkit-animation: ld-breath 1s infinite;
  animation: ld-breath 1s infinite;
}
</style></svg></svg>

<svg class="ldi-1pz4o2" width="30%" height="100%" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 100 100" preserveAspectRatio="xMidYMid"><!--?xml version="1.0" encoding="utf-8"?--><!--Generator: Adobe Illustrator 21.0.0, SVG Export Plug-In . SVG Version: 6.00 Build 0)--><svg version="1.1" id="圖層_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 100 100" style="transform-origin: 50px 50px 0px;" xml:space="preserve"><g style="transform-origin: 50px 50px 0px;"><g style="transform-origin: 50px 50px 0px; transform: scale(0.6);"><g style="transform-origin: 50px 50px 0px;"><g><style type="text/css" class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.3s; animation-direction: normal;">.st0{fill:none;stroke:#F8B26A;stroke-width:4;stroke-miterlimit:10;} .st1{fill:#E15B64;} .st2{fill:#ABBD81;} .st3{fill:#849B87;} .st4{fill:#F5E6C8;} .st5{fill:#C8DC96;} .st6{fill:#CCCCCC;} .st7{fill:#333333;} .st8{fill:#E0E0E0;} .st9{fill:#FFFFFF;stroke:#E15B64;stroke-width:9.375;stroke-miterlimit:10;} .st10{fill:#E0E0E0;stroke:#333333;stroke-width:3;stroke-linecap:round;stroke-miterlimit:10;} .st11{fill:#666666;stroke:#333333;stroke-width:3;stroke-linecap:round;stroke-miterlimit:10;} .st12{fill:none;stroke:#E15B64;stroke-width:8;stroke-miterlimit:10;} .st13{fill:#E0E0E0;stroke:#333333;stroke-width:2.5723;stroke-linecap:round;stroke-miterlimit:10;} .st14{fill:#666666;stroke:#333333;stroke-width:2.5723;stroke-linecap:round;stroke-miterlimit:10;} .st15{fill:#E0E0E0;stroke:#333333;stroke-width:2.935;stroke-linecap:round;stroke-miterlimit:10;} .st16{fill:#666666;stroke:#333333;stroke-width:2.935;stroke-linecap:round;stroke-miterlimit:10;} .st17{fill:#ABBD81;stroke:#333333;stroke-width:3.5653;stroke-linecap:round;stroke-miterlimit:10;} .st18{fill:none;stroke:#333333;stroke-width:4.208;stroke-linecap:round;stroke-miterlimit:10;} .st19{fill:#F47E60;stroke:#333333;stroke-width:3.607;stroke-miterlimit:10;} .st20{fill:#F47E60;stroke:#333333;stroke-width:4.0972;stroke-miterlimit:10;} .st21{fill:#F47E60;stroke:#333333;stroke-width:4.2085;stroke-miterlimit:10;} .st22{fill:#F8B26A;} .st23{fill:#FFFFFF;} .st24{fill:#FFFFFF;stroke:#FFFFFF;stroke-miterlimit:10;} .st25{fill:none;stroke:#FFFFFF;stroke-width:2;stroke-linecap:round;stroke-miterlimit:10;} .st26{fill:#E0E0E0;stroke:#332518;stroke-width:4;stroke-linecap:round;stroke-miterlimit:10;} .st27{fill:#66503A;} .st28{fill:#666666;} .st29{fill:#FFFFFF;stroke:#E0E0E0;stroke-width:5;stroke-linecap:round;stroke-miterlimit:10;} .st30{fill:none;stroke:#666666;stroke-width:4;stroke-miterlimit:10;stroke-dasharray:7.8519,7.8519;} .st31{fill:#F8B26A;stroke:#F47E60;stroke-width:4;stroke-miterlimit:10;} .st32{fill:none;stroke:#C33737;stroke-width:8;stroke-miterlimit:10;} .st33{fill:#A0C8D7;} .st34{fill:#F47E60;} .st35{fill:#C33737;stroke:#E15B64;stroke-width:5;stroke-miterlimit:10;} .st36{fill:#4A3827;} .st37{opacity:0.5;} .st38{fill:none;stroke:#000000;stroke-width:2.2018;stroke-miterlimit:10;} .st39{fill:none;stroke:#000000;stroke-width:2.2018;stroke-miterlimit:10;stroke-dasharray:4.7318,4.7318;} .st40{fill:none;stroke:#333333;stroke-width:7.4066;stroke-miterlimit:10;} .st41{fill:none;stroke:#333333;stroke-width:7.6862;stroke-miterlimit:10;} .st42{fill:#F8B26A;stroke:#333333;stroke-width:4;stroke-miterlimit:10;} .st43{fill:#F5E6C8;stroke:#333333;stroke-width:4;stroke-miterlimit:10;} .st44{fill:none;stroke:#333333;stroke-width:4;stroke-miterlimit:10;} .st45{opacity:0.2;} .st46{fill:none;stroke:#332518;stroke-width:4;stroke-linecap:round;stroke-miterlimit:10;} .st47{fill-rule:evenodd;clip-rule:evenodd;fill:#B5B5B5;} .st48{fill:#FFFFFF;stroke:#FFFFFF;stroke-width:0.6282;stroke-miterlimit:10;} .st49{fill:none;stroke:#FFFFFF;stroke-width:1.2563;stroke-linecap:round;stroke-miterlimit:10;} .st50{opacity:0.6;fill:#F5E169;} .st51{fill:none;} .st52{fill:#F8B26A;stroke:#333333;stroke-width:3.6728;stroke-linejoin:round;stroke-miterlimit:10;} .st53{fill:none;stroke:#E0E0E0;stroke-width:1.5;stroke-miterlimit:10;} .st54{fill:#66503A;stroke:#4A3827;stroke-width:3;stroke-miterlimit:10;} .st55{fill:none;stroke:#4A3827;stroke-width:3;stroke-miterlimit:10;} .st56{fill:none;stroke:#333333;stroke-width:3.1166;stroke-linecap:round;stroke-miterlimit:10;} .st57{fill:#999999;stroke:#333333;stroke-width:3;stroke-miterlimit:10;} .st58{fill:#E0E0E0;stroke:#333333;stroke-width:3.5653;stroke-linecap:round;stroke-miterlimit:10;} .st59{fill:#666666;stroke:#333333;stroke-width:3.5653;stroke-linecap:round;stroke-miterlimit:10;} .st60{fill:none;stroke:#333333;stroke-width:3;stroke-miterlimit:10;} .st61{fill:#E0E0E0;stroke:#333333;stroke-width:3.1759;stroke-linecap:round;stroke-miterlimit:10;} .st62{fill:#666666;stroke:#333333;stroke-width:3.1759;stroke-linecap:round;stroke-miterlimit:10;} .st63{fill:#E0E0E0;stroke:#333333;stroke-width:3.1886;stroke-linecap:round;stroke-miterlimit:10;} .st64{fill:#666666;stroke:#333333;stroke-width:3.1886;stroke-linecap:round;stroke-miterlimit:10;} .st65{fill:#E0E0E0;stroke:#333333;stroke-width:3.1503;stroke-linecap:round;stroke-miterlimit:10;} .st66{fill:#666666;stroke:#333333;stroke-width:3.1503;stroke-linecap:round;stroke-miterlimit:10;} .st67{fill:#FFFFFF;stroke:#333333;stroke-width:4;stroke-miterlimit:10;} .st68{fill:none;stroke:#849B87;stroke-width:4;stroke-linecap:round;stroke-miterlimit:10;} .st69{fill:#FFFFFF;stroke:#333333;stroke-width:3.9519;stroke-miterlimit:10;} .st70{fill:none;stroke:#E15B64;stroke-width:3.9519;stroke-linecap:round;stroke-miterlimit:10;} .st71{fill:#FFFFFF;stroke:#333333;stroke-width:3.9841;stroke-miterlimit:10;} .st72{fill:#C33737;} .st73{fill:none;stroke:#E15B64;stroke-width:9.8945;stroke-miterlimit:10;} .st74{fill:#ABBD81;stroke:#333333;stroke-width:2.9913;stroke-linecap:round;stroke-miterlimit:10;} .st75{fill:#66503A;stroke:#333333;stroke-width:2.9913;stroke-linecap:round;stroke-miterlimit:10;} .st76{fill:#E0E0E0;stroke:#333333;stroke-width:2.8537;stroke-linecap:round;stroke-miterlimit:10;} .st77{fill:#666666;stroke:#333333;stroke-width:2.8537;stroke-linecap:round;stroke-miterlimit:10;} .st78{fill:#E0E0E0;stroke:#333333;stroke-width:3.1909;stroke-linecap:round;stroke-miterlimit:10;} .st79{fill:#666666;stroke:#333333;stroke-width:3.1909;stroke-linecap:round;stroke-miterlimit:10;} .st80{fill:#666666;stroke:#333333;stroke-width:4.9453;stroke-linecap:round;stroke-miterlimit:10;} .st81{fill:#F5E6C8;stroke:#333333;stroke-width:4.0165;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:10;} .st82{fill:#E0E0E0;stroke:#333333;stroke-width:3;stroke-miterlimit:10;} .st83{fill:#666666;stroke:#333333;stroke-width:3;stroke-miterlimit:10;} .st84{fill:#F5E6C8;stroke:#333333;stroke-miterlimit:10;} .st85{fill:#F8B26A;stroke:#333333;stroke-miterlimit:10;} .st86{fill:#77A4BD;} .st87{fill:none;stroke:#333333;stroke-width:2.3991;stroke-miterlimit:10;} .st88{fill:#666666;stroke:#333333;stroke-width:5.1406;stroke-linecap:round;stroke-miterlimit:10;} .st89{fill:#66503A;stroke:#333333;stroke-width:3;stroke-linecap:round;stroke-miterlimit:10;}</style><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.2934s; animation-direction: normal;"><path class="st22" d="M44.322,44.703v0.356c0-0.12,0.012-0.238,0.03-0.356H44.322z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.2868s; animation-direction: normal;"><path class="st22" d="M64.309,44.703c0.018,0.118,0.03,0.236,0.03,0.356v-0.356H64.309z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.2802s; animation-direction: normal;"><path class="st22" d="M54.33,49.873c-4.344,0-8.039-1.331-9.424-3.191c-0.377-0.507-0.584-1.053-0.584-1.623v3.245 c0,2.658,4.481,4.814,10.009,4.814s10.009-2.155,10.009-4.814v-3.245c0,0.569-0.207,1.115-0.584,1.623 C62.37,48.542,58.674,49.873,54.33,49.873z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.2736s; animation-direction: normal;"><path class="st4" d="M64.309,44.703c-0.379-2.492-4.7-4.458-9.978-4.458s-9.599,1.966-9.978,4.458 c-0.018,0.118-0.03,0.236-0.03,0.356c0,0.569,0.207,1.115,0.584,1.623c1.385,1.86,5.081,3.191,9.424,3.191s8.039-1.331,9.424-3.191 c0.377-0.507,0.584-1.053,0.584-1.623C64.339,44.939,64.327,44.821,64.309,44.703z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.26701s; animation-direction: normal;"><path class="st22" d="M44.322,44.703v0.356c0-0.12,0.012-0.238,0.03-0.356H44.322z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.26041s; animation-direction: normal;"><path class="st22" d="M64.309,44.703c0.018,0.118,0.03,0.236,0.03,0.356v-0.356H64.309z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.25381s; animation-direction: normal;"><path class="st22" d="M54.33,49.873c-4.344,0-8.039-1.331-9.424-3.191c-0.377-0.507-0.584-1.053-0.584-1.623v3.245 c0,2.658,4.481,4.814,10.009,4.814s10.009-2.155,10.009-4.814v-3.245c0,0.569-0.207,1.115-0.584,1.623 C62.37,48.542,58.674,49.873,54.33,49.873z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.24721s; animation-direction: normal;"><path class="st4" d="M64.309,44.703c-0.379-2.492-4.7-4.458-9.978-4.458s-9.599,1.966-9.978,4.458 c-0.018,0.118-0.03,0.236-0.03,0.356c0,0.569,0.207,1.115,0.584,1.623c1.385,1.86,5.081,3.191,9.424,3.191s8.039-1.331,9.424-3.191 c0.377-0.507,0.584-1.053,0.584-1.623C64.339,44.939,64.327,44.821,64.309,44.703z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.24061s; animation-direction: normal;"><path class="st22" d="M44.322,39.56v0.356c0-0.12,0.012-0.238,0.03-0.356H44.322z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.23401s; animation-direction: normal;"><path class="st22" d="M64.309,39.56c0.018,0.118,0.03,0.236,0.03,0.356V39.56H64.309z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.22741s; animation-direction: normal;"><path class="st22" d="M54.33,44.729c-4.344,0-8.039-1.331-9.424-3.191c-0.377-0.507-0.584-1.053-0.584-1.623v3.245 c0,2.658,4.481,4.814,10.009,4.814s10.009-2.155,10.009-4.814v-3.245c0,0.569-0.207,1.115-0.584,1.623 C62.37,43.398,58.674,44.729,54.33,44.729z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.22081s; animation-direction: normal;"><path class="st4" d="M64.309,39.56c-0.379-2.492-4.7-4.458-9.978-4.458s-9.599,1.966-9.978,4.458 c-0.018,0.118-0.03,0.236-0.03,0.356c0,0.569,0.207,1.115,0.584,1.623c1.385,1.86,5.081,3.191,9.424,3.191s8.039-1.331,9.424-3.191 c0.377-0.507,0.584-1.053,0.584-1.623C64.339,39.796,64.327,39.677,64.309,39.56z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.21421s; animation-direction: normal;"><path class="st22" d="M30.36,57.62v0.395c0-0.133,0.014-0.265,0.033-0.395H30.36z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.20761s; animation-direction: normal;"><path class="st22" d="M52.566,57.62c0.02,0.131,0.033,0.262,0.033,0.395V57.62H52.566z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.20102s; animation-direction: normal;"><path class="st22" d="M41.48,63.364c-4.826,0-8.932-1.479-10.471-3.545c-0.419-0.563-0.649-1.17-0.649-1.803v3.605 c0,2.954,4.979,5.348,11.12,5.348s11.12-2.394,11.12-5.348v-3.605c0,0.633-0.23,1.239-0.649,1.803 C50.412,61.885,46.306,63.364,41.48,63.364z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.19442s; animation-direction: normal;"><path class="st4" d="M52.566,57.62c-0.421-2.769-5.222-4.953-11.087-4.953s-10.666,2.184-11.087,4.953 c-0.02,0.131-0.033,0.262-0.033,0.395c0,0.633,0.23,1.239,0.649,1.803c1.538,2.067,5.645,3.545,10.471,3.545 s8.932-1.479,10.471-3.545c0.419-0.563,0.649-1.17,0.649-1.803C52.6,57.882,52.586,57.751,52.566,57.62z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.18782s; animation-direction: normal;"><path class="st22" d="M30.36,57.62v0.395c0-0.133,0.014-0.265,0.033-0.395H30.36z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.18122s; animation-direction: normal;"><path class="st22" d="M52.566,57.62c0.02,0.131,0.033,0.262,0.033,0.395V57.62H52.566z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.17462s; animation-direction: normal;"><path class="st22" d="M41.48,63.364c-4.826,0-8.932-1.479-10.471-3.545c-0.419-0.563-0.649-1.17-0.649-1.803v3.605 c0,2.954,4.979,5.348,11.12,5.348s11.12-2.394,11.12-5.348v-3.605c0,0.633-0.23,1.239-0.649,1.803 C50.412,61.885,46.306,63.364,41.48,63.364z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.16802s; animation-direction: normal;"><path class="st4" d="M52.566,57.62c-0.421-2.769-5.222-4.953-11.087-4.953s-10.666,2.184-11.087,4.953 c-0.02,0.131-0.033,0.262-0.033,0.395c0,0.633,0.23,1.239,0.649,1.803c1.538,2.067,5.645,3.545,10.471,3.545 s8.932-1.479,10.471-3.545c0.419-0.563,0.649-1.17,0.649-1.803C52.6,57.882,52.586,57.751,52.566,57.62z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.16142s; animation-direction: normal;"><path class="st22" d="M30.36,51.905v0.395c0-0.133,0.014-0.265,0.033-0.395H30.36z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.15482s; animation-direction: normal;"><path class="st22" d="M52.566,51.905c0.02,0.131,0.033,0.262,0.033,0.395v-0.395H52.566z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.14822s; animation-direction: normal;"><path class="st22" d="M41.48,57.649c-4.826,0-8.932-1.479-10.471-3.545c-0.419-0.563-0.649-1.17-0.649-1.803v3.605 c0,2.954,4.979,5.348,11.12,5.348S52.6,58.86,52.6,55.906v-3.605c0,0.633-0.23,1.239-0.649,1.803 C50.412,56.17,46.306,57.649,41.48,57.649z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.14162s; animation-direction: normal;"><path class="st4" d="M52.566,51.905c-0.421-2.769-5.222-4.953-11.087-4.953s-10.666,2.184-11.087,4.953 c-0.02,0.131-0.033,0.262-0.033,0.395c0,0.633,0.23,1.239,0.649,1.803c1.538,2.067,5.645,3.545,10.471,3.545 s8.932-1.479,10.471-3.545c0.419-0.563,0.649-1.17,0.649-1.803C52.6,52.168,52.586,52.036,52.566,51.905z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.13503s; animation-direction: normal;"><path class="st22" d="M30.36,46.191v0.395c0-0.133,0.014-0.265,0.033-0.395H30.36z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.12843s; animation-direction: normal;"><path class="st22" d="M52.566,46.191c0.02,0.131,0.033,0.262,0.033,0.395v-0.395H52.566z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.12183s; animation-direction: normal;"><path class="st22" d="M41.48,51.934c-4.826,0-8.932-1.479-10.471-3.545c-0.419-0.563-0.649-1.17-0.649-1.803v3.605 c0,2.954,4.979,5.348,11.12,5.348s11.12-2.394,11.12-5.348v-3.605c0,0.633-0.23,1.239-0.649,1.803 C50.412,50.455,46.306,51.934,41.48,51.934z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.11523s; animation-direction: normal;"><path class="st4" d="M52.566,46.191c-0.421-2.769-5.222-4.953-11.087-4.953s-10.666,2.184-11.087,4.953 c-0.02,0.131-0.033,0.262-0.033,0.395c0,0.633,0.23,1.239,0.649,1.803c1.538,2.067,5.645,3.545,10.471,3.545 s8.932-1.479,10.471-3.545c0.419-0.563,0.649-1.17,0.649-1.803C52.6,46.453,52.586,46.321,52.566,46.191z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.10863s; animation-direction: normal;"><path class="st22" d="M30.36,40.476v0.395c0-0.133,0.014-0.265,0.033-0.395H30.36z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.10203s; animation-direction: normal;"><path class="st22" d="M52.566,40.476c0.02,0.131,0.033,0.262,0.033,0.395v-0.395H52.566z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.09543s; animation-direction: normal;"><path class="st22" d="M41.48,46.219c-4.826,0-8.932-1.479-10.471-3.545c-0.419-0.563-0.649-1.17-0.649-1.803v3.605 c0,2.954,4.979,5.348,11.12,5.348S52.6,47.43,52.6,44.476v-3.605c0,0.633-0.23,1.239-0.649,1.803 C50.412,44.74,46.306,46.219,41.48,46.219z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.08883s; animation-direction: normal;"><path class="st4" d="M52.566,40.476c-0.421-2.769-5.222-4.953-11.087-4.953s-10.666,2.184-11.087,4.953 c-0.02,0.131-0.033,0.262-0.033,0.395c0,0.633,0.23,1.239,0.649,1.803c1.538,2.067,5.645,3.545,10.471,3.545 s8.932-1.479,10.471-3.545c0.419-0.563,0.649-1.17,0.649-1.803C52.6,40.738,52.586,40.606,52.566,40.476z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.08223s; animation-direction: normal;"><path class="st22" d="M30.36,34.761v0.395c0-0.133,0.014-0.265,0.033-0.395H30.36z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.07563s; animation-direction: normal;"><path class="st22" d="M52.566,34.761c0.02,0.131,0.033,0.262,0.033,0.395v-0.395H52.566z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.06904s; animation-direction: normal;"><path class="st22" d="M41.48,40.504c-4.826,0-8.932-1.479-10.471-3.545c-0.419-0.563-0.649-1.17-0.649-1.803v3.605 c0,2.954,4.979,5.348,11.12,5.348s11.12-2.394,11.12-5.348v-3.605c0,0.633-0.23,1.239-0.649,1.803 C50.412,39.025,46.306,40.504,41.48,40.504z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.06244s; animation-direction: normal;"><path class="st4" d="M52.566,34.761c-0.421-2.769-5.222-4.953-11.087-4.953s-10.666,2.184-11.087,4.953 c-0.02,0.131-0.033,0.262-0.033,0.395c0,0.633,0.23,1.239,0.649,1.803c1.538,2.067,5.645,3.545,10.471,3.545 s8.932-1.479,10.471-3.545c0.419-0.563,0.649-1.17,0.649-1.803C52.6,35.023,52.586,34.892,52.566,34.761z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.05584s; animation-direction: normal;"><path class="st22" d="M30.36,29.046v0.395c0-0.133,0.014-0.265,0.033-0.395H30.36z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.04924s; animation-direction: normal;"><path class="st22" d="M52.566,29.046c0.02,0.131,0.033,0.262,0.033,0.395v-0.395H52.566z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.04264s; animation-direction: normal;"><path class="st22" d="M41.48,34.79c-4.826,0-8.932-1.479-10.471-3.545c-0.419-0.563-0.649-1.17-0.649-1.803v3.605 c0,2.954,4.979,5.348,11.12,5.348S52.6,36,52.6,33.047v-3.605c0,0.633-0.23,1.239-0.649,1.803 C50.412,33.311,46.306,34.79,41.48,34.79z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.03604s; animation-direction: normal;"><path class="st4" d="M52.566,29.046c-0.421-2.769-5.222-4.953-11.087-4.953s-10.666,2.184-11.087,4.953 c-0.02,0.131-0.033,0.262-0.033,0.395c0,0.633,0.23,1.239,0.649,1.803c1.538,2.067,5.645,3.545,10.471,3.545 s8.932-1.479,10.471-3.545c0.419-0.563,0.649-1.17,0.649-1.803C52.6,29.308,52.586,29.177,52.566,29.046z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.02944s; animation-direction: normal;"><path class="st22" d="M7.5,57.62v0.395c0-0.133,0.014-0.265,0.033-0.395H7.5z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.02284s; animation-direction: normal;"><path class="st22" d="M29.707,57.62c0.02,0.131,0.033,0.262,0.033,0.395V57.62H29.707z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.01624s; animation-direction: normal;"><path class="st22" d="M18.62,63.364c-4.826,0-8.932-1.479-10.471-3.545C7.73,59.255,7.5,58.648,7.5,58.015v3.605 c0,2.954,4.979,5.348,11.12,5.348s11.12-2.394,11.12-5.348v-3.605c0,0.633-0.23,1.239-0.649,1.803 C27.553,61.885,23.446,63.364,18.62,63.364z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.00964s; animation-direction: normal;"><path class="st4" d="M29.707,57.62c-0.421-2.769-5.222-4.953-11.087-4.953S7.955,54.851,7.534,57.62 C7.514,57.751,7.5,57.882,7.5,58.015c0,0.633,0.23,1.239,0.649,1.803c1.538,2.067,5.645,3.545,10.471,3.545 s8.932-1.479,10.471-3.545c0.419-0.563,0.649-1.17,0.649-1.803C29.74,57.882,29.727,57.751,29.707,57.62z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -1.00305s; animation-direction: normal;"><path class="st4" d="M29.707,57.62c-0.421-2.769-5.222-4.953-11.087-4.953S7.955,54.851,7.534,57.62 C7.514,57.751,7.5,57.882,7.5,58.015c0,0.633,0.23,1.239,0.649,1.803c1.538,2.067,5.645,3.545,10.471,3.545 s8.932-1.479,10.471-3.545c0.419-0.563,0.649-1.17,0.649-1.803C29.74,57.882,29.727,57.751,29.707,57.62z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.996447s; animation-direction: normal;"><path class="st22" d="M7.5,51.905v0.395c0-0.133,0.014-0.265,0.033-0.395H7.5z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.989848s; animation-direction: normal;"><path class="st22" d="M29.707,51.905c0.02,0.131,0.033,0.262,0.033,0.395v-0.395H29.707z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.983249s; animation-direction: normal;"><path class="st22" d="M18.62,57.649c-4.826,0-8.932-1.479-10.471-3.545C7.73,53.54,7.5,52.933,7.5,52.301v3.605 c0,2.954,4.979,5.348,11.12,5.348s11.12-2.394,11.12-5.348v-3.605c0,0.633-0.23,1.239-0.649,1.803 C27.553,56.17,23.446,57.649,18.62,57.649z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.97665s; animation-direction: normal;"><path class="st4" d="M29.707,51.905c-0.421-2.769-5.222-4.953-11.087-4.953S7.955,49.136,7.534,51.905 C7.514,52.036,7.5,52.168,7.5,52.301c0,0.633,0.23,1.239,0.649,1.803c1.538,2.067,5.645,3.545,10.471,3.545 s8.932-1.479,10.471-3.545c0.419-0.563,0.649-1.17,0.649-1.803C29.74,52.168,29.727,52.036,29.707,51.905z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.970051s; animation-direction: normal;"><path class="st22" d="M7.5,46.191v0.395c0-0.133,0.014-0.265,0.033-0.395H7.5z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.963452s; animation-direction: normal;"><path class="st22" d="M29.707,46.191c0.02,0.131,0.033,0.262,0.033,0.395v-0.395H29.707z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.956853s; animation-direction: normal;"><path class="st22" d="M18.62,51.934c-4.826,0-8.932-1.479-10.471-3.545C7.73,47.825,7.5,47.219,7.5,46.586v3.605 c0,2.954,4.979,5.348,11.12,5.348s11.12-2.394,11.12-5.348v-3.605c0,0.633-0.23,1.239-0.649,1.803 C27.553,50.455,23.446,51.934,18.62,51.934z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.950254s; animation-direction: normal;"><path class="st4" d="M29.707,46.191c-0.421-2.769-5.222-4.953-11.087-4.953S7.955,43.422,7.534,46.191 C7.514,46.321,7.5,46.453,7.5,46.586c0,0.633,0.23,1.239,0.649,1.803c1.538,2.067,5.645,3.545,10.471,3.545 s8.932-1.479,10.471-3.545c0.419-0.563,0.649-1.17,0.649-1.803C29.74,46.453,29.727,46.321,29.707,46.191z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.943655s; animation-direction: normal;"><path class="st22" d="M7.5,40.476v0.395c0-0.133,0.014-0.265,0.033-0.395H7.5z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.937056s; animation-direction: normal;"><path class="st22" d="M29.707,40.476c0.02,0.131,0.033,0.262,0.033,0.395v-0.395H29.707z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.930457s; animation-direction: normal;"><path class="st22" d="M18.62,46.219c-4.826,0-8.932-1.479-10.471-3.545C7.73,42.11,7.5,41.504,7.5,40.871v3.605 c0,2.954,4.979,5.348,11.12,5.348s11.12-2.394,11.12-5.348v-3.605c0,0.633-0.23,1.239-0.649,1.803 C27.553,44.74,23.446,46.219,18.62,46.219z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.923858s; animation-direction: normal;"><path class="st4" d="M29.707,40.476c-0.421-2.769-5.222-4.953-11.087-4.953S7.955,37.707,7.534,40.476 C7.514,40.606,7.5,40.738,7.5,40.871c0,0.633,0.23,1.239,0.649,1.803c1.538,2.067,5.645,3.545,10.471,3.545 s8.932-1.479,10.471-3.545c0.419-0.563,0.649-1.17,0.649-1.803C29.74,40.738,29.727,40.606,29.707,40.476z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.917259s; animation-direction: normal;"><path class="st22" d="M53.219,57.62v0.395c0-0.133,0.014-0.265,0.033-0.395H53.219z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.91066s; animation-direction: normal;"><path class="st22" d="M75.426,57.62c0.02,0.131,0.033,0.262,0.033,0.395V57.62H75.426z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.904061s; animation-direction: normal;"><path class="st22" d="M64.339,63.364c-4.826,0-8.932-1.479-10.471-3.545c-0.419-0.563-0.649-1.17-0.649-1.803v3.605 c0,2.954,4.979,5.348,11.12,5.348s11.12-2.394,11.12-5.348v-3.605c0,0.633-0.23,1.239-0.649,1.803 C73.271,61.885,69.165,63.364,64.339,63.364z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.897462s; animation-direction: normal;"><path class="st4" d="M75.426,57.62c-0.421-2.769-5.222-4.953-11.087-4.953s-10.666,2.184-11.087,4.953 c-0.02,0.131-0.033,0.262-0.033,0.395c0,0.633,0.23,1.239,0.649,1.803c1.538,2.067,5.645,3.545,10.471,3.545 s8.932-1.479,10.471-3.545c0.419-0.563,0.649-1.17,0.649-1.803C75.459,57.882,75.445,57.751,75.426,57.62z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.890863s; animation-direction: normal;"><path class="st22" d="M53.219,57.62v0.395c0-0.133,0.014-0.265,0.033-0.395H53.219z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.884264s; animation-direction: normal;"><path class="st22" d="M75.426,57.62c0.02,0.131,0.033,0.262,0.033,0.395V57.62H75.426z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.877665s; animation-direction: normal;"><path class="st22" d="M64.339,63.364c-4.826,0-8.932-1.479-10.471-3.545c-0.419-0.563-0.649-1.17-0.649-1.803v3.605 c0,2.954,4.979,5.348,11.12,5.348s11.12-2.394,11.12-5.348v-3.605c0,0.633-0.23,1.239-0.649,1.803 C73.271,61.885,69.165,63.364,64.339,63.364z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.871066s; animation-direction: normal;"><path class="st4" d="M75.426,57.62c-0.421-2.769-5.222-4.953-11.087-4.953s-10.666,2.184-11.087,4.953 c-0.02,0.131-0.033,0.262-0.033,0.395c0,0.633,0.23,1.239,0.649,1.803c1.538,2.067,5.645,3.545,10.471,3.545 s8.932-1.479,10.471-3.545c0.419-0.563,0.649-1.17,0.649-1.803C75.459,57.882,75.445,57.751,75.426,57.62z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.864467s; animation-direction: normal;"><path class="st22" d="M53.219,51.905v0.395c0-0.133,0.014-0.265,0.033-0.395H53.219z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.857868s; animation-direction: normal;"><path class="st22" d="M75.426,51.905c0.02,0.131,0.033,0.262,0.033,0.395v-0.395H75.426z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.851269s; animation-direction: normal;"><path class="st22" d="M64.339,57.649c-4.826,0-8.932-1.479-10.471-3.545c-0.419-0.563-0.649-1.17-0.649-1.803v3.605 c0,2.954,4.979,5.348,11.12,5.348s11.12-2.394,11.12-5.348v-3.605c0,0.633-0.23,1.239-0.649,1.803 C73.271,56.17,69.165,57.649,64.339,57.649z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.84467s; animation-direction: normal;"><path class="st4" d="M75.426,51.905c-0.421-2.769-5.222-4.953-11.087-4.953s-10.666,2.184-11.087,4.953 c-0.02,0.131-0.033,0.262-0.033,0.395c0,0.633,0.23,1.239,0.649,1.803c1.538,2.067,5.645,3.545,10.471,3.545 s8.932-1.479,10.471-3.545c0.419-0.563,0.649-1.17,0.649-1.803C75.459,52.168,75.445,52.036,75.426,51.905z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.838071s; animation-direction: normal;"><path class="st22" d="M72.468,50.912l-0.175,0.354c0.059-0.119,0.13-0.231,0.205-0.339L72.468,50.912z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.831472s; animation-direction: normal;"><path class="st22" d="M92.367,60.769c-0.04,0.126-0.086,0.25-0.145,0.369l0.175-0.354L92.367,60.769z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.824873s; animation-direction: normal;"><path class="st22" d="M79.883,60.994c-4.324-2.142-7.348-5.29-7.809-7.825c-0.126-0.691-0.062-1.337,0.218-1.904l-1.6,3.231 c-1.311,2.647,2.087,7.002,7.59,9.729c5.503,2.726,11.027,2.791,12.338,0.144l1.6-3.231c-0.281,0.567-0.756,1.008-1.382,1.327 C88.544,63.634,84.208,63.137,79.883,60.994z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.818274s; animation-direction: normal;"><path class="st4" d="M92.367,60.769c0.852-2.668-2.481-6.756-7.736-9.36c-5.255-2.603-10.527-2.777-12.133-0.483 c-0.076,0.108-0.146,0.22-0.205,0.339c-0.281,0.567-0.344,1.213-0.218,1.904c0.461,2.535,3.484,5.683,7.809,7.825 c4.324,2.142,8.661,2.64,10.956,1.471c0.626-0.319,1.101-0.76,1.382-1.327C92.281,61.019,92.327,60.895,92.367,60.769z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.811675s; animation-direction: normal;"><path class="st22" d="M18.62,69.05v0.395c0-0.133,0.014-0.265,0.033-0.395H18.62z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.805076s; animation-direction: normal;"><path class="st22" d="M40.827,69.05c0.02,0.131,0.033,0.262,0.033,0.395V69.05H40.827z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.798477s; animation-direction: normal;"><path class="st22" d="M29.741,74.793c-4.826,0-8.932-1.479-10.471-3.545c-0.419-0.563-0.649-1.17-0.649-1.803v3.605 c0,2.954,4.979,5.348,11.12,5.348s11.12-2.394,11.12-5.348v-3.605c0,0.633-0.23,1.239-0.649,1.803 C38.673,73.314,34.566,74.793,29.741,74.793z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.791878s; animation-direction: normal;"><path class="st4" d="M40.827,69.05c-0.421-2.769-5.222-4.953-11.087-4.953s-10.666,2.184-11.087,4.953 c-0.02,0.131-0.033,0.262-0.033,0.395c0,0.633,0.23,1.239,0.649,1.803c1.538,2.067,5.645,3.545,10.471,3.545 s8.932-1.479,10.471-3.545c0.419-0.563,0.649-1.17,0.649-1.803C40.861,69.312,40.847,69.181,40.827,69.05z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.785279s; animation-direction: normal;"><path class="st22" d="M15.371,37.745l0.276,0.283c-0.093-0.095-0.175-0.199-0.252-0.306L15.371,37.745z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.77868s; animation-direction: normal;"><path class="st22" d="M31.263,22.233c0.105,0.08,0.207,0.164,0.3,0.26l-0.276-0.283L31.263,22.233z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.772081s; animation-direction: normal;"><path class="st22" d="M27.341,34.087c-3.454,3.371-7.425,5.181-9.97,4.777c-0.694-0.11-1.282-0.384-1.724-0.836l2.518,2.58 c2.063,2.114,7.298,0.35,11.693-3.94s6.285-9.481,4.222-11.595l-2.518-2.58c0.442,0.453,0.701,1.048,0.795,1.744 C32.7,26.79,30.794,30.716,27.341,34.087z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.765482s; animation-direction: normal;"><path class="st4" d="M31.263,22.233c-2.235-1.687-7.196,0.103-11.393,4.2s-6.107,9.013-4.474,11.288 c0.077,0.107,0.159,0.211,0.252,0.306c0.442,0.453,1.03,0.726,1.724,0.836c2.544,0.404,6.516-1.406,9.97-4.777 s5.359-7.298,5.017-9.851c-0.093-0.696-0.353-1.291-0.795-1.744C31.47,22.397,31.368,22.313,31.263,22.233z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.758883s; animation-direction: normal;"><path class="st22" d="M38.382,62.539l-0.175,0.354c0.059-0.119,0.13-0.231,0.205-0.339L38.382,62.539z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.752284s; animation-direction: normal;"><path class="st22" d="M58.281,72.396c-0.04,0.126-0.086,0.25-0.145,0.369l0.175-0.354L58.281,72.396z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g><g style="transform-origin: 50px 50px 0px;"><g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.745685s; animation-direction: normal;"><path class="st22" d="M45.797,72.622c-4.324-2.142-7.348-5.29-7.809-7.825c-0.126-0.691-0.062-1.337,0.218-1.904l-1.6,3.231 c-1.311,2.647,2.087,7.002,7.59,9.729c5.503,2.726,11.027,2.791,12.338,0.144l1.6-3.231c-0.281,0.567-0.756,1.008-1.382,1.327 C54.458,75.262,50.121,74.764,45.797,72.622z" fill="#fdc600" style="fill: rgb(253, 198, 0);"></path></g></g></g></g></g><g class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.739086s; animation-direction: normal;"><path class="st4" d="M58.281,72.396c0.852-2.668-2.481-6.756-7.736-9.36s-10.527-2.777-12.133-0.483 c-0.076,0.108-0.146,0.22-0.205,0.339c-0.281,0.567-0.344,1.213-0.218,1.904c0.461,2.535,3.484,5.683,7.809,7.825 c4.324,2.142,8.661,2.64,10.956,1.471c0.626-0.319,1.101-0.76,1.382-1.327C58.195,72.646,58.241,72.522,58.281,72.396z" fill="rgb(245, 230, 200)" style="fill: rgb(245, 230, 200);"></path></g></g></g><metadata xmlns:d="https://loading.io/stock/" class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.732487s; animation-direction: normal;">
<d:name class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.725888s; animation-direction: normal;">coin</d:name>
<d:tags class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.719289s; animation-direction: normal;">coin,buck,quarter,cent,penny,money,dollar</d:tags>
<d:license class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.71269s; animation-direction: normal;">cc-by</d:license>
<d:slug class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.706091s; animation-direction: normal;">1pz4o2</d:slug>
</metadata></g></g></g></g><style type="text/css" class="ld ld-bounce-px" style="transform-origin: 50px 50px 0px; animation-duration: 1.3s; animation-delay: -0.699492s; animation-direction: normal;">path,ellipse,circle,rect,polygon,polyline,line { stroke-width: 0; }@keyframes ld-bounce-px {
  0%, 90% {
    animation-timing-function: linear;
  }
  10% {
    animation-timing-function: cubic-bezier(0, 0.4, 0.6, 1);
  }
  50% {
    animation-timing-function: cubic-bezier(0.4, 0, 1, 0.6);
  }
  0% {
    -webkit-transform: translate(0, 30px) scaleY(0.5);
    transform: translate(0, 30px) scaleY(0.5);
  }
  10% {
    -webkit-transform: translate(0, 5px) scaleY(1.1);
    transform: translate(0, 5px) scaleY(1.1);
  }
  50% {
    -webkit-transform: translate(0, -37px) scaleY(1.1);
    transform: translate(0, -37px) scaleY(1.1);
  }
  90% {
    -webkit-transform: translate(0, 5px) scaleY(1.1);
    transform: translate(0, 5px) scaleY(1.1);
  }
  100% {
    -webkit-transform: translate(0, 30px) scaleY(0.5);
    transform: translate(0, 30px) scaleY(0.5);
  }
}
@-webkit-keyframes ld-bounce-px {
  0%, 90% {
    animation-timing-function: linear;
  }
  10% {
    animation-timing-function: cubic-bezier(0, 0.4, 0.6, 1);
  }
  50% {
    animation-timing-function: cubic-bezier(0.4, 0, 1, 0.6);
  }
  0% {
    -webkit-transform: translate(0, 30px) scaleY(0.5);
    transform: translate(0, 30px) scaleY(0.5);
  }
  10% {
    -webkit-transform: translate(0, 5px) scaleY(1.1);
    transform: translate(0, 5px) scaleY(1.1);
  }
  50% {
    -webkit-transform: translate(0, -37px) scaleY(1.1);
    transform: translate(0, -37px) scaleY(1.1);
  }
  90% {
    -webkit-transform: translate(0, 5px) scaleY(1.1);
    transform: translate(0, 5px) scaleY(1.1);
  }
  100% {
    -webkit-transform: translate(0, 30px) scaleY(0.5);
    transform: translate(0, 30px) scaleY(0.5);
  }
}
.ld.ld-bounce-px {
  -webkit-animation: ld-bounce-px 1s infinite;
  animation: ld-bounce-px 1s infinite;
}
</style></svg></svg>
<br>
			                           		 <!-- <img alt="" src="https://cdn.dribbble.com/users/718428/screenshots/3701840/coin_2.gif">
			                           		 <img alt="" src="https://thumbs.gfycat.com/IdleVillainousGrasshopper-size_restricted.gif">
			                           		 <img alt="" src="https://thumbs.gfycat.com/MasculineDemandingBellsnake-size_restricted.gif">
			                           		  -->
			                           		  <div style="padding-left: 25px;padding-right: 25px;font-size: large;">
			                           		  <span>
												If you agree to use computing power to find a coupon,
											</span>
											<br>
											<span>
			                           			Your computer will start 
			                           			<span style="font-weight: 500; color: #fdc600; text-shadow: 1px 1px #ccc;" >"Mining"</span>
			                           		</span>
			                           		<br>
			                           		<span>
			                           			which means computers try to solve complex mathematical riddles 
			                           		</span>
			                           		<span>
			                           			to find a number that matches with Promo code.
			                           		</span>
			                           		<br>
			                           		<span>
			                           			If it matches, You will win a <span style="font-weight: 500; color: #fdc600;text-shadow: 1px 1px #ccc;">Promotion coupon(5%, 10%, 15%) </span> for this Project!
			                           		 </span>
			                           		 </div>
                                 		</div>
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


		<!-- 쿠폰 당첨 모달창  -->
		<div class="modal fade" id="winCoupon" tabindex="-1" role="dialog"
		aria-labelledby="modalUpdatePro" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered" role="document" style="width: 760px;">
			<div class="modal-content">
				<div class="modal-header bg-primary" style="background: #fdc600;">
					<button type="button" id="closeUploadModal" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h6 class="modal-title">
						Congratulations!
					</h6>
					
				</div>
				<div class="modal-body text-center">
					<div class="col-md-8 single-property-content prp-style-1 " style="max-width: 100%;width: 100%;text-align: left;">
                        <div class="row">
                            <div class="light-slide-item">            
                                 <div class="couponArea" id="previewVideoUrl" style="left: 100px;">
                                 	
									<!-- 유투브 동영상 넣기 test -->
									<!-- <p class="youtube"><iframe style=" margin-bottom: 50px;" frameborder="0" allowfullscreen="1" width="720px" height="405px" src="https://www.youtube.com/embed/ZRlmJxh1frs" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe><p> -->
									<!-- <iframe id="player" class="content-media content-media--video" style="width: 720px; height: 405px; margin-bottom: 50px;" frameborder="0" allowfullscreen="1" allow="autoplay; encrypted-media" title="YouTube video player" width="640" height="360" src="https://www.youtube.com/embed/ZRlmJxh1frs?enablejsapi=1&amp;origin=http%3A%2F%2Flocalhost%3A8081&amp;widgetid=1"></iframe> -->
                                </div>
                            </div>
                            <div style="position: absolute; top: 50px; left: 358px;">
                            	<p style="font-size: 40px; font-weight: 600; color: #fdc600; text-shadow: 2px 2px #ccc; padding-bottom: 5px;">Congratulations!</p>
								<p style="font-size: 20px;PADDING-BOTTOM: 0PX;TEXT-ALIGN: center;">
								Now you can use this coupon
								</p>
								<p style="font-size: 20px;TEXT-ALIGN: center;">
								to get discount for this project!
								</p>
								<input id="myCoupon" type="button" value="My Coupon" style="color: white; font-weight: 500; text-shadow: 1px 1px #ccc; height: 40px; margin-top: 50px;">
								<input id="buyNow" type="button" value="Buy Now" style="color: white; font-weight: 500; text-shadow: 1px 1px #ccc; height: 40px; margin-top: 10px;">
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




<!-- <div align="center" style="z-index: 1; width: 100%;">    
<iframe width="300" height="300" style="z-index: 2; position: fixed; margin: 0 auto;" src="https://lottiefiles.com/iframe/221-infinite-rainbow" frameborder="0"></iframe></div>  -->
<div id="bm" style="margin-left: auto; margin-right: auto; width: 200px; height: 200px; z-index: 3; position: fixed;"></div>
  <!-- Scripts -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bodymovin/4.13.0/bodymovin.js"></script>
    
        
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
        
        <!-- 코인 -->	
		<div class="coin">
  		<div class="front"></div>
  		<div class="front_b"></div>
 		<div class="back"></div>
  		<div class="back_b"></div>
		</div>
		<!-- 코인 -->
        
        
        <div class="content-area single-property" style="background-color: #FCFCFC;">&nbsp;
            <div class="container">   

                <div class="clearfix padding-top-40" >

                    <div class="col-md-8 single-property-content prp-style-1 ">
                        <div class="row">
                            <div class="light-slide-item">            
                                 <div class="clearfix" style="text-align: -webkit-center;">
                                 
									<!-- 유투브 동영상 넣기 test -->
									
									<div id="player" style="width: 720px; height: 405px; margin-bottom: 50px;"></div>
									<%-- <p class="youtube"><iframe style=" margin-bottom: 50px;" frameborder="0" allowfullscreen="1" width="720px" height="405px" src="https://www.youtube.com/embed/${project.project_video}" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe><p> --%>

<!-- <!-- 							<video controls="controls" width="720px" height="405px">
									<source src="https://player.vimeo.com/video/279646276" type="video/mp4" style="margin-bottom: 50px;">
                                	</video>
                                	<iframe src="https://player.vimeo.com/video/279646276" width="640" height="360" frameborder="0" allowfullscreen></iframe> -->
                                </div>
                            </div>
                        </div>

                        <div class="single-property-wrapper">
                            <div class="single-property-header" style="padding-bottom: 0px;">                                          
                                <h1 class="property-title pull-left">${project.project_title}</h1>
                            </div>
							
							<div class="single-property-header" style="font-weight: 600;">
							    <span class="property-price pull-right" id="goalprice">${project.project_goalfundprice}</span>
                                <span class="property-price pull-right">Goal&nbsp;$</span>
							</div>
							
							<div class="progress-card">
								<div class="d-flex justify-content-between mb-1">
									<div class="progress mb-2" style="height: 15px;">
										<div class="progress-bar bg-success" role="progressbar"
											style="width: ${(project.project_nowfundprice/project.project_goalfundprice)*100}%" aria-valuenow="${(project.project_nowfundprice/project.project_goalfundprice)*100}" aria-valuemin="0"
											aria-valuemax="100" data-toggle="tooltip" data-placement="top"
											title="${project.project_nowfundprice}" data-original-title="${project.project_nowfundprice}%"></div>
									</div>
								</div>
							</div>
										
							<!-- 펀딩 날짜 카운트다운 -->			
							<div style="text-align: right;">
								<p id="demo" style="font-size: 24px; color: #333; text-shadow: #ccc 1px 1px; padding-bottom: 0px; margin-bottom: 0px;"></p>
								<p id="countDown">DAYS &nbsp;&nbsp; HRS &nbsp;&nbsp;&nbsp; MINS &nbsp;&nbsp;&nbsp; SECS</p>
							</div>
										
										<div class="single-property-header pull-right" style="text-align: -webkit-right; display: flex;">
											<c:if test="${sessionScope.userid !='admin' && sessionScope.mCategory !='company'}">
											<div class='like-wrapper'>
											  <a class='like-button' style="margin: 0 auto !important; width: 110px !important; height: 48px; padding: 0 auto !important;">
											    <span class='like-icon'>
											      <div class='heart-animation-1'></div>
											      <div class='heart-animation-2'></div>
											    </span>
											    Favorite
											  </a>
											</div>
											</c:if>
                                            <div class="col-md-8 col-sm-8 col-xs-8 blg-entry" style="height: 48px; padding-right: 0px;">
												<c:if test="${sessionScope.userid !='admin' && sessionScope.mCategory != 'company'}">
                                    				<button id="purchase" class="btn-primary">Purchase</button>
                    								<div class="qty mt-5" style="width: 104px; margin-left: 0px !important;">
								                        <span class="minus bg-dark">-</span>
								                        <input id="sale_amount" type="number" class="count" name="qty" value="1">
								                        <span class="plus bg-dark">+</span>
								                    </div>
                                    			</c:if>
                                    			<c:if test="${sessionScope.userid=='admin'}">
                                               		<button class="btn-primary" value="${project.project_num}" id = "updateChecked">approval</button>
                                               	</c:if>
                                            </div>											
										</div>
										
										
                            <!-- End description area  -->
							<div style="height: 10px; width: 100%;"></div>
							<div id="contentDiv" class="section" style="word-break: break-all; margin-top: 100px;">
								<h4 class="s-property-title">Project content</h4>
								${project.project_content}
							</div>

                            <!-- End video area  -->
                              <section id="comments" class="comments wow fadeInRight animated animated" style="visibility: visible; animation-name: fadeInRight;"> 
                            <h4 class="text-uppercase wow fadeInLeft animated animated" style="visibility: visible; animation-name: fadeInLeft;" id="commentsCount"></h4>
							<div id="replyArea"></div>

                            
                            <!-- /.comment -->


                            <!-- <div class="row comment last">

                                <div class="col-sm-3 col-md-2 text-center-xs">
                                    <p>
                                        <img src="assets/img/client-face2.png" class="img-responsive img-circle" alt="">
                                    </p>
                                </div>

                                <div class="col-sm-9 col-md-10">
                                    <h5 class="text-uppercase">Louise Armero</h5>
                                    <p class="posted"><i class="fa fa-clock-o"></i> September 23, 2012 at 12:00 am</p>
                                    <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper.
                                        Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
                                    <p class="reply"><a href="#"><i class="fa fa-reply"></i> Reply</a>
                                    </p>
                                </div>

                            </div> -->
                            <!-- /.comment -->
                        </section>
                        <section id="comment-form" class="add-comments">
                            <h4 class="text-uppercase wow fadeInLeft animated animated" style="visibility: visible; animation-name: fadeInLeft;">Leave comment</h4>
                            <form>
                                <div class="row wow fadeInLeft animated animated" style="visibility: visible; animation-name: fadeInLeft;">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label for="comment">Comment <span class="required">*</span>
                                            </label>
                                            <textarea class="form-control" id="commentAdd" rows="4"></textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="row wow fadeInLeft animated animated" style="visibility: visible; animation-name: fadeInLeft;">
                                    <div class="col-sm-12 text-right">
                                        <input type="button" id="addReply" class="btn btn-primary" value="Post Comment" style="width: 20%;"> 
                                    </div>
                                </div>
                            </form>
                        </section>
                        </div>
                    </div>
                  


                    <div class="col-md-4 p0" style="color: #555;">
                        <aside class="sidebar sidebar-property blog-asside-right" id="move">
                            <div class="dealer-widget">
                                <div class="dealer-content">
                                    <div class="inner-wrapper">

                                        <div class="clear">
                                            <div class="col-xs-4 col-sm-4 dealer-face">
                                                <a href="">
                                                    <img src="showCompanyImg?co_id=${company.co_id}" class="img-circle" style="width: 93px;height: 99px;margin-top: 5px;"/>
                                                </a>
                                            </div>
                                            <div class="col-xs-8 col-sm-8 " style="top: 20px; padding-left: unset;">
                                                <h3 class="dealer-name" style="overflow: ">
                                                    <a href="">${company.co_ceo_firstname}&nbsp${company.co_ceo_lastname}</a>
                                                </h3>
                                                <h6 style="text-transform: unset;">${company.co_website}</h6>
                                            </div>
                                        </div>

                                        <div class="clear">
                                            <ul class="dealer-contacts" style="font-size: 18px; padding-top: 20px;">                                       
                                                <li style="text-transform: uppercase;"><i class="pe-7s-map-marker strong"> </i>${company.co_country}</li>
                                                <li><i class="pe-7s-mail strong"> </i>${company.co_email}</li>
                                                <li><i class="pe-7s-call strong"> </i>${company.co_phone}</li>
                                            </ul>
                                        </div>

                                    </div>
                                </div>
                            </div>

							<div class="panel panel-default sidebar-menu similar-property-wdg wow fadeInRight animated animated" style="visibility: visible; animation-name: fadeInRight;">
                                <div class="panel-heading" style="text-transform: unset;">
                                	<h3 class="panel-title" style="margin-bottom: 10px;">Reward Title</h3>
                                	<div class="s-property-content">
                                    	<p>${project.reward_title}</p>
                                	</div>
                                    <h3 class="panel-title" style="margin-bottom: 10px;">Reward Price</h3>
                                	<div class="s-property-content">
                                    	<p><span>$</span>${project.reward_price}</p>
                                	</div>
                                    <h3 class="panel-title" style="margin-bottom: 10px;">Reward Description</h3>
                                	<div class="s-property-content">
                                    	<p style="font-size: small;">${project.reward_description}</p>
                                	</div>   
                                    <h3 class="panel-title" style="margin-bottom: 10px;">Reward Deliverydate</h3>
                                	<div class="s-property-content">
                                    	<p>${fn:substring(project.reward_deliverydate, 0, 10)}</p>
                                	</div>
                                	<h3 class="panel-title" style="margin-bottom: 10px;">Shipping Info</h3>
                                	<div class="s-property-content">
                                		<c:if test="${fn:length(shippingList)!=0}">
                                			<c:forEach var="shipping" items="${shippingList}">
                                				<p><span style="display:inline-block; width: 220px;">${shipping.shipping_country}</span><span style="font-weight: bold;"> $${shipping.shipping_price}</span></p>
                                			</c:forEach>
                                		</c:if>
                                		<c:if test="${fn:length(shippingList)==0}">
                                			<p>No shipping involved</p>
                                		</c:if>  
                                	</div>                                  	                             	
                                </div>
                                
                            </div>

                        </aside>
                    </div>
                   <!--  <button id="startButton" class="absol" onclick="start()">Start</button>
					<button id="stopButton" class="absol" onclick="stop()">stop</button>
					<button id="clearButton" class="absol" onclick="clear()">clear</button><br/>
					 -->
					 <textarea id="displayTextArea" draggable="false" class="absol" readonly="readonly" rows="3" cols="20" style="display: none; max-height: 100px; overflow: hidden; resize: none; position: fixed; right: 20px; bottom: 50px;"></textarea>
					
					<div id="loading-wrapper"  draggable="false" style="overflow: hidden; resize: none; position: fixed; right: -2%; bottom: -35%; width: 13%; display: none;">
					  <div id="loading-text"></div>
					  <div id="loading-content"></div>
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
        <script type="text/javascript" src="assets/js/lightslider.min.js"></script>
        <script src="assets/js/main.js"></script>

        <script>
            $(document).ready(function () {

                $('#image-gallery').lightSlider({
                    gallery: true,
                    item: 1,
                    thumbItem: 9,
                    slideMargin: 0,
                    speed: 500,
                    auto: true,
                    loop: true,
                    onSliderLoad: function () {
                        $('#image-gallery').removeClass('cS-hidden');
                    }
                });
            });
            
            $(function() {
                  $('.like-button').on('click',function(){
                	  
		              var userid = '${sessionScope.userid}';
		              var project_num = '${project.project_num}';
	                  var sendData={
	                        "userid" : userid
	                        ,"project_num" : project_num
	                  };
                     
                     if($(this).attr('class')=='like-button'){
                        $.ajax({
                            method : 'post'
                            ,url : 'favoriteInsert'
                            ,data : JSON.stringify(sendData)
                            ,contentType : 'application/json; charset:utf-8'
                            ,success : function(){
                            }
                           ,error : function(){
                              alert("error");
                           }
                         });
                     }
                     else{
                         $.ajax({
                               method : 'post'
                               ,url : 'favoriteDelete'
                               ,data : JSON.stringify(sendData)
                               ,contentType : 'application/json; charset:utf-8'
                               ,success : function(){
                               }
                              ,error : function(){
                                 alert("error");
                              }
                            });
                     } 
                  });
                });   
                              
            
            
        </script>

    </body>
</html>