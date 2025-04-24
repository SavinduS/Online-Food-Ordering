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



public class readEmpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public readEmpServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		List <employee> allEmp = employee_service.getAll();
		request.setAttribute("allEmp", allEmp);
		
		RequestDispatcher dispatcher =request.getRequestDispatcher("AdminDashboard.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
		
	}

}
