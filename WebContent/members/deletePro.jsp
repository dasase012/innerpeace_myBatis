<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>ȸ�� Ż��</title>
</head>
<body>
	<c:if test="${check == 1}">
 		<script language="JavaScript">
		alert("Ż�� �Ϸ�Ǿ����ϴ�.")
		</script>
 		<meta http-equiv="Refresh" content="0;url=/innerpeace_aaa/member/index">	
	</c:if> 
	<c:if test="${check != 1}">
		<script>
		alert("��й�ȣ�� ���� �ʽ��ϴ�")
		history.go(-1);</script>
	</c:if>

</body>
</html>