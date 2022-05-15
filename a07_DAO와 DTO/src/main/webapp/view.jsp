<%@page import="com.board.dao.BoardDao"%>
<%@page import="com.board.dto.BoardDto"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	div{
		width: 600px;
		margin: 200px auto;
	}
	
	table{
		width: 600px;
		text-align: center;
		
	}
	
	th{
		background-color: aliceblue;
	}
	
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		
	}

</style>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	BoardDto dto = new BoardDao().view(num, true);
	
%>
<div>
	<table>
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle()%></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=dto.getWriter() %></td>
		</tr>
		<tr>
			<th>작성일시</th>
			<td><%=dto.getRegtime() %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=dto.getHits() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=dto.getContent() %></td>
		</tr>
	</table>
	<br>
	<input type="button" value="뒤로가기" onclick="location.href='list.jsp'">
	<input type="button" value="수정하기" onclick="location.href='write.jsp?num=<%=num %>'">
	<input type="button" value="삭제하기" onclick="location.href='delete.jsp?num=<%=num %>'">
</div>
</body>
</html>