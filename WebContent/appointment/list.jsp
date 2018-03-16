<%@ page import="member2.JoinDataBean" %>
<%@ page import="member2.JoinDBBean" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head><title>Insert title here</title>

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


	<p class="w3-left" style="padding-left: 30px"></p>
<div class="w3-container" style="margin-top: 80px; width: 1000px;">
<!-- <p class="w3-right w3-padding-right-large">
	<a href="/innerpeace_aaa/member/home">������������ ����</a></p> -->
	
	<c:if test="${count==0 }">
	<table class="table-bordered w3-display-topmiddle" style="margin-top: 10%;" width="700">
		<tr class="w3-grey">
			<td align="center">����� ���� ������ �����ϴ�.</td>
	</table>
	</c:if>
	<c:if test="${count!=0}">
	<table class="w3-table-all" width="60%" style="margin-left:45%;">
		<h3 style=" margin-top: 30px; margin-left: 90%;"><b><u>My ����</u></b></h3>
		<tr class="w3-amber">
		<!-- <td align="center" width="50">��ȣ</td> -->
		<td align="center" width="100"><b>������</b></td>
		<td align="center" width="100"><b>��纴��</b></td>
		<td align="center" width="60"><b>���Ό����1</b></td>
		<td align="center" width="60"><b>���Ό����2</b></td>
		<td align="center" width="30"><b>�������</b></td>
	
	<c:forEach var="records" items="${apptList}">
		<tr height="30">
		<%-- <td align="center" width="50">${num}</td>
		<c:set var="num" value="${num-1}"/>  --%>
		<td align="center" width="50">${records.con_cat}</td>
			<td align="center" width="50">${records.doc}</td>
			<td align="center" width="100">${records.appt_date1}</td>
			<td align="center" width="100">${records.appt_date2}</td>
			<td align="center" width="50">
				<input type="button" value="�������" 
			onclick="document.location.href='apptCancel?num=${records.num}'">
			</td>
			</tr><!-- </a> --></c:forEach>	</table> </c:if>

<div class="w3-center">
	
	<%-- <c:if test="${count>0}">			
		<c:if test="${startPage>bottomLine}">
		<a href="apptlist?pageNum=${startPage-bottomLine}">[����]</a>
		</c:if>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}">	
		<a href="apptlist?pageNum=${i}">
		<c:if test="${i!=currentPage }">[${i}]</c:if>
		<c:if test="${i==currentPage }">
		<font color='red'>[${i }]</font></c:if></a>
		</c:forEach>
		
		<c:if test="${endPage<pageCount }">
		<a href="apptlist?pageNum=${startPage+bottomLine}">[����]</a>
		</c:if></c:if> --%>
</div>
</div>
	<!-- footer contact admin -->
	<%@ include file="/mainhome/footer.jsp" %>
</body>
</html>