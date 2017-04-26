package cn.dc.supermarket.entity;

import java.util.Date;

public class Product {
	private Integer pid;
	private String productName;
	private String imgPath;
	private double priceIn;
	private double priceOut;
	private int stockNum;
	private String disc;
	private Date inTime;
	private Date outTime;
	private ProductCategory productCategory;
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public double getPriceIn() {
		return priceIn;
	}
	public void setPriceIn(double priceIn) {
		this.priceIn = priceIn;
	}
	public double getPriceOut() {
		return priceOut;
	}
	public void setPriceOut(double priceOut) {
		this.priceOut = priceOut;
	}
	public int getStockNum() {
		return stockNum;
	}
	public void setStockNum(int stockNum) {
		this.stockNum = stockNum;
	}
	public String getDisc() {
		return disc;
	}
	public void setDisc(String disc) {
		this.disc = disc;
	}
	public Date getInTime() {
		return inTime;
	}
	public void setInTime(Date inTime) {
		this.inTime = inTime;
	}
	public Date getOutTime() {
		return outTime;
	}
	public void setOutTime(Date outTime) {
		this.outTime = outTime;
	}
	public ProductCategory getProductCategory() {
		return productCategory;
	}
	public void setProductCategory(ProductCategory productCategory) {
		this.productCategory = productCategory;
	}



}
