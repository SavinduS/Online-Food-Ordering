package com.foodordering.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.services.*;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        UserService service = new UserService();

        try {
            if (password != null && !password.isEmpty()) {
                if (password.equals(confirmPassword)) {
                    // ✅ Update with password
                    service.updateUserWithPassword(email, firstName, lastName, phone, password);
                } else {
                    // ❌ Passwords don't match
                    request.setAttribute("error", "Passwords do not match.");
                    RequestDispatcher dis = request.getRequestDispatcher("UserProfile.jsp");
                    dis.forward(request, response);
                    return;
                }
            } else {
             
            }

            // ✅ Redirect after update
            response.sendRedirect("UserProfile.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Update failed.");
            RequestDispatcher dis = request.getRequestDispatcher("UserProfile.jsp");
            dis.forward(request, response);
        }
        
        
    }
  
        
   
}
