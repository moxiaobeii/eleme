package eleme.service;

import java.sql.SQLException;
import java.util.List;

import eleme.entity.Business;
import eleme.entity.Consignee;
import eleme.entity.Orders;
import eleme.entity.User;

public interface ConsigneeService {
	
	//查询收货信息
	public List<Consignee> queryConsignee();
	
	//查询用户信息
	public User queryUserInfo(User user) ;
	
	//查询收藏商家信息
	public List<Business> queryCollectedBusinessInfo();
	
	//查询订单信息
	public List<Orders> queryRecentlyOrderInfo(int userId);
	
	//保存收货人信息
	public void saveConsigneeInfo(Consignee consignee);
	
	//删除收货人信息
	public void deleteConsigneeInfo(int id);
	
	//修改收货人信息
	public void updateConsigneeInfo(Consignee consignee);
}
