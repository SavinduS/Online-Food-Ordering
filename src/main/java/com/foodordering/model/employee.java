package com.foodordering.model;

public class employee {
	int empID;
	String NIC;
	String name;
	String email;
	String phone_num;
	String password;
	String password_confirm;
	String position;
	
	
	
	public employee(int empID, String NIC, String name, String email, String phone_num, String password, String password_confirm, String position) {
		super();
		this.empID = empID;
		this.NIC = NIC;
		this.name = name;
		this.email = email;
		this.phone_num = phone_num;
		this.password = password;
		this.password_confirm= password_confirm;
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

	

	public employee(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	public employee() {
		// TODO Auto-generated constructor stub
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
	public String getPassword_confirm() {
		return password_confirm;
	}

	public void setPassword_confirm(String password_confirm) {
		this.password_confirm = password_confirm;
	}

	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	
	

}
