// The client ID is obtained from the {{ Google Cloud Console }}
// at {{ https://cloud.google.com/console }}.
// If you run this code from a server other than http://localhost,
// you need to register your own client ID.
var OAUTH2_CLIENT_ID = '811659979623-l1arsgl8gap4sue96vuj3s82uu94mbr6.apps.googleusercontent.com';
var OAUTH2_SCOPES = [
  'https://www.googleapis.com/auth/youtube'
];

// Upon loading, the Google APIs JS client automatically invokes this callback.
googleApiClientReady = function() {
  gapi.auth.init(function() {
    window.setTimeout(checkAuth, 1);
/*  });
  $('#logout').click(function(){
	  alert('로그아웃 누름');
  	var token = gapi.auth.getToken();
  	if(token){
  		var script = document.createElement("script");
  		script.src = "https://accounts.google.com/o/oauth2/revoke?token=" + token.access.token;
  		document.body.appendChild(script);
  		document.body.removeChild(script);
  	}
  	gapi.auth.setToken(null);
  	handleAuthResult(null);*/
  });
}

// Attempt the immediate OAuth 2.0 client flow as soon as the page loads.
// If the currently logged-in Google Account has previously authorized
// the client specified as the OAUTH2_CLIENT_ID, then the authorization
// succeeds with no user intervention. Otherwise, it fails and the
// user interface that prompts for authorization needs to display.
function checkAuth() {
  gapi.auth.authorize({
    client_id: OAUTH2_CLIENT_ID,
    scope: OAUTH2_SCOPES,
    immediate: true
  }, handleAuthResult);
}

$(function (){
	 $("#modalUpdate").on("show.bs.modal", function(){
		 if(gapi.auth.getToken() == null){
			 $('#signoutButton').hide();
			 $('#signinButton').show();
		 } else{
			 $('#signoutButton').show();
			 $('#signinButton').hide();
		 }
	}) 
	
	$("#modalUpdate").on("hidden.bs.modal", function(){
		  /*gapi.auth.init(function() {
			  
		    	var token = gapi.auth.getToken();
		    	alert(token);
		    	
		    	if(token){
		    		var script = document.createElement("script");
		    		script.src = "https://accounts.google.com/o/oauth2/revoke?token=" + token.access_token;
		    		document.body.appendChild(script);
		    		document.body.removeChild(script);
		    	}
		    	gapi.auth.setToken(null);
		    	handleAuthResult(null);
		    	$.ajax({
		    		method : 'get'
		    		, url : 'https://accounts.google.com/Logout'
		    		, dataType : "jsonp"
		    		, jsonCallback : 'callfunc'
		    		, success : function(resp){
		    			alert("성공");
		    			alert(resp);
		    		},
		    		error : function(resp){
		    			alert("error");
		    			alert(JSON.stringify(resp));
		    			if(resp.statusText=="success"){
		    				$('#channel-name').text("");
		    		        $('#channel-thumbnail').attr('src', "https://yt3.ggpht.com/a-/ACSszfH5cclsP-pPERmK8VKjhHCeyLQAy6Ls7X-luQ=s88-mo-c-c0xffffffff-rj-k-no");
		    		        $('.post-sign-ins').hide();
		    		        $('.pre-sign-ins').show();
		    				$('#signoutButton').hide();
		    				$('#signinButton').show();
		    			}
		    		}
		    		
		    	})
		  });		*/
/*		 gapi.auth.init(function() {
			  
		    	var token = gapi.auth.getToken();
		    	alert(token);
		    	
		    	if(token){
		    		var script = document.createElement("script");
		    		script.src = "https://accounts.google.com/o/oauth2/revoke?token=" + token.access_token;
		    		document.body.appendChild(script);
		    		document.body.removeChild(script);
		    	}
		    	gapi.auth.setToken(null);
		    	handleAuthResult(null);
		    	$.ajax({
		    		method : 'get'
		    		, url : 'https://accounts.google.com/Logout'
		    		, dataType : "jsonp"
		    		, success : function(resp){
		    			alert("성공");
		    			alert(resp);
		    		},
		    		error : function(resp){
		    			alert("error");
		    			alert(JSON.stringify(resp));
		    			if(resp.statusText=="success"){
		    				$('#channel-name').text("");
		    		        $('#channel-thumbnail').attr('src', "https://yt3.ggpht.com/a-/ACSszfH5cclsP-pPERmK8VKjhHCeyLQAy6Ls7X-luQ=s88-mo-c-c0xffffffff-rj-k-no");
		    		        $('#signoutButton').hide();
		    		        $('#signinButton').show();
		    			}
		    		}
		    		
		    	})
		  });*/
	}) 
})


function logout(){
	  gapi.auth.init(function() {
		  
	    	var token = gapi.auth.getToken();
	    	
	    	if(token){
	    		var script = document.createElement("script");
	    		script.src = "https://accounts.google.com/o/oauth2/revoke?token=" + token.access_token;
	    		document.body.appendChild(script);
	    		document.body.removeChild(script);
	    	}
	    	gapi.auth.setToken(null);
	    	handleAuthResult(null);
	    	$.ajax({
	    		method : 'get'
	    		, url : 'https://accounts.google.com/Logout'
	    		, dataType : "jsonp"
	    		, success : function(resp){
	    			alert("success");
	    		},
	    		error : function(resp){
	    			alert("error");
/*	    			alert(JSON.stringify(resp));
*/	    			if(resp.statusText=="success"){
	    				$('#channel-name').text("");
	    		        $('#channel-thumbnail').attr('src', "https://yt3.ggpht.com/a-/ACSszfH5cclsP-pPERmK8VKjhHCeyLQAy6Ls7X-luQ=s88-mo-c-c0xffffffff-rj-k-no");
	    		        $('.post-sign-ins').hide();
	    		        $('.pre-sign-ins').show();
	    				$('#signoutButton').hide();
	    				$('#signinButton').show();
	    			}
	    		}
	    		
	    	})
	  });
}
// Handle the result of a gapi.auth.authorize() call.
function handleAuthResult(authResult) {
  if (authResult && !authResult.error) {
    // Authorization was successful. Hide authorization prompts and show
    // content that should be visible after authorization succeeds.
    $('.pre-auth').hide();
    $('.post-auth').show();
	$('#signoutButton').show();
	$('#signinButton').hide();
    loadAPIClientInterfaces();
  } else {
    // Make the #login-link clickable. Attempt a non-immediate OAuth 2.0
    // client flow. The current function is called when that flow completes.
    $('#login-link').click(function() {
      gapi.auth.authorize({
        client_id: OAUTH2_CLIENT_ID,
        scope: OAUTH2_SCOPES,
        immediate: false
        }, handleAuthResult);
    });
    
   
  }
}
// Load the client interfaces for the YouTube Analytics and Data APIs, which
// are required to use the Google APIs JS client. More info is available at
// https://developers.google.com/api-client-library/javascript/dev/dev_jscript#loading-the-client-library-and-the-api
function loadAPIClientInterfaces() {
  gapi.client.load('youtube', 'v3', function() {
    handleAPILoaded();
  });
}
