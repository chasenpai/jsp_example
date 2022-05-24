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
	
	ArrayList<String> list = (ArrayList)session.getAttribute("productList");
	
	session.setAttribute("product", request.getParameter("product"));
	
	String selectedItem = (String)session.getAttribute("product");
	
	list.add(selectedItem);
	
	session.setAttribute("key", list);
	
%>
<script>
	alert('상품이 추가되었습니다.');
	history.go(-1);
</script>
</body>

</html>