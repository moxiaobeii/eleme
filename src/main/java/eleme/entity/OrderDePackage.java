package eleme.entity;

import java.util.List;

/**
 * 包装订单，订单详情，收货人信息的实体类
 * @author wu
 *
 */
public class OrderDePackage {
	private Orders order;
	private List<OrderDetails> orderDetails;
	private Consignee consignee;
	public Orders getOrder() {
		return order;
	}
	public void setOrder(Orders order) {
		this.order = order;
	}
	public List<OrderDetails> getOrderDetails() {
		return orderDetails;
	}
	public void setOrderDetails(List<OrderDetails> orderDetails) {
		this.orderDetails = orderDetails;
	}
	public Consignee getConsignee() {
		return consignee;
	}
	public void setConsignee(Consignee consignee) {
		this.consignee = consignee;
	}
	
	
}
