package admin.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import admin.model.vo.OftenQuery;

public class OftenQueryDAO {
	private Properties prop = new Properties();

	public OftenQueryDAO() {
		String fileName = OftenQueryDAO.class.getResource("/sql/admin/oftenq-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<OftenQuery> selectList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;

		ArrayList<OftenQuery> list = null;

		String query = prop.getProperty("selectList");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			list = new ArrayList<OftenQuery>();

			while (rset.next()) {
				OftenQuery no = new OftenQuery(rset.getInt("Q_NUM"), rset.getString("Q_TITLE"),
						rset.getString("Q_CONTENT"));
				list.add(no);

				// System.out.println(list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public ArrayList<OftenQuery> selectListN(Connection conn, int n) {

		PreparedStatement psmt = null;
		ResultSet rset = null;

		ArrayList<OftenQuery> list = null;

		String query = prop.getProperty("selectListN");

		try {

			psmt = conn.prepareStatement(query);
			psmt.setInt(1, n);
			rset = psmt.executeQuery();

			list = new ArrayList<OftenQuery>();

			while (rset.next()) {
				OftenQuery no = new OftenQuery(rset.getInt("Q_NUM"), rset.getString("Q_TITLE"),
						rset.getString("Q_CONTENT"));
				list.add(no);

				// System.out.println(list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		return list;

	}

	public ArrayList<OftenQuery> selectList(Connection conn, String option, String search) {

		String keyword = "%" + search + "%";

		String query = null;

		if (option.charAt(0) == 'A') {
			query = "select * from OFTENQUERY WHERE Q_TITLE || Q_CONTENT LIKE(?) ORDER BY Q_NUM ASC";
		} else if (option.charAt(0) == 'T') {
			query = "select * from OFTENQUERY WHERE Q_TITLE LIKE(?) ORDER BY Q_NUM ASC";
		} else if (option.charAt(0) == 'C') {
			query = "select * from OFTENQUERY WHERE Q_CONTENT LIKE(?) ORDER BY Q_NUM ASC";
		} else {
			query = "select * from OFTENQUERY ORDER BY Q_NUM ASC";
		}

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<OftenQuery> list = null;

		try {

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();

			list = new ArrayList<OftenQuery>();

			while (rset.next()) {
				OftenQuery no = new OftenQuery(rset.getInt("Q_NUM"), rset.getString("Q_TITLE"),
						rset.getString("Q_CONTENT"));
				list.add(no);

				// System.out.println(list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<OftenQuery> selectList
	(Connection conn, String option, String search, int currentPage,int boardLimit) 
	{
		String query = prop.getProperty("selectListFP");

		if (option.equals("T")) {
			query = query.replace("Q_TITLE || Q_CONTENT", "Q_TITLE");
		} else if (option.equals("C")) {
			query = query.replace("Q_TITLE || Q_CONTENT", "Q_CONTENT");
		}
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String keyword = "%" + search + "%";

		ArrayList<OftenQuery> list = null;
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;

		try {

			list = new ArrayList<OftenQuery>();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();

			while (rset.next()) {
				OftenQuery no = new OftenQuery
				(rset.getInt("Q_NUM"), rset.getString("Q_TITLE"), rset.getString("Q_CONTENT"));
				list.add(no);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getCountFilter(Connection conn, String option, String search) {
		// String query = "select COUNT(*) from OFTENQUERY WHERE Q_TITLE || Q_CONTENT
		// LIKE(?)";

		String query = prop.getProperty("getCountFilter");
		if (option.equals("T")) {
			query = query.replace("Q_TITLE || Q_CONTENT", "Q_TITLE");
		} else if (option.equals("C")) {
			query = query.replace("Q_TITLE || Q_CONTENT", "Q_CONTENT");
		}
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String keyword = "%" + search + "%";

		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return result;
	}

	public int getCountAll(Connection conn) {
		String query = prop.getProperty("getCountAll");

		Statement stmt = null;
		ResultSet rset = null;

		int result = 0;

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return result;
	}

	public ArrayList<OftenQuery> selectList(Connection conn, int currentPage, int boardLimit) {
		String query = prop.getProperty("selectListP");

	
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<OftenQuery> list = null;
		
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;

		try {

			list = new ArrayList<OftenQuery>();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();

			while (rset.next()) {
				OftenQuery no = new OftenQuery
				(rset.getInt("Q_NUM"), rset.getString("Q_TITLE"), rset.getString("Q_CONTENT"));
				list.add(no);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
