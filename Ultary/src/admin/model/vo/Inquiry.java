package admin.model.vo;

import java.sql.Date;

/**
 * @author gun
 *
 */
/**
 * @author gun
 *
 */
public class Inquiry {
	private int inquirynum; // 문의 번호
	private String inquirytitle; // 문의 제목
	private String inquirycontent; // 문의 내용
	private Date inquirydate; // 문의 날짜
	private String answer;  // 답변 여부 'Y'/'N'
	private Date answerdate; // 답변 날짜
	private String ans_content; // 답변 내용
	private String memeberid; // 회원 아이디
	
	public Inquiry() {

	}
	
	

	public Inquiry(String inquirytitle, String inquirycontent, String memeberid) {
		super();
		this.inquirytitle = inquirytitle;
		this.inquirycontent = inquirycontent;
		this.memeberid = memeberid;
	}



	public Inquiry(int inquirynum, String inquirytitle, String inquirycontent, Date inquirydate, String answer,
			Date answerdate, String ans_content, String memeberid) {
		super();
		this.inquirynum = inquirynum;
		this.inquirytitle = inquirytitle;
		this.inquirycontent = inquirycontent;
		this.inquirydate = inquirydate;
		this.answer = answer;
		this.answerdate = answerdate;
		this.ans_content = ans_content;
		this.memeberid = memeberid;
	}



	@Override
	public String toString() {
		return "Inquiry [inquirynum=" + inquirynum + ", inquirytitle=" + inquirytitle + ", inquirycontent="
				+ inquirycontent + ", inquirydate=" + inquirydate + ", answer=" + answer + ", answerdate=" + answerdate
				+ ", ans_content=" + ans_content + ", memeberid=" + memeberid + "]";
	}

	public int getInquirynum() {
		return inquirynum;
	}

	public void setInquirynum(int inquirynum) {
		this.inquirynum = inquirynum;
	}

	public String getInquirytitle() {
		return inquirytitle;
	}

	public void setInquirytitle(String inquirytitle) {
		this.inquirytitle = inquirytitle;
	}

	public String getInquirycontent() {
		return inquirycontent;
	}

	public void setInquirycontent(String inquirycontent) {
		this.inquirycontent = inquirycontent;
	}

	public Date getInquirydate() {
		return inquirydate;
	}

	public void setInquirydate(Date inquirydate) {
		this.inquirydate = inquirydate;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Date getAnswerdate() {
		return answerdate;
	}

	public void setAnswerdate(Date answerdate) {
		this.answerdate = answerdate;
	}

	public String getAns_content() {
		return ans_content;
	}

	public void setAns_content(String ans_content) {
		this.ans_content = ans_content;
	}

	public String getMemeberid() {
		return memeberid;
	}

	public void setMemeberid(String memeberid) {
		this.memeberid = memeberid;
	}
	
	

	
}
