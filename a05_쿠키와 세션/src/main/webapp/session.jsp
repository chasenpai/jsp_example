<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	session.setAttribute("userId", "gildong");
	out.println("userId에 저장된 값: " + session.getAttribute("userId"));
	session.setMaxInactiveInterval(60*60*1);
	
	session.removeAttribute("userId");
%>
</body>
</html>