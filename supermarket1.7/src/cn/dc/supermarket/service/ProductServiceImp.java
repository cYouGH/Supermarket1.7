package cn.dc.supermarket.service;

import cn.dc.supermarket.dao.ProductDao;
import cn.dc.supermarket.entity.Product;
import cn.dc.supermarket.utils.QueryPage;

public class ProductServiceImp implements ProductService {
	public ProductDao productDao;

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	@Override
	public void delete(Product product) {
		productDao.delete(product);
	}

	@Override
	public Product findById(int pid) {
		Product product = productDao.findById(pid);
		if(product == null){
			return null;
		}
		return product;
	}

	@Override
	public void update(Product product) {
		productDao.update(product);
	}

	@Override
	public void add(Product product) {
		productDao.add(product);
	}

	@Override
	public QueryPage<Product> findAllByPage(int page, int limit) {
		QueryPage<Product> qp = productDao.findAllByPage(page, limit);
		return qp;
	}


	

}
