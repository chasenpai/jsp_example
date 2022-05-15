package com.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

import com.board.dto.BoardDto;

public class BoardDao {

	Connection conn; //외부저장소인 DBMS를 드라이버를 통해 객체로 가져온 연결 객체
	PreparedStatement pstmt; //문자열 안에 잇는 SQL문을 객체로 저장하고 변수가 들어갈 자리에 알맞는 값을 넣어주고 SQL문을 실행
	ResultSet rs; //select의 결과를 담는 객체
	
	public BoardDao() {
	}
	
	//게시글 갯수 얻기
	public int getNumRecords() {
		int numRecords = 0;
		
		//SQL문 작성
		String query = "select count(*) from board2";
		
		try {
			//Connection 객체를 전달받음
			conn = DBconnector.getConnection();
			//위에서 작성한 쿼리문을 PrepareStatement에 전달
			pstmt = conn.prepareStatement(query);
			//쿼리 실행 후 결과를 ResultSet에 담는다
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				numRecords = rs.getInt(1);
			}
		} catch (Exception e) {
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
				throw new RuntimeException(e);
			}
		}
		return numRecords;
	}
	
	
	//게시판 목록
	public ArrayList<BoardDto> list(int start, int listSize){
		
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		
		String query = "select * from board2 order by num desc limit ?, ?";
		
		try {
			conn = DBconnector.getConnection();
			pstmt = conn.prepareStatement(query);
			//SQL 쿼리에 ?가 있다면 알맞는 값을 전달
			pstmt.setInt(1, start);
			pstmt.setInt(2, listSize);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//새로운 DTO 객체를 만들고 글 데이터를 이 객체에 저장
				BoardDto dto = new BoardDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegtime(rs.getString("regtime"));
				dto.setHits(rs.getInt("hits"));
				
				//이 DTO 객체를 ArrayList에 추가
				list.add(dto);
			}
			
		}catch(Exception e){
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
				throw new RuntimeException(e);
			}
		}
		return list;
	}
	
	
	//게시글 조회
	public BoardDto select(int num, boolean incHits) {
		BoardDto dto = new BoardDto();
		
		String query = "select * from board2 where num=" + num;
		
		try {
			conn = DBconnector.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//글 데이터를 DTO에 저장
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegtime(rs.getString("regtime"));
				dto.setHits(rs.getInt("hits"));
				
				//incHits가 true이면 해당 글의 조회수를 1 증가시킴
				if(incHits) {
					pstmt = conn.prepareStatement(
							"update board2 set hits=hits+1 where num=" + num);
					pstmt.executeUpdate();
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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
		return dto;
	}
	
	//작성시간
	public String getCurTime() {
		return LocalDate.now() + " " + LocalTime.now().toString().substring(0, 8);
	}
	
	
	//게시글 작성
	public void insert(BoardDto dto) {
		
		String query = "insert into board2(writer, title, content, regtime, hits)"
					  + "values(?, ?, ?, ?, 0)";
		
		try {
			conn = DBconnector.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, getCurTime());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
				
			}catch(SQLException e) {
				throw new RuntimeException(e);
			}
		}
	}
	
	
	//게시글 수정
	public void update(BoardDto dto) {
		
		String query = "update board2 set writer=?, title=?, content=?, regtime=?"
					 + "where num=?";
		
		try {
			conn = DBconnector.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, getCurTime());
			pstmt.setInt(5, dto.getNum());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
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
				throw new RuntimeException(e);
			}
		}
		
	}
	
	
	//글삭제
	public void delete(int num) {
		
		String query = "delete from board2 where num=" + num;
		
		try {
			conn = DBconnector.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
