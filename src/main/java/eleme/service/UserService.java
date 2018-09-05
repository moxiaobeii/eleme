package eleme.service;

import eleme.entity.User;

public interface UserService {
	
	public User getUser(String username,String password);
}
