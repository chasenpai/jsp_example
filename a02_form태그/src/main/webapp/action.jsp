<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	이름 <%=request.getParameter("name") %><br>
	나이 <%=request.getParameter("age") %><br>
	주소 <%=request.getParameter("address") %><br>
</body>
</html>