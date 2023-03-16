package in.ineuron.dao;

import in.ineuron.entity.User;

public interface UserDao  {

	public boolean userRegister(User us);
	
	public User login(String email,String password);
	
	
}
