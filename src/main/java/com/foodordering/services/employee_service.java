package com.foodordering.services;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.foodordering.Util.DBConnect;
import com.foodordering.model.Delivery;
import com.foodordering.model.Payment;
import com.foodordering.model.UserModel;
import com.foodordering.model.employee;



public class employee_service {
	
	private static ResultSet rs=null;
	
	
	public boolean addEmployee(employee emp) {
		
		boolean isSuccess = false;
		try {
			
			DBConnect db = new DBConnect();
			Statement statement = DBConnect.getConnection().createStatement();
			
			String query = "insert into employee values(0,'"+emp.getNIC()+"','"+emp.getName()+"','"+emp.getEmail()+"','"+emp.getPhone_num()+"','"+emp.getPassword()+"','"+emp.getPassword_confirm()+"','"+emp.getPosition()+"')";
			
			int result;
			
			result= statement.executeUpdate(query);
			statement.close();
			
			if(result >0) {
				isSuccess = true;
			}
			else
				isSuccess = false;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;	
	}
	
	//get by id
	public static List<employee> getById (int EMPID){
		
		ArrayList <employee> emp = new ArrayList<>();
		
		try {
			//DB connection
			DBConnect db = new DBConnect();
			Statement statement = DBConnect.getConnection().createStatement();
			
			String query  = "select * from employee where empID = '"+EMPID+"'";
			
			rs = statement.executeQuery(query);
			
			while(rs.next()) {
				int empID = rs.getInt(1);
				String NIC = rs.getString(2);
				String name = rs.getString(3);
				String email = rs.getString(4);
				String phone_num = rs.getString(5);
				String password = rs.getString(6);
				String password_confirm = rs.getString(7);
				String position = rs.getString(8);
				
				employee EMP = new employee(empID,NIC,name,email,phone_num,password,password_confirm,position);
				emp.add(EMP);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return emp;
	}
	
	//get all
	public static List<employee> getAll(){
		
		ArrayList <employee> emps = new ArrayList<>();
		
		try {
			DBConnect db = new DBConnect();
			Statement statement = DBConnect.getConnection().createStatement();
			
			String query  = "select empID, NIC, name, email, phone_num, position from employee";
			
			rs = statement.executeQuery(query);
			
			while(rs.next()) {
				int empID = rs.getInt(1);
				String NIC = rs.getString(2);
				String name = rs.getString(3);
				String email = rs.getString(4);
				String phone_num = rs.getString(5);
				String position = rs.getString(6);
				
				employee EMP = new employee(empID,NIC,name,email,phone_num,position);
				emps.add(EMP);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return emps;
	}
	
	//update data
	public boolean updateEmp(employee emp) {
		boolean isSuccess = false;
		try {
			DBConnect db = new DBConnect();
			Statement statement = DBConnect.getConnection().createStatement();
			
			String query = "update employee set NIC='"+emp.getNIC()+"', name='"+emp.getName()+"',email='"+emp.getEmail()+"',phone_num='"+emp.getPhone_num()+"',password='"+emp.getPassword()+"',password_confirm='"+emp.getPassword_confirm()+"',position='"+emp.getPosition()+"'"
							+"where empID= '"+emp.getEmpID()+"'";
			
			int result;
			
			result= statement.executeUpdate(query);
			statement.close();
			
			if(result >0) {
				isSuccess = true;
			}
			else
				isSuccess = false;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	 //delete data
	public boolean deleteEMP(employee emp) {
		boolean isSuccess = false;
		
		try {
			DBConnect db = new DBConnect();
			Statement statement = DBConnect.getConnection().createStatement();
			
			String query = "delete from employee where empID='"+emp.getEmpID()+"'";
			
			int result;
			
			result= statement.executeUpdate(query);
			statement.close();
			
			if(result >0) {
				isSuccess = true;
			}
			else
				isSuccess = false;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	//read all delivery summary
	public static List<Delivery> readAllDelivery(){
		
		ArrayList <Delivery> deliveryArr = new ArrayList<>();
		
		try {
			DBConnect db = new DBConnect();
			Statement statement = DBConnect.getConnection().createStatement();
			
			String query  = "select first_name,last_name,email,phone,address,city,postal_code from delivery";
			
			rs = statement.executeQuery(query);
			
			while(rs.next()) {
				String firstName = rs.getString(1);
				String lastName = rs.getString(2);
				String email = rs.getString(3);
				String phone = rs.getString(4);
				String address = rs.getString(5);
				String city = rs.getString(6);
				String postalCode = rs.getString(7);
				
				Delivery delivery = new Delivery(firstName,lastName,email,phone,address,city,postalCode);
				deliveryArr.add(delivery);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return deliveryArr;
	}
	
	//read all customers
	public static List<UserModel> readAllCustomers(){
		
		ArrayList <UserModel> customerArr = new ArrayList<>();
		
		try {
			DBConnect db = new DBConnect();
			Statement statement = DBConnect.getConnection().createStatement();
			
			String query  = "select firstname,lastname,email,phonenumber from customerregistration";
			
			rs = statement.executeQuery(query);
			
			while(rs.next()) {
				String firstName = rs.getString(1);
				String lastName = rs.getString(2);
				String email = rs.getString(3);
				String phone = rs.getString(4);
				
				UserModel customer = new UserModel(firstName,lastName,email,phone);
				customerArr.add(customer);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return customerArr;
	}
	
	//update employee profile
	public boolean updateEmpProfile(employee emp) {
	    boolean isSuccess = false;

	    try {
	        DBConnect db = new DBConnect();
	        Statement statement = DBConnect.getConnection().createStatement();

	        String query;
	        if (emp.getPassword().isEmpty()) {
	            query = "UPDATE employee SET phone_num='" + emp.getPhone_num() + "' WHERE empID='" + emp.getEmpID() + "'";
	        } else {
	            query = "UPDATE employee SET phone_num='" + emp.getPhone_num() + 
	                    "', password='" + emp.getPassword() + 
	                    "', password_confirm='" + emp.getPassword_confirm() + 
	                    "' WHERE empID='" + emp.getEmpID() + "'";
	        }

	        int result = statement.executeUpdate(query);
	        statement.close();

	        isSuccess = result > 0;

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return isSuccess;
	}

}
