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
<style>
	table{
		width: 700px;
		text-align: center;
	}
	th{
		background-color: aliceblue;
	}
</style>
</head>
<body>
<form action="uploadFile.jsp" method="post" enctype="multipart/form-data">
	작성자: <input type="text" name="userName"><br>
	업로드할 파일을 선택하세요.<br>
	<input type="file" name="upload"><br>
	<input type="submit" value="업로드">
</form>
<br>

<table>
		<tr>
			<th>작성자<th>
			<th>파일명</th>
			<th>업로드 날짜</th>
			<th>크기</th>
			<th>삭제</th>
		</tr>
	
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String query = "select * from webhard";
	
	Class.forName("org.mariadb.jdbc.Driver");
	
	try{
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/jspdb", "jsp", "1234");
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
%>			
		<tr>
			<td><%=rs.getString("userName") %></td>
			<td></td>
			<td><a href="files/<%=rs.getString("fileName")%>" ><%=rs.getString("fileName") %></a></td>
			<td><%=rs.getString("fileTime") %></td>
			<td><%=rs.getInt("fileSize") %></td>
			<td><a href="deleteFile.jsp?num=<%=rs.getInt("num")%>">X</a></td>
		</tr>
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
</table>
</body>
</html>