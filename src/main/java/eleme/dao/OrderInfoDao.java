package eleme.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;import org.apache.commons.dbutils.handlers.BeanListHandler;

import eleme.entity.Consignee;
import eleme.entity.OrderDetails;
import eleme.utils.DataSourceUtils;

public class OrderInfoDao {
	private static QueryRunner qr = null;
	static {
		qr = new QueryRunner(DataSourceUtils.getDataSource());
	}
	
	
	public OrderInfoDao() {
		
	}
	
	//查询收货人表
	public List<Consignee> queryConsigneeById(int userId) throws SQLException{
		return qr.query("select * from consignee where userId = ?", new BeanListHandler<Consignee>(Consignee.class),userId);
	}

	public List<OrderDetails> queryOrderDetailsByOrderId(String oid) throws SQLException {
		return qr.query("select * from order_details where oid = ?", new BeanListHandler<OrderDetails>(OrderDetails.class),oid);
	}
	
	//插入收货人地址信息
	public void insertConsignee(String name, int sex, String adress, long telphone,int userId) throws SQLException {
		qr.update("insert into consignee values(?,?,?,?,?,?)",4*Math.random(),name,sex,adress,telphone,userId);
		
	}

	//删除收货人地址
	public void deleteConsignee(int conId) throws SQLException {
		qr.update("delete from consignee where con_id = ?",conId);		
	}

	//修改地址
	public void modifyConsignee(String conId, String name, int sex, String resultAddress, long telphone) throws SQLException {
		qr.update("update consignee set name=?,sex=?,address=?,telphone=? where con_id = ?",name,sex,resultAddress,telphone,conId);		

	}
	
	
	
	
}
