searchVisible = 0;
transparent = true;

$(document).ready(function () {
    /*  Activate the tooltips      */
    $('[rel="tooltip"]').tooltip();

    $('.wizard-card').bootstrapWizard({
        'tabClass': 'nav nav-pills',
        'nextSelector': '.btn-next',
        'previousSelector': '.btn-previous',
        onInit: function (tab, navigation, index) {

            //check number of tabs and fill the entire row
            var $total = navigation.find('li').length;
            $width = 100 / $total;

            $display_width = $(document).width();

            if ($display_width < 600 && $total > 3) {
                $width = 50;
            }

            navigation.find('li').css('width', $width + '%');

        },
        onNext: function (tab, navigation, index) {
            if (index == 1) {
            	var project_title = $('#project_title').val();
            	var project_category = $('#project_category').val(); 
            	var project_location = $('#project_location').val();
            	var project_startdate = $('#project_startdate').val();
            	var product_goaldate = $('#product_goaldate').val();
            	var project_goalfundprice = $('#project_goalfundprice').val();
            	var project_coverImage = $('#project_coverImage').val();
            	if(project_title == ''){
            		alert('Please insert your Project title');
            		$('#project_title').focus();
            		return false;
            	}
            	if(project_category == ''){
            		alert('Please select your Project category');
            		$('#project_category').focus();
            		return false;    		
            	}
            	if(project_location == ''){
            		alert('Please insert your Project location');
            		$('#project_location').focus();
            		return false;    		
            	}
            	if(project_startdate == ''){
            		alert('Please insert your Funding start date');
            		$('#project_startdate').focus();
            		return false;    		
            	}
            	if(product_goaldate == ''){
            		alert('Please insert your Funding end date');
            		$('#product_goaldate').focus();
            		return false;    		
            	}
                if((new Date(project_startdate).getTime() > new Date(product_goaldate).getTime())){
                	alert('Please check your Funding start-end Date');
                	$('#project_startdate').focus();
                	return false;
                }
            	if(project_goalfundprice == ''){
            		alert('Please insert your Funding goal');
            		$('#project_goalfundprice').focus();
            		return false;    		
            	}
            	if(isNaN(project_goalfundprice)){
            		alert('Funding goal must be a number');
            		$('#project_goalfundprice').focus();
            		return false;    		
            	}
            	if(project_coverImage == ''){
            		alert('Please upload your Project cover image');
            		$('#project_coverImage').focus();
            		return false;    		
            	}            	
            	//alert('1페이지에서 2페이지 넘어감');
                return validateFirstStep();
            } else if (index == 2) {
            	var reward_title = $('#reward_title').val();
            	var reward_price = $('#reward_price').val();
            	var reward_description = $('#reward_description').val();
            	var product_goaldate = $('#product_goaldate').val();
            	var reward_deliverydate = $('#reward_deliverydate').val();
            	var shipping_detail = $('#shipping_detail').val();
            	if(reward_title == ''){
            		alert('Please insert your Reward title');
            		$('#reward_title').focus();
            		return false;    		
            	}            	
            	if(reward_price == ''){
            		alert('Please insert your Reward price');
            		$('#reward_price').focus();
            		return false;    		
            	}
            	if(isNaN(reward_price)){
            		alert('Reward price must be a number');
            		$('#reward_price').focus();
            		return false;    		
            	}            	
            	if(reward_description == ''){
            		alert('Please insert your Reward description');
            		$('#reward_description').focus();
            		return false;    		
            	}        
            	if(reward_deliverydate == ''){
            		alert('Please insert your Reward delivery date');
            		$('#reward_deliverydate').focus();
            		return false;    		
            	}                	
                if((new Date(product_goaldate).getTime() > new Date(reward_deliverydate).getTime())){
                	alert('Please check your Reward delivery date and Funding date');
                	$('#reward_deliverydate').focus();
                	return false;
                }
            	if(shipping_detail == ''){
            		alert('Please select your Shipping detail');
            		$('#shipping_detail').focus();
            		return false;    		
            	}
            	if(shipping_detail == 'shipping_anywhere'){
                	if($('#shipping_price').val() == ''){
                		alert('Please insert your Shipping price');
                		$('shipping_price').focus();
                		return false;    		
                	}
                	if(isNaN($('#shipping_price').val())){
                		alert('Shipping price must be a number');
                		$('#shipping_price').focus();
                		return false;    		
                	}
            	}
            	if(shipping_detail == 'shipping_certain'){
            		var check = true;
            		$('input[name=shipping_price]').each(function(index, item){
            			if($(this).val() == ''){
            				alert('Please insert your Shipping price');
            				check=false;
            			}
            			if(isNaN($(this).val())){
            				alert('Shipping price must be a number');
            				check=false;
            			}
            		});
            		return check;
            	}            	
            	//alert('2페이지에서 3페이지 넘어감');
                return validateSecondStep();
            } else if (index == 3) {
            	var video_id = $('#video-id').val();
            	//var content = CKEDITOR.instances['editor1'].getData();
            	if(video_id == ''){
            		alert('Please upload your project video');
            		return false;
            	}
/*            	if(content == ''){
            		alert('Please write your project description');
            		return false;
            	}*/
            	//alert('3페이지에서 4페이지 넘어감');
                return validateThirdStep();
            } //etc. 

        },
        onTabClick: function (tab, navigation, index) {
            // Disable the posibility to click on tabs
            return false;
        },
        onTabShow: function (tab, navigation, index) {
            var $total = navigation.find('li').length;
            var $current = index + 1;

            var wizard = navigation.closest('.wizard-card');

            // If it's the last tab then hide the last button and show the finish instead
            if ($current >= $total) {
                $(wizard).find('.btn-next').hide();
                $(wizard).find('.btn-finish').show();
            } else {
                $(wizard).find('.btn-next').show();
                $(wizard).find('.btn-finish').hide();
            }
        }
    });

    //check index1 page
/*    function check1(){
    	var project_title = $('#project_title').val();
    	var project_category = $('#project_category').val(); 
    	var project_location = $('#project_location').val();
    	var project_startdate = $('#project_startdate').val();
    	var product_goaldate = $('#product_goaldate').val();
    	var project_goalfundprice = $('#project_goalfundprice').val();
    	if(project_title == ''){
    		alert('Please insert your Project title');
    		$('#project_title').focus();
    		return;
    	}
    	if(project_category == ''){
    		alert('Please insert your Project category');
    		$('#project_category').focus();
    		return;    		
    	}
    	if(project_location == ''){
    		alert('Please insert your Project location');
    		$('#project_location').focus();
    		return;    		
    	}
    	if(project_startdate == ''){
    		alert('Please insert your Funding start');
    		$('#project_startdate').focus();
    		return;    		
    	}
    	if(product_goaldate == ''){
    		alert('Please insert your Funding end');
    		$('#product_goaldate').focus();
    		return;    		
    	}
    	if(project_goalfundprice == ''){
    		alert('Please insert your Funding goal');
    		$('#project_goalfundprice').focus();
    		return;    		
    	}    	
    }*/
    
    
    // Prepare the preview for profile picture
/*    $("#project_coverImage").change(function () {
        readURL(this);
    });*/

    $('[data-toggle="wizard-radio"]').click(function () {
        wizard = $(this).closest('.wizard-card');
        wizard.find('[data-toggle="wizard-radio"]').removeClass('active');
        $(this).addClass('active');
        $(wizard).find('[type="radio"]').removeAttr('checked');
        $(this).find('[type="radio"]').attr('checked', 'true');
    });

    $('[data-toggle="wizard-checkbox"]').click(function () {
        if ($(this).hasClass('active')) {
            $(this).removeClass('active');
            $(this).find('[type="checkbox"]').removeAttr('checked');
        } else {
            $(this).addClass('active');
            $(this).find('[type="checkbox"]').attr('checked', 'true');
        }
    });

    $height = $(document).height();
    $('.set-full-height').css('height', $height);


});

