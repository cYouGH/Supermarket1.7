package cn.dc.supermarket.dao;

import java.util.List;

import cn.dc.supermarket.entity.User;
import cn.dc.supermarket.utils.QueryPage;

public interface UserDao {
	
	void add(User user);
	void update(User existUser);
	User get(String username);
	User getById(Integer id);
	List<User> findAll();
	QueryPage<User> findAllByPage(int page,int limit);
	int getCount();
	void delete(User user);
	User findByCode(String code);

}
