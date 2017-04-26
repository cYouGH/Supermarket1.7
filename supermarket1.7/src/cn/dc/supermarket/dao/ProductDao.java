package cn.dc.supermarket.dao;

import cn.dc.supermarket.entity.Product;
import cn.dc.supermarket.utils.QueryPage;

public interface ProductDao {
	void delete(Product product);
	Product findById(Integer pid);
	void update(Product product);
	void add(Product product);
	QueryPage<Product> findAllByPage(int page,int limit);
	int getCount();

}
