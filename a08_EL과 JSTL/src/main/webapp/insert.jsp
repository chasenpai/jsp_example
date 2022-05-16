<%@page import="com.board.dao.BoardDao"%>
<%@page import="com.board.dto.BoardDto"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	if(title == null || title.length() == 0 || 
	   writer == null || writer.length() == 0 || 
	   content == null || content.length() == 0)
	{
%>
		<script>
			alert('모든 항목을 입력해주세요.');
			history.back();
		</script>
<%		
		return;
	}	

	BoardDto dto = new BoardDto();
	
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	
	new BoardDao().insert(dto);
	
	response.sendRedirect("list.jsp");
%>
</body>
</html>