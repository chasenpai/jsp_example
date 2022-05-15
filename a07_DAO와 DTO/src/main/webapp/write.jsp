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
	
	input[type="text"], textarea{
		width: 97%;
		border: 0px;
	}
	
</style>
</head>
<body>
<%
	String tmp = request.getParameter("num");
	int num = 0;	

	if(tmp != null && tmp.length() > 0){
		num = Integer.parseInt(tmp);
	}
	
	String title = "";
	String writer = "";
	String content = "";
	String action = "insert.jsp";
	
	if(num > 0){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from boardEx where num=?";
		
		Class.forName("org.mariadb.jdbc.Driver");
		
		try{
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/jspdb", "jsp", "1234");
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				title = rs.getString("title");
				writer = rs.getString("writer");
				content = rs.getString("content");
				
				action = "update.jsp?num=" + num;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs != null){
				rs.close();
			}
			if(pstmt != null){
				pstmt.close();
			}
			if(conn != null){
				conn.close();
			}
		}
	}
	
%>
<div>
	<form action="<%=action %>" method="post">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="<%=title%>"></td>
			</tr>
			<tr>
				<th>작성자</th>
<%
				if(action == "insert.jsp"){
%>	
				<td><input type="text" name="writer" value="<%=writer%>"></td>
<%					
				}else{
%>					
				<td><input type="text" name="writer" value="<%=writer%>" readonly></td>
<%					
				}
%>			
				
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" rows="10" cols="20"><%=content%></textarea></td>
			</tr>
		</table>
		<br>
		<input type="submit" value="저장">
		<input type="button" value="취소" onclick="history.back()">
	</form>
</div>	
</body>
</html>