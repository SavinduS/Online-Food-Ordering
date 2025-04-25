package com.foodordering.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

import com.foodordering.services.*;


@WebServlet("/ReviewDeleteServlet")
public class ReviewDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");

            service service = new service();
            service.deleteReview(name, email, mobile);

            // ✅ Redirect back to main review list (no params)
            response.sendRedirect("review-list");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ReviewCreate.jsp?error=delete");
        }
    }
}
