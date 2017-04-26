package cn.dc.supermarket.service;

import java.util.List;

import cn.dc.supermarket.entity.User;
import cn.dc.supermarket.utils.QueryPage;

public interface UserService {
	boolean checkUser(User user);
	void add(User user);
	User get(String userName);
	void update(User user);
	List<User> findAll();
	QueryPage<User> findAllByPage(int page,int limit);
	void delete(User user);
	User findById(int id);
	User findByCode(String code);

}
