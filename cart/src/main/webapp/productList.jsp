<%@page import="java.util.ArrayList"%>
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
	ArrayList list = new ArrayList();
	session.setAttribute("productList", list);
%>

	<h1>상품 리스트</h1>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	session.setAttribute("id", id);
%>
	<p>${id}님이 로그인 했습니다.</p>	
	<hr>
	<form action="addCart.jsp" method="post">
		<select name="product">
			<option value="지갑">지갑</option>
			<option value="시계">시계</option>
			<option value="구두">구두</option>
			<option value="모자">모지</option>
			<option value="넥타이">넥타이</option>
		</select><br>
		<input type="submit" value="추가">
	</form>
	<p><a href="checkOut.jsp">구매하기</a></p>
</body>
</html>