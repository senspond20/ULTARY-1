package post.model.vo;

import java.sql.Date;

public class PostComment {
	private int cNum; // 댓글번호
	private String cContent; // 댓글내용
	private Date cDate; // 댓글 작성일
	private int cLike; // 댓글좋아요수
	private int cRange; // 비밀여부
	private int postNum; // 글번호
	private String memberid; // 회원아이디
	
	public PostComment() {}

	public PostComment(int cNum, String cContent, Date cDate, int cLike, int cRange, int postNum, String memberid) {
		super();
		this.cNum = cNum;
		this.cContent = cContent;
		this.cDate = cDate;
		this.cLike = cLike;
		this.cRange = cRange;
		this.postNum = postNum;
		this.memberid = memberid;
	}

	public int getcNum() {
		return cNum;
	}

	public void setcNum(int cNum) {
		this.cNum = cNum;
	}

	public String getcContent() {
		return cContent;
	}

	public void setcContent(String cContent) {
		this.cContent = cContent;
	}

	public Date getcDate() {
		return cDate;
	}

	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}

	public int getcLike() {
		return cLike;
	}

	public void setcLike(int cLike) {
		this.cLike = cLike;
	}

	public int getcRange() {
		return cRange;
	}

	public void setcRange(int cRange) {
		this.cRange = cRange;
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
		return "PostComment [cNum=" + cNum + ", cContent=" + cContent + ", cDate=" + cDate + ", cLike=" + cLike
				+ ", cRange=" + cRange + ", postNum=" + postNum + ", memberid=" + memberid + "]";
	}
	
	
}
