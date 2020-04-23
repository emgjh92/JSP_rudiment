package com.ja.rubato.model;

import java.sql.*;
import java.util.*;
import java.util.Date;

import com.ja.rubato.vo.*;

public class MemberDao {
	
	private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER="scott";
	private static final String PASSWORD="tiger";
	
	
	public void insert(String m_id, String m_pw, String m_nick, String m_phone) {
		//회원 가입 기능
		String query="INSERT INTO FB_MEMBER VALUES(fb_memebr_seq.nextval,?,?,?,?,SYSDATE)";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		
		
		try {
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection(URL,USER,PASSWORD);
			pstm = conn.prepareStatement(query);
			pstm.setString(1, m_id);
			pstm.setString(2, m_pw);
			pstm.setString(3, m_nick);
			pstm.setString(4, m_phone);

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
	
	//************************20200421 코드 추가********************************
	
	public MemberVo selectByIdAndPw(String id, String pw) {
		//회원 조회 기능 (회원인지 아닌지 확인)
		MemberVo memberVo = null;
		
		String query = "SELECT * FROM fb_member WHERE m_id=? AND m_pw=?";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); //드라이버 불러오기
			
			conn = DriverManager.getConnection(URL,USER,PASSWORD); //DB접속
			pstm = conn.prepareStatement(query); //prepareStatement 설정
			pstm.setString(1, id); // 첫 번째 ? 에 할당
			pstm.setString(2, pw); // 두 번째 ? 에 할당
			
			rs = pstm.executeQuery(); //query 실행
			
			//로직.....
			
			if(rs.next()) {
				int m_no = rs.getInt("m_no");
				String m_id = rs.getString("m_id");
				String m_pw = rs.getString("m_pw");
				String m_nick = rs.getString("m_nick");
				String m_phone = rs.getString("m_phone");
				java.util.Date m_joindate = rs.getDate("m_joindate");
				
				memberVo = new MemberVo(m_no,m_id,m_pw,m_nick,m_phone,m_joindate);
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
		
		return memberVo;

	}
	
	public MemberVo selectByNo(int no) { //맴버 넘버로 회원 조회
		MemberVo memberVo = null;
		
		String query = "SELECT * FROM fb_member WHERE m_no=?";
		
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); //드라이버 불러오기
			
			conn = DriverManager.getConnection(URL,USER,PASSWORD); //DB접속
			pstm = conn.prepareStatement(query); //prepareStatement 설정
			pstm.setInt(1, no); // 첫 번째 ? 에 할당
			
			
			rs = pstm.executeQuery(); //query 실행
			
			//로직.....
			
			if(rs.next()) {
				int m_no = rs.getInt("m_no");
				String m_id = rs.getString("m_id");
				String m_pw = rs.getString("m_pw");
				String m_nick = rs.getString("m_nick");
				String m_phone = rs.getString("m_phone");
				java.util.Date m_joindate = rs.getDate("m_joindate");
				
				memberVo = new MemberVo(m_no,m_id,m_pw,m_nick,m_phone,m_joindate);
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
		
		
		return memberVo;
	}
	//************************************************************************
}
