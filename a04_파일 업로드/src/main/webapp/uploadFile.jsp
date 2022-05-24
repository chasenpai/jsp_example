<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
	//String userName = request.getParameter("userName");
	
	

	MultipartRequest multi = new MultipartRequest(
		request,
		application.getRealPath("/files"),
		100 * 1024 * 1024,
		"utf-8",
		new DefaultFileRenamePolicy()
		);
	
	String userName = multi.getParameter("userName");
	System.out.println(userName);

	File file = multi.getFile("upload");
	
	if(file != null){
		Connection conn = null;
		PreparedStatement pstmt = null;
		String query = "insert into webhard values(num, ?, now(), ?, ?);";
		
		Class.forName("org.mariadb.jdbc.Driver");
		
		try{
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/jspdb", "jsp", "1234");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, file.getName());
			pstmt.setInt(2, (int)file.length());
			pstmt.setString(3, userName);
			pstmt.executeUpdate();
			
			response.sendRedirect("webhard.jsp");
			
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
		
	}
%>
</body>
</html>