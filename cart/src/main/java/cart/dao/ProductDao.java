package cart.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cart.dto.ProductDto;

public class ProductDao {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	
	//제품 목록
	public ArrayList<ProductDto> list(){
		ArrayList<ProductDto> list = new ArrayList<ProductDto>();
		String query = "select * from product01 order by productNum desc";
		
		try {
			conn = DBConnector.getConnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDto dto = new ProductDto();
				
				dto.setProductNum(rs.getInt("productNum"));
				dto.setProductName(rs.getString("productName"));
				dto.setPrice(rs.getInt("price"));
				dto.setCompany(rs.getString("company"));
				dto.setCategory(rs.getString("category"));
				
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
	
	
	//제품 보기
	public ProductDto view(int num) {
		String query = "select * from product01 where productNum=?";
		ProductDto dto = new ProductDto();
		try {
			conn = DBConnector.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto.setProductNum(rs.getInt("productNum"));
				dto.setProductName(rs.getString("productName"));
				dto.setPrice(rs.getInt("price"));
				dto.setCompany(rs.getString("company"));
				dto.setCategory(rs.getString("category"));
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
		return dto;
	}
	
	
	
	
	
	
	
}
