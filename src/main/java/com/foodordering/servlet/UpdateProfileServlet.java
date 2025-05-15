package com.foodordering.servlet;

import com.foodordering.services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Inheritance: This class extends HttpServlet
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        UserService userService = new UserService();

        // Validate password only if field is not blank
        if (password != null && !password.trim().isEmpty()) {
            if (!password.equals(confirmPassword)) {
                response.sendRedirect("UserProfile.jsp?error=password_mismatch");
                return;
            }
            userService.updateUserWithPassword(email, firstName, lastName, phone, password);
        } else {
            userService.updateUser(email, firstName, lastName, phone);
        }

        // After successful update
        response.sendRedirect("UserProfile.jsp?success=updated");
    }
}
