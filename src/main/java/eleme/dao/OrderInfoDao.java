package eleme.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;import org.apache.commons.dbutils.handlers.BeanListHandler;

import eleme.entity.Consignee;
import eleme.entity.OrderDetails;
import eleme.utils.DataSourceUtils;

public class OrderInfoDao {
//	private static QueryRunner qr = null;
//	static {
//		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
//	}
	
	
	public OrderInfoDao() {
		
	}
	
	//查询收货人表
	public List<Consignee> queryConsigneeById(int userId) throws SQLException{
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		return qr.query("select * from consignee where userId = ?", new BeanListHandler<Consignee>(Consignee.class),userId);
	}

	public List<OrderDetails> queryOrderDetailsByOrderId(String oid) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		return qr.query("select * from order_details where oid = ?", new BeanListHandler<OrderDetails>(OrderDetails.class));
	}
	
	//插入收货人地址信息
	public void insertConsignee(String name, int sex, String adress, long telphone,int userId) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		qr.update("insert into consignee values(1860,?,?,?,?,?)",name,sex,adress,telphone,userId);
		
	}
	
	
	
	
}
