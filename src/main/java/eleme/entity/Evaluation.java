package eleme.entity;

/**
 * 商品评价收货人
 * @author momo
 *
 */
public class Evaluation {
	private int eid;  //评价id
	private String service_content;  //评价内容
	private String service_evaluation;  //服务评价   0-3:不满意  4-5满意
	private double good_evaluation;  //菜品评价
	private int feeding_speed;  //送餐速度
	private String sell_reply;   //商家回复内容
	private Orders orders;  //订单
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
	public String getService_evaluation() {
		return service_evaluation;
	}
	public void setService_evaluation(String service_evaluation) {
		this.service_evaluation = service_evaluation;
	}
	public double getGood_evaluation() {
		return good_evaluation;
	}
	public void setGood_evaluation(double good_evaluation) {
		this.good_evaluation = good_evaluation;
	}
	public int getFeeding_speed() {
		return feeding_speed;
	}
	public void setFeeding_speed(int feeding_speed) {
		this.feeding_speed = feeding_speed;
	}
	public String getSell_reply() {
		return sell_reply;
	}
	public void setSell_reply(String sell_reply) {
		this.sell_reply = sell_reply;
	}
	public Orders getOrders() {
		return orders;
	}
	public void setOrders(Orders orders) {
		this.orders = orders;
	}
	
	
}
