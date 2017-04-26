package cn.dc.supermarket.action;

import java.util.Date;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.dc.supermarket.entity.Product;
import cn.dc.supermarket.entity.SellRecord;
import cn.dc.supermarket.entity.User;
import cn.dc.supermarket.service.SellRecordService;
import cn.dc.supermarket.utils.QueryPage;

public class SellRecordAction extends ActionSupport implements ModelDriven<SellRecord> {

	/**
	 * 作者：丁川
	 */

	private SellRecord sellRecord = new SellRecord();
	private SellRecordService sellRecordService;
	private int page=1;
	private Product product;
	private User user;

	public void setUser(User user) {
		this.user = user;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public void setSellRecordService(SellRecordService sellRecordService) {
		this.sellRecordService = sellRecordService;
	}

	@Override
	public SellRecord getModel() {
		return this.sellRecord;
	}

	public String sellOperation() {
		product = (Product) ServletActionContext.getRequest().getSession().getAttribute("sellProduct");
		sellRecord.setSellProduct(product);
		return "sellPage";
	}

	public String addRecord() {
		Date outTime = new Date();
		user = (User) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
		product = (Product) ServletActionContext.getRequest().getSession().getAttribute("sellProduct");
		product.setOutTime(outTime);
		product.setStockNum(product.getStockNum() - sellRecord.getSellCount());
		sellRecord.setSellProduct(product);
		sellRecord.setOpUser(user);
		sellRecord.setSellDate(outTime);
		sellRecordService.save(sellRecord);
		return "addSuccess";
	}
	
	public String findAll(){
		int limit=5;
		QueryPage<SellRecord> qp = sellRecordService.findAll(page ,limit);
		ActionContext.getContext().getValueStack().set("pageBean", qp);
		return "findSuccess";
	}
}
