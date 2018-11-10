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
	               //alert("Approved");
	               $("#updateChecked").hide();
	               window.location.href="${pageContext.request.contextPath}/adminProjects";
	            };
	            if(resp!=1){
	               //alert("Not approved");
	            };
	         }
	         ,beforeSend:function(){
	             $('#status').fadeIn();
	             $('#preloader').fadeIn();
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
			console.log("ddd");
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
			//alert("success");
			if(resp==null){
			//alert("Please insert your comment");	
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
			//alert("success");
			if(resp==null){
			//alert("값 입력이 안됨");	
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

/* var eventSource;
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
			alert(lottery);
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
}; */

// 5. The API calls this function when the player's state changes.
var done = false;
var start = false; //첫 시작
var hash = false;
var check = false;
var couponCheck = ${couponCheck[0] ==null};
function onPlayerStateChange(event) {
	if(player.getPlayerState() == 1 && !start){
		start = true;
		if(category =='member'){
		check = confirm('Do you want to use your computing power to find a coupon for this product?'); 
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
				 //alert('ㅅㅂ');
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
	
		<!-- Preview 모달창  -->
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
			                           <h4>Get a Promo Code and Watching Video! </h4>
			                           	<div id="key" class="animated infinite flipInY delay-3s">
			                           		<img src="assets/img/key.png" width="200px" alt="Mirror Edge">
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
								<p>DAYS &nbsp;&nbsp; HRS &nbsp;&nbsp;&nbsp; MINS &nbsp;&nbsp;&nbsp; SECS</p>
							</div>
										
										<div class="single-property-header pull-right" style="text-align: -webkit-right; display: flex;">
											<c:if test="${sessionScope.userid !='admin' && sessionScope.mCategory !='company'}">
											</c:if>
                                            <div class="col-md-8 col-sm-8 col-xs-8 blg-entry" style="height: 48px; padding-right: 0px;">
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
                                            <p>Duis mollis  blandit tempus porttitor curabiturDuis mollis  blandit tempus porttitor curabitur , est non…</p>
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
					
					<div id="loading-wrapper"  draggable="false" style="overflow: hidden; resize: none; position: fixed; right: -45%; bottom: -39%; display: none;">
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
                               //alert("sucess");
                            }
                           ,error : function(){
                              //alert("error");
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
                                  //alert("체크해제성공");
                               }
                              ,error : function(){
                                 //alert("체크해제에러");
                              }
                            });
                     } 
                  });
                });   
                              
            
            
        </script>

    </body>
</html>