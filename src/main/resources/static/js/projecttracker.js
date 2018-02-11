function validateEmail() {
	var emailAddress = $('#forgottenpasswordinput');
	$('#sendpassword').click(function() {	
		if (!emailAddress.val()) {
			$('#errors').show();
			$('.has-error').html("No email address has been added!");
		}
		else {
			$('#errors').hide();
			$('.has-error').html();
			checkEmail();
		}
	});
	
	emailAddress.on('keypress',function(e) {
		if (e.which == 13) {
			if (!emailAddress.val()) {
				$('#errors').show();
				$('.has-error').html("No email address has been added!");
			}
			else {
				$('#errors').hide();
				$('.has-error').html();
				checkEmail();
			}
			$("form").submit(function(e){
		        e.preventDefault();
		    });
		}
		
	});
	
}

function checkEmail() {
	var emailAddress = $('#forgottenpasswordinput');
	$.ajax({
	    url : '/emailaddress?'
		,
		
	    data : {
		'emailAddress' : emailAddress.val()
	   },

	    dataType : 'html',

	    success: function(email) {

	if (emailAddress.val() != email) {
		$('#errors').show();
		$('.has-error').html("Email address does not exist!");
	}
	else {
	$('#resetPassword').modal('toggle');
	$('#emailAddress').html(emailAddress.val());
	}
	    },
	    error: function(e){
	        alert("There is a technical issue! Please try again later.");
	    }

	 });
}


function togglePostcode() {
	var selectedOption = document.getElementById("countries").value;
	
	if (selectedOption == "GB") {
		document.getElementById("postcodelookup").style.display="block";
	}
	else {
		document.getElementById("postcodelookup").style.display="none";
	}
}

function getDateTime() {
	var d = new Date();
	var month = d.getMonth();
	switch (month) {
		case(0): month = 'Jan'; break;
		case(1): month = 'Feb'; break;
		case(2): month = 'Mar'; break;
		case(3): month = 'Apr'; break;
		case(4): month = 'May'; break;
		case(5): month = 'Jun'; break;
		case(6): month = 'Jul'; break;
		case(7): month = 'Aug'; break;
		case(8): month = 'Sep'; break;
		case(9): month = 'Oct'; break;
		case(10): month = 'Nov'; break;
		case(11): month = 'Dec'; break;
	}
	var date = d.getDate() + ' ' + month + ' ' + d.getFullYear();
	var time = d.getHours() + ':' + d.getMinutes();
	return date + ' ' + time;
}

function getAddress() {
	if (!$("input[name='addpostcode']").val()) {
		alert("No postcode has been entered");
	}
	else {
	$.ajax({
    url : 'https://api.getAddress.io/v2/uk/{postcode}?api-key=I8nXqhwnA0qMpm_u8MHhyQ8904'
	,
	
    data : {
	'postcode' : $("input[name='addpostcode']").val()
   },

    dataType : 'json',

    success: function(r) {
		//console.log('success',r);
		$("#addressblock").show();
		$("#addressList").html('<option selected>Please select an address</option>');
		$("input[name='address1']").val("");
		$("input[name='address2']").val("");
		$("input[name='address3']").val("");
		$("input[name='city']").val("");
		$("input[name='postcode']").val("");
		
		for (i=0;i<r.Addresses.length;i++) {
			//Empty array
			var addressResults = [];
			//split array of list into array of strings
			var addressResultsString = r.Addresses[i].split(",");
			for (j=0;j<addressResultsString.length-1;j++) {
			//select elements that have more than one character
			if (addressResultsString[j].length > 1) {
			//add element to new array 
			addressResults.push(addressResultsString[j]);
			}
			
		}
		$("#addressList").append('<option>' + addressResults + '</option>');
		}
	},		
    error: function(e){ 
       console.log('failure',e);
   }

});
	}	
	};
	

