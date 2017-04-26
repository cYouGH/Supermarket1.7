package cn.dc.supermarket.service;

import java.util.List;

import cn.dc.supermarket.dao.ProductCategoryDao;
import cn.dc.supermarket.entity.ProductCategory;

public class ProductCategoryServiceImp implements ProductCategoryService {
	private ProductCategoryDao productCategoryDao;
	

	public void setProductCategoryDao(ProductCategoryDao productCategoryDao) {
		this.productCategoryDao = productCategoryDao;
	}


	@Override
	public List<ProductCategory> findAll() {
		List<ProductCategory> productCategory= productCategoryDao.findAll();
		return productCategory;
	}


	@Override
	public ProductCategory findById(int cid) {
		ProductCategory pc = productCategoryDao.findById(cid);
		return pc;
	}

}
