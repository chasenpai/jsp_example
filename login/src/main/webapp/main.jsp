<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="logout" method="post">
	<h1>${id }님 환영합니다.
	</h1>
	<input type="submit" value="로그아웃"><br>
	<a href="userInfo?id=${id }"><input type="button" value="내정보"></a>
</form>
</body>

</html>