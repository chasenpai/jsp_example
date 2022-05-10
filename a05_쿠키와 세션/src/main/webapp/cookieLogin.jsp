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

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	if(id.equals("admin") && pwd.equals("1234")){
		Cookie cookie = new Cookie("userId", id);
		cookie.setMaxAge(-1); //웹 브라우저가 닫힐 때 쿠키가 만료
		response.addCookie(cookie);
		
		response.sendRedirect("cookieMain.jsp");
		return;
	}

%>
</body>
</html>