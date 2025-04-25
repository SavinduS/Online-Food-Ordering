<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.foodordering.model.CartItem" %>
<%@ page import="com.foodordering.model.Delivery" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Orders</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <%@ include file="./partials/header.jsp" %>
</head>
<body class="bg-gray-100 font-[Poppins]">

  <div class="max-w-6xl mx-auto px-4 py-12">
    <h1 class="text-3xl font-bold text-center text-red-600 mb-10">Thank You for Ordering!</h1>

    <!-- Order Card -->
    <div class="bg-white rounded-xl shadow-md p-8 border border-black" id="orderCard">
      <div class="grid md:grid-cols-2 gap-8">

        <!-- Order Details -->
        <div>
          <h2 class="text-xl font-bold mb-4">Order ID #${delivery.id}</h2>
          
          <p class="mb-2">
            <strong>Status:</strong> 
            <span class="bg-yellow-400 text-white px-2 py-1 rounded font-semibold">Processing</span>
          </p>

          <%
          Delivery delivery = (Delivery) session.getAttribute("delivery");

          %>

          <h3 class="font-semibold text-lg mt-6 mb-2">Delivery Address</h3>
          <% if (delivery != null) { %>
            <p><i class="fas fa-user mr-2"></i> <%= delivery.getFirstName() %> <%= delivery.getLastName() %></p>
            <p><i class="fas fa-phone mr-2"></i> <%= delivery.getPhone() %></p>
            <p><i class="fas fa-map-marker-alt mr-2"></i> <%= delivery.getAddress() %>, <%= delivery.getCity() %></p>
          <% } else { %>
            <p class="text-red-600 font-semibold">No delivery data available.</p>
          <% } %>

          <div class="mt-6 space-y-2">

            <form action="CancelOrderServlet" method="post">
			  <input type="hidden" name="id" value="${delivery.id}" />
			  <button type="submit" class="bg-red-500 hover:bg-red-600 text-white px-5 py-2 rounded shadow w-48">
			    <i class="fas fa-times mr-1"></i> Cancel Order
			  </button>
			</form>
            
          </div>
        </div>

		<div>
  <h3 class="font-semibold text-lg mb-4">Order Summary</h3>

  <table class="w-full text-left border-collapse">
    <thead>
      <tr class="bg-red-600 text-white">
        <th class="p-2">Product</th>
        <th class="p-2">Qty</th>
        <th class="p-2">Price</th>
      </tr>
    </thead>
    <tbody class="text-gray-800">
      <%
        double total = 0;
        List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
        if (cartItems != null && !cartItems.isEmpty()) {
          for (CartItem item : cartItems) {
            double itemTotal = item.getPrice() * item.getQuantity();
            total += itemTotal;
      %>
        <tr class="border-b">
          <td class="p-2"><%= item.getFoodName() %></td>
          <td class="p-2"><%= item.getQuantity() %></td>
          <td class="p-2">$<%= String.format("%.2f", itemTotal) %></td>
        </tr>
      <% 
          }
        } else {
      %>
        <tr><td colspan="3" class="text-red-500 p-2">No cart items found.</td></tr>
      <% } %>
    </tbody>
    <tfoot>
      <tr class="font-semibold text-red-600 text-xl">
        <td colspan="2" class="p-2 text-right">Total:</td>
        <td class="p-2 text-black font-bold">$<%= String.format("%.2f", total) %></td>
      </tr>
    </tfoot>
  </table>
</div>
</div>
</div>
</div>		
  <script src="js/myOrder.js"></script>
  <%@ include file="./partials/footer.jsp" %>
</body>
</html>
