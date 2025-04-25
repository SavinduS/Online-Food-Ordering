package com.foodordering.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import com.foodordering.model.*;
import com.foodordering.services.*;

@WebServlet("/ReviewUpdateServlet")
public class ReviewUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // 🟢 Read form data
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String rating = request.getParameter("rating");
            String comment = request.getParameter("comment");

            // 🟢 Set values to Customer object
            Customer cus = new Customer();
            cus.setName(name);
            cus.setEmail(email);
            cus.setMobile(mobile);
            cus.setRate(rating);
            cus.setComment(comment);

            // 🟢 Call service layer
            service service = new service();
            service.updateReview(cus);

            // 🟢 Redirect back to review-list with user info (to show update/delete buttons again)
            response.sendRedirect("review-list?name=" + name + "&email=" + email + "&mobile=" + mobile);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ReviewCreate.jsp?error=update");
        }
    }
}
