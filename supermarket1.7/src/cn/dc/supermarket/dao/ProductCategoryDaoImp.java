package cn.dc.supermarket.dao;

import java.util.List;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import cn.dc.supermarket.entity.ProductCategory;

@Transactional(readOnly = false)
public class ProductCategoryDaoImp extends HibernateDaoSupport implements ProductCategoryDao {

	@Override
	public List<ProductCategory> findAll() {
		String hql = "from ProductCategory";
		List<ProductCategory> productCategory = (List<ProductCategory>) this.getHibernateTemplate().find(hql);
		return productCategory;
	}

	@Override
	public ProductCategory findById(Integer cid) {
		ProductCategory pc=this.getHibernateTemplate().get(ProductCategory.class, cid);
		return pc;
	}

}
