<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
	request.setCharacterEncoding("utf-8");

	int num = Integer.parseInt(request.getParameter("num"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	if(title == null || title.length() == 0 || content == null || content.length() == 0){
%>
		<script>
			alert('모든 항목을 입력해주세요.');
			history.back();
		</script>
<%	
		return;
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String query = "update boardEx set title=?, content=? where num=?";
	
	Class.forName("org.mariadb.jdbc.Driver");
	try{
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/jspdb", "jsp", "1234");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, title);
		pstmt.setString(2, content);
		pstmt.setInt(3, num);
		pstmt.executeQuery();
		
	} catch(Exception e){
		e.printStackTrace();
	}finally{
		if(pstmt != null){
			pstmt.close();
		}
		if(conn != null){
			conn.close();
		}
	}
	
	response.sendRedirect("view.jsp?num=" + num);
%>
</body>
</html>