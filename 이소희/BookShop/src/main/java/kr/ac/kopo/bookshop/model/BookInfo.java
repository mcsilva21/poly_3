package kr.ac.kopo.bookshop.model;

import java.util.List;

import kr.ac.kopo.bookshop.util.Pager;

public class BookInfo {
	List<Book> list;
	Pager pager;
	public List<Book> getList() {
		return list;
	}
	public void setList(List<Book> list) {
		this.list = list;
	}
	public Pager getPager() {
		return pager;
	}
	public void setPager(Pager pager) {
		this.pager = pager;
	}
	
	

}
