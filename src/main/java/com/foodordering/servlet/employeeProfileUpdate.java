package com.foodordering.servlet;

import com.foodordering.model.employee;
import com.foodordering.services.employee_service;
import com.foodordering.Util.DBConnect;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;


@WebServlet("/employeeProfileUpdate")
public class employeeProfileUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public employeeProfileUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    employee emp = new employee();
	    
	    //Set data into the employee object from the form
	    emp.setEmpID(Integer.parseInt(request.getParameter("empID")));
	    emp.setPhone_num(request.getParameter("phone_num"));
	    emp.setPassword(request.getParameter("password"));
	    emp.setPassword_confirm(request.getParameter("password_confirm"));

	   
	    employee_service service = new employee_service();
	    boolean isTrue = service.updateEmpProfile(emp); 

	    if (isTrue) {
	        List<employee> EmpDetails = employee_service.getById(emp.getEmpID());
	        request.setAttribute("EmpDetails", EmpDetails);

	        response.getWriter().println("<script>alert('Profile Updated Successfully!'); window.location.href='employeeProfileRead';</script>");
	    } 
	    
	    else {
	        response.getWriter().println("<script>alert('Update Failed! Please try again.'); window.location.href='EmployeeProfile.jsp';</script>");
	    }
	}

	}


