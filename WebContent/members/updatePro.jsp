<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>Insert title here</title></head>
<body>

<meta http-equiv="Refresh" content="0;url=/innerpeace_aaa/member/home?id=${id}&pageNum=${pageNum}">
	<c:if test="${chk == 1}">
		<script>
		alert("회원정보가 수정되었습니다.")</script>
	</c:if>
	<c:if test="${chk != 1}">
		<script>
		alert("비밀번호가 맞지 않습니다")
		history.go(-1);</script>
	</c:if>
</body>
</html>