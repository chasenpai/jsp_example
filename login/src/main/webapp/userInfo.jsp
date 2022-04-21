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
<form>
	아이디: <input type = "text" name="id" value="${info.userId }" readonly="readonly"><br>
	비밀번호: <input type="text" value="${info.userPwd }" readonly="readonly"><br>
	이름: <input type="text" value="${info.userName }" readonly="readonly"><br>
	성별: <input type="text" value="${info.gender }" readonly="readonly"><br>
	나이: <input type="text" value="${info.userAge }" readonly="readonly"><br>
	전화번호: <input type="text" value="${info.phoneNum}" readonly="readonly"><br>
	우편번호: <input type="text" value="${info.zipcode}" readonly="readonly"><br>
	주소: <input type="text" value="${info.addr}" readonly="readonly"><br>
	상세주소: <input type="text" value="${info.addrDetail}" readonly="readonly"><br>
	기타: <input type="text" value="${info.addrEtc}" readonly="readonly"><br>
	가입날짜 <p>${info.regDate }</p>
	
	<a href="updateInfo?id=${id }"><input type="button" value="정보수정하기"></a>
	<a href="deleteUser.jsp?id=${id }"><input type="button" value="회원탈퇴하기"></a>	
	<input type="button" value="뒤로가기" onclick="history.back()">
</form>
</body>
</html>