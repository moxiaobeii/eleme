package eleme.service.impl;

import eleme.dao.UserDao;
import eleme.entity.User;
import eleme.service.UserService;

public class UserServiceImpl implements UserService {

	public User getUser(long phone) {
		UserDao userDao = new UserDao();
		User user = userDao.getUser(phone);
		return user;
	}

}
