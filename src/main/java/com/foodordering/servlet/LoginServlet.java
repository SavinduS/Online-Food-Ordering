package com.foodordering.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.model.*;
import com.foodordering.services.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        employee emp = new employee(email, password);
        UserLoginModel user = new UserLoginModel(email, password);
        LoginService service = new LoginService();

        if (service.validateAdmin(emp)) {
            HttpSession session = request.getSession();
            session.setAttribute("userEmail", email);
            session.setAttribute("role", "admin");

            response.sendRedirect("AdminDashboard.jsp");
        } else if (service.validateCustomer(user)) {
            HttpSession session = request.getSession();
            session.setAttribute("userEmail", email);
            session.setAttribute("role", "user");

            response.sendRedirect("home"); 
        } else {
            request.setAttribute("error", "Invalid email or password");
            RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
            dis.forward(request, response);
        }
    }
}
