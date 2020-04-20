package trust.model.vo;

import java.sql.Date;

public class TrustReview {
	private int trNum; // 위탁후기번호
	private int trScore; // 별점
	private String trContent; // 위탁후기내용
	private String memberId; // 회원아이디
	private Date trUploadDate;
	
	public TrustReview() {}
	
	public TrustReview(int trNum, int trScore, String trContent, String memberId) {
		super();
		this.trNum = trNum;
		this.trScore = trScore;
		this.trContent = trContent;
		this.memberId = memberId;
	}
	
	public TrustReview(int trNum, int trScore, String trContent, String memberId, Date trUploadDate) {
		super();
		this.trNum = trNum;
		this.trScore = trScore;
		this.trContent = trContent;
		this.memberId = memberId;
		this.trUploadDate = trUploadDate;
	}

	public Date getTrUploadDate() {
		return trUploadDate;
	}

	public void setTrUploadDate(Date trUploadDate) {
		this.trUploadDate = trUploadDate;
	}

	public int getTrNum() {
		return trNum;
	}

	public void setTrNum(int trNum) {
		this.trNum = trNum;
	}

	public int getTrScore() {
		return trScore;
	}

	public void setTrScore(int trScore) {
		this.trScore = trScore;
	}

	public String getTrContent() {
		return trContent;
	}

	public void setTrContent(String trContent) {
		this.trContent = trContent;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "TrustReview [trNum=" + trNum + ", trScore=" + trScore + ", trContent=" + trContent + ", memberId="
				+ memberId + "]";
	}
	
	
}
