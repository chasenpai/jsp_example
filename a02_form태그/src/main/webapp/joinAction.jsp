<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<form >
	<table>
		<caption>회원정보</caption>
		<tr>
			<td>ID</td>
			<td><%=request.getParameter("id") %></td>
		</tr>
		<tr>
			<td>PW</td>
			<td><%=request.getParameter("pwd") %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=request.getParameter("name") %></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><%=request.getParameter("gender") %></td>
		</tr>
		<tr>
			<td>가입경로</td>
			<td><%=request.getParameter("path") %></td>
		</tr>
		
		<tr>
			<td>관심분야</td>
			<td>
				<%String[] field = request.getParameterValues("field"); 
				for(String f : field){
					out.print(f + " ");
				}
				%>
			</td>
		</tr>
	</table>
</form>
</body>
</html>