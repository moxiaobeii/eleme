package eleme.dao;

import eleme.entity.User;
import eleme.utils.DataSourceUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class UserDao {
	public User getUser(long phone) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from user where telphone = ?";
		User user = null;
		try {
			user = runner.query(sql,new BeanHandler<User>(User.class),phone);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

}
