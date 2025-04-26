package com.foodordering.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.foodordering.model.UserModel;
import com.foodordering.services.employee_service;


@WebServlet("/customerSummary")
public class readCustomerSummaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public readCustomerSummaryServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
        List<UserModel> allCustomer = employee_service.readAllCustomers();
        request.setAttribute("allCustomer", allCustomer);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("customerSummary.jsp");
        dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
