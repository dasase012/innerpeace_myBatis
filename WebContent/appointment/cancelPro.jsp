<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>���� ���</title>
</head>
<body>
	<c:if test="${check == 1}">
 		<script language="JavaScript">
		alert("�����Ͻ� ���������� ��ҵǾ����ϴ�.")
		</script>
 		<meta http-equiv="Refresh" content="1;url=/innerpeace_aaa/member/apptlist?id=${id}&pageNum=${pageNum}">	
	</c:if>
	<c:if test="${check != 1}">
		<script>
		alert("�α����� �ʿ��մϴ�.")
		history.go(-1);</script>
	</c:if>
</body>
</html>