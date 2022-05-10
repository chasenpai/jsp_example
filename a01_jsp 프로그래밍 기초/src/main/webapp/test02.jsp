<!-- page 지시자 -->
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 스크립틀릿 -->
<%
	out.println("오늘 날짜: " + LocalDate.now() + "<br>");
%>

<!-- 표현식 -->
<%= request.getParameter("name") %><br>

<%-- JSP 주석 --%>

<%
	/*
		여러 줄 주석
	*/
	//한줄 주석
%>
<!-- 
	HTML 영역 주석
 -->
 	
 	/*
 		일반 텍스트로 인식됨 
 	*/
 	<br>
 	//일반 텍스트로 인식됨
 	

</body>
</html>