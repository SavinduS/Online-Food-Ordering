package com.foodordering.servlet;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.foodordering.services.*;
import com.foodordering.model.*;


@WebServlet("/review-list")
public class ReviewListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        service service = new service();
        List<Customer> reviews = service.getAllReviews();

        request.setAttribute("reviews", reviews);
        RequestDispatcher dispatcher = request.getRequestDispatcher("ReviewCreate.jsp");
        dispatcher.forward(request, response);
    }
}
