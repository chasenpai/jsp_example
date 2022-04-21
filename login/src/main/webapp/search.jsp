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
<h2>아이디 찾기</h2><br>
<form action="searchId" method="post">
	이름<input type="text" name="name" value=""><br>
	전화번호<input type="text" name="phone" value=""><br>
	<input type="submit" value="찾기">
</form>
<c:if test="${findId eq 'null' }">
	<script>
		alert("올바른 정보를 입력해주세요.")
	</script>
</c:if>
<c:if test="${findId eq 'find'}">
	<script>
		alert("회원님의 아이디는 <c:out value = "${userId}"/> 입니다.")
	</script>
</c:if>
<br>
<form action="searchPwd" method="post">
	<h2>비밀번호 찾기</h2>
	아이디<input type="text" name="id"><br>
	이름<input type="text" name="name"><br>
	전화번호<input type="text" name="phone"><br>
	<input type="submit" value="찾기">
</form>
<c:if test="${findPwd eq 'null'}">
	<script>
		alert("올바른 정보를 입력해주세요.")
	</script>
</c:if>
<c:if test="${findPwd eq 'find'}">
	<script>
		alert("회원님의 비밀번호는 <c:out value = "${userPwd}"/> 입니다.")
	</script>
</c:if>

<input type="button" value="뒤로가기" onclick="location.href='login'">
</body>
</html>