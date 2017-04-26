package cn.dc.supermarket.dao;

import cn.dc.supermarket.entity.SellRecord;
import cn.dc.supermarket.utils.QueryPage;

public interface SellRecordDao {

	void save(SellRecord sellRecord);

	QueryPage<SellRecord> findAll(int page, int limit);
	
	int getCount();
}
