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
	out.println(session.getAttribute("userId"));
	
	session.removeAttribute("userId");
	out.println(session.getAttribute("userId"));
%>
</body>
</html>