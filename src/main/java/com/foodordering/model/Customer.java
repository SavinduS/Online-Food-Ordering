package com.foodordering.model;

public class Customer {
    private int id;
    private String name;
    private String email;
    private String mobile;
    private String rate;
    private String comment;
    
    
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getEmail() {
		return email;
	}
	public String getMobile() {
		return mobile;
	}
	public String getRate() {
		return rate;
	}
	public String getComment() {
		return comment;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public void setRate(String rate) {
		this.rate = rate;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}

    
    
}