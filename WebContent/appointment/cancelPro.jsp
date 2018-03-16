<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>예약 취소</title>
</head>
<body>
	<c:if test="${check == 1}">
 		<script language="JavaScript">
		alert("예약하신 진료일정이 취소되었습니다.")
		</script>
 		<meta http-equiv="Refresh" content="1;url=/innerpeace_aaa/member/apptlist?id=${id}&pageNum=${pageNum}">	
	</c:if>
	<c:if test="${check != 1}">
		<script>
		alert("로그인이 필요합니다.")
		history.go(-1);</script>
	</c:if>
</body>
</html>