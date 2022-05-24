<%@page import="cart.dao.ProductDao"%>
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
	
	#productNum{
		width: 80px;
	}
	#productName{
		width: 200px;
	}
	#price{
		width: 150px;
	}
	#company{
		width: 150px;
	}
	#category{
		width: 150px;
	}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	session.setAttribute("id", id);
	
	request.setAttribute("productList", new ProductDao().list());
%>
	<div>
		<h3>${id }님 로그인</h3>
		<table>
			<tr>
				<th id="productNum">번호</th>
				<th id="productName">제품명</th>
				<th id="price">가격</th>
				<th id="company">제조사</th>
				<th id="category">카테고리</th>
			</tr>
			
			<c:forEach var="product" items="${productList }">
				<tr>
					<td>${product.productNum }</td>
					<td><a href="productView.jsp?num=${product.productNum }">${product.productName }</a></td>
					<td>${product.price }</td>
					<td>${product.company }</td>
					<td>${product.category }</td>		
				</tr>
			</c:forEach>
		</table>
		<br>
	</div>	
</body>
</html>