package eleme.entity;

import java.util.List;

/**
 * 订单详情实体类
 * @author momo
 *
 */
public class OrderDetails {
	private String cart_id;  //订单详情id
	private double subtotal;  //订单小计
	private int count;  //数量
	private String bname;  //商家名称
	private int good_evaluation;  //商品评价
	private Orders orders;  //订单
	private String gname;  //商品
	
	public String getCart_id() {
		return cart_id;
	}
	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public int getGood_evaluation() {
		return good_evaluation;
	}
	public void setGood_evaluation(int good_evaluation) {
		this.good_evaluation = good_evaluation;
	}
	public Orders getOrders() {
		return orders;
	}
	public void setOrders(Orders orders) {
		this.orders = orders;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}

}

