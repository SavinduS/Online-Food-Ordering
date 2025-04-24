package com.foodordering.model;

public class employee {
	int empID;
	String NIC;
	String name;
	String email;
	String phone_num;
	String password;
	String position;
	
	
	
	public employee(int empID, String NIC, String name, String email, String phone_num, String password, String position) {
		super();
		this.empID = empID;
		this.NIC = NIC;
		this.name = name;
		this.email = email;
		this.phone_num = phone_num;
		this.password = password;
		this.position = position;
	}

	public employee(int empID, String NIC, String name, String email, String phone_num, String position) {
		super();
		this.empID = empID;
		this.NIC = NIC;
		this.name = name;
		this.email = email;
		this.phone_num = phone_num;
		this.position = position;
	}

	public int getEmpID() {
		return empID;
	}
	public void setEmpID(int empID) {
		this.empID = empID;
	}
	public String getNIC() {
		return NIC;
	}
	public void setNIC(String NIC) {
		this.NIC = NIC;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone_num() {
		return phone_num;
	}
	public void setPhone_num(String phone_num) {
		this.phone_num = phone_num;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	
	

}
