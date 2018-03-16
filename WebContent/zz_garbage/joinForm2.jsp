<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"></head>
<style>
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	body{
		font-family: 'Jeju Gothic', sans-serif;
		font-size: 12pt;
		background-size: cover;
		background-image: url("../livingroom.png");
  	 	padding-top: 5en;
  		display: flex;
 		justify-content: center;
	}	
	h2,label{
		font-family: 'Jeju Gothic', sans-serif;
		font-size: 14pt;
	}
	
</style>
<html>

<head>

<meta charset="UTF-8">

<title>이너피스 회원가입</title>

</head>

<body>
		
 <div class="w3-container w3-card-4 w3-display-middle w3-teal" style="width: 40%; height: 14%; 	">
	
		<hr width = 100% size=2 >

		<h2 align="center">innerpeace 회원 가입</h2>
	
		<hr width = 100% size=2 >
	</div>
	 <div class="w3-container w3-card-4 w3-display-middle" style="width: 40%; height: 50%;">
	
	
	
	<form class="w3-container w3-display-center" action="/innerpeace_aaa/member/joinSuccess" method="post">
<%-- 	<input type="hidden" name="id" value="${info.id }">
	<input type="hidden" name="name" value="${info.name }"> --%>
		<!-- 기본정보 -->
			<p>
			<label class="w3-text-teal">
			이름 :<input class="w3-input w3-border w3-light-grey" type="text" name="name" size="20" required="required">
			</label><br>
			<label class="w3-text-teal">
			아이디 :<input class="w3-input w3-border w3-light-grey" type="text" name="id" size="20" required="required"></label><br>
			<label class="w3-text-teal">
			비밀번호 :<input class="w3-input w3-border  w3-light-grey"  type="password" name="pwd" size="20" required="required"></label><br>
			<label class="w3-text-teal">
			비밀번호 확인 :<input class="w3-input w3-border  w3-light-grey" type="password" name="confirmPwd" size="20" required="required"></label><br>
			<label class="w3-text-teal">
			성별 : <input type="radio" name="gender" value="male" required="required">남
				 <input type="radio" name="gender" value="female" required="required">여</label><br><br>
			<label class="w3-text-teal">
			생년월일 :<input class="w3-input w3-border w3-light-grey" type="date" name="birthdate" size="20" required="required"></label>
			</p>
				
		<!-- 연락처 -->
			<p>
			<label class="w3-text-teal">
			전화번호 :<input class="w3-input w3-border w3-light-grey" type="tel" name="tel" size="20" required="required">
			</label><br>
			<label class="w3-text-teal">
			이메일:<input class="w3-input w3-border w3-light-grey" type="email" name="email" size="20">
			</label>
			</p>
			
		<!-- 과거진료이력 -->
			<p>
			<label class="w3-text-teal">
			과거에 상담 혹은 진료를 받은 적이 있습니까?<br>
			<input type="radio" name="con_past" value="있다" required="required">있다
			<input type="radio" name="con_past" value="없다" required="required">없다
			</label><br><br>
	        <label class="w3-text-teal">
			있다면 가장 최근 상담/진료 받으신 날짜를 알려주세요<br>
			<input class="w3-input w3-border w3-light-grey"  type="date" name="con_date" size="20">
			</label><br>
			<label class="w3-text-teal">
			상담받으신 내용을 간단히 알려주세요<br>
			<input class="w3-input w3-border w3-light-grey"  type="text" name="con_cat" size="20">
			</label><br>					
			<label class="w3-text-teal">
			분류 : <input type="radio" name="position" value="일반인" required="required">일반인
				 <input type="radio" name="position" value="의료진" required="required">의료진</label>
			</p>
			
			<p>
			<label>
			<input type="submit" value="작성완료"><!-- &nbsp;&nbsp; -->
			<input type="reset" value="다시작성">
			<input type="button" value="취소" onclick="window.location.href='/innerpeace_aaa/member/index'">
			</label></p>		
		</form>
	</div>

</body>

</html>



