package cn.dc.supermarket.utils;

import java.util.List;

public class QueryPage<T> {
	List<T> qpList;
	int totalPage;
	int totalCount;
	int currentPage;

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


	public List<T> getQpList() {
		return qpList;
	}

	public void setQpList(List<T> qpList) {
		this.qpList = qpList;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

}
