package eleme.dao;

import java.sql.SQLException;
import java.util.List;

import javax.print.attribute.ResolutionSyntax;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import eleme.entity.Business;
import eleme.entity.Consignee;
import eleme.entity.OrderDetails;
import eleme.entity.Orders;
import eleme.entity.User;
import eleme.utils.DataSourceUtils;

public class ConsigneeDao {
	
	//查询收货人信息
	public List<Consignee> getConsigneeInfo() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from consignee";	
		return  runner.query(sql,new BeanListHandler<Consignee>(Consignee.class));
	}
	
	//查询用户信息
	public User queryUserInfo(User user) throws SQLException{
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		int userId = (int)user.getUserId();
		String sql = "select * from user where userId = ?";
		return runner.query(sql,new BeanHandler<User>(User.class),userId);
	}
		 
	//查询收藏用户的信息
	public List<Business> queryCollectedBusinessInfo() throws SQLException{
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from business where collection=1";	
		return  runner.query(sql,new BeanListHandler<Business>(Business.class));
	}
	
	//查询订单信息
	public List<Orders> queryRecentlyOrders(int userId) throws SQLException{
		
		//获取登录用户的ID
		int userID = userId;
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select oid, bname, create_time, total_price, order_status from orders  where userId =? GROUP BY oid order by create_time desc";
		List<Orders> ordersResult = runner.query(sql,new BeanListHandler<Orders>(Orders.class),userID);
		
		return ordersResult;
	}
	
	//查询订单详情中的count商品数量 和 gname商品名称 字段
	public List<OrderDetails> queryOrderDetailsInfo(String oid) throws SQLException{
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select oid, count , gname from order_details WHERE oid = ?";
		List<OrderDetails> orderDetailResult = runner.query(sql,new BeanListHandler<OrderDetails>(OrderDetails.class),oid);
		return orderDetailResult;
	}
	
	//获取商家logo图片
	public String queryBusinessLogo(String bname) throws SQLException{
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select logo from business WHERE bname = ? ";
		String BusinessLogoResult = runner.query(sql,new BeanHandler<String>(String.class),bname);
		return BusinessLogoResult;
	}
	
	//保存收货人信息
	public void saveConsigneeInfo(Consignee consignee) throws SQLException{
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into consignee values(?,?,?,?,?,?)";
		runner.update(sql, consignee.getCon_id(),consignee.getName(),consignee.getSex(),consignee.getAddress(),consignee.getTelphone(),"1003");
	}
	
	//删除收货人信息
	public void deleteConsigneeInfo(int id) throws SQLException{
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "delete from consignee where con_id=?";
		runner.update(sql, id);
	}
	
	//修改收货人信息
	public void updateConsigneeInfo(Consignee consignee) throws SQLException{
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update consignee set name=?, sex=?, address=?, telphone=? where con_id=?";
		runner.update(sql, consignee.getName(), consignee.getSex(), consignee.getAddress(), consignee.getTelphone(), consignee.getCon_id());
	}
	
	public static void main(String[] args) {
		ConsigneeDao consigneeDao = new ConsigneeDao();
		
	}
}
