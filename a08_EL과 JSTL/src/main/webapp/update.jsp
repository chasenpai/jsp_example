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

	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	if(title == null || title.length() == 0 ||  content == null || content.length() == 0){
%>
		<script>
			alert('모든 항목을 입력해주세요.');
			history.back();
		</script>
<%	
		return;
	}
	
	BoardDto dto = new BoardDto();
	
	dto.setNum(num);
	dto.setTitle(title);
	dto.setContent(content);
	
	new BoardDao().update(dto);
	
	response.sendRedirect("view.jsp?num=" + num);
%>
</body>
</html>