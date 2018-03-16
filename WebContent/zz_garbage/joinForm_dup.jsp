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
		font-family: 'Jeju Gothic', sans-serif;
		background-size: cover;
		background-image: url("/innerpeace_aaa/resources/signupimg.jpg");
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
		// 회원가입 화면의 입력값들을 검사한다.
        function checkValue()
        {
            var form = document.userInfo;
        
            if(!form.id.value){
                alert("아이디를 입력하세요.");
                return false;
            }
            
            if(form.idDuplication.value != "idCheck"){
                alert("아이디 중복체크를 해주세요.");
                return false;
            }
        }
      // 아이디 중복체크 화면open
        function openIdChk(){
        
            window.name = "parentForm";
            window.open("/innerpeace_aaa/members/IdCheck.jsp",
                    "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
        }
 
        // 아이디 입력창에 값 입력시 hidden에 idUncheck를 세팅한다.
        // 이렇게 하는 이유는 중복체크 후 다시 아이디 창이 새로운 아이디를 입력했을 때
        // 다시 중복체크를 하도록 한다.
        function inputIdChk(){
            document.userInfo.idDuplication.value ="idUncheck";
        }

</script>

<body>

<!-- signup Form -->
<div class="w3-container w3-half" style="width:40%;">
  <ul class="w3-ul w3-hover-shadow">
  <li class="w3-teal w3-xlarge w3-center w3-padding-32" style="color: black;">innerpeace 회원 가입</li>
	<form class="w3-container w3-transparent" action="joinSuccess" onsubmit="return checkValue()" method="post">
		<%-- <input type="hidden" name="id" value="${info.id }">
		<input type="hidden" name="id" value="${info.name }"> --%>
		
		<!-- 기본정보 -->
			<p>
			<label class="w3-text-white">
			이름 :<input class="w3-input w3-border w3-light-grey" type="text" name="name" size="20" required="required">
			</label><br>
			<label class="w3-text-white">
			아이디 :<input class="w3-input w3-border w3-light-grey" type="text" name="id" size="20" onkeydown="inputIdChk()" required="required"></label><br>
				 <input type="button" value="중복확인" onclick="openIdChk()">    
	             <input type="hidden" name="idDuplication" value="idUncheck" >
			<label class="w3-text-white">
			비밀번호 :<input class="w3-input w3-border  w3-light-grey"  type="password" name="pwd" size="20" required="required"></label><br>
			<label class="w3-text-white">
			비밀번호 확인 :<input class="w3-input w3-border  w3-light-grey" type="password" name="confirmPwd" size="20" onkeyup="checkPwd()" required="required"></label><br>
			<div id="checkPwd"></div>
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
			<input type="submit" value="작성완료"><!-- &nbsp;&nbsp; -->
			<input type="reset" value="다시작성">
			<input type="button" value="취소" onclick="window.location.href='/innerpeace_aaa/member/index'">
			</label></p>
	</ul>
	</div>
	</form>
</body>
</html> 
