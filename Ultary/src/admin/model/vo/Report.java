package admin.model.vo;

import java.sql.Date;
/*
	RE_NUM, 
	RE_REASON, 
	RE_DATE, 
	RE_PROCESS, 
	RE_PERSON, 
	MEMBERID
 */

public class Report {
	private int reNum; // 신고번호
	private int reReason; // 신고사유
	private Date reDate; // 신고일
	private String reProcess; // 처리현황
	private String rePerson; // 신고자
	private String memberId; // 신고대상
}
