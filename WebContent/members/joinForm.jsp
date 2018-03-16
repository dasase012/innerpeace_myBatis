<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<title>W3.CSS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style type="text/css">
	@import url(//fonts.googleapis.com/earlyaccess/jejugothic.css);
	
	body {
		/*font-family: 'Jeju Gothic';*/
		background-size: cover;
		background-image: url("/innerpeace_myBatis/resources/livingroom.png");
 		padding-top: 5en;
 		display: flex;
 		justify-content: center;
	}
</style>
<script>
	//confirm pwd
 function checkPwd(){
        var f1 = document.forms[0];
        var pw1 = f1.pwd.value;
        var pw2 = f1.confirmPwd.value;
        if(pw1!=pw2){
         document.getElementById('checkPwd').style.color = "red";
         document.getElementById('checkPwd').innerHTML = "동일한 암호를 입력하세요."; 
        }else{
         document.getElementById('checkPwd').style.color = "black";
         document.getElementById('checkPwd').innerHTML = "암호가 확인 되었습니다."; 
         
        }
        
       }
	
	
	//id duplicate
	function check(){
		if(!document.joinForm.id.value){
			alert("ID를 입력하세요");
			return false;
		}
	}
	function confirmId(){
		if(document.joinForm.id.value == ""){
			alert("ID를 입력하세요");
			return;
		}
		url = "/innerpeace_myBatis/members/confirmId.jsp?id=" + document.joinForm.id.value;
		open(url, "confirm", "toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
	}
	
</script>

<body>

<!-- signup Form -->
<div class="w3-container w3-half" style="width:40%;">
  <ul class="w3-ul w3-hover-shadow">
  <li class="w3-amber w3-xlarge w3-center w3-padding-32" style="color: black;">innerpeace 회원 가입</li>
	<form class="w3-container w3-transparent" action="joinSuccess" method="post" name="joinForm" onSubmit="return check()">
		<%-- <input type="hidden" name="id" value="${info.id }">
		<input type="hidden" name="id" value="${info.name }"> --%>
		
		<!-- 기본정보 -->
			<p>
			<label class="w3-text-white">
			이름 :<input class="w3-input w3-border w3-light-grey" type="text" name="name" size="20" required="required">
			</label><br>
			<label class="w3-text-white">
			아이디 :&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="중복확인" name="confirm_id" onClick="confirmId(this.form)"/>
			<input class="w3-input w3-border w3-light-grey" type="text" name="id" size="20"  required="required"></label>
			<br>
			<label class="w3-text-white">
			비밀번호 :<input class="w3-input w3-border  w3-light-grey" type="password" name="pwd" size="20" required="required"></label><br>
			<label class="w3-text-white">
			비밀번호 확인 :<input class="w3-input w3-border  w3-light-grey" type="password" name="confirmPwd" size="20" onkeyup="checkPwd()" required="required"></label>
			<div id="checkPwd"></div><br>
			<label class="w3-text-white">
			성별 : <input type="radio" name="gender" value="male" required="required">남
				 <input type="radio" name="gender" value="female" required="required">여</label><br><br>
			<label class="w3-text-white">
			생년월일 :<input class="w3-input w3-border w3-light-grey" type="date" name="birthdate" size="20" required="required"></label>
			</p>
				
		<!-- 연락처 -->
			<p>
			<label class="w3-text-white">
			전화번호 :<input class="w3-input w3-border w3-light-grey" type="tel" name="tel" size="20" required="required">
			</label><br>
			<label class="w3-text-white">
			이메일:<input class="w3-input w3-border w3-light-grey" type="email" name="email" size="20">
			</label>
			</p>
			
		<!-- 과거진료이력 -->
			<p>
			<label class="w3-text-white">
			과거에 상담 혹은 진료를 받은 적이 있습니까?<br>
			<input type="radio" name="con_past" value="있다" required="required">있다
			<input type="radio" name="con_past" value="없다" required="required">없다
			</label><br><br>
	        <label class="w3-text-white">
			있다면 가장 최근 상담/진료 받으신 날짜를 알려주세요<br>
			<input class="w3-input w3-border w3-light-grey"  type="date" name="con_date" size="20">
			</label><br>
			<label class="w3-text-white">
			상담받으신 내용을 간단히 알려주세요<br>
			<input class="w3-input w3-border w3-light-grey"  type="text" name="con_cat" size="20">
			</label><br>					
			<label class="w3-text-white">
			분류 : <input type="radio" name="position" value="patient" required="required">일반인
				 <input type="radio" name="position" value="doc" required="required">의료진</label>
			</p>
			
			<p>
			<label>
			<input class="w3-button w3-amber w3-round" type="submit" value="작성완료"><!-- &nbsp;&nbsp; -->
			<input class="w3-button w3-amber w3-round" type="reset" value="다시작성">
			<input class="w3-button w3-amber w3-round" type="button" value="취소" onclick="window.location.href='/innerpeace_myBatis/member/index'">
			</label></p>
	</ul>
	</div>
	</form>
</body>
</html> 
