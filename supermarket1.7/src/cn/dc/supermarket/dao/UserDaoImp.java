package cn.dc.supermarket.dao;

import java.util.List;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import cn.dc.supermarket.entity.User;
import cn.dc.supermarket.utils.PageHibernateCallback;
import cn.dc.supermarket.utils.QueryPage;

@Transactional
public class UserDaoImp extends HibernateDaoSupport implements UserDao {

	@Override
	public void add(User user) {
		System.out.println("save user");
		this.getHibernateTemplate().save(user);
	}

	@Override
	public void delete(User user) {
		this.getHibernateTemplate().delete(user);
	}

	@Override
	public void update(User existUser) {
		this.getHibernateTemplate().update(existUser);
	}

	@Override
	public User get(String username) {
		String queryString = "from User where username= ?";
		@SuppressWarnings("unchecked")
		List<User> list = (List<User>) this.getHibernateTemplate().find(queryString, username);
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public List<User> findAll() {
		String hql = "from User";
		List<User> list =(List<User>) this.getHibernateTemplate().find(hql);
		return list;
	}

	@Override
	public QueryPage<User> findAllByPage(int page, int limit) {
		QueryPage<User> qp=new QueryPage<User>();
		qp.setCurrentPage(page);
		int begin=(page-1)*limit;
		int totalCount=getCount();
		
		String hql = "from User";
		List<User> users = this.getHibernateTemplate()
				.execute(new PageHibernateCallback<User>(hql, new Object[] {}, begin, limit));
		
		if (users != null && users.size() > 0) {
			int totalPage;
			if(totalCount%limit == 0){
				totalPage=totalCount/limit;
			}else{
				totalPage=totalCount/limit+1;
			}
			
			qp.setQpList(users);
			qp.setTotalPage(totalPage);
			qp.setTotalCount(totalCount);
			
			return qp;
		}
		return null;
	}

	@Override
	public int getCount() {
		String hql = "select count(*) from User";
		List<Long> count = (List<Long>) this.getHibernateTemplate().find(hql);

		if (count != null && count.size() > 0) {
			return count.get(0).intValue();
		}

		return 0;
	}

	@Override
	public User getById(Integer id) {
		return this.getHibernateTemplate().get(User.class, id);
	}

	@Override
	public User findByCode(String code) {
		String hql = "from User where code = ?";
		List<User> list = (List<User>) this.getHibernateTemplate().find(hql, code);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

}
