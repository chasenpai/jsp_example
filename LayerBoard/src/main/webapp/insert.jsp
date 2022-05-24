<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="board.dao.BoardDao"%>
<%@page import="board.dto.BoardDto"%>
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
	
	MultipartRequest multi = new MultipartRequest(
			request,
			application.getRealPath("/files"),
			100 * 1024 * 1024,
			"utf-8",
			new DefaultFileRenamePolicy()
			);

	String title = multi.getParameter("title");
	String writer = multi.getParameter("writer");
	String content = multi.getParameter("content");
	System.out.println(title);
	System.out.println(writer);
	System.out.println(content);
	
	File file = multi.getFile("upload");

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
	dto.setImageName(file.getName());
	
	new BoardDao().insert(dto);
	
	response.sendRedirect("list.jsp");
%>
</body>
</html>