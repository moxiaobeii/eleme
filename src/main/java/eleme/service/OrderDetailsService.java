package eleme.service;

import java.util.List;

import eleme.entity.Consignee;
import eleme.entity.OrderDetails;
import eleme.entity.Orders;

public interface OrderDetailsService {
	
	/**
	 *	根据订单号获得订单 
	 */
	public Orders getOrdersInfo(String oid);
	
	/**
	 * 根据订单号获得订单详情
	 * @param oid
	 * @return
	 */
	public List<OrderDetails> getOrderDetails(String oid);
	
	/**
	 * 根据收货ID获得收货人信息
	 * @param cid
	 * @return
	 */
	public Consignee getConsigneeInfo(String cid);
}
