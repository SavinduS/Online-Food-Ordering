package com.foodordering.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodordering.model.*;
import com.foodordering.services.*;


@WebServlet("/addEmpServlet")
public class addEmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public addEmpServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		employee emp = new employee(0, null, null, null, null, null, null,null);
		
		emp.setNIC(request.getParameter("NIC"));
		emp.setName(request.getParameter("name"));
		emp.setEmail(request.getParameter("email"));
		emp.setPhone_num(request.getParameter("phone_num"));
		emp.setPassword(request.getParameter("password"));
		emp.setPassword_confirm(request.getParameter("password_confirm"));
		emp.setPosition(request.getParameter("position"));
		
		boolean isTrue;
		
		employee_service service = new employee_service();
		isTrue= service.addEmployee(emp);
		
		if(isTrue == true) {
			response.getWriter().println("<script>alert('Data Insert Successfully!'); window.location.href='employeeManagement';</script>");

		}
		
		else {
		    response.getWriter().println("<script>alert('Data Insert Unsuccessfully!!! Please add again.'); window.location.href='AddEmployee.jsp';</script>");
		}

		
	}

}
