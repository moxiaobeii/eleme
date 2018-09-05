package eleme.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import eleme.entity.Consignee;
import eleme.entity.OrderDetails;
import eleme.entity.Orders;
import eleme.utils.DataSourceUtils;

public class OrderDetailsDao {
	
	/**
	 * 根据订单号，获取订单
	 * @param oid
	 * @return
	 */
	public Orders getOrdersInfo(String oid) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from orders where oid=?";
		Orders orders = null;
		try {
			orders = runner.query(sql, new BeanHandler<Orders>(Orders.class),oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return orders;
	}
	
	/**
	 * 根据订单号，查询订单详情，返回订单详情集合
	 * @param oid
	 * @return
	 */
	public List<OrderDetails> getOrderDeteils(String oid){
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from order_details where oid=?";
		List<OrderDetails> OrderDetailsList = null;
		
		try {
			OrderDetailsList = runner.query(sql, new BeanListHandler<OrderDetails>(OrderDetails.class),oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return OrderDetailsList;
	}
	
	public Consignee getConsignee(String oid) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from consignee where con_id=(select con_id from orders where oid = ?)";
		Consignee consignee = null;
		try {
			consignee = runner.query(sql, new BeanHandler<Consignee>(Consignee.class),oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return consignee;
	}
}
