package cn.dc.supermarket.service;

import cn.dc.supermarket.entity.SellRecord;
import cn.dc.supermarket.utils.QueryPage;

public interface SellRecordService {
	
	void save(SellRecord sellRecord);

	QueryPage<SellRecord> findAll(int page, int limit);

}
