<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
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
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	//String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	BoardDto dto = new BoardDto();
	
	dto.setTitle(title);
	dto.setWriter((String)session.getAttribute("id"));
	dto.setContent(content);
	
	new BoardDao().insert(dto);
	
	response.sendRedirect("list.jsp");
%>
</body>
</html>