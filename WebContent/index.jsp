<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">

 <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-colors-highway.css">

<style type="text/css">

	body {
		background-size: cover;
		background-image: url("/innerpeace_myBatis/resources/livingroom.png");
 		padding-top: 5en;
 		display: flex;
 		justify-content: center;
	}
	#enter{
		font-family: 'Ubuntu', sans-serif;
	}
	
	/* welcome message typewriter effect */
	.typewriter h1{
		color: white;
		font-family: 'Ubuntu', sans-serif;
		font-size: 5.5rem;
		font-weight: bold;
		overflow: hidden;
		border-right: .10em solid orange;
		white-space: nowrap;
		margin: 140px auto;
		animation: typing 3.5s steps(30, end), blink-caret .5s step-end infinite;
		width: 100%;
	}
	@keyframes typing{
		from {width:0}
		to {width: 100%}
	}
	@keyframes blink-caret{
		from,to{border-color: transparent}
		50%{border-color: orange}
	}
	
</style>
<body>
	<!--	welcome message typewriter effect   -->
		<div class="typewriter" style="margin-top: 10%;">
			<h1><div>
			Hello, welcome to innerpeace!</div></h1>
		</div>
		
	
	
	<!-- Enter : loginpage  -->
		<div class="w3-container w3-center" id="enter">
		    <form action="/innerpeace_myBatis/member/loginForm" method="post">
		    <button class="w3-button w3-amber w3-round-large  w3-padding-large w3-xlarge w3-display-middle" 
		    		style="margin-top: 10%; "type="submit">Enter</button></form>
		</div>
  
 
 
</body>
</html>