function populateAddress() {
	//populate address inputs
	var postcode = $("input[name='addpostcode']").val().toUpperCase();
	$('#addressblock').change(function() {
	var array=[];
	$('#addressblock option:selected').each(function() {
		if ($('#addressblock option:selected').val() == 'Please select an address') {
			$("input[name='address1']").val("");
			$("input[name='address2']").val("");
			$("input[name='address3']").val("");
			$("input[name='city']").val("");
			$("input[name='postcode']").val("");
	
		}
	array = $('#addressblock option:selected').val();
	array = array.split(',');
	//console.log(array);
	//console.log(array[0]);
	});
	if (array.length == 2) {
	
	$("input[name='address1']").val(array[0]);
	$("input[name='address2']").val("");
	$("input[name='address3']").val("");
	$("input[name='city']").val(array[1]);
	$("input[name='postcode']").val(postcode);
	}
	else if (array.length == 3) {
	$("input[name='address1']").val(array[0]);
	$("input[name='address2']").val(array[1]);
	$("input[name='address3']").val("");
	$("input[name='city']").val(array[2]);
	$("input[name='postcode']").val(postcode);
	}
	else if (array.length >= 4) {
	$("input[name='address1']").val(array[0]);
	$("input[name='address2']").val(array[1]);
	$("input[name='address3']").val(array[2]);
	$("input[name='city']").val(array[3]);
	$("input[name='postcode']").val(postcode);
	} 
	
	});
};

function editProject() {
	var checkBox = $("input:checkbox[id='action']").is("checked");
	var checkBoxesSelected = $("input:checkbox[id='action']:checked").length;
		if (checkBoxesSelected > 1) {
			alert("More than one project was selected. Please select one project.");
		}
		else if (checkBoxesSelected == 0) {
			alert("No project was selected!");
		}
		else {
		$("input:checkbox[id='action']:checked").each(function() {
		var project = $(this).parent().prev().prev().prev().prev().prev().prev().find('a').attr('href');
		var projectLink = project.substring(0,project.length-5) + "edit";
		window.location = window.location.href.substring(0,window.location.href.length-1) + projectLink;
		});
		}
};

function editTask() {
	var checkBox = $("input:checkbox[id='action']").is("checked");
	var checkBoxesSelected = $("input:checkbox[id='action']:checked").length;
		if (checkBoxesSelected > 1) {
			alert("More than one task was selected. Please select one task.");
		}
		else if (checkBoxesSelected == 0) {
			alert("No task was selected!");
		}
		else {
		$("input:checkbox[id='action']:checked").each(function() {
		var task = $(this).parent().prev().prev().prev().prev().prev().prev().find('a').attr('href');
		var taskLink = project.substring(0,project.length-5) + "edit";
		window.location = window.location.href.substring(0,window.location.href.length-1) + taskLink;
		});
		}
};

function toggleCheckbox() {
	var checkBox = $("input:checkbox[id='action']:checked");
	if (checkBox.length == 0)
	$("input:checkbox[id='action']").prop("checked",true);
	else
	$("input:checkbox[id='action']").prop("checked",false);
};

function viewDatePicker() {
	  var date_input=$('input[id="datepicker"]');
	  var container= $('body');
	  var options={
		format: 'dd/mm/yyyy',
		container: container,
		todayHighlight: true,
		autoclose: true,
	  };
	  date_input.datepicker(options);
}

$(document).ready(function() {
	if (!$('#container').html()) {
		$('#container').height(460);
	}

	//add comments blocks
	$('#addcommentbutton').click(function() {
		if (!$('#commentsinput').val()) {
			alert("No comments have been added to the comments field!");
		}
		else {
			var user = 'aelagha';
			var timeadded = getDateTime();
			var addComments = $('#commentsinput').val(); 
			$('.commentsfield').css('display','block');
			$('.commentsfield').append('<div class="commentsblock"><span class="glyphicon glyphicon-chevron-right"></span>'
			+ '<p class="commentstext"> ' + addComments + '</p><span class="addedby">Added by: ' + user + ' on ' + timeadded + '</span></div>');
			$('#commentsinput').val('');
			//var storecomments = $('#commentstext').val();
			
		}
	});
	
	$("#postcodelookupbutton").click(function(){
	getAddress();
	populateAddress();
});
	viewDatePicker();
	validateEmail();
	
});