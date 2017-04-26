package cn.dc.supermarket.dao;

import java.util.List;

import cn.dc.supermarket.entity.ProductCategory;

public interface ProductCategoryDao {
	List<ProductCategory> findAll();

	ProductCategory findById(Integer cid);
}
