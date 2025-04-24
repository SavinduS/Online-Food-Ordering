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

        UserLoginModel loginUser = new UserLoginModel(email, password);
        LoginService service = new LoginService();

        if (service.validateLogin(loginUser)) {
            HttpSession session = request.getSession();
            session.setAttribute("userEmail", email);

            // ✅ Redirect to UserProfile.jsp
            response.sendRedirect("UserProfile.jsp");
        } else {
            request.setAttribute("error", "Invalid email or password");
            RequestDispatcher dis = request.getRequestDispatcher("Login.jsp");
            dis.forward(request, response);
        }
    }
}
