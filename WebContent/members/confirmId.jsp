<%@page import="member2.JoinDBMybatis"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<%
		String id = request.getParameter("id");
		JoinDBMybatis dao = JoinDBMybatis.getInstance();
		boolean result = dao.confirmId(id);
		
		if(result){%>
		<center>
		<br/><br/>
		<h4>�̹� ������� ID�Դϴ�.</h4>
		</center>
	<%	}else{ %>
		<center>
		<br/><br/>
		<h4>�Է��Ͻ�  <%=id %>�� ����Ͻ� �� �ִ� ID�Դϴ�.</h4>
		</center>
	<% 	} %>


</body>
</html>