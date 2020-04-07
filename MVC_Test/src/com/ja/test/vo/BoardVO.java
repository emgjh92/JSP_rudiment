package com.ja.test.vo;

public class BoardVO {
	private String b_no;
	private String m_no;
	private String b_title;
	private String b_content;
	private String b_writedate;
	public BoardVO(String b_no, String m_no, String b_title, String b_content, String b_writedate) {
		super();
		this.b_no = b_no;
		this.m_no = m_no;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_writedate = b_writedate;
	}
	public String getB_no() {
		return b_no;
	}
	public void setB_no(String b_no) {
		this.b_no = b_no;
	}
	public String getM_no() {
		return m_no;
	}
	public void setM_no(String m_no) {
		this.m_no = m_no;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_writedate() {
		return b_writedate;
	}
	public void setB_writedate(String b_writedate) {
		this.b_writedate = b_writedate;
	}
	
	
	
	
}
