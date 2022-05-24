package cart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cart.dto.CartDto;

public class CartDao {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	
	public void add(CartDto dto) {
		String query = "insert into cart01 values(cartNum, ?, 1)";
		
		try {
			conn = DBConnector.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, dto.getProductNum());
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
	
	
	public ArrayList<CartDto> list(){
		ArrayList<CartDto> list = new ArrayList<CartDto>();
		String query = "select * from cart01 order by cartNum desc";
		
		try {
			conn = DBConnector.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CartDto dto = new CartDto();
				
				dto.setCartNum(rs.getInt("cartNum"));
				dto.setProductNum(rs.getInt("productNum"));
				dto.setQuantity(rs.getInt("quantity"));
				
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
					pstmt.close();
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}
}
