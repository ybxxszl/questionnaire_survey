package com.vo;

public class PageBean {
	
	private Integer totalPage;//总页数
	private Integer totalItem;//总条数
	private Integer page;//当前页数
	private Integer item = 10;//每页条数
	
	public void setTotalPage() {
		Integer temp = this.totalItem % this.item;
		Integer t = this.totalItem / this.item;
		if(temp > 0){
			this.totalPage = t + 1;
		}else{
			this.totalPage = t;
		}
	}
	public Integer getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
	public Integer getTotalItem() {
		return totalItem;
	}
	public void setTotalItem(Integer totalItem) {
		this.totalItem = totalItem;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getItem() {
		return item;
	}
	
	@Override
	public String toString() {
		return "PageBean [totalPage=" + totalPage + ", totalItem=" + totalItem
				+ ", page=" + page + ", item=" + item + "]";
	}

}
