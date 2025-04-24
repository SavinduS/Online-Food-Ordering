<%@ page import="java.util.List" %>
<%@ page import="com.foodordering.model.CartItem" %>
<%@ page import="com.foodordering.model.Delivery" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Step 3: Payment Confirmation</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <%@ include file="./partials/header.jsp" %>
</head>
<body class="font-[sans-serif] bg-gray-100">

<!-- Step Progress Bar -->
<div class="flex justify-between items-center max-w-4xl mx-auto mb-10 relative mt-10">
  <div class="absolute top-6 left-0 w-full h-1 bg-gray-300 z-0"></div>
  <div class="z-10 flex flex-col items-center">
    <span class="w-9 h-9 rounded-full bg-red-600 text-white flex items-center justify-center font-bold">1</span>
    <i class="fas fa-shopping-cart text-red-600 mt-2"></i>
    <p class="text-sm font-bold">Cart</p>
  </div>
  <div class="z-10 flex flex-col items-center">
    <span class="w-9 h-9 rounded-full bg-red-600 text-white flex items-center justify-center font-bold">2</span>
    <i class="fas fa-credit-card text-red-600 mt-2"></i>
    <p class="text-sm font-bold">Payment Info</p>
  </div>
  <div class="z-10 flex flex-col items-center">
    <span class="w-9 h-9 rounded-full bg-red-600 text-white flex items-center justify-center font-bold">3</span>
    <i class="fas fa-check-circle text-white mt-2"></i>
    <p class="text-sm font-bold">Confirmation</p>
  </div>
</div>

<!-- Confirmation Container -->
<div class="bg-white max-w-5xl mx-auto p-8 rounded-xl shadow-md border border-black">
  <h2 class="text-2xl font-bold text-center mb-8">Order Confirmation</h2>

 <div class="grid md:grid-cols-2 gap-6">
  <!-- User Info Card -->
  <div class="border p-6 rounded-md">
    <h3 class="text-lg font-semibold mb-4 flex items-center gap-2">
      <i class="fas fa-user"></i> Your Details
    </h3>
    
    <div class="space-y-2 text-base">
      <%
      Delivery delivery = (Delivery) session.getAttribute("delivery");
      List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cartItems");
      %>
      <% if (delivery != null) { %>
        <p><strong>Name:</strong> <%= delivery.getFirstName() %> <%= delivery.getLastName() %></p>
        <p><strong>Email:</strong> <%= delivery.getEmail() %></p>
        <p><strong>Phone:</strong> <%= delivery.getPhone() %></p>
        <p><strong>Address:</strong> <%= delivery.getAddress() %>, <%= delivery.getCity() %></p>
      <% } else { %>
        <p class="text-red-600 font-semibold">No delivery data available.</p>
      <% } %>
    </div>

    <!-- ✅ Edit Button -->
    <div class="mt-6">
      <button
        onclick="location.href='editDetails.jsp'" 
        class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded shadow font-semibold"
      >
        <i class="fas fa-edit mr-2"></i> Edit Details
      </button>
    </div>
  </div>
 

    <!-- Order Summary Card -->
    <div class="border p-6 rounded-md">
      <h3 class="text-lg font-semibold mb-4 flex items-center gap-2"><i class="fas fa-shopping-cart"></i> Order Summary</h3>
      <table class="w-full text-left border-collapse">
        <thead>
          <tr class="bg-red-600 text-white">
            <th class="p-2">Product</th>
            <th class="p-2">Quantity</th>
            <th class="p-2">Price</th>
          </tr>
        </thead>
        <tbody class="text-gray-800">
          <% 
            double total = 0;
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
          <tr class="font-semibold">
            <td colspan="2" class="p-2">Total:</td>
            <td class="p-2">$<%= String.format("%.2f", total) %></td>
          </tr>
        </tfoot>
      </table>
    </div>
  </div>

  <div class="text-center mt-10">
   <button type="button" onclick="location.href='myOrder.jsp'" id="confirmOrder" class="bg-green-600 hover:bg-green-700 text-white px-6 py-3 rounded shadow font-semibold">
  <i class="fas fa-check-circle"></i> Confirm Your Order
</button>
   
  </div>
</div>

<div><br><br></div>

<script src="js/confirmPayment.js"></script>
<%@ include file="./partials/footer.jsp" %>
</body>
</html>
