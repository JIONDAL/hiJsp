package session_quiz;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	private Connection con;
	
	public MemberDAO() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "oracle";
		String password = "oracle";
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MemberDTO selectId(String id) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("SELECT * FROM session_quiz WHERE id=?");
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				MemberDTO memberDto = new MemberDTO();
				memberDto.setId(rs.getString("id"));
				memberDto.setPw(rs.getString("pw"));
				memberDto.setUserName(rs.getString("user_name"));
				memberDto.setAddress(rs.getString("address"));
				memberDto.setMobile(rs.getString("mobile"));
				return memberDto;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void register(String id, String pw, String userName, String address, String mobile) {
		String sql = "INSERT INTO session_quiz VALUES(?,?,?,?,?)";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			ps.setString(3, userName);
			ps.setString(4, address);
			ps.setString(5, mobile);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void disConnection() {
		try {
			if(con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberDTO> selectAll(int begin, int end) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<MemberDTO> members = new ArrayList<MemberDTO>();
		String sql = "SELECT BBB.* FROM "
				+ "(SELECT rownum as rn, AAA.* FROM "
				+ "(SELECT session_quiz.* FROM session_quiz ORDER BY id)AAA"
				+ ")BBB "
				+ "WHERE BBB.rn >= ? AND BBB.rn <= ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, begin);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberDTO memberDto = new MemberDTO();
				memberDto.setId(rs.getString("id"));
				memberDto.setPw(rs.getString("pw"));
				memberDto.setUserName(rs.getString("user_name"));
				memberDto.setAddress(rs.getString("address"));
				memberDto.setMobile(rs.getString("mobile"));
				members.add(memberDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return members;
	}
	public int count() {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql ="";
		int count = 0;
		try {
			sql ="SELECT count(id) FROM session_quiz";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	public ArrayList<MemberDTO> selectAll(int begin, int end, String select, String search) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		ArrayList<MemberDTO> members = new ArrayList<MemberDTO>();
		String sql = "";
		if(select.equals("id")) {
			sql ="SELECT BBB.* "
			+ "FROM (SELECT rownum as rn, AAA.* "
			+ "FROM (SELECT session_quiz.* "
			+ "FROM session_quiz WHERE id like ? ORDER BY id)AAA)BBB "
			+ "WHERE BBB.rn >= ? AND BBB.rn <= ?";
		}else {
			sql ="SELECT BBB.* "
			+ "FROM (SELECT rownum as rn, AAA.* "
			+ "FROM (SELECT session_quiz.* "
			+ "FROM session_quiz WHERE mobile like ? ORDER BY id)AAA)BBB "
			+ "WHERE BBB.rn >= ? AND BBB.rn <= ?";
		}
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+search+"%");
			ps.setInt(2, begin);
			ps.setInt(3, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberDTO memberDto = new MemberDTO();
				memberDto.setId(rs.getString("id"));
				memberDto.setPw(rs.getString("pw"));
				memberDto.setUserName(rs.getString("user_name"));
				memberDto.setAddress(rs.getString("address"));
				memberDto.setMobile(rs.getString("mobile"));
				members.add(memberDto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return members;
	}
	
	public int count(String select, String search) {
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql ="";
		int count = 0;
		try {
			if(select.equals("id"))
				sql ="SELECT count(id) FROM session_quiz WHERE id like ?";
			else
				sql ="SELECT count(id) FROM session_quiz WHERE mobile like ?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, "%"+search+"%");
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public void update(String id, String pw, String userName, String address, String mobile) {
		String sql = "UPDATE session_quiz SET pw=?, user_name=?, address=?, mobile=? WHERE id=?";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, pw);
			ps.setString(2, userName);
			ps.setString(3, address);
			ps.setString(4, mobile);
			ps.setString(5, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String id) {
		String sql = "DELETE FROM session_quiz WHERE id=?";
		PreparedStatement ps = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}

/*
 SELECT rownum as rn, session_exam.* FROM session_exam WHERE id like '%test%';
SELECT BBB.rn, BBB.id FROM (SELECT rownum as rn, session_exam.* FROM session_exam)BBB
WHERE BBB.rn >= 5 AND BBB.rn <= 8;

SELECT id FROM session_exam WHERE id like '%test%';
SELECT count(id) FROM session_exam WHERE id like '%test%';

SELECT * FROM session_quiz;
INSERT INTO session_quiz VALUES('tester1', '1111','테스터일','서울시 일구', '010-1234-1111');
INSERT INTO session_quiz VALUES('tester2', '1111','테스터이','서울시 이구', '010-1234-2222');
INSERT INTO session_quiz VALUES('tester3', '1111','테스터삼','서울시 삼구', '010-1234-3333');
INSERT INTO session_quiz VALUES('tester4', '1111','테스터사','서울시 사구', '010-1234-4444');
INSERT INTO session_quiz VALUES('tester5', '1111','테스터오','서울시 오구', '010-1234-5555');

INSERT INTO session_quiz VALUES('user1', '1111','유저일','서울시 일구', '010-1234-6666');
INSERT INTO session_quiz VALUES('user2', '1111','유저이','서울시 이구', '010-1234-7777');
INSERT INTO session_quiz VALUES('user3', '1111','유저삼','서울시 삼구', '010-1234-8888');
INSERT INTO session_quiz VALUES('user4', '1111','유저사','서울시 사구', '010-1234-9999');
INSERT INTO session_quiz VALUES('user5', '1111','유저오','서울시 오구', '010-1234-0000');

COMMIT;

SELECT session_quiz.* FROM session_quiz ORDER BY id;

SELECT rownum as rn, AAA.* 
FROM (SELECT session_quiz.* FROM session_quiz ORDER BY id)AAA;

SELECT BBB.* FROM 
(SELECT rownum as rn, AAA.* FROM (SELECT session_quiz.* FROM session_quiz ORDER BY id)AAA)BBB
WHERE BBB.rn >= 1 AND BBB.rn <= 15;

SELECT AAA.* 
FROM (SELECT rownum as rn, id, pw, name, email FROM session_exam WHERE id like '%u%')AAA 
WHERE AAA.rn<= 10 AND AAA.rn >=1;


SELECT session_quiz.* FROM session_quiz WHERE id like '%test%' ORDER BY id;

SELECT rownum as rn, AAA.* 
FROM (SELECT session_quiz.* FROM session_quiz WHERE id like '%test%' ORDER BY id)AAA;

SELECT BBB.* FROM 
(SELECT rownum as rn, AAA.* 
FROM (SELECT session_quiz.* FROM session_quiz WHERE id like '%test%' ORDER BY id)AAA)BBB
WHERE BBB.rn >= 4 AND BBB.rn <= 6;
 */











