package session_quiz;
/*
CREATE TABLE session_quiz(
id varchar2(20),
pw varchar2(20),
user_name varchar2(21),
address varchar2(200),
mobile varchar2(20),
PRIMARY KEY(id)
);

COMMIT;
 */
public class MemberDTO {
	// 테이블 이름 : session_quiz
	// userName -> user_name
	private String id;
	private String pw;
	private String confirm;
	private String userName;
	private String address;
	private String mobile;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	
}
