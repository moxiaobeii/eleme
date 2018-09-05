package eleme.dao;

import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import eleme.entity.User;
import eleme.utils.DataSourceUtils;

public class UserDao {
	public User getUser(String username,String password) {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from user where username=? and password=?";
		User user = null;
		try {
			user = runner.query(sql,new BeanHandler<User>(User.class),username,password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	
	public static void main(String[] args) {
		UserDao userDao = new UserDao();
		User user = userDao.getUser("root", "admin");
		System.out.println(user.getUserId()+"gdfgg");
	}
}
