package cn.dc.supermarket.service;

import cn.dc.supermarket.entity.Product;
import cn.dc.supermarket.utils.QueryPage;

public interface ProductService {
	void delete(Product product);
	Product findById(int pid);
	void update(Product product);
	void add(Product product);
	QueryPage<Product> findAllByPage(int page,int limit);

}
