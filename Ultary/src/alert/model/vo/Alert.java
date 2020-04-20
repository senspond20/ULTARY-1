package alert.model.vo;

import java.sql.Date;

public class Alert {
	private int alNum; // 알림창 번호
	private Date alDate; // 알림일자
	private String alLink; // 알림링크
	private String memberId; // 회원아이디
	private int alKind; // 알림종류
}
