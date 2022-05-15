<%@page import="com.board.dao.BoardDao"%>
<%@page import="com.board.dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.security.KeyStore.ProtectionParameter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div>
	<table>
		<tr>
			<th id="num">번호</th>
			<th id="title">제목</th>
			<th id="writer">작성자</th>
			<th id="regtime">작성일시</th>
			<th id="hits">조회수</th>
		</tr>
	<%
		ArrayList<BoardDto> list = new BoardDao().list();
	
		for(BoardDto dto : list){
	%>			
			<tr>
				<td><%=dto.getNum() %></td>
				<td><a href="view.jsp?num=<%=dto.getNum() %>"><%=dto.getTitle() %></a></td>
				<td><%=dto.getWriter()%></td>
				<td><%=dto.getRegtime() %></td>
				<td><%=dto.getHits()%></td>
			</tr>
	<%	
		}
	%>		
	</table>
	<br>
	<input type="button" value="글쓰기" onclick="location.href='write.jsp'">
</div>	
</body>
</html>