package eleme.entity;

import java.util.Date;
import java.util.List;

/**
 * 订单实体类
 * @author momo
 *
 */
public class Orders {
	private String oid;  //订单id
	private String bname;  //商家名称
	private Date create_time;  //创建时间
	private int total_count;  //总数量
	private int good_count;//购买总量
	public int getGood_count() {
		return good_count;
	}
	public void setGood_count(int good_count) {
		this.good_count = good_count;
	}
	public String getBusinessPhoto() {
		return businessPhoto;
	}
	public void setBusinessPhoto(String businessPhoto) {
		this.businessPhoto = businessPhoto;
	}
	private double total_price;  //总价格
	private int pay_way;  //支付方式 '付款方式 0:支付宝  1：微信  2：易宝'
	private String order_remarks;  //订单备注
	private int order_status;  //订单状态 0:未付款 1:订单失效 2:已付款 3:未送达 4:已送达
	private User user;   //用户
	private Consignee consignee;  //收货人
 	private List<OrderDetails> orderDetails;  //订单详情
 	private String businessPhoto;//商家照片
 	
	
	public String getOid() {
		return oid;
	}
	public void setOid(String oid) {
		this.oid = oid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public int getTotal_count() {
		return total_count;
	}
	public void setTotal_count(int total_count) {
		this.total_count = total_count;
	}
	public double getTotal_price() {
		return total_price;
	}
	public void setTotal_price(double total_price) {
		this.total_price = total_price;
	}
	public int getPay_way() {
		return pay_way;
	}
	public void setPay_way(int pay_way) {
		this.pay_way = pay_way;
	}
	public String getOrder_remarks() {
		return order_remarks;
	}
	public void setOrder_remarks(String order_remarks) {
		this.order_remarks = order_remarks;
	}
	public int getOrder_status() {
		return order_status;
	}
	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Consignee getConsignee() {
		return consignee;
	}
	public void setConsignee(Consignee consignee) {
		this.consignee = consignee;
	}
	public List<OrderDetails> getOrderDetails() {
		return orderDetails;
	}
	public void setOrderDetails(List<OrderDetails> orderDetails) {
		this.orderDetails = orderDetails;
	}
	
	
}
