package eleme.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import eleme.entity.OrderDetails;
import eleme.entity.Orders;
import eleme.utils.DataSourceUtils;

public class PayDao {
	private static PayDao payDao;
	private static QueryRunner qr;
	static {
		qr = new QueryRunner(DataSourceUtils.getDataSource());
	}
	private PayDao() {
		
	}
	
	//单例模式
	public static PayDao getPayDao() {
		if(payDao == null) {
			payDao = new PayDao();
			return payDao;
		}
		return payDao;
	}

	
	//通过订单号和用户id查询订单
	public static Orders queryOrderByUserIdAndOderId(String oId, int userId) throws SQLException {
		Orders order = qr.query("select * from orders where oid=? and userId=?"
				,new BeanHandler<Orders>(Orders.class),oId,userId);
		return order;
	}
	
	//通过订单号来查询订单明细表
	public static List<OrderDetails> queryOrderDetailsByOrderId(String oId) throws SQLException{
		List<OrderDetails> orderDetailsList = qr.query("select * from order_details where oid=?", new BeanListHandler<OrderDetails>(OrderDetails.class),oId);
		return orderDetailsList;
	}
	
	//通过订单号来查询订单表
	public static Orders queryOrderByOderId(String oId) throws SQLException {
		Orders order = qr.query("select * from orders where oid=?"
				,new BeanHandler<Orders>(Orders.class),oId);
		return order;
	}
	
	//根据订单号来更新订单表
	public static void updateOrderByorderId(Orders order) throws SQLException {
		qr.update("update orders set order_status = ? where oid = ?",order.getOrder_status(),order.getOid());
	}
	
}
