<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Fredericka+the+Great" rel="stylesheet">
<style>
  
  body {
    margin: 40px 10px;
    padding: 10;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

 	a{
 		text-decoration: none;
 	}
</style>
</head>
<body>
	<!-- Navbar (sit on top) -->
		<div class="w3-top" style="left: 0px;" >
		  <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:3px;height: 74px;">
		    <a href="/innerpeace_aaa/member/home" class="w3-bar-item w3-btn w3-display-topmiddle" 
		    										style="padding-bottom: 0;padding-top:0;text-decoration: none;">
		    	<h1 style="font-family:'Fredericka the Great', cursive; height: 54px;">innerpeace</h1></a>
		    <!-- Right-sided navbar links. Hide them on small screens -->
		    <div class="w3-right w3-hide-small">
		           
			      <div class="w3-dropdown-hover w3-round-large" style="margin-top: 10px;">
				   <button class="w3-button w3-round-large w3-black" style="padding-right: 20px; padding-left: 20px; font-family:'Fredericka the Great', cursive;">MENU</button>
				   <div class="w3-dropdown-content w3-bar-block" style="right:0; font-family:'Fredericka the Great', cursive;">
				   	 <p><b>Welcome ${id}!</b></p>
				     <a href="/innerpeace_aaa/member/appt" class="w3-bar-item w3-button">진료예약</a>
				     <a href="/innerpeace_aaa/member/apptlist" class="w3-bar-item w3-button">예약관리</a>
		    		 <a href="/innerpeace_aaa/member/video" class="w3-bar-item w3-button">원격진료</a>
		    		 <a href="/innerpeace_aaa/member/map" class="w3-bar-item w3-button">상담기관 찾기</a><!-- 	 
				     <a href="/innerpeace_aaa/appointment/history.jsp" class="w3-bar-item w3-button">진료기록</a> -->
				     
				     <c:if test="${id != 'admin'}">
				     <a href="/innerpeace_aaa/member/updateForm" class="w3-bar-item w3-button">회원정보</a>
				     </c:if>
				     <c:if test="${id == 'admin'}">
				     <a href="/innerpeace_aaa/member/list" class="w3-bar-item w3-button">회원리스트보기</a>
				     </c:if>
				   </div>
				 </div>
			      <a href="/innerpeace_aaa/member/logout">
				<i id="logout" class="material-icons" title="로그아웃" style="font-size:36px; margin-top: 10px;">power_settings_new</i>
			  </a>
		    </div>
		  </div>
		</div>
</body>
</html>