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
		session.setAttribute("userId", id);
		session.setAttribute("userName", "관리자");
		
		response.sendRedirect("sessionMain.jsp");
		return;
	}
%>
<script>

</script>
</body>
</html>