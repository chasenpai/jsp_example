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
	String userId = null;

	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie cookie : cookies){
			if(cookie.getName().equals("userId")){
				userId = cookie.getValue();
				break;
			}
		}
	}
	
	if(userId != null){
%>
	<form action="cookieLogout.jsp" method="post">
		<%=userId %>님 로그인
		<input type="submit" value="로그아웃">
	</form>
<%

	}else{
		
%>	

	<form action="cookieLogin.jsp">
		아이디: <input type="text" name="id"><br>
		비밀번호: <input type="password" name="pwd"><br>
		<input type="submit" value="로그인">
	</form>

<%

	}
	
%>

</body>
</html>