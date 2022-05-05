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
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String query = "select * from person";
	
	Class.forName("org.mariadb.jdbc.Driver");
	
	try{
		conn = DriverManager.getConnection(
				"jdbc:mariadb://localhost:3306/jspdb", "jsp", "1234");
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
%>
		번호: <%=rs.getInt("num") %><br>		
		이름: <%=rs.getString("name") %><br>
		나이: <%=rs.getInt("age") %><br>
		주소: <%=rs.getString("address") %>
<%
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