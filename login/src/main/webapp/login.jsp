<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden">
	<form action="loginCheck" method="post">
		아이디: <input type="text" name="id" value=""><br>
		비밀번호: <input type="password" name="pwd" value=""><br>
		<input type="submit" value="로그인" >
		<input type="button" value="회원가입" onclick="location.href='join.jsp'"><br>
		<input type="button" value="아이디 찾기" onclick="location.href='search.jsp'">
		<input type="button" value="비밀번호 찾기" onclick="location.href='search.jsp'">
		<h1>${id }</h1>
	</form>
	<c:if test="${result == 0 || result == -1 }">
		<script>
			alert("아이디 혹은 비밀번호가 틀립니다.")
		</script>
	</c:if>
</body>
</html>