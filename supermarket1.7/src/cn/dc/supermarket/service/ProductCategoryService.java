
package cn.dc.supermarket.service;

import java.util.List;

import cn.dc.supermarket.entity.ProductCategory;

public interface ProductCategoryService {
	List<ProductCategory> findAll();

	ProductCategory findById(int cid);

}
