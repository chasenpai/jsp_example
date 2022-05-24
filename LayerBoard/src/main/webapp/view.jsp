<%@page import="board.dao.BoardDao"%>
<%@page import="board.dto.BoardDto"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	img{
		width:300px;
	}
	

</style>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	BoardDto dto = new BoardDao().view(num);
	
	dto.setTitle(dto.getTitle().replace(" ", "&nbsp;"));
	dto.setContent(dto.getContent().replace(" ", "&nbsp;").replace("\n", "<br>"));
	
	request.setAttribute("board", dto);
%>
<div>
	<table>
		<tr>
			<th>제목</th>
			<td>${board.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.writer }</td>
		</tr>
		<tr>
			<th>작성일시</th>
			<td>${board.regdate }</td>
		</tr>
		<c:choose>
			<c:when test="${board.imageName != null }">
				<tr>
					<th>이미지</th>
					<td><img src="files/${board.imageName }"/></td>		
				</tr>
			</c:when>
		</c:choose>
		<tr>
			<th>내용</th>
			<td>${board.content }</td>
		</tr>
	</table>
	<br>
	<input type="button" value="뒤로가기" onclick="location.href='list.jsp'">
	<input type="button" value="답글달기" onclick="location.href='writeReply.jsp?num=${board.num}'">
</div>
</body>
</html>