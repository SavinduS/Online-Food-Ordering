package com.foodordering.servlet;

import com.foodordering.model.Customer;
import com.foodordering.services.service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/displayReviews")
public class ReviewDisplayServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            service s = new service();
            List<Customer> allReviews = s.getAllReviews();
            List<Customer> latest6 = allReviews.stream().limit(6).toList();

            request.setAttribute("reviews", latest6);
            request.setAttribute("email", request.getParameter("email"));
            request.setAttribute("mobile", request.getParameter("mobile"));
            request.setAttribute("success", request.getParameter("success"));
            request.setAttribute("deleted", request.getParameter("deleted"));

            request.getRequestDispatcher("ReviewDisplay.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ReviewCreate.jsp?error=load");
        }
    }
}
