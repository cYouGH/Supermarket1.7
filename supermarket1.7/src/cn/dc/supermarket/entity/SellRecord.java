package cn.dc.supermarket.entity;

import java.util.Date;

public class SellRecord {
	private Product sellProduct;
	private Integer sellId;
	private User opUser;
	private double discount;
	private int sellCount;
	private double profit;
	private double totalMoney;
	private Date sellDate;
	private String sellDisc;
	public Product getSellProduct() {
		return sellProduct;
	}
	public void setSellProduct(Product sellProduct) {
		this.sellProduct = sellProduct;
	}
	public Integer getSellId() {
		return sellId;
	}
	public void setSellId(Integer sellId) {
		this.sellId = sellId;
	}
	public User getOpUser() {
		return opUser;
	}
	public void setOpUser(User opUser) {
		this.opUser = opUser;
	}
	public double getDiscount() {
		return discount;
	}
	public void setDiscount(double discount) {
		this.discount = discount;
	}
	public int getSellCount() {
		return sellCount;
	}
	public void setSellCount(int sellCount) {
		this.sellCount = sellCount;
	}
	public double getProfit() {
		return profit;
	}
	public void setProfit(double profit) {
		this.profit = profit;
	}
	public double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(double totalMoney) {
		this.totalMoney = totalMoney;
	}
	public Date getSellDate() {
		return sellDate;
	}
	public void setSellDate(Date sellDate) {
		this.sellDate = sellDate;
	}
	public String getSellDisc() {
		return sellDisc;
	}
	public void setSellDisc(String sellDisc) {
		this.sellDisc = sellDisc;
	}

	

}
