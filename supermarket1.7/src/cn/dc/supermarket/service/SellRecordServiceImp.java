package cn.dc.supermarket.service;

import cn.dc.supermarket.dao.SellRecordDao;
import cn.dc.supermarket.entity.SellRecord;
import cn.dc.supermarket.utils.QueryPage;

public class SellRecordServiceImp implements SellRecordService {
	private SellRecordDao sellRecordDao;
	
	public void setSellRecordDao(SellRecordDao sellRecordDao) {
		this.sellRecordDao = sellRecordDao;
	}

	@Override
	public void save(SellRecord sellRecord) {
		sellRecordDao.save(sellRecord);
	}

	@Override
	public QueryPage<SellRecord> findAll(int page, int limit) {
		QueryPage<SellRecord> qp = sellRecordDao.findAll(page,limit);
		return qp;
	}
	
	
}
