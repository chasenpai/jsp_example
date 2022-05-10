<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
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
	Class.forName("org.mariadb.jdbc.Driver");
	
	try{
		conn = DriverManager.getConnection(
				"jdbc:mariadb://localhost:3306/jspdb", "jsp", "1234");
		
		out.print("DB 접속 완료");
		
	}catch(Exception e){
		e.printStackTrace();	
	}finally{
		try{
			if(conn != null){
				conn.close();
			}
		}catch(SQLException e){
			throw new RuntimeException(e);
		}
	}

%>
</body>
</html>