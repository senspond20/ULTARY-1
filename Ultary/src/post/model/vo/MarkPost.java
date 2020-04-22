package post.model.vo;

import java.sql.Date;

public class MarkPost {
	private int mpNum;
	private Date mpDate;
	private int postNum;
	private String memberid;
	
	public MarkPost() {}

	public MarkPost(int mpNum, Date mpDate, int postNum, String memberid) {
		super();
		this.mpNum = mpNum;
		this.mpDate = mpDate;
		this.postNum = postNum;
		this.memberid = memberid;
	}

	public int getMpNum() {
		return mpNum;
	}

	public void setMpNum(int mpNum) {
		this.mpNum = mpNum;
	}

	public Date getMpDate() {
		return mpDate;
	}

	public void setMpDate(Date mpDate) {
		this.mpDate = mpDate;
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	@Override
	public String toString() {
		return "MarkPost [mpNum=" + mpNum + ", mpDate=" + mpDate + ", postNum=" + postNum + ", memberid=" + memberid
				+ "]";
	}
	
}
