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
	request.setAttribute("score", 80);
%>

점수 : ${score }<br>
점수 + 10 : ${score + 10 }<br>
점수 - 10 : ${score - 10 }<br>
점수 = 80 : ${score == 80 }
</body>
</html>