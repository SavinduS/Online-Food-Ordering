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


@WebServlet("/updateEmpServlet")
public class updateEmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public updateEmpServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		employee emp = new employee();
		
		emp.setEmpID(Integer.parseInt(request.getParameter("empID")));
		emp.setNIC(request.getParameter("NIC"));
		emp.setName(request.getParameter("name"));
		emp.setEmail(request.getParameter("email"));
		emp.setPhone_num(request.getParameter("phone_num"));
		emp.setPosition(request.getParameter("position"));
		
		boolean isTrue;
		employee_service service = new employee_service();
		isTrue= service.updateEmp(emp);
		
		if(isTrue == true) {
			List <employee> EmpDetails = employee_service.getById(Integer.parseInt(request.getParameter("empID")));
			request.setAttribute("EmpDetails", EmpDetails);
			
			response.getWriter().println("<script>alert('Data Updated Successfully!'); window.location.href='employeeManagement';</script>");

		}
		
		else{
			response.getWriter().println("<script>alert('Data Update Unsuccessfully!!! Please update again.'); window.location.href='employeeManagement';</script>");
		}
		
		
		
	}

}
