package post.model.vo;

import java.sql.Date;

public class CAns {
	private int ansNum;
	private String ansContent;
	private Date ansDate;
	private int cNum;
	private String memberid;
	
	public CAns() {}

	public CAns(int ansNum, String ansContent, Date ansDate, int cNum, String memberid) {
		super();
		this.ansNum = ansNum;
		this.ansContent = ansContent;
		this.ansDate = ansDate;
		this.cNum = cNum;
		this.memberid = memberid;
	}

	public int getAnsNum() {
		return ansNum;
	}

	public void setAnsNum(int ansNum) {
		this.ansNum = ansNum;
	}

	public String getAnsContent() {
		return ansContent;
	}

	public void setAnsContent(String ansContent) {
		this.ansContent = ansContent;
	}

	public Date getAnsDate() {
		return ansDate;
	}

	public void setAnsDate(Date ansDate) {
		this.ansDate = ansDate;
	}

	public int getcNum() {
		return cNum;
	}

	public void setcNum(int cNum) {
		this.cNum = cNum;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	@Override
	public String toString() {
		return "CAns [ansNum=" + ansNum + ", ansContent=" + ansContent + ", ansDate=" + ansDate + ", cNum=" + cNum
				+ ", memberid=" + memberid + "]";
	}
	
}
