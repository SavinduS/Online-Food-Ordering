package com.foodordering.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.foodordering.model.employee;
import com.foodordering.services.employee_service;


@WebServlet("/employeeProfileRead")
public class employeeProfileRead extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public employeeProfileRead() {
        super();
    }

	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        employee loggedEmp = (employee) session.getAttribute("loggedEmployee");
        String role = (String) session.getAttribute("role");

        if (loggedEmp == null || role == null || 
            !(role.equals("Manager") || role.equals("Staff") || role.equals("Delivery_Person"))) {
            response.sendRedirect("Login.jsp");
            return;
        }

        
        List<employee> empList = employee_service.getById(loggedEmp.getEmpID());
        employee emp = (empList != null && !empList.isEmpty()) ? empList.get(0) : null;

        if (emp == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        
        //update session employee data
        session.setAttribute("loggedEmployee", emp);

        RequestDispatcher dispatcher = request.getRequestDispatcher("EmployeeProfile.jsp");
        dispatcher.forward(request, response);
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
