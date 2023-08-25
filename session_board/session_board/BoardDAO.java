package session_board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {
	private Connection con;
	
	public BoardDAO() {
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
	public void disConnection() {
		try {
			if(con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int count() {
		String sql = "SELECT count(no) FROM session_board";
		PreparedStatement ps= null;
		ResultSet rs = null;
		int count = 0;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public ArrayList<BoardDTO> selectAll(int begin, int end) {
		String sql = "SELECT BBB.* FROM "
				+ "(SELECT rownum as rn, AAA.* FROM "
				+ "(SELECT session_board.* FROM session_board order by no desc)AAA)BBB "
				+ "WHERE BBB.rn >= ? AND BBB.rn <= ?";
		PreparedStatement ps= null;
		ResultSet rs = null;
		ArrayList<BoardDTO> boards = new ArrayList<>();
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, begin);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setNo(rs.getInt("no"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setId(rs.getString("id"));
				board.setWriteDate(rs.getString("write_date"));
				board.setHits(rs.getInt("hits"));
				board.setFileName(rs.getString("file_name"));
				boards.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boards;
	}
	
	public int selectMaxNo() {
		int no = 0;
		String sql = "SELECT max(no)+1 FROM session_board";
		PreparedStatement ps= null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				no = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return no;
	}
	
	public void write(BoardDTO board) {
		String sql = "INSERT INTO session_board VALUES(?,?,?,?,?,?,?)";
		PreparedStatement ps= null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, board.getNo());
			ps.setString(2, board.getTitle());
			ps.setString(3, board.getContent());
			ps.setString(4, board.getId());
			ps.setString(5, board.getWriteDate());
			ps.setInt(6, board.getHits());
			ps.setString(7, board.getFileName());
			ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateHits(int no) {
		String sql = "UPDATE session_board SET hits=hits+1 WHERE no=?";
		PreparedStatement ps= null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public BoardDTO selectNo(int no) {
		String sql = "SELECT * FROM session_board WHERE no=?";
		PreparedStatement ps= null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			if(rs.next()) {
				updateHits(no);
				BoardDTO board = new BoardDTO();
				board.setNo(rs.getInt("no"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setId(rs.getString("id"));
				board.setWriteDate(rs.getString("write_date"));
				board.setHits(rs.getInt("hits")+1);
				board.setFileName(rs.getString("file_name"));
				return board;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public BoardDTO searchForModify(int no) {
		String sql = "SELECT * FROM session_board WHERE no=?";
		PreparedStatement ps= null;
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			if(rs.next()) {
				BoardDTO board = new BoardDTO();
				board.setNo(rs.getInt("no"));
				board.setTitle(rs.getString("title"));
				board.setContent(rs.getString("content"));
				board.setId(rs.getString("id"));
				board.setWriteDate(rs.getString("write_date"));
				board.setHits(rs.getInt("hits")+1);
				board.setFileName(rs.getString("file_name"));
				return board;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void modify(int no, String title, String content) {
		String sql = "UPDATE session_board SET title=?, content=? WHERE no=?";
		PreparedStatement ps= null;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setInt(3, no);
			ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delete(int no) {
		String sql = "DELETE FROM session_board WHERE no=?";
		PreparedStatement ps= null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, no);
			ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
/*
INSERT INTO session_board VALUES(1, '테스트1', '테스트1','tester1','2023-06-20',0,'');
INSERT INTO session_board VALUES(2, '테스트2', '테스트2','tester2','2023-06-20',0,'');
INSERT INTO session_board VALUES(3, '테스트3', '테스트3','tester3','2023-06-20',0,'');
INSERT INTO session_board VALUES(4, '테스트4', '테스트4','tester4','2023-06-21',0,'');
INSERT INTO session_board VALUES(5, '테스트5', '테스트5','tester5','2023-06-21',0,'');
INSERT INTO session_board VALUES(6, '테스트6', '테스트6','user1','2023-06-21',0,'');
INSERT INTO session_board VALUES(7, '테스트7', '테스트7','user2','2023-06-22',0,'');
INSERT INTO session_board VALUES(8, '테스트8', '테스트8','user3','2023-06-22',0,'');
INSERT INTO session_board VALUES(9, '테스트9', '테스트9','user4','2023-06-22',0,'');
INSERT INTO session_board VALUES(10, '테스트10', '테스트10','user5','2023-06-23',0,'');
INSERT INTO session_board VALUES(11, '테스트11', '테스트11','admin','2023-06-23',0,'');
commit;

SELECT session_board.* FROM session_board order by no desc;

SELECT rownum as rn, AAA.* FROM (SELECT session_board.* FROM session_board order by no desc)AAA;

SELECT BBB.* FROM 
(SELECT rownum as rn, AAA.* FROM 
(SELECT session_board.* FROM session_board order by no desc)AAA)BBB 
WHERE BBB.rn >= 10 AND BBB.rn <= 12;

*/






