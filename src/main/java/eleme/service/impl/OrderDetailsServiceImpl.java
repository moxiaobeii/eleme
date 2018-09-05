package eleme.service.impl;

import java.util.List;

import eleme.dao.OrderDetailsDao;
import eleme.entity.Consignee;
import eleme.entity.OrderDetails;
import eleme.entity.Orders;
import eleme.service.OrderDetailsService;

public class OrderDetailsServiceImpl implements OrderDetailsService{
	private OrderDetailsDao orderDetailsdao = new OrderDetailsDao();
	
	public Orders getOrdersInfo(String oid) {
		Orders orders = orderDetailsdao.getOrdersInfo(oid);
		
		return orders;
	}

	public List<OrderDetails> getOrderDetails(String oid) {
		List<OrderDetails> orderDeteils = orderDetailsdao.getOrderDeteils(oid);
		return orderDeteils;
	}

	public Consignee getConsigneeInfo(String oid) {
		Consignee consignee = orderDetailsdao.getConsignee(oid);
		return consignee;
	}

}
