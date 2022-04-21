package com.login.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.login.vo.UserVo;

public class UserDao {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public UserDao() {

	}
	
	public void joinId(UserVo vo) {
		
		String query = "insert into member2(userId, userPwd, userName, gender, userAge, phoneNum, zipcode, addr, addrDetail, addrEtc) "
					 + "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = DBconnector.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vo.getUserId());
			pstmt.setString(2, vo.getUserPwd());
			pstmt.setString(3, vo.getUserName());
			pstmt.setString(4, vo.getGender());
			pstmt.setInt(5, vo.getUserAge());
			pstmt.setString(6, vo.getPhoneNum());
			pstmt.setString(7, vo.getZipcode());
			pstmt.setString(8, vo.getAddr());
			pstmt.setString(9, vo.getAddrDetail());
			pstmt.setString(10, vo.getAddrEtc());
			
			pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(SQLException e) {
				throw new RuntimeException(e);
			}
		}
	}
	
	
	public int checkId(String id) {
		
		String query = "SELECT COUNT(userId) FROM member2 WHERE userId = ?";
		int check = 0;
		
		try {

			conn = DBconnector.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			rs.next();
			check = rs.getInt(1);
			
		} catch(SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
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
			} catch(SQLException e) {
				throw new RuntimeException(e);
			}
		}
		return check;
	}
	
	
	public int login(String id, String pwd) {
		String query = "select count(userId) from member2 where userId = ? And userPwd = ?";
		int check = 0;
		
		try {
			conn = DBconnector.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			
			rs.next();
			check = rs.getInt(1);
			
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
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
			} catch(SQLException e) {
				throw new RuntimeException(e);
			}
		}
		return check;
	}
	
	
	public UserVo showInfo(String id) {
		UserVo vo = new UserVo();
		
		String query = "select * from member2 where userId = ?";
		
		try {
			conn = DBconnector.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo.setUserId(rs.getString("userId"));
				vo.setUserPwd(rs.getString("userPwd"));
				vo.setUserName(rs.getString("userName"));
				vo.setGender(rs.getString("gender"));
				vo.setUserAge(rs.getInt("userAge"));
				vo.setPhoneNum(rs.getString("phoneNum"));
				vo.setZipcode(rs.getString("zipcode"));
				vo.setAddr(rs.getString("addr"));
				vo.setAddrDetail(rs.getString("addrDetail"));
				vo.setAddrEtc(rs.getString("addrEtc"));
				vo.setRegDate(rs.getString("regDate"));
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
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
		return vo;
	}
	
	
	public void update(UserVo vo) {
		
		String query = "UPDATE member2 SET userPwd = ?, userName = ?, phoneNum = ?, zipcode = ?, addr = ?, addrDetail = ?, addrEtc = ? "
					 + "WHERE userId = ?";
		
		try {
			conn = DBconnector.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, vo.getUserPwd());
			pstmt.setString(2, vo.getUserName());
			pstmt.setString(3, vo.getPhoneNum());
			pstmt.setString(4, vo.getZipcode());
			pstmt.setString(5, vo.getAddr());
			pstmt.setString(6, vo.getAddrDetail());
			pstmt.setString(7, vo.getAddrEtc());
			pstmt.setString(8, vo.getUserId());
			
			pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(SQLException e) {
				throw new RuntimeException(e);
			}
		}
		

	}
	
	
	public void delete(String id) {
		
		String query = "delete from member2 where userId= ?";
		
		try {
			conn = DBconnector.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch(SQLException e) {
				throw new RuntimeException(e);
			}
		}
	}
	
	
	public String searchId(String name, String phone) {
		
		String query = "select userId from member2 where userName=? and phoneNum=?";
		
		String id = null;
		
		try {
			conn = DBconnector.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				id = rs.getString("userId");
			}
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
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
		return id;
	}
	
	
	public String searchPwd(String id, String name, String phone) {
		
		String query = "select userPwd from member2 where userId=? and userName=? and phoneNum=?";
		
		String pwd = null;
		
		try {
			conn = DBconnector.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				pwd = rs.getString("userPwd");
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} catch(Exception e) {
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
		return pwd;
	}

}
