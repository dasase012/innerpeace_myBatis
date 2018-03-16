<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<head><title>Insert title here</title></head>
<body>

<!-- Navbar (sit on top) -->
	<%@ include file="/mainhome/header.jsp" %>




	<p class="w3-left" style="padding-left: 30px"></p>
<div class="w3-container">
	<span class="w3-center w3-large">
		<h3><b><u>��ü ȸ����:${count}</u></b></h3>
	</span>
<p class="w3-right w3-padding-right-large">
	<a href="/innerpeace_aaa/member/home">������������ ����</a></p>
	
	<c:if test="${count==0 }">
	<table class="table-bordered" width="700">
		<tr class="w3-grey">
			<td align="center">�Խ��ǿ� ����� ���� �����ϴ�.</td>
	</table>
	</c:if>
	<c:if test="${count!=0}">
	<table class="w3-table-all w3-hoverable" width="60%">
		<tr class="w3-light-green">
		<td align="center" width="50">��ȣ</td>
		<td align="center" width="50">���̵�</td>
		<td align="center" width="50">�̸�</td>
		<td align="center" width="50">����</td>
		<td align="center" width="100">������</td>
	
	<c:forEach var="member" items="${memberList}">
		<tr height="30">
		<td align="center" width="50">${number}</td>
		<c:set var="number" value="${number-1}"/>
		<td align="center" width="50"><a href="content?id=${member.id}&pageNum=${curentPage}">
			${member.id}</td>
			<td align="center" width="50">${member.name}</td>
			<td align="center" width="50">${member.gender}</td>
			<td align="center" width="100">${member.regdate}</td>
			</tr></a></c:forEach>	</table> </c:if>

<div class="w3-center">
	
	<c:if test="${count>0}">			
		<c:if test="${startPage>bottomLine}">
		<a href="list?pageNum=${startPage-bottomLine}">[����]</a>
		</c:if>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}">	
		<a href="list?pageNum=${i}">
		<c:if test="${i!=currentPage }">[${i}]</c:if>
		<c:if test="${i==currentPage }">
		<font color='red'>[${i }]</font></c:if></a>
		</c:forEach>
		
		<c:if test="${endPage<pageCount }">
		<a href="list?pageNum=${startPage+bottomLine}">[����]</a>
		</c:if></c:if>
</div>
</div>
</body>
</html>