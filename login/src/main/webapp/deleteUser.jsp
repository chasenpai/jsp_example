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
<form action="delete" method="post">
<input type="hidden" name="id" value="${id }">
비밀번호를 입력하세요 <input type="password" name="pwd">
<input type="submit" value="회원탈퇴하기">
</form>
<c:if test="${result == 0 || result == -1 }">
		<script>
			alert("비밀번호를 확인해주세요.")
		</script>
	</c:if>
</body>
</html>