<%@page import="ex.ScoreDto"%>
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
	ScoreDto dto = new ScoreDto();

	dto.setName("홍길동");
	dto.setKor(100);
	dto.setEng(90);
	dto.setMath(80);
	
	request.setAttribute("score", dto);
%>

	이름 : ${score.name }<br>
	국어 : ${score.kor }<br>
	영어 : ${score.eng }<br>
	수학 : ${score.math }
</body>
</html>