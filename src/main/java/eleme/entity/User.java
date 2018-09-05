package eleme.entity;

/**
 * 消费者实体类
 * @author momo
 *
 */
public class User {
	
	private int userId;
	private long telphone;
	private String username;
	private String password;
	private int myRedPaper;
	private int myGold;
	private long myCount;
	
	public int getMyGold() {
		return myGold;
	}
	public void setMyGold(int myGold) {
		this.myGold = myGold;
	}
	public long getMyCount() {
		return myCount;
	}
	public void setMyCount(long myCount) {
		this.myCount = myCount;
	}
	public int getMyRedPaper() {
		return myRedPaper;
	}
	public void setMyRedPaper(int myRedPaper) {
		this.myRedPaper = myRedPaper;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public long getTelphone() {
		return telphone;
	}
	public void setTelphone(long telphone) {
		this.telphone = telphone;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
