package cn.dc.supermarket.service;

import java.util.List;

import cn.dc.supermarket.dao.UserDao;
import cn.dc.supermarket.entity.User;
import cn.dc.supermarket.utils.QueryPage;

public class UserServiceImp implements UserService {
	
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public boolean checkUser(User user){
		User userGet = userDao.get(user.getUsername());
		if(userGet!=null){
			if(userGet.getUsername().equals(user.getUsername())&&userGet.getPassword().equals(user.getPassword())){
				return true;
			}
		}else{
			return false;
		}
		return false;
	}

	@Override
	public void add(User user) {
		userDao.add(user);
	}

	@Override
	public User get(String username) {
		User userGet = userDao.get(username);
		return userGet;
	}

	@Override
	public void update(User existUser) {
		userDao.update(existUser);
	}

	@Override
	public List<User> findAll() {
		List<User> users = userDao.findAll();
		return users;
	}

	@Override
	public QueryPage<User> findAllByPage(int page,int limit) {
		QueryPage<User> qp=userDao.findAllByPage(page, limit);
		return qp;
	}

	@Override
	public void delete(User user) {
		userDao.delete(user);
	}

	@Override
	public User findById(int id) {
		User user = userDao.getById(id);
		return user;
	}

	@Override
	public User findByCode(String code) {
		User user=userDao.findByCode(code);
		return user;
	}

}
