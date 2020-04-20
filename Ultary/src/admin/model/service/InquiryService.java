package admin.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.dao.InquiryDAO;
import admin.model.vo.Inquiry;
import admin.model.vo.Notice;

public class InquiryService {
	
	public int insertInquiry(Inquiry n) {
		Connection conn = getConnection();
		int result = new InquiryDAO().insertInquiry(conn, n);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Inquiry> selectList() {
		Connection conn = getConnection();
		ArrayList<Inquiry> list = new InquiryDAO().selectList(conn);
		
		close(conn);
		return list;
	}

	public int answerInquiry(int no, String answer) {
		Connection conn = getConnection();
		int result = new InquiryDAO().updateInquiry(conn, no, answer);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Inquiry> selectFilter(String option, String search, String check) {
		Connection conn = getConnection();
		ArrayList<Inquiry> list = new InquiryDAO().selectList(conn, option,search, check);
		close(conn);
		return list;
	}

	public ArrayList<Inquiry> selectList(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<Inquiry> list = new InquiryDAO().selectList(conn, currentPage, boardLimit);
		return list;
	}

	public ArrayList<Inquiry> selectList(String option, String search, String check, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<Inquiry> list = new InquiryDAO().selectList(conn,option,search,check,currentPage, boardLimit);
		return list;
	}

}
