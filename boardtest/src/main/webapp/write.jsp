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
	
	input[type="text"], textarea{
		width: 97%;
		border: 0px;
	}
	
</style>
</head>
<body>
<%
	//request.setCharacterEncoding("uft-8");
	//String id = request.getParameter("id");

%>
<div>
	<form action="insert.jsp" method="post">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" value="${id }" readonly></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="10" cols="20"></textarea></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="저장">
		<input type="button" value="취소" onclick="history.back()">
	</form>
</div>	
</body>
</html>