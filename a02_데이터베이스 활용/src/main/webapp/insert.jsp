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
	Connection conn = null;
	PreparedStatement pstmt = null;
	String query = "insert into person values(?, ?, ?, ?)";
	
	Class.forName("org.mariadb.jdbc.Driver");
	try{
		conn = DriverManager.getConnection(
				"jdbc:mariadb://localhost:3306/jspdb", "jsp", "1234");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, 1);
		pstmt.setString(2, "홍길동");
		pstmt.setInt(3, 25);
		pstmt.setString(4, "서울특별시");
		pstmt.executeUpdate();
		
		out.print("레코드 추가 완료");
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
%>
</body>
</html>