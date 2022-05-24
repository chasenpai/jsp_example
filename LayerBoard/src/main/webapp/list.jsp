<%@page import="board.dao.BoardDao"%>
<%@page import="board.dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.security.KeyStore.ProtectionParameter"%>
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
	.title2{
		text-align: left;
	}
</style>
</head>
<%
	request.setAttribute("boardList", new BoardDao().list());
%>
<body>

<div>
	<table>
		<tr>
			<th id="num">번호</th>
			<th id="title">제목</th>
			<th id="writer">작성자</th>
			<th id="regtime">작성일시</th>
		</tr>
		
		<c:forEach var="board" items="${boardList }">
			<tr>
				<td>${board.num }</td>
				<c:choose>
					<c:when test="${board.parentNum > 0 }">
						<td class="title2"><a href="view.jsp?num=${board.num }"><span style="padding-left:30px;">${board.title }</span></a></td>
					</c:when>
					<c:otherwise>
						<td class="title2"><a href="view.jsp?num=${board.num }">${board.title }</a></td>
					</c:otherwise>
				</c:choose>
				<td>${board.writer }</td>
				<td>${board.regdate }</td>
			</tr>
		</c:forEach>
		
		
	</table>
	<br>
	<input type="button" value="글쓰기" onclick="location.href='write.jsp'">
</div>	
</body>
</html>