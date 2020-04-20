package post.model.vo;

import java.sql.Date;

public class Post {
	private int postNum; // 글번호
	private String postTitle; // 글제목
	private String postContent; // 글내용
	private int postLike; // 글좋아요수
	private Date postDate; // 글작성일
	private int postclick; // 글조회수
	private int postRange; // 공개범위
	private int categorynum; // 카테고리 번호
	private String memberid; // 작성자아이디
	
	public Post() {}

	public Post(int postNum, String postTitle, String postContent, int postLike, Date postDate, int postclick,
			int postRange, int categorynum, String memberid) {
		super();
		this.postNum = postNum;
		this.postTitle = postTitle;
		this.postContent = postContent;
		this.postLike = postLike;
		this.postDate = postDate;
		this.postclick = postclick;
		this.postRange = postRange;
		this.categorynum = categorynum;
		this.memberid = memberid;
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public int getPostLike() {
		return postLike;
	}

	public void setPostLike(int postLike) {
		this.postLike = postLike;
	}

	public Date getPostDate() {
		return postDate;
	}

	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}

	public int getPostclick() {
		return postclick;
	}

	public void setPostclick(int postclick) {
		this.postclick = postclick;
	}

	public int getPostRange() {
		return postRange;
	}

	public void setPostRange(int postRange) {
		this.postRange = postRange;
	}

	public int getCategorynum() {
		return categorynum;
	}

	public void setCategorynum(int categorynum) {
		this.categorynum = categorynum;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	@Override
	public String toString() {
		return "Post [postNum=" + postNum + ", postTitle=" + postTitle + ", postContent=" + postContent + ", postLike="
				+ postLike + ", postDate=" + postDate + ", postclick=" + postclick + ", postRange=" + postRange
				+ ", categorynum=" + categorynum + ", memberid=" + memberid + "]";
	}
	
	
}
