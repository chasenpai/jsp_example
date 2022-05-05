<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.div{margin: 0 auto;
		margin-top : 300px;
		width: 350px;
		
		}
		
	h3{text-align: center;
		margin-bottom: 30px
	}
	
	a{margin-top: 10px}
		
</style>
</head>
<body>
<div class="div">
	<h3>회원 로그인</h3>
	<input type="hidden">
	<form action="loginCheck" method="post">
		<div class="input-group mb-3">
	  		<!-- <span class="input-group-text" id="basic-addon1">아이디</span> -->
	 	 	<input type="text" name="id" value="" class="form-control" placeholder="id" aria-label="ID" aria-describedby="basic-addon1">
		</div>
		<div class="input-group mb-3">
	  		<!-- <span class="input-group-text" id="basic-addon1">아이디</span> -->
	 	 	<input type="password" name="pwd" value="" class="form-control" placeholder="password" aria-label="Password" aria-describedby="basic-addon1">
		</div>
		<input type="submit" class="btn btn-primary" value="로그인" >
		<input type="button" class="btn btn-primary" value="회원가입" onclick="location.href='join.jsp'">
		<a style="float: right;" href="search.jsp">아이디/비밀번호 찾기</a>
		<!--<p style="float: right;" onclick="location.href='search.jsp'">아이디/비밀번호 찾기</p>
		<!-- <input type="button" style="float: right;"class="btn btn-primary" value=" "> -->
	</form>
</div>
	<c:if test="${result == 0 || result == -1 }">
		<script>
			alert("아이디 혹은 비밀번호가 틀립니다.")
		</script>
	</c:if>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</html>