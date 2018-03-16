<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
	body {
		background-size: cover;
		background-image: url("/innerpeace_aaa/resources/livingroom.png");
 		padding-top: 5en;
 		display: flex;
 		justify-content: center;
	}
</style>
<body>

<!-- LoginForm -->
	<div class="w3-container w3-half w3-display-middle" style="width:30%;">
	  <ul class="w3-ul w3-hover-shadow">
	  <li class="w3-amber w3-xlarge w3-center w3-padding-32">Login</li>
	<form class="w3-container w3-card-4 w3-white" action="loginPro" method="post">
	
	<p>
	<input class="w3-input" type="text" name="id" style="width:100%" required>
	<label>ID</label></p>
	<p>
	<input class="w3-input" type="password" name="pwd" style="width:100%" required>
	<label>PASSWORD</label></p>
	
	<p>
	<input id="milk" class="w3-check" type="checkbox" checked="checked">
	<label>REMEMBER MY ID</label></p>
	
	<p class="w3-center">
	<button class="w3-button w3-section w3-amber  w3-round w3-ripple" type="submit"> Login </button>
	
	<button class="w3-button w3-section w3-amber w3-round w3-ripple" type="button" 
			onclick="window.location.href='/innerpeace_myBatis/member/index'"> Cancel </button></p>
	<p>
	<div class="text-center p-t-136" style="text-align: right;">
						<a class="txt2" href="/innerpeace_myBatis/member/joinForm">
							Create your Account
							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
	</p>
	
	</form>
	</ul>
	</div>



</body>
</html> 
