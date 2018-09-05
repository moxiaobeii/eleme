package eleme.service.impl;

import eleme.dao.UserDao;
import eleme.entity.User;
import eleme.service.UserService;

public class UserServiceImpl implements UserService {

	public User getUser(String username, String password) {
		UserDao userDao = new UserDao();
		User user = userDao.getUser(username, password);
		return user;
	}

}
