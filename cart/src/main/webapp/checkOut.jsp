<%@page import="java.util.ArrayList"%>
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
	ArrayList list = (ArrayList)session.getAttribute("key");
	for(int i = 0; i < list.size(); i++){
		out.println(list.get(i) + "\n");
	}
%>
</body>
</html>