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

import admin.model.vo.Inquiry;

public class InquiryDAO {
	
private Properties prop = new Properties();
	
	public InquiryDAO() {
		String fileName
		=InquiryDAO.class.getResource("/sql/admin/inquiry-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertInquiry(Connection conn, Inquiry n) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertInquiry"); 
		
		try {
			pstmt = conn.prepareStatement(query);
			
// insertInquiry = insert into inquiry values(seq_inquirynum.nextval, ? , ? , sysdate, default, null,null, ?)
			pstmt.setString(1, n.getInquirytitle()); //臾몄쓽 �젣紐�
			pstmt.setString(2, n.getInquirycontent()); //臾몄쓽 �궡�슜

			pstmt.setString(3, n.getMemeberid());  // �쉶�썝 �븘�씠�뵒

			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public ArrayList<Inquiry> selectList(Connection conn) {
		
		String query= "select * from inquiry";
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Inquiry> list = null;
		
		try {
			
			stmt = conn.createStatement();	
			rset = stmt.executeQuery(query);
			list = new ArrayList<Inquiry>();
			Inquiry i = null;
			
			while(rset.next()) {
				i = new Inquiry(rset.getInt("INQUIRYNUM"),
								rset.getString("INQUIRYTITLE"),
								rset.getString("INQUIRYCONTENT"),
								rset.getDate("INQUIRYDATE"),
								rset.getString("ANSWER"),
								rset.getDate("ANSWERDATE"),
								rset.getString("ANS_CONTENT"),
								rset.getString("MEMBERID"));
				list.add(i);			
						
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}

		return list;
	}

	public int updateInquiry(Connection conn, int no, String answer) {
		String query = prop.getProperty("updateInquriyANSWER");
		
	//	"UPDATE INQUIRY SET ANSWER = 'Y', ANSWERDATE = SYSDATE, ANS_CONTENT ='�떟蹂��엯�땲�떎.' WHERE INQUIRYNUM = 1";

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		try {
			pstmt  = conn.prepareStatement(query);
			pstmt.setString(1, answer);
			pstmt.setInt(2, no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Inquiry> selectList
	(Connection conn, String option, String search, String check) {
	
		//SELECT * FROM INQUIRY WHERE INQUIRYTITLE || INQUIRYCONTENT LIKE(?) AND ANSWER = ?;
		
		String query = null;
		String keyword = "%" + search + "%";
		String checkYN = "N";
		
		if(check !=null) {
			checkYN = "Y";
		}
		
		if(option.equals("A")) {
			query = "SELECT * FROM INQUIRY WHERE INQUIRYTITLE || INQUIRYCONTENT LIKE(?) AND ANSWER = ?";
		}else if(option.equals("U")) {
			query = "SELECT * FROM INQUIRY WHERE MEMBERID LIKE(?) AND ANSWER = ?";
		}
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Inquiry> list = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, keyword);
			pstmt.setString(2, checkYN);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Inquiry>();
			Inquiry i = null;
			
			while(rset.next()) {
				i = new Inquiry(rset.getInt("INQUIRYNUM"),
								rset.getString("INQUIRYTITLE"),
								rset.getString("INQUIRYCONTENT"),
								rset.getDate("INQUIRYDATE"),
								rset.getString("ANSWER"),
								rset.getDate("ANSWERDATE"),
								rset.getString("ANS_CONTENT"),
								rset.getString("MEMBERID"));
				list.add(i);					
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public ArrayList<Inquiry> selectList(Connection conn, int currentPage, int boardLimit) {
	
		String query = prop.getProperty("selectListP");
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Inquiry> list = null;
		
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Inquiry>();
			Inquiry i = null;
			
			while(rset.next()) {
				i = new Inquiry(rset.getInt("INQUIRYNUM"),
								rset.getString("INQUIRYTITLE"),
								rset.getString("INQUIRYCONTENT"),
								rset.getDate("INQUIRYDATE"),
								rset.getString("ANSWER"),
								rset.getDate("ANSWERDATE"),
								rset.getString("ANS_CONTENT"),
								rset.getString("MEMBERID"));
				list.add(i);					
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public ArrayList<Inquiry> selectList
	(Connection conn, String option, String search, String check, int currentPage,int boardLimit) {
		
		String keyword = "%" + search + "%";
		String checkYN = "N";
		
		if(check !=null) {
			checkYN = "Y";
		}
		
		String query = prop.getProperty("selectListFP");
		if(option.equals("A")) {
			query = query.replace("WHERECONDITION", "INQUIRYTITLE || INQUIRYCONTENT");
		}else if(option.equals("U")) {
			query = query.replace("WHERECONDITION", "MEMBERID");
		}
		
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Inquiry> list = null;
		
		int startRow = (currentPage - 1) * boardLimit + 1;
		int endRow = startRow + boardLimit - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setString(3,keyword);
			pstmt.setString(4, checkYN);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Inquiry>();
			Inquiry i = null;
			
			while(rset.next()) {
				i = new Inquiry(rset.getInt("INQUIRYNUM"),
								rset.getString("INQUIRYTITLE"),
								rset.getString("INQUIRYCONTENT"),
								rset.getDate("INQUIRYDATE"),
								rset.getString("ANSWER"),
								rset.getDate("ANSWERDATE"),
								rset.getString("ANS_CONTENT"),
								rset.getString("MEMBERID"));
				list.add(i);					
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


