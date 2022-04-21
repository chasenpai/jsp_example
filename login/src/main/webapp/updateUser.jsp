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
<form action="update" method="post">
	아이디: <input type = "text" name="id" value="${info.userId }" readonly="readonly"><br>
	비밀번호: <input type="text" name="pwd" value="${info.userPwd }" ><br>
	이름: <input type="text" name="name" value="${info.userName }" ><br>
	성별: <input type="text" value="${info.gender }" readonly="readonly"><br>
	나이: <input type="text" name="age" value="${info.userAge }" readonly="readonly"><br>
	전화번호: <input type="text" name="phone" value="${info.phoneNum}" ><br>
	우편번호: <input type="text" name="zipcode"  class="postcodify_postcode5" value="${info.zipcode}" ><br>
	<button type="button" id="postcodify_search_button">검색</button><br>
	주소: <input type="text" name="addr" class="postcodify_address"  value="${info.addr}" ><br>
	상세주소: <input type="text" name="addrDetail" class="postcodify_details" value="${info.addrDetail}" ><br>
	기타: <input type="text" name="addrEtc" class="postcodify_extra_info" value="${info.addrEtc}" ><br>
	<input type="submit" value="수정하기">
</form>
</body>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
</html>