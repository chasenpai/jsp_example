<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
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
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	int check = 0;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String query = "select count(*) from memberEx where userId=? and userPwd=?";
	
	Class.forName("org.mariadb.jdbc.Driver");
	
	try{
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/jspdb", "jsp", "1234");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userId);
		pstmt.setString(2, userPwd);
		rs = pstmt.executeQuery();
		
		rs.next();
		check = rs.getInt(1);
		
		if(check == 1){
			session.setAttribute("userId", userId);
			
			response.sendRedirect("main.jsp");
			return;
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(rs != null){
				rs.close();
			}
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

%>
<script>
	alert('아이디 또는 비밀번호를 확인해주세요.');
	history.back();
</script>
</body>
</html>