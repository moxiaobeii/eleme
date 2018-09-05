package eleme.service.impl;

import java.sql.SQLException;
import java.util.List;

import com.alipay.api.domain.DashboardParam;

import eleme.dao.ConsigneeDao;
import eleme.entity.Business;
import eleme.entity.Consignee;
import eleme.entity.OrderDetails;
import eleme.entity.Orders;
import eleme.entity.User;
import eleme.service.ConsigneeService;

public class ConsigneeServiceImpl implements ConsigneeService{
	
	//获取收获人信息，返回到dao层进行查询
	public List<Consignee> queryConsignee() {
		ConsigneeDao dao = new ConsigneeDao();
		try {
			return dao.getConsigneeInfo();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public User queryUserInfo(User user) {
		// TODO Auto-generated method stub
		ConsigneeDao dao = new ConsigneeDao();
		try {
			return dao.queryUserInfo(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}

	public List<Business> queryCollectedBusinessInfo() {
		ConsigneeDao dao = new ConsigneeDao();
		try {
			return dao.queryCollectedBusinessInfo();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	//查询近三个月订单详情
	public List<Orders> queryRecentlyOrderInfo(int userId) {
		ConsigneeDao queryRecentlyOrdersService = new ConsigneeDao();
		try {
			//查询出order表里的字段
			List<Orders> queryRecentlyOrders = queryRecentlyOrdersService.queryRecentlyOrders(userId);
			
			//循环遍历去获取order bean中的List<orderDtails>字段并从数据库中查询赋值
			for(int i = 0;i < queryRecentlyOrders.size(); i ++){
				
				int good_count=0;//购买总量
				String oid = queryRecentlyOrders.get(i).getOid();
				ConsigneeDao queryRecentlyOrdersService2 = new ConsigneeDao();
				
				//循环遍历获取每个oid对应的商品名称和数量
	            List<OrderDetails> orderDetailInfo = queryRecentlyOrdersService2.queryOrderDetailsInfo(oid);
	            queryRecentlyOrders.get(i).setOrderDetails(orderDetailInfo);
	            
	            for(int j=0; j< orderDetailInfo.size(); j++){
	            	good_count += orderDetailInfo.get(j).getCount();
	            }
	            queryRecentlyOrders.get(i).setGood_count(good_count);
//	            ConsigneeDao queryRecentlyOrdersService3 = new ConsigneeDao();
//	            String aString = queryRecentlyOrdersService3.queryBusinessLogo();
	        }
			return queryRecentlyOrders;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}

	//保存收货人信息
	public void saveConsigneeInfo(Consignee consignee) {
		// TODO Auto-generated method stub
		ConsigneeDao saveConsigneeInfo = new ConsigneeDao();
		try {
			saveConsigneeInfo.saveConsigneeInfo(consignee);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deleteConsigneeInfo(int id) {
		// TODO Auto-generated method stub
		ConsigneeDao deleteConsigneeInfo = new ConsigneeDao();	
		try {
			deleteConsigneeInfo.deleteConsigneeInfo(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void updateConsigneeInfo(Consignee consignee) {
		// TODO Auto-generated method stub
		ConsigneeDao updateConsigneeInfo = new ConsigneeDao();	
		try {
			updateConsigneeInfo.updateConsigneeInfo(consignee);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
