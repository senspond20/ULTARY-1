package member.model.vo;

public class Pet {
	private int petNum; // 반려동물 번호
	private String petName; // 반려동물 이름
	private int petage; // 반려동물나이
	private char petGender; // 반려동물성별
	private char petKind; // 반려동물종류
	private String memberId; 
	
	public Pet() {}

	public Pet(String petName, int petage, char petGender, char petKind, String memberId) {
		super();
		this.petName = petName;
		this.petage = petage;
		this.petGender = petGender;
		this.petKind = petKind;
		this.memberId = memberId;
	}

	public Pet(int petNum, String petName, int petage, char petGender, char petKind, String memberId) {
		super();
		this.petNum = petNum;
		this.petName = petName;
		this.petage = petage;
		this.petGender = petGender;
		this.petKind = petKind;
		this.memberId = memberId;
	}

	public int getPetNum() {
		return petNum;
	}

	public void setPetNum(int petNum) {
		this.petNum = petNum;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public int getPetage() {
		return petage;
	}

	public void setPetage(int petage) {
		this.petage = petage;
	}

	public char getPetGender() {
		return petGender;
	}

	public void setPetGender(char petGender) {
		this.petGender = petGender;
	}

	public char getPetKind() {
		return petKind;
	}

	public void setPetKind(char petKind) {
		this.petKind = petKind;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Pet [petNum=" + petNum + ", petName=" + petName + ", petage=" + petage + ", petGender=" + petGender
				+ ", petKind=" + petKind + ", memberId=" + memberId + "]";
	}
	
	
	
}
