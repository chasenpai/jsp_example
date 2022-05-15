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
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	
	if(title == null || title.length() == 0 || writer == null || writer.length() == 0 || content == null || content.length() == 0){
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
	
	String query = "insert into boardEx values (num, ?, ?, ?, now(), 0)";
	
	Class.forName("org.mariadb.jdbc.Driver");
	
	try{
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/jspdb", "jsp", "1234");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, title);
		pstmt.setString(2, writer);
		pstmt.setString(3, content);
		pstmt.executeUpdate();
		
	
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(pstmt != null){
				pstmt.close();
			}
			if(conn != null){
				conn.close();
			}
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	
	response.sendRedirect("list.jsp");
%>
</body>
</html>