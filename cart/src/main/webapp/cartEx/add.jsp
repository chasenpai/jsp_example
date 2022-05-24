<%@page import="cart.dao.CartDao"%>
<%@page import="cart.dto.CartDto"%>
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
	request.setCharacterEncoding("utf-8");
	
	int productNum = Integer.parseInt(request.getParameter("productNum"));
	
	CartDto dto = new CartDto();
	
	dto.setProductNum(productNum);
	
	new CartDao().add(dto);
	
%>
<script>
	alert('추가되었습니다.');
	history.back();
</script>
</body>
</html>