function validateFirstStep() {

    $(".wizard-card form").validate({
        rules: {
            firstname: "required",
            lastname: "required",
            email: {
                required: true,
                email: true
            }

            /*  other possible input validations
             ,username: {
             required: true,
             minlength: 2
             },
             password: {
             required: true,
             minlength: 5
             },
             confirm_password: {
             required: true,
             minlength: 5,
             equalTo: "#password"
             },
             
             topic: {
             required: "#newsletter:checked",
             minlength: 2
             },
             agree: "required"
             */

        },
        messages: {
            firstname: "Please enter your First Name",
            lastname: "Please enter your Last Name",
            email: "Please enter a valid email address",
            /*   other posible validation messages
             username: {
             required: "Please enter a username",
             minlength: "Your username must consist of at least 2 characters"
             },
             password: {
             required: "Please provide a password",
             minlength: "Your password must be at least 5 characters long"
             },
             confirm_password: {
             required: "Please provide a password",
             minlength: "Your password must be at least 5 characters long",
             equalTo: "Please enter the same password as above"
             },
             email: "Please enter a valid email address",
             agree: "Please accept our policy",
             topic: "Please select at least 2 topics"
             */

        }
    });

    if (!$(".wizard-card form").valid()) {
        //form is invalid
        return false;
    }

    return true;
}

function validateSecondStep() {

    //code here for second step
    $(".wizard-card form").validate({
        rules: {
        },
        messages: {
        }
    });

    if (!$(".wizard-card form").valid()) {
        console.log('invalid');
        return false;
    }
    return true;

}

function validateThirdStep() {
    //code here for third step


}

//Function to show image before upload

function readURL(input) {
/*    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $('#wizardPicturePreview').attr('src', URL.createObjectURL(input.files[0])).fadeIn('slow');
        }
        reader.readAsDataURL(input.files[0]);
    }*/
}













