package eleme.dto;

/**
 * 用于包装评价数据的实体类
 * @author wu
 *
 */
public class EvaluationData {
	private int serviceNum;//商家服务的等级
	private String texterea;//对商家服务评价
	private String speedTime;//送餐时间
	private String allfood;//商品评价组成字符串
	private String oid; //订单号
	private String bname; //店名
	private String username; //用户名
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public int getServiceNum() {
		return serviceNum;
	}
	public void setServiceNum(int serviceNum) {
		this.serviceNum = serviceNum;
	}
	public String getTexterea() {
		return texterea;
	}
	public void setTexterea(String texterea) {
		this.texterea = texterea;
	}
	public String getSpeedTime() {
		return speedTime;
	}
	public void setSpeedTime(String speedTime) {
		this.speedTime = speedTime;
	}
	public String getAllfood() {
		return allfood;
	}
	public void setAllfood(String allfood) {
		this.allfood = allfood;
	}
	
	
}
