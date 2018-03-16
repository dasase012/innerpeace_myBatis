<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta charset="euc-kr" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
   
 
  body {
    margin: 40px 10px;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  iframe{
  	height: 70%; 
  	width: 330;
  	padding: 0;
  	/* margin-top: 50px; */
  	border: none;
	margin-right: 300px;
	margin-top: 20px;
	margin-bottom: 30px;
	
	-moz-border-radius: 12px;
	-webkit-border-radius: 12px;
	border-radius: 12px;
	
	-moz-box-shadow: 4px 4px 14px #000;
	-webkit-box-shadow: 4px 4px 14px #000;
	box-shadow: 4px 4px 14px #000;
	
	-moz-transform:rotate(20deg);
	-webkit-transform:rotate(20deg);
	-o-transform:rotate(20deg);
	-ms-transform:rotate(20deg);
	filter:progid:DXImageTransform.Microsoft.BasicImage(rotation=.2);
  }

	/* image hover effect  */
	.container {
  position: relative;
  width: 50%;
}

.image {
  display: block;
  width: 100%;
  height: auto;
}

.overlay {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  height: 100%;
  width: 100%;
  opacity: 0;
  transition: .5s ease;
  background-color: silver;
}

.container:hover .overlay {
  opacity: 0.7;
}

.text {
  color: white;
  font-size: 20px;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  -ms-transform: translate(-50%, -50%);
  text-align: center;
}

</style>
</head>

<body>
	
	<!-- Navbar (sit on top) -->
	<%@ include file="/mainhome/header.jsp" %>

	<!-- First Grid: 기관찾기 & 예약하기 -->
	
		  <div class="w3-row w3-half w3-padding-24  w3-transparent w3-center" style="height:200px;">
		    <div class="container" style="width: 50%; margin-top: 100px; margin-left: 10%; margin-right:30%;"> 
		    	<a href="/innerpeace_aaa/doc_find/map.jsp">
		        <img src="/innerpeace_aaa/resources/map.png" class="w3-image w3-circle w3-btn" style="width:50%"></a>
		      	<div class="overlay">
				  <div class="text">병원찾기</div>
				</div>
		    </div>
		  </div>
		  
		  <div class="w3-half w3-padding-24 w3-transparent w3-center" style="height:200px">
			<div class="container">
		      <a href="/innerpeace_aaa/member/appt">
		      <img src="/innerpeace_aaa/resources/appt.png" class="w3-image w3-circle w3-btn" style="width:50%"></a>
		        <div class="overlay">
				  <div class="text">진료예약</div>
				</div>
		    </div>
		  </div>
		</div>
		<!-- Second Grid: 원격진료 & Contact -->
		<div class="container" style="width: 50%; margin-left: 10%; margin-right:30%;">
		  <div class="w3-row w3-half w3-padding-24 w3-transparent w3-center" style="height:200px">
		     <a href="/innerpeace_aaa/videochat/video.jsp">
		     <img src="/innerpeace_aaa/resources/videocall.png" class="w3-image w3-circle w3-btn" style="width:50%"></a>
		      <div class="overlay">
				  <div class="text">원격진료</div>
				</div>
		  </div>
		  </div>
		   <div class="w3-half w3-padding-24 w3-transparent w3-center" style="height:200px">
		      <div class="container">
		      <a href="mailto:dasase012@hotmail.com">
		     <img src="/innerpeace_aaa/resources/help.png" class="w3-image w3-circle w3-btn" style="width:50%"></a>
		      <div class="overlay">
				  <div class="text">CONTACT</div>
				</div>
		    </div>
			</div>
		</div>
	<!-- jsoup -->
	<iframe src="/innerpeace_aaa/mainhome/jsoup.jsp" class="w3-display-right" 
			style="overflow: scroll;"></iframe>
	
	<!-- footer contact admin -->
	<%@ include file="/mainhome/footer.jsp" %>
	
</body>
</html>