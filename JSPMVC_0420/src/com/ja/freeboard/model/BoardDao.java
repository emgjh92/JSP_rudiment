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
//+++++++++++++++++++++++++++++++++20200421 코드 추가++++++++++++++++++++++++++++++++++++++
	public void delete(int no) {
		//글 삭제 기능	
		String query="DELETE FROM fb_board WHERE b_no=?";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		
		
		try {
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection(URL,USER,PASSWORD);
			pstm = conn.prepareStatement(query);
			pstm.setInt(1, no); //1번째 ? 에 no를 할당

			pstm.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
				if(pstm!=null) {
					try {
						pstm.close();
					}catch(Exception e) {
						e.printStackTrace();
					}
				}
				
			}
		
		if(conn != null) {
			try {
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			
			
		}
	} 
	
	public void update(int no, String title, String content) {
		//글 수정 기능
		String query="UPDATE fb_board SET b_title=?, b_content=? WHERE b_no=?";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		
		
		try {
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection(URL,USER,PASSWORD);
			pstm = conn.prepareStatement(query);
			pstm.setString(1, title); //1번째 ? 에 title를 할당
			pstm.setString(2, content); //2번째 ? 에 content를 할당
			pstm.setInt(3, no); //3번째 ? 에 no를 할당

			pstm.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
				if(pstm!=null) {
					try {
						pstm.close();
					}catch(Exception e) {
						e.printStackTrace();
					}
				}
				
			}
		
		if(conn != null) {
			try {
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			
			
		}
	}
	
	public void insert(int memberNo, String title, String content) {
		//글 쓰기 기능
		String query="INSERT INTO fb_board VALUES(FB_BOARD_SEQ.nextval,?,?,?,SYSDATE)";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		
		
		try {
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection(URL,USER,PASSWORD);
			pstm = conn.prepareStatement(query);
			pstm.setInt(1, memberNo); //1번째 ? 에 memberNo를 할당
			pstm.setString(2, title); //2번째 ? 에 title를 할당
			pstm.setString(3, content); //3번째 ? 에 content를 할당

			pstm.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
				if(pstm!=null) {
					try {
						pstm.close();
					}catch(Exception e) {
						e.printStackTrace();
					}
				}
				
			}
		
		if(conn != null) {
			try {
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			
			
		}
	}
	
	public BoardVo selectByNo(int no) {
		//글 검색 기능 (글 넘버로)
		
		BoardVo boardVo = null;
		
		String query = "SELECT * FROM fb_board WHERE b_no =?";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); //드라이버 불러오기
			
			conn = DriverManager.getConnection(URL,USER,PASSWORD); //DB접속
			pstm = conn.prepareStatement(query); //prepareStatement 설정
			pstm.setInt(1, no);
			
			rs = pstm.executeQuery(); //query 실행
			
			//로직.....
			
			if(rs.next()) {
				int b_no = rs.getInt("b_no");
				int m_no = rs.getInt("m_no");
				String b_title = rs.getString("b_title");
				String b_content = rs.getString("b_content");
				java.util.Date b_writedate = rs.getDate("b_writedate");
			
				boardVo = new BoardVo(b_no,m_no,b_title,b_content,b_writedate);
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
			return boardVo;
			}
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
}
