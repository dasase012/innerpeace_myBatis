<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>Insert title here</title></head>
<body>

<meta http-equiv="Refresh" content="0;url=/innerpeace_aaa/member/home?id=${id}&pageNum=${pageNum}">
	<c:if test="${chk == 1}">
		<script>
		alert("ȸ�������� �����Ǿ����ϴ�.")</script>
	</c:if>
	<c:if test="${chk != 1}">
		<script>
		alert("��й�ȣ�� ���� �ʽ��ϴ�")
		history.go(-1);</script>
	</c:if>
</body>
</html>