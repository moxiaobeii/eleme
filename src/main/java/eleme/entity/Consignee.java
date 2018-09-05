package eleme.entity;

/**
 * 收货人实体类
 * @author momo
 *
 */
public class Consignee {
	private int con_id;  //收货人id
	private String name;  //收货人
	private int sex;  //性别
	private String address;  //地址
	private long telphone;  //联系方式
	private User user;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getCon_id() {
		return con_id;
	}
	public void setCon_id(int con_id) {
		this.con_id = con_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public long getTelphone() {
		return telphone;
	}
	public void setTelphone(long telphone) {
		this.telphone = telphone;
	}
	
}
