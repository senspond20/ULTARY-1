package admin.model.vo;

/*  DB칼럼
    Q_NUM
	Q_TITLE
	Q_CONTENT
	MEMBERID
	
INSERT INTO OFTENQUERY VALUES(SEQ_QNO.NEXTVAL,'울타리(ULTARY)는 어떤곳입니까?', '울타리는 반려동물 커뮤니티 및 위탁매칭 서비스를 제공하는 공간입니다.', DEFAULT);
INSERT INTO OFTENQUERY VALUES(SEQ_QNO.NEXTVAL,'위탁매칭 서비스는 무엇인가요?', '울타리 커뮤티티 회원간 반려동물 위탁의뢰를 매칭해주는 서비스입니다.', DEFAULT);
INSERT INTO OFTENQUERY VALUES(SEQ_QNO.NEXTVAL,'회원탈퇴는 어디서 하나요?', '마이페이지에서 할 수 있습니다.', DEFAULT);

 select * from oftenquery;
 */
public class OftenQuery {
	private int qNum; // 질문 번호
	private String qTitle; // 질문제목
	private String qContent; // 질문 내용
	private String memberId; // 회원아이디 (admin)
	
	public OftenQuery() {
	}
	
	public OftenQuery(int qNum, String qTitle, String qContent) {
		super();
		this.qNum = qNum;
		this.qTitle = qTitle;
		this.qContent = qContent;
	}


	public OftenQuery(int qNum, String qTitle, String qContent, String memberId) {
		super();
		this.qNum = qNum;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.memberId = memberId;
	}

	public int getqNum() {
		return qNum;
	}

	public void setqNum(int qNum) {
		this.qNum = qNum;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "OftenQuery [qNum=" + qNum + ", qTitle=" + qTitle + ", qContent=" + qContent + ", memberId=" + memberId
				+ "]";
	}
	
	
}
