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
	if(session.getAttribute("userId") != null){	

%>
	<form action="sessionLogout.jsp" method="post">
		<%=session.getAttribute("userName") %>님 로그인 <br>
		<input type="submit" value="로그아웃">
	</form>
<%
	}else{
		
%>
	
	<form action="sessionLogin.jsp" method="post">
		아이디: <input type="text" name="id"><br>
		비밀번호: <input type="password" name="pwd"><br>
		<input type="submit" value="로그인">
	</form>
	
<%
	}
%>
</body>
</html>