package com.ja.freeboard.model;

import java.util.*;
import java.sql.*;
import com.ja.freeboard.vo.*;

public class BoardDao {
	//************************20200421 코드 추가********************************


	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER="scott";
	private static final String PASSWORD="tiger";
	
	public ArrayList<BoardVo> selectAll(){ //조건 없이 모든 내용을 불러옴
		
		ArrayList<BoardVo> list = new ArrayList<BoardVo>(); //비어있어도 무조건 나와야 함

		String query = "SELECT * FROM fb_board ORDER BY b_no DESC";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); //드라이버 불러오기
			
			conn = DriverManager.getConnection(URL,USER,PASSWORD); //DB접속
			pstm = conn.prepareStatement(query); //prepareStatement 설정

			
			rs = pstm.executeQuery(); //query 실행
			
			//로직.....
			
			while(rs.next()) {
				int b_no = rs.getInt("b_no");
				int m_no = rs.getInt("m_no");
				String b_title = rs.getString("b_title");
				String b_content = rs.getString("b_content");
				java.util.Date b_writedate = rs.getDate("b_writedate");
				
				BoardVo boardVo = new BoardVo(b_no,m_no,b_title,b_content,b_writedate);
				
				list.add(boardVo);
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally { //finally 에선 각가의 close 를 적어준다.
			if(rs!=null) {
				try {
					rs.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			if(pstm!=null) {
				try {
					pstm.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			
			if(conn!=null) {
				try {
					conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			
			
		}
		//--------------------------------------------------------------------
		
		
		return list;
	}
	//*****************************************************************************
	
}
