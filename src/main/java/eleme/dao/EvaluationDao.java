package eleme.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ColumnListHandler;

import eleme.entity.Evaluation;
import eleme.utils.DataSourceUtils;

public class EvaluationDao {
	private QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

	public QueryRunner getRunner() {
		return runner;
	}

	/**
	 * 添加订单评价
	 * @param evaluation
	 */
	public void addEvaluation(Evaluation evaluation,String evalDate) {
		String sql = "insert into evaluation(service_content,service_evaluation,good_evaluation,feeding_speed,oid,bname,username,evaldate) values(?,?,?,?,?,?,?,?)";
		try {
			
			runner.update(sql,evaluation.getService_content(),evaluation.getService_evaluation(),evaluation.getGood_evaluation(),evaluation.getFeeding_speed(),evaluation.getOid(),evaluation.getBname(),evaluation.getUsername(),evalDate);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 获得商店的所有订单评价
	 * @param shopName
	 * @return
	 */
	public List<Evaluation> getShopEval(String shopName){
		String sql = "select * from evaluation where bname = ?";
		List<Evaluation> evaluations = null;
		try {
			evaluations=runner.query(sql, new BeanListHandler<Evaluation>(Evaluation.class),shopName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return evaluations;
	}
	/**
	 * 获得商家满意评价
	 * @param shopName
	 * @return
	 */
	public List<Evaluation> getSatisfaction(String shopName){
		String sql = "select * from evaluation where bname = ? and service_evaluation > ?";
		List<Evaluation> evaluations = null;
		try {
			evaluations=runner.query(sql, new BeanListHandler<Evaluation>(Evaluation.class),shopName,3);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return evaluations;
	}
	
	/**
	 * 获得商家不满意评价
	 * @param shopName
	 * @return
	 */
	public List<Evaluation> getNoSatisfaction(String shopName){
		String sql = "select * from evaluation where bname = ? and service_evaluation < ?";
		List<Evaluation> evaluations = null;
		try {
			evaluations=runner.query(sql, new BeanListHandler<Evaluation>(Evaluation.class),shopName,3);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return evaluations;
	}
	/**
	 * 获得订单中的商品名字
	 * @param oid
	 * @return
	 */
	public List<String> getGname(String oid){
		String sql = "select gname from order_details where oid = ?";
		List<String> gnames = null;
		try {
			gnames = runner.query(sql, new ColumnListHandler<String>("gname"),oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return gnames;
	}
}
