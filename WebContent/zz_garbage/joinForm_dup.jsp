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
         document.getElementById('checkPwd').innerHTML = "������ ��ȣ�� �Է��ϼ���."; 
        }else{
         document.getElementById('checkPwd').style.color = "black";
         document.getElementById('checkPwd').innerHTML = "��ȣ�� Ȯ�� �Ǿ����ϴ�."; 
         
        }
        
       }
	
	
	//id duplicate
		// ȸ������ ȭ���� �Է°����� �˻��Ѵ�.
        function checkValue()
        {
            var form = document.userInfo;
        
            if(!form.id.value){
                alert("���̵� �Է��ϼ���.");
                return false;
            }
            
            if(form.idDuplication.value != "idCheck"){
                alert("���̵� �ߺ�üũ�� ���ּ���.");
                return false;
            }
        }
      // ���̵� �ߺ�üũ ȭ��open
        function openIdChk(){
        
            window.name = "parentForm";
            window.open("/innerpeace_aaa/members/IdCheck.jsp",
                    "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
        }
 
        // ���̵� �Է�â�� �� �Է½� hidden�� idUncheck�� �����Ѵ�.
        // �̷��� �ϴ� ������ �ߺ�üũ �� �ٽ� ���̵� â�� ���ο� ���̵� �Է����� ��
        // �ٽ� �ߺ�üũ�� �ϵ��� �Ѵ�.
        function inputIdChk(){
            document.userInfo.idDuplication.value ="idUncheck";
        }

</script>

<body>

<!-- signup Form -->
<div class="w3-container w3-half" style="width:40%;">
  <ul class="w3-ul w3-hover-shadow">
  <li class="w3-teal w3-xlarge w3-center w3-padding-32" style="color: black;">innerpeace ȸ�� ����</li>
	<form class="w3-container w3-transparent" action="joinSuccess" onsubmit="return checkValue()" method="post">
		<%-- <input type="hidden" name="id" value="${info.id }">
		<input type="hidden" name="id" value="${info.name }"> --%>
		
		<!-- �⺻���� -->
			<p>
			<label class="w3-text-white">
			�̸� :<input class="w3-input w3-border w3-light-grey" type="text" name="name" size="20" required="required">
			</label><br>
			<label class="w3-text-white">
			���̵� :<input class="w3-input w3-border w3-light-grey" type="text" name="id" size="20" onkeydown="inputIdChk()" required="required"></label><br>
				 <input type="button" value="�ߺ�Ȯ��" onclick="openIdChk()">    
	             <input type="hidden" name="idDuplication" value="idUncheck" >
			<label class="w3-text-white">
			��й�ȣ :<input class="w3-input w3-border  w3-light-grey"  type="password" name="pwd" size="20" required="required"></label><br>
			<label class="w3-text-white">
			��й�ȣ Ȯ�� :<input class="w3-input w3-border  w3-light-grey" type="password" name="confirmPwd" size="20" onkeyup="checkPwd()" required="required"></label><br>
			<div id="checkPwd"></div>
			<label class="w3-text-white">
			���� : <input type="radio" name="gender" value="male" required="required">��
				 <input type="radio" name="gender" value="female" required="required">��</label><br><br>
			<label class="w3-text-white">
			������� :<input class="w3-input w3-border w3-light-grey" type="date" name="birthdate" size="20" required="required"></label>
			</p>
				
		<!-- ����ó -->
			<p>
			<label class="w3-text-white">
			��ȭ��ȣ :<input class="w3-input w3-border w3-light-grey" type="tel" name="tel" size="20" required="required">
			</label><br>
			<label class="w3-text-white">
			�̸���:<input class="w3-input w3-border w3-light-grey" type="email" name="email" size="20">
			</label>
			</p>
			
		<!-- ���������̷� -->
			<p>
			<label class="w3-text-white">
			���ſ� ��� Ȥ�� ���Ḧ ���� ���� �ֽ��ϱ�?<br>
			<input type="radio" name="con_past" value="�ִ�" required="required">�ִ�
			<input type="radio" name="con_past" value="����" required="required">����
			</label><br><br>
	        <label class="w3-text-white">
			�ִٸ� ���� �ֱ� ���/���� ������ ��¥�� �˷��ּ���<br>
			<input class="w3-input w3-border w3-light-grey"  type="date" name="con_date" size="20">
			</label><br>
			<label class="w3-text-white">
			�������� ������ ������ �˷��ּ���<br>
			<input class="w3-input w3-border w3-light-grey"  type="text" name="con_cat" size="20">
			</label><br>					
			<label class="w3-text-white">
			�з� : <input type="radio" name="position" value="patient" required="required">�Ϲ���
				 <input type="radio" name="position" value="doc" required="required">�Ƿ���</label>
			</p>
			
			<p>
			<label>
			<input type="submit" value="�ۼ��Ϸ�"><!-- &nbsp;&nbsp; -->
			<input type="reset" value="�ٽ��ۼ�">
			<input type="button" value="���" onclick="window.location.href='/innerpeace_aaa/member/index'">
			</label></p>
	</ul>
	</div>
	</form>
</body>
</html> 
