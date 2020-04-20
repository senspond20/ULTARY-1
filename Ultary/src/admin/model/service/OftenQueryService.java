package admin.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import admin.model.dao.NoticeDAO;
import admin.model.dao.OftenQueryDAO;
import admin.model.vo.Notice;
import admin.model.vo.OftenQuery;

public class OftenQueryService {

	public ArrayList<OftenQuery> selectList() {
		Connection conn = getConnection();

		ArrayList<OftenQuery> list = new OftenQueryDAO().selectList(conn);
		close(conn);
		
		return list;
	}

	public ArrayList<OftenQuery> selectList(String option, String search) {
		Connection conn = getConnection();
		ArrayList<OftenQuery> list = new OftenQueryDAO().selectList(conn,option,search);
		close(conn);
		return list;
	}

	public ArrayList<OftenQuery> selectList(int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<OftenQuery> list = new OftenQueryDAO().selectList(conn,currentPage,boardLimit);
		close(conn);
		return list;
	}
	
	public ArrayList<OftenQuery> selectList(String option, String search, int currentPage, int boardLimit) {
		Connection conn = getConnection();
		ArrayList<OftenQuery> list = new OftenQueryDAO().selectList(conn,option,search,currentPage,boardLimit);
		close(conn);
		return list;
	}

	public int getCountFilter(String option, String search) {
		Connection conn = getConnection();
		int result = new OftenQueryDAO().getCountFilter(conn,option,search);
		return result;
	}

	public int getCountAll() {
		Connection conn = getConnection();
		int result = new OftenQueryDAO().getCountAll(conn);
		return result;
	}



}
