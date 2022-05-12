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

	div{
		width: 600px;
		margin: 200px auto;
	}
	
	table{
		width: 600px;
		text-align: center;
		
	}
	
	th{
		background-color: aliceblue;
	}
	
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
		
	}

</style>
</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	String writer = null;
	String title = null;
	String content = null;
	String regtime = null;
	int hits = 0;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String query1 = "select * from boardEx where num=?";
	String query2 = "update boardEx set hits= hits+1 where num=?";
	
	Class.forName("org.mariadb.jdbc.Driver");
	
	try{
		conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/jspdb", "jsp", "1234");
		pstmt = conn.prepareStatement(query1);
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();

		if(rs.next()){
			writer = rs.getString("writer");
			title = rs.getString("title");
			content = rs.getString("content");
			regtime = rs.getString("regtime");
			hits = rs.getInt("hits");
			
			
			pstmt.close();
			
			pstmt = conn.prepareStatement(query2);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
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
<div>
	<table>
		<tr>
			<th>제목</th>
			<td><%=title %></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><%=writer %></td>
		</tr>
		<tr>
			<th>작성일시</th>
			<td><%=regtime %></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=hits %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=content %></td>
		</tr>
	</table>
	<br>
	<input type="button" value="뒤로가기" onclick="location.href='list.jsp'">
	<input type="button" value="수정하기" onclick="location.href='write.jsp?num=<%=num %>'">
	<input type="button" value="삭제하기" onclick="location.href='delete.jsp?num=<%=num %>'">
</div>
</body>
</html>