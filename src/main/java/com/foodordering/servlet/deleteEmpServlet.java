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


public class deleteEmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public deleteEmpServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		employee emp = new employee(0, null, null, null, null, null, null);
		emp.setEmpID(Integer.parseInt(request.getParameter("empID")));
		
		boolean isTrue;
		employee_service service = new employee_service();
		isTrue= service.deleteEMP(emp);
		
		if(isTrue == true) {
			List <employee> DeleteDetails = employee_service.getById(Integer.parseInt(request.getParameter("empID")));
			request.setAttribute("DeleteDetails", DeleteDetails);
			
			response.getWriter().println("<script>alert('Data Delete Successfully!'); window.location.href='AdminDashboard';</script>");

		}
		
		else{
			response.getWriter().println("<script>alert('Data Delete Unsuccessfully!!!');</script>");
			RequestDispatcher dispatcher =request.getRequestDispatcher("AdminDashboard");
			dispatcher.forward(request, response);
		}
	}

}
