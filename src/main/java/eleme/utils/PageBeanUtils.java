package eleme.utils;

import java.util.List;

public class PageBeanUtils<E> {
	
	private List<E> list;  //对象记录结果集
	private int totalPage;  //总共多少页
	private int totalCount;  //总共多少条记录
	private int pageSize;  //每页显示多少条记录
	private int currentPage;  //当前页
	
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		//自动计算总页数
		totalPage = this.totalCount % pageSize == 
				0 ? (this.totalCount / pageSize) : this.totalCount / pageSize + 1;
	}
	
	public int getTotalCount() {
		return totalCount;
	}

	public List<E> getList() {
		return list;
	}

	public void setList(List<E> list) {
		this.list = list;
	}

	public int getTotalPage() {
		return totalPage;
	}

	//不存在设置总页数的setter方法
//	public void setTotalPage(int totalPage) {
//		this.totalPage = totalPage;
//	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	
	
}
