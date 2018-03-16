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
    padding: 10;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  } 

</style>
</head>

<body>
	
	<!-- Navbar (sit on top) -->
	<%@ include file="/mainhome/header.jsp" %>
	
	<!-- body -->	
	<div class="w3-row w3-display-middle" style="bottom: 150px;">
	  <div class="w3-quarter w3-container">
	    <a href="/innerpeace_aaa/member/appt">
	     <img src="/innerpeace_aaa/resources/appt.png" title="���Ό��" class="w3-image w3-padding-large w3-circle w3-btn " style="width:250px"></a>
	  </div>
	  <div class="w3-quarter w3-container">
	    <a href="/innerpeace_aaa/member/video">
		 <img src="/innerpeace_aaa/resources/videocall.png" title="��������" class="w3-image w3-padding-large w3-circle w3-btn " style="width:250px;"></a>
	  </div>
	  <div class="w3-quarter w3-container">
	    <a href="/innerpeace_aaa/member/map">
	     <img src="/innerpeace_aaa/resources/map.png" title="����ã��" class="w3-image w3-padding-large w3-circle w3-btn" style="width:250px;"></a>
	  </div>
	  <div class="w3-quarter w3-container">
	    <a href="/innerpeace_aaa/member/updateForm">
	     <img src="/innerpeace_aaa/resources/acct.png" title="ȸ������" class="w3-image w3-padding-large w3-circle w3-btn" style="width:250px;"></a>
	  </div>
	</div>


	
	
	

	
	
	<!-- quote -->
	<%@ include file="/mainhome/quote.jsp" %>

	
	<!-- footer contact admin -->
	<%@ include file="/mainhome/footer.jsp" %>
	
</body>
</html>