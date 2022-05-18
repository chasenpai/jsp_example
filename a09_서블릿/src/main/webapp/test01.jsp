<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="forward" method="get">
	<input type="text" name="name" placeholder="이름">
	<input type="submit" value="포워드로 전송">
</form>
<br>
<form action="redirect" method="get">
	<input type="text" name="name" placeholder="이름">
	<input type="submit" value="리다이렉트로 전송">
</form>

	
</body>
</html>