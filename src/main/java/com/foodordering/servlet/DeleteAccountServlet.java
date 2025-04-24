package com.foodordering.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.services.*;

@WebServlet("/DeleteAccountServlet")
public class DeleteAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        try {
            UserService service = new UserService();
            service.deleteUserByEmail(email);

            // Invalidate session after deletion
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }

            // Redirect to login after account is deleted
            response.sendRedirect("Login.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Account deletion failed.");
            RequestDispatcher dis = request.getRequestDispatcher("UserProfile.jsp");
            dis.forward(request, response);
        }
    }
}
