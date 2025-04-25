package com.foodordering.servlet
;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.foodordering.model.Customer;
import com.foodordering.services.*;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Customer cus = new Customer();
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String mobile = request.getParameter("mobile");
            String rating = request.getParameter("rating");
            String comment = request.getParameter("message");

            cus.setName(name);
            cus.setEmail(email);
            cus.setMobile(mobile);
            cus.setRate(rating);
            cus.setComment(comment);

            service service = new service();
            service.insertData(cus);

            // ✅ Redirect with params to allow showing update/delete buttons for this review
            response.sendRedirect("review-list?name=" + name + "&email=" + email + "&mobile=" + mobile);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ReviewCreate.jsp?error=true");
        }
    }
}
