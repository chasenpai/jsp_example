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
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String userName = request.getParameter("userName");
	int check = 0;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String query1 = "select count(*) from memberEx where userId=?";
	String query2 = "insert into memberex values(num, ?, ?, ?)";
	
	Class.forName("org.mariadb.jdbc.Driver");
	
	try{
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/jspdb", "jsp", "1234");
		pstmt = conn.prepareStatement(query1);
		pstmt.setString(1, userId);
		rs = pstmt.executeQuery();
		
		rs.next();
		check = rs.getInt(1);
		
		if(check == 1){
%>
		<script>
			alert('이미 사용중인 아이디입니다.');
			history.back();
		</script>
<% 		
			
			pstmt.close();
		}
		
		if(check == 0){
			pstmt = conn.prepareStatement(query2);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			pstmt.setString(3, userName);
			pstmt.executeUpdate();
%>
		<script>
			alert('회원가입 완료');
			window.location.href="loginForm.jsp";
		</script>
<%	
			//response.sendRedirect("loginForm.jsp");
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
</body>
</html>