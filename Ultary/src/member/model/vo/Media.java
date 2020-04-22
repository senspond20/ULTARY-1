package member.model.vo;

public class Media {
	private int mediaNum; // 미디어 번호
	private String imgroute; // 이미지경로
	private String imgName; // 원본사진명
	private String webName; // 웹사진이름
	private int mediaUse; // 미디어 용도
	private String memberId; // 회원아이디
	private int postNum; // 글번호
	private int petNum; // 반려동물번호
	
	public Media() {
		
	}
	
	public Media(String webName, String memberId) {
		super();
		this.webName = webName;
		this.memberId = memberId;
	}

	public Media(String imgroute, String imgName, String webName, String memberId) {
		super();
		this.imgroute = imgroute;
		this.imgName = imgName;
		this.webName = webName;
		this.memberId = memberId;
	}
	
	
	
	public Media(int mediaNum, String imgroute, String imgName, String webName, int mediaUse, String memberId) {
		super();
		this.mediaNum = mediaNum;
		this.imgroute = imgroute;
		this.imgName = imgName;
		this.webName = webName;
		this.mediaUse = mediaUse;
		this.memberId = memberId;
	}

	public Media(int mediaNum, String imgroute, String imgName, String webName, int mediaUse, String memberId,
			int postNum, int petNum) {
		super();
		this.mediaNum = mediaNum;
		this.imgroute = imgroute;
		this.imgName = imgName;
		this.webName = webName;
		this.mediaUse = mediaUse;
		this.memberId = memberId;
		this.postNum = postNum;
		this.petNum = petNum;
	}

	public int getMediaNum() {
		return mediaNum;
	}

	public void setMediaNum(int mediaNum) {
		this.mediaNum = mediaNum;
	}

	public String getImgroute() {
		return imgroute;
	}

	public void setImgroute(String imgroute) {
		this.imgroute = imgroute;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getWebName() {
		return webName;
	}

	public void setWebName(String webName) {
		this.webName = webName;
	}

	public int getMediaUse() {
		return mediaUse;
	}

	public void setMediaUse(int mediaUse) {
		this.mediaUse = mediaUse;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}

	public int getPetNum() {
		return petNum;
	}

	public void setPetNum(int petNum) {
		this.petNum = petNum;
	}

	@Override
	public String toString() {
		return "Media [mediaNum=" + mediaNum + ", imgroute=" + imgroute + ", imgName=" + imgName + ", webName="
				+ webName + ", mediaUse=" + mediaUse + ", memberId=" + memberId + ", postNum=" + postNum + ", petNum="
				+ petNum + "]";
	}
	
	
}
