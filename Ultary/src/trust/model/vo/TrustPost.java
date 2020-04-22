package trust.model.vo;

import java.sql.Date;

public class TrustPost {
	private int tpostNum; // 위탁요청게시판번호
	private Date trustsDue; // 돌봄시작기간
	private Date trusteDue; // 돌봄종료기간
	private int trustMeans; // 돌봄방식
	private String trustPhone; // 비상연락처
	private String trustPS; // 보내는 메시지
	private String sushin; // 위탁수신자 닉네임
	private String balshin; 
	private int position;
	private int petnum;
	private int trnum;
	
	public TrustPost() {}

	

	public TrustPost(int tpostNum, Date trustsDue, Date trusteDue, int trustMeans, String trustPhone, String trustPS,
			String sushin, String balshin, int position, int petnum, int trnum) {
		super();
		this.tpostNum = tpostNum;
		this.trustsDue = trustsDue;
		this.trusteDue = trusteDue;
		this.trustMeans = trustMeans;
		this.trustPhone = trustPhone;
		this.trustPS = trustPS;
		this.sushin = sushin;
		this.balshin = balshin;
		this.position = position;
		this.petnum = petnum;
		this.trnum = trnum;
	}
	


	public TrustPost(Date trustsDue, Date trusteDue, int trustMeans, String trustPhone, String trustPS, String sushin,
			String balshin, int petnum) {
		super();
		this.trustsDue = trustsDue;
		this.trusteDue = trusteDue;
		this.trustMeans = trustMeans;
		this.trustPhone = trustPhone;
		this.trustPS = trustPS;
		this.sushin = sushin;
		this.balshin = balshin;
		this.petnum = petnum;
	}



	public TrustPost(int tpostNum, Date trustsDue, Date trusteDue, int trustMeans, String trustPhone, String trustPS,
			String sushin, String balshin) {
		super();
		this.tpostNum = tpostNum;
		this.trustsDue = trustsDue;
		this.trusteDue = trusteDue;
		this.trustMeans = trustMeans;
		this.trustPhone = trustPhone;
		this.trustPS = trustPS;
		this.sushin = sushin;
		this.balshin = balshin;
	}
	


	public TrustPost(int tpostNum, Date trustsDue, Date trusteDue, int trustMeans, String trustPhone, String trustPS,
			String sushin, String balshin, int position) {
		super();
		this.tpostNum = tpostNum;
		this.trustsDue = trustsDue;
		this.trusteDue = trusteDue;
		this.trustMeans = trustMeans;
		this.trustPhone = trustPhone;
		this.trustPS = trustPS;
		this.sushin = sushin;
		this.balshin = balshin;
		this.position = position;
	}
	


	public TrustPost(Date trustsDue, Date trusteDue, int trustMeans, String trustPhone, String trustPS, String sushin,
			String balshin) {
		super();
		this.trustsDue = trustsDue;
		this.trusteDue = trusteDue;
		this.trustMeans = trustMeans;
		this.trustPhone = trustPhone;
		this.trustPS = trustPS;
		this.sushin = sushin;
		this.balshin = balshin;
	}



	public int getTpostNum() {
		return tpostNum;
	}

	public void setTpostNum(int tpostNum) {
		this.tpostNum = tpostNum;
	}

	public Date getTrustsDue() {
		return trustsDue;
	}

	public void setTrustsDue(Date trustsDue) {
		this.trustsDue = trustsDue;
	}
	
	public int getPetnum() {
		return petnum;
	}



	public void setPetnum(int petnum) {
		this.petnum = petnum;
	}



	public int getTrnum() {
		return trnum;
	}



	public void setTrnum(int trnum) {
		this.trnum = trnum;
	}



	public Date getTrusteDue() {
		return trusteDue;
	}

	public void setTrusteDue(Date trusteDue) {
		this.trusteDue = trusteDue;
	}

	public int getPosition() {
		return position;
	}



	public void setPosition(int position) {
		this.position = position;
	}



	public int getTrustMeans() {
		return trustMeans;
	}

	public void setTrustMeans(int trustMeans) {
		this.trustMeans = trustMeans;
	}

	public String getTrustPhone() {
		return trustPhone;
	}

	public void setTrustPhone(String trustPhone) {
		this.trustPhone = trustPhone;
	}

	public String getTrustPS() {
		return trustPS;
	}

	public void setTrustPS(String trustPS) {
		this.trustPS = trustPS;
	}


	public String getSushin() {
		return sushin;
	}



	public void setSushin(String sushin) {
		this.sushin = sushin;
	}



	public String getBalshin() {
		return balshin;
	}



	public void setBalshin(String balshin) {
		this.balshin = balshin;
	}



	@Override
	public String toString() {
		return "TrustPost [tpostNum=" + tpostNum + ", trustsDue=" + trustsDue + ", trusteDue=" + trusteDue
				+ ", trustMeans=" + trustMeans + ", trustPhone=" + trustPhone + ", trustPS=" + trustPS + ", sushin="
				+ sushin + ", balshin=" + balshin + ", position=" + position + ", petnum=" + petnum + ", trnum=" + trnum
				+ "]";
	}










	
}
