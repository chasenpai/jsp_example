<%@page import="board.dao.BoardDao"%>
<%@page import="board.dto.BoardDto"%>
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

	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	BoardDto dto = new BoardDto();
	
	dto.setParentNum(num);
	dto.setTitle(title);
	dto.setWriter(writer);
	dto.setContent(content);
	
	new BoardDao().insertReply(dto);
	
	response.sendRedirect("list.jsp");
%>
</body>
</html>