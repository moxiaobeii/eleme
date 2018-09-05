package eleme.service.impl;

import java.sql.SQLException;
import java.util.List;

import eleme.dao.OrderInfoDao;
import eleme.entity.Consignee;
import eleme.entity.OrderDetails;
import eleme.service.OrderService;

public class OrderServiceImpl implements OrderService{

	
	
	
	public List<Consignee> queryConsigneeById(int userId) throws SQLException{
		//查询收货人表
		return new OrderInfoDao().queryConsigneeById(userId);
		
	}

	//查询订单明细表
	public List<OrderDetails> queryOrderDetailsByOrderId(String oid) throws SQLException {
		return new OrderInfoDao().queryOrderDetailsByOrderId(oid);
	}

	public void insertConsignee(String name, int sex,String adress, long telphone,int userId) throws SQLException {
		new OrderInfoDao().insertConsignee(name,sex,adress,telphone,userId);
	}
	
	//插入收货地址
	
	
}
