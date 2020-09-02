package com.f5704.util;

public class FView {
	private String page ;
	private String templet;
	
	public FView(String templet , String page){
		this.templet = templet ;
		this.page = page ; 
	}
	
	public FView(String page){
		this.page = page ; 
	}
	
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getTemplet() {
		return templet;
	}
	public void setTemplet(String templet) {
		this.templet = templet;
	}
}
