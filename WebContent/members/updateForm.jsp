<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head><title>�Խ���</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

</head>

	<form method="post" name="updateform" action="updatePro" >
	<input type="hidden" name="id" value="${member.id}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<form class="w3-container w3-card-4 w3-white w3-text-black" style="height: 100%;">
	<div class="w3-row w3-section">
<body>
	<!-- header -->
	<%@ include file="/mainhome/header.jsp" %>
	
<center class="w3-card-4 w3-display-middle" style="margin-top:50px; width: 800; height: 600; margin-bottom: 50; top: 400px;"><p><h3><b><u>ȸ�� ����</u></b></h3></p>
<div class="container" id="info">
	<table class="w3-table w3-bordered " style="width:50%;">
	<tr height="30">
		<td width="125" align="left"><b>���̵�</b></td>
		<td width="125" align="left">${member.id}</td>
	</tr><tr height="30">	
		<td width="125"><b>�̸�</b></td>
		<td width="125">
		<input type="text" size="10" maxlength="20" name="name" value="${member.name}"></td>
	</tr>
	<tr height="30">	
		<td width="125"><b>��й�ȣ</b></td>
		<td width="125">
		<input type="password" size="10" maxlength="15" name="pwd" value="${member.pwd}"></td>
	</tr><tr height="30">			
		<td width="125"><b>����</b></td>
		<td width="125" >
		<input type="text" size="10" maxlength="10" name="gender" value="${member.gender}"></td>
	</tr><tr height="30">	
		<td width="125"><b>�������</b></td>
		<td width="125">
		<input type="text" size="10" maxlength="10" name="birthdate" value="${member.birthdate}"></td>
	</tr><tr height="30">		
		<td width="125"><b>����ó</b></td>
		<td width="125">
		<input type="text" size="20" maxlength="15" name="tel" value="${member.tel}"></td>
	</tr><tr height="30">	
		<td width="125"><b>�̸���</b></td>
		<td width="125">
		<input type="text" size="20" maxlength="40" name="email" value="${member.email}"></td>
	</tr><tr height="30">	
		<td width="125"><b>���� �������</b></td>
		<td width="125" align="center">${member.con_past}</td>
	</tr><tr height="30">	
			<td width="125"><b>�ֱ� ������</b></td>
			<td width="125" align="center">${member.con_date}</td>
	</tr><tr height="30">
			<td width="125"><b>�������</b></td>
			<td width="125" align="center">${member.con_cat}</td>
	</tr><tr height="30">	
		<td width="125"><b>����</b></td>
		<td width="125" align="center">${member.position}</td>
	</tr>
		
	<tr height="30">
		<td colspan="4"  class="w3-center">
			<input  class="w3-button w3-amber w3-round" type="submit" value="��������" >  
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input  class="w3-button w3-amber w3-round" type="button" value="Ż��" 
			onclick="document.location.href='/innerpeace_aaa/member/deleteForm?id=${member.id}&pageNum=${pageNum}'">
			&nbsp;&nbsp;&nbsp;&nbsp;
			<input  class="w3-button w3-amber w3-round" type="button" value="���" 
			onclick="document.location.href='/innerpeace_aaa/member/home'">
	</td></tr> </table></div></center>
	
	<!-- footer -->
	<%@ include file="/mainhome/footer.jsp" %>
	</body>

</div></form></form>
</body>
</html>