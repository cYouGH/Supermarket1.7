package cn.dc.supermarket.dao;

import java.util.List;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import cn.dc.supermarket.entity.Product;
import cn.dc.supermarket.utils.PageHibernateCallback;
import cn.dc.supermarket.utils.QueryPage;

@Transactional(readOnly = false)
public class ProductDaoImp extends HibernateDaoSupport implements ProductDao {

	@Override
	public void delete(Product product) {
		this.getHibernateTemplate().delete(product);
	}

	@Override
	public Product findById(Integer pid) {
		Product product = this.getHibernateTemplate().get(Product.class, pid);
		if(product !=null){
			return product;
		}
		return null;
	}

	@Override
	public void update(Product product) {
		this.getHibernateTemplate().update(product);
	}

	@Override
	public void add(Product product) {
		this.getHibernateTemplate().save(product);
	}

	@Override
	public QueryPage<Product> findAllByPage(int page, int limit) {
		int begin = (page-1)/limit;
		QueryPage<Product> qp = new QueryPage<Product>();
		String hql = "from Product";
		List<Product> products=this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[] {}, begin, limit));
		int count = getCount();
		int totalPage = 0;
		if(count%limit == 0){
			totalPage = count/limit;
		}else{
			totalPage = count/limit+1;
		}
		qp.setCurrentPage(page);
		qp.setTotalPage(totalPage);
		qp.setQpList(products);
		qp.setTotalCount(count);
		return qp;
	}

	@Override
	public int getCount() {
		String hql = "select count(*) from Product";
		List<Long> count = (List<Long>) this.getHibernateTemplate().find(hql);

		if (count != null && count.size() > 0) {
			return count.get(0).intValue();
		}
		return 0;
	}

}
