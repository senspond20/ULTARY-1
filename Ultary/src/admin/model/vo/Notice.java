package admin.model.vo;

import java.sql.Date;

/**
 * @author gun
 *
 */
public class Notice {
	
	private int n_num;	
	private String n_title; 	
	private String n_content;
	private int n_clicks;
	private Date n_date;
	private String memberid;
	
	public Notice() {
	}
	
    
	public Notice(int n_num, String n_title, String n_content) {
		super();
		this.n_num = n_num;
		this.n_title = n_title;
		this.n_content = n_content;
	}


	public Notice(String n_title, String n_content, String memberid) {
		super();
		this.n_title = n_title;
		this.n_content = n_content;
		this.memberid = memberid;
	}


	public Notice(int n_num, String n_title, String n_content, int n_clicks, Date n_date, String memberid) {
		super();
		this.n_num = n_num;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_clicks = n_clicks;
		this.n_date = n_date;
		this.memberid = memberid;
	}

	public int getN_num() {
		return n_num;
	}

	public void setN_num(int n_num) {
		this.n_num = n_num;
	}

	public String getN_title() {
		return n_title;
	}

	public void setN_title(String n_title) {
		this.n_title = n_title;
	}

	public String getN_content() {
		return n_content;
	}

	public void setN_content(String n_content) {
		this.n_content = n_content;
	}

	public int getN_clicks() {
		return n_clicks;
	}

	public void setN_clicks(int n_clicks) {
		this.n_clicks = n_clicks;
	}

	public Date getN_date() {
		return n_date;
	}

	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}


	@Override
	public String toString() {
		return "Notice [n_num=" + n_num + ", n_title=" + n_title + ", n_content=" + n_content + ", n_clicks=" + n_clicks
				+ ", n_date=" + n_date + ", memberid=" + memberid + "]";
	}
	
	
}