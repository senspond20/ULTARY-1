package admin.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.dao.NoticeDAO;
import admin.model.vo.Notice;

public class NoticeService {

	public ArrayList<Notice> selectList() {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDAO().selectList(conn);
		close(conn);

		return list;
	}

	public int insertNotice(Notice n) {
		Connection conn = getConnection();
		int result = new NoticeDAO().insertNotice(conn, n);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	public Notice selectNotice(int no) {
		Connection conn = getConnection();

		NoticeDAO nDAO = new NoticeDAO();

		int result = nDAO.updateCount(conn, no); // 조회수 업데이트 용

		Notice n = null;
		if (result > 0) {
			n = new NoticeDAO().selectNotice(conn, no);

			if (n != null) {
				commit(conn);// 이 커밋은 조회수 업데이트에 관한 커밋!
			} else {
				rollback(conn);
			}
		}

		close(conn);

		return n;
	}

	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		int result = new NoticeDAO().updateNotice(conn, n);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return result;

	}

	public int deleteNotice(int nno) {
		Connection conn = getConnection();
		int result = new NoticeDAO().deleteNotice(conn, nno);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	public int getListCountAll() {
		Connection conn = getConnection();
		int result = new NoticeDAO().getListCountAll(conn);
		close(conn);
		return result;
	}

	public int getListCountFilter(String option, String searchKeyword) {
		Connection conn = getConnection();
		int result = new NoticeDAO().getListCountFilter(conn, option, searchKeyword);
		close(conn);
		return result;
	}

	public ArrayList<Notice> selectList(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDAO().selectList(conn, currentPage, boardLimit);
		close(conn);
		return list;
	}

	public ArrayList<Notice> selectList(String option, String searchKeyword, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDAO().selectList(conn, option, searchKeyword, currentPage, boardLimit);
		close(conn);
		return list;
	}

}
