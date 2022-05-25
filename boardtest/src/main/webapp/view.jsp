<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
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
			<th>내용</th>
			<td>${board.content }</td>
		</tr>
	</table>
	<br>
	<input type="button" value="뒤로가기" onclick="location.href='list.jsp'">
	<c:choose>
		<c:when test="${board.writer == id }">
			<input type="button" value="수정하기" onclick="location.href='write.jsp?num=${param.num}>'">
			<input type="button" value="삭제하기" onclick="location.href='delete.jsp?num=${param.num}'">
		</c:when>
	</c:choose>
</div>
</body>
</html>