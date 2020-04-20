package post.model.vo;

import java.sql.Date;

public class PostComment {
	private int cNum; // 댓글번호
	private String cContent; // 댓글내용
	private Date cDate; // 댓글 작성일
	private int cLike; // 댓글좋아요수
	private int cRange; // 비밀여부
	private int postNum; // 글번호
	private String memberid; // 회원아이디
}
