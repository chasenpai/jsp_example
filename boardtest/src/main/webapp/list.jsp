<%@page import="test.board.dao.BoardDao"%>
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
		width: 700px;
		margin: 200px auto;
	}

	table{
		width: 700px;
		text-align: center;
	}
	
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		
	}
	
	th{
		background-color: aliceblue;
	}
	
	#num{
		width: 80px;
	}
	#title{
		width: 220px;
	}
	#writer{
		width: 100px;
	}
	#regtime{
		width: 220px;
	}
	#hits{
		width: 80px;
	}
</style>
</head>
<body>
<%
	request.setAttribute("boardList", new BoardDao().list());
%>
	<div>
	<h3>${id } 님 로그인</h3>
		<table>
			<tr>
				<th id="num">번호</th>
				<th id="title">제목</th>
				<th id="writer">작성자</th>
			</tr>
			
			<c:forEach var="board" items="${boardList }">
				<tr>
					<td>${board.num }</td>
					<td><a href="view.jsp?num=${board.num }">${board.title }</a></td>
					<td>${board.writer }</td>
				</tr>
			</c:forEach>
			
		</table>
		<br>
		<input type="button" value="글쓰기" onclick="location.href='write.jsp'">
		<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
	</div>
</body>
</html>