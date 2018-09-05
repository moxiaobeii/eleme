package eleme.dao;

import java.sql.SQLException;

import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import eleme.entity.Business;
import eleme.entity.BusinessGoods;
import eleme.entity.Goods;
import eleme.utils.DataSourceUtils;

public class IndexDao {
	/*查询全部商家信息*/
	public List<Business> indexAll() throws SQLException {
		//第一步：创建queryRunner对象，用来操作sql语句
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		//第二步：创建sql语句
		String sql = "select * from business";
		//第三步：执行sql语句,params:是sql语句的参数
		//注意，给sql语句设置参数的时候，按照user表中字段的顺序
		//创建集合用来存放查询出来的全部商家信息
		List<Business> listIndexAll = null;
		listIndexAll = qr.query(sql, new BeanListHandler<Business>(Business.class));
		//把数据返回会IndexService层
		return listIndexAll;
	}
	
	/*查询到指定大导航栏而小导航栏选中全部商家的商家信息*/
	@SuppressWarnings("deprecation")
	public List<Business> indexMore(int indexTI) throws SQLException{
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from business where cid in (select cid from category where tid = ?)";
		List<Business> listIndexMore = null;
		listIndexMore = qr.query(sql, new BeanListHandler<Business>(Business.class), indexTI);
		return listIndexMore;
	}
	
	
	
	/*查询到指定大导航栏和小导航栏的商家信息*/
	public List<Business> indexLess(int indexTI, int indexBT) throws SQLException{
		//将拿到的两个参数进行某些处理(变成一个数据库能识别的特定的id)
		int indexTBI = indexTI*100 + indexBT;
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from business where cid = ?";
		List<Business> listIndexLess = null;
		listIndexLess = qr.query(sql, new BeanListHandler<Business>(Business.class), indexTBI);
		
		return listIndexLess;
	}
	
	/*通过搜索框查询商家菜式信息*/
	public List<BusinessGoods> indexSearch(String searchValue) throws SQLException{
		//首先通过搜索框信息查询商家的信息
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		//查询通过商家
		String sql = "select bid, bname, evaluation_score, distribution_time from business where bname like ?";
		List<BusinessGoods> listIndexSearch = null;
		listIndexSearch = qr.query(sql, new BeanListHandler<BusinessGoods>(BusinessGoods.class), "%"+searchValue+"%");
		//遍历出模糊查询出的商家信息
		for(BusinessGoods list: listIndexSearch) {
			//每遍历出一个商家信息就按商家名查询出其前3条商品信息
			//先获取当前商家名
			String bname = list.getBname();
			String sql2 = "select * from goods where bname = ? limit 0,3";
			//把查询出来的3条商品记录放到集合listIndexSearch中的goods集合属性中
			list.setGoods(qr.query(sql2, new BeanListHandler<Goods>(Goods.class), bname));
		}
		return listIndexSearch;
	}
}
