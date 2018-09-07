package eleme.entity;

/**
 * 商品评价收货人
 * @author momo
 *
 */
public class Evaluation {
	private int eid;  //评价id
	private String service_content;  //评价内容
	private double service_evaluation;  //服务评价   0-3:不满意  4-5满意
	private String good_evaluation;  //菜品评价组成的字符串
	private String feeding_speed;  //送餐速度
	private String sell_reply;   //商家回复内容
	private String oid;  //订单
	private String bname; //店名
	private String username; // 用户名
	private String evalDate; //用户评价时间
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEvalDate() {
		return evalDate;
	}
	public void setEvalDate(String evalDate) {
		this.evalDate = evalDate;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public String getService_content() {
		return service_content;
	}
	public void setService_content(String service_content) {
		this.service_content = service_content;
	}
	public double getService_evaluation() {
		return service_evaluation;
	}
	public void setService_evaluation(double service_evaluation) {
		this.service_evaluation = service_evaluation;
	}
	public String getGood_evaluation() {
		return good_evaluation;
	}
	public void setGood_evaluation(String good_evaluation) {
		this.good_evaluation = good_evaluation;
	}
	public String getFeeding_speed() {
		return feeding_speed;
	}
	public void setFeeding_speed(String feeding_speed) {
		this.feeding_speed = feeding_speed;
	}
	public String getSell_reply() {
		return sell_reply;
	}
	public void setSell_reply(String sell_reply) {
		this.sell_reply = sell_reply;
	}
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	
	
}
