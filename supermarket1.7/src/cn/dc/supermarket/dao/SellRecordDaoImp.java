package cn.dc.supermarket.dao;

import java.util.List;

import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.transaction.annotation.Transactional;

import cn.dc.supermarket.entity.SellRecord;
import cn.dc.supermarket.utils.PageHibernateCallback;
import cn.dc.supermarket.utils.QueryPage;

@Transactional(readOnly = false)
public class SellRecordDaoImp extends HibernateDaoSupport implements SellRecordDao {

	@Override
	public void save(SellRecord sellRecord) {
		this.getHibernateTemplate().save(sellRecord);
	}

	@Override
	public QueryPage<SellRecord> findAll(int page, int limit) {
		QueryPage<SellRecord> qp = new QueryPage<>();
		int totalCount = getCount();
		qp.setTotalCount(totalCount);
		int begin = (page-1)*limit; 
		String hql = "from SellRecord";
		List<SellRecord> srList = (List<SellRecord>) this.getHibernateTemplate().execute(new PageHibernateCallback<SellRecord>(hql, new Object[]{}, begin, limit));
		qp.setQpList(srList);
		
		int totalPage;
		if(totalCount%limit == 0){
			totalPage = totalCount/limit;
		}else{
			totalPage = totalCount/limit + 1;
		}
		
		qp.setCurrentPage(page);
		qp.setTotalPage(totalPage);
		
		
		return qp;
	}

	@Override
	public int getCount() {
		String hql = "select count(*) from SellRecord";
		List<Long> countList = (List<Long>) this.getHibernateTemplate().find(hql);
		if(countList!=null){
			return countList.get(0).intValue();
		}
		return 0;
	}

}
