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

<title>�̳��ǽ� ȸ������</title>

</head>

<body>
		
 <div class="w3-container w3-card-4 w3-display-middle w3-teal" style="width: 40%; height: 14%; 	">
	
		<hr width = 100% size=2 >

		<h2 align="center">innerpeace ȸ�� ����</h2>
	
		<hr width = 100% size=2 >
	</div>
	 <div class="w3-container w3-card-4 w3-display-middle" style="width: 40%; height: 50%;">
	
	
	
	<form class="w3-container w3-display-center" action="/innerpeace_aaa/member/joinSuccess" method="post">
<%-- 	<input type="hidden" name="id" value="${info.id }">
	<input type="hidden" name="name" value="${info.name }"> --%>
		<!-- �⺻���� -->
			<p>
			<label class="w3-text-teal">
			�̸� :<input class="w3-input w3-border w3-light-grey" type="text" name="name" size="20" required="required">
			</label><br>
			<label class="w3-text-teal">
			���̵� :<input class="w3-input w3-border w3-light-grey" type="text" name="id" size="20" required="required"></label><br>
			<label class="w3-text-teal">
			��й�ȣ :<input class="w3-input w3-border  w3-light-grey"  type="password" name="pwd" size="20" required="required"></label><br>
			<label class="w3-text-teal">
			��й�ȣ Ȯ�� :<input class="w3-input w3-border  w3-light-grey" type="password" name="confirmPwd" size="20" required="required"></label><br>
			<label class="w3-text-teal">
			���� : <input type="radio" name="gender" value="male" required="required">��
				 <input type="radio" name="gender" value="female" required="required">��</label><br><br>
			<label class="w3-text-teal">
			������� :<input class="w3-input w3-border w3-light-grey" type="date" name="birthdate" size="20" required="required"></label>
			</p>
				
		<!-- ����ó -->
			<p>
			<label class="w3-text-teal">
			��ȭ��ȣ :<input class="w3-input w3-border w3-light-grey" type="tel" name="tel" size="20" required="required">
			</label><br>
			<label class="w3-text-teal">
			�̸���:<input class="w3-input w3-border w3-light-grey" type="email" name="email" size="20">
			</label>
			</p>
			
		<!-- ���������̷� -->
			<p>
			<label class="w3-text-teal">
			���ſ� ��� Ȥ�� ���Ḧ ���� ���� �ֽ��ϱ�?<br>
			<input type="radio" name="con_past" value="�ִ�" required="required">�ִ�
			<input type="radio" name="con_past" value="����" required="required">����
			</label><br><br>
	        <label class="w3-text-teal">
			�ִٸ� ���� �ֱ� ���/���� ������ ��¥�� �˷��ּ���<br>
			<input class="w3-input w3-border w3-light-grey"  type="date" name="con_date" size="20">
			</label><br>
			<label class="w3-text-teal">
			�������� ������ ������ �˷��ּ���<br>
			<input class="w3-input w3-border w3-light-grey"  type="text" name="con_cat" size="20">
			</label><br>					
			<label class="w3-text-teal">
			�з� : <input type="radio" name="position" value="�Ϲ���" required="required">�Ϲ���
				 <input type="radio" name="position" value="�Ƿ���" required="required">�Ƿ���</label>
			</p>
			
			<p>
			<label>
			<input type="submit" value="�ۼ��Ϸ�"><!-- &nbsp;&nbsp; -->
			<input type="reset" value="�ٽ��ۼ�">
			<input type="button" value="���" onclick="window.location.href='/innerpeace_aaa/member/index'">
			</label></p>		
		</form>
	</div>

</body>

</html>



