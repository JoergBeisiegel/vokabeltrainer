$(document).ready(function(){
	// login mit username =='admin' and password == 'password'
	$("#login").click(function(){
		if($('#login').text() == 'Einloggen') {
			if( $("#loginusername").val()=='admin' && $("#loginpassword").val()=='password') {
				$("#loginusername").hide();
				$("#loginpassword").hide();
				$('#login').text('Ausloggen');
			}
			else {
				alert("Please try again");
			}
		} else if($('#login').text() == 'Ausloggen') {
			$("#loginusername").show();
			$("#loginpassword").show();
			$('#login').text('Einloggen');
		}
	});
	// Logout
	$("#login").click(function() {
	});
});

