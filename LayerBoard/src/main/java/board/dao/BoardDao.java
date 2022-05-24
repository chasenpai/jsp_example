package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import board.dto.BoardDto;

public class BoardDao {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public ArrayList<BoardDto> list(){
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		String query = "SELECT CASE WHEN LEVEL-1 > 0 \r\n"
				+ "THEN CONCAT(CONCAT(REPEAT('     ', level - 1),'ㄴre:'), b.title)\r\n"
				+ "ELSE b.title\r\n"
				+ "END AS title\r\n"
				+ ",b.writer\r\n"
				+ ",b.regdate\r\n"
				+ ",b.num\r\n"
				+ ",b.parentNum\r\n"
				+ ",fnc.level\r\n"
				+ "FROM\r\n"
				+ "	(SELECT fnc_layer() AS id, @level AS level\r\n"
				+ "	FROM (SELECT @start_with:=0, @id:=@start_with, @level:=0) vars\r\n"
				+ "    JOIN layerBoard\r\n"
				+ "    WHERE @id IS NOT NULL) fnc\r\n"
				+ "    JOIN layerBoard b ON fnc.id = b.num\r\n"
				+ "    ;\r\n"
				+ "";
		
		try {
			conn = DBConnector.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDto dto = new BoardDto();
				
				dto.setNum(rs.getInt("num"));
				dto.setParentNum(rs.getInt("parentNum"));
				dto.setParentNum(rs.getInt("parentNum"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate"));
				
				
				list.add(dto);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	
	public BoardDto view(int num) {
		String query = "select * from layerBoard where num=?";
		BoardDto dto = new BoardDto();
		
		try {
			conn = DBConnector.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto.setNum(rs.getInt("num"));
				dto.setParentNum(rs.getInt("parentNum"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setImageName(rs.getString("imageName"));
				dto.setRegdate(rs.getNString("regdate"));
			
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					pstmt.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}
	
	public void insert(BoardDto  dto) {
		String query = "insert into layerBoard values(num, parentNum, ?, ?, ?, ?, now())";
		
		try {
			conn = DBConnector.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getImageName());
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void insertReply(BoardDto  dto) {
		String query = "insert into layerBoard values(num, ?, ?, ?, ?, null, now())";
		
		try {
			conn = DBConnector.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, dto.getParentNum());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getWriter());
			pstmt.setString(4, dto.getContent());
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
}
