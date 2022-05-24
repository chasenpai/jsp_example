<%@page import="cart.dao.ProductDao"%>
<%@page import="cart.dto.ProductDto"%>
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
	
	.productNum{
		width: 100px;
	}
	.productName{
		width: 100px;
	}
	.price{
		width:100px;
	}
	.company{
		width:100px;
	}
	.categroy{
		width:100px;
	}
	
	td{
		width: 300px;
	}

</style>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	ProductDto dto = new ProductDao().view(num);

	request.setAttribute("product", dto);
%>
<div>
	<h3>${id }</h3>
	<table>
		<tr>
			<th class="productNum">제품번호</th>
			<td>${product.productNum }</td>
		</tr>
		<tr>
			<th class="productName">제품명</th>
			<td>${product.productName }</td>
		</tr>
		<tr>
			<th class="price">가격</th>
			<td>${product.price }</td>
		</tr>
		<tr>
			<th class="company">제조사</th>
			<td>${product.company }</td>
		</tr>
		<tr>
			<th class="category">카테고리</th>
			<td>${product.category }</td>
		</tr>
		<c:if test="${id != null }">
		<tr>
			<td colspan="2" align="center">
			<form action="add.jsp?productNum=${product.productNum }" method="post">
				<input type="submit"value="담기">
			</form>
			</td>
		</tr>
		</c:if>
		
	</table>
	<br>
	
</div>
</body>
</html>