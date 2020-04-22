package member.model.vo;

import java.sql.Date;

public class Member {
	private String memberId; // 회원아이디
	private String nickname; // 닉네임
	private String memberName; // 이름
	private String password; // 비밀번호
	private char gender; // 성별
	private String birth; // 생년월일
	private String email; // 이메일
	private String phone; // 전화번호
	private Date enrollDate; // 가입일
	private String address; // 주소
	private int pwQuery; // 비밀번호질문번호
	private String pwqAns; // 비밀번호질문답
	private char trust; // 위탁여부
	private int trustmeans; // 위탁방식                                                                                                                                                   -
	private String trustfield; // 위탁환경
	private String trustAdd; // 위탁추가사항
	private int markscore; // 관심받은 수
	private char warn; // 경고여부 
	private char status; // 회원상태
	
	public Member() {}

	//아이디 찾기에 쓰임
	public Member(String memberId) {
		super();
		this.memberId = memberId;
	}

	//로그인할때 받는 기본 정보 (아이디, 비번)
	public Member(String memberId, String password) {
		super();
		this.memberId = memberId;
		this.password = password;
	}
	
	public Member(String nickname, char gender, int markscore) {
		super();
		this.nickname = nickname;
		this.gender = gender;
		this.markscore = markscore;
	}

	// 네이버에서 받아오는 정보 (이름, 아이디, 이메일, 닉네임, 성별, 생일)
	public Member(String memberId, String nickname, String memberName, String birth, char gender, String email) {
		super();
		this.memberId = memberId;
		this.nickname = nickname;
		this.memberName = memberName;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
	}
	
	
	public Member(String memberId, String nickname, String memberName, char gender, String birth, String email,
			String phone, Date enrollDate, String address, char trust, int trustmeans, String trustfield,
			String trustAdd, int markscore, char warn, char status) {
		super();
		this.memberId = memberId;
		this.nickname = nickname;
		this.memberName = memberName;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.address = address;
		this.trust = trust;
		this.trustmeans = trustmeans;
		this.trustfield = trustfield;
		this.trustAdd = trustAdd;
		this.markscore = markscore;
		this.warn = warn;
		this.status = status;
	}

	//회원가입시 받는 정보
	public Member(String memberId, String nickname, String memberName, String password, char gender, String birth,
			String email, String phone, String address, int pwQuery, String pwqAns, char trust, int trustmeans,
			String trustfield, String trustAdd) {
		super();
		this.memberId = memberId;
		this.nickname = nickname;
		this.memberName = memberName;
		this.password = password;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.pwQuery = pwQuery;
		this.pwqAns = pwqAns;
		this.trust = trust;
		this.trustmeans = trustmeans;
		this.trustfield = trustfield;
		this.trustAdd = trustAdd;
	}
	
	
	public Member(String memberId, String nickname, String memberName, String password, char gender, String birth,
			String email, String phone, Date enrollDate, String address, int pwQuery, String pwqAns, char trust, int turstmeans,
			String trustfield, String trustAdd, int markscore, char warn, char status) {
		super();
		this.memberId = memberId;
		this.nickname = nickname;
		this.memberName = memberName;
		this.password = password;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
		this.enrollDate = enrollDate;
		this.address = address;
		this.pwQuery = pwQuery;
		this.pwqAns = pwqAns;
		this.trust = trust;
		this.trustmeans = turstmeans;
		this.trustfield = trustfield;
		this.trustAdd = trustAdd;
		this.markscore = markscore;
		this.warn = warn;
		this.status = status;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getPwQuery() {
		return pwQuery;
	}

	public void setPwQuery(int pwQuery) {
		this.pwQuery = pwQuery;
	}

	public String getPwqAns() {
		return pwqAns;
	}

	public void setPwqAns(String pwqAns) {
		this.pwqAns = pwqAns;
	}

	public char getTrust() {
		return trust;
	}

	public void setTrust(char trust) {
		this.trust = trust;
	}

	public int getTurstmeans() {
		return trustmeans;
	}

	public void setTurstmeans(int turstmeans) {
		this.trustmeans = turstmeans;
	}

	public String getTrustfield() {
		return trustfield;
	}

	public void setTrustfield(String trustfield) {
		this.trustfield = trustfield;
	}

	public String getTrustAdd() {
		return trustAdd;
	}

	public void setTrustAdd(String trustAdd) {
		this.trustAdd = trustAdd;
	}

	public int getMarkscore() {
		return markscore;
	}

	public void setMarkscore(int markscore) {
		this.markscore = markscore;
	}

	public char getWarn() {
		return warn;
	}

	public void setWarn(char warn) {
		this.warn = warn;
	}

	public char getStatus() {
		return status;
	}

	public void setStatus(char status) {
		this.status = status;
	}
	
	public int getTrustmeans() {
		return trustmeans;
	}

	public void setTrustmeans(int trustmeans) {
		this.trustmeans = trustmeans;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", nickname=" + nickname + ", memberName=" + memberName + ", password="
				+ password + ", gender=" + gender + ", birth=" + birth + ", email=" + email + ", phone=" + phone
				+ ", enrollDate=" + enrollDate + ", address=" + address + ", pwQuery=" + pwQuery + ", pwqAns=" + pwqAns
				+ ", trust=" + trust + ", turstmeans=" + trustmeans + ", trustfield=" + trustfield + ", trustAdd="
				+ trustAdd + ", markscore=" + markscore + ", warn=" + warn + ", status=" + status + "]";
	}
	
	
	
}
