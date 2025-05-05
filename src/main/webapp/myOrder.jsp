<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*, java.util.stream.Collectors" %>
<%@ page import="com.foodordering.model.CartModel" %>
<%@ page import="com.foodordering.model.Delivery" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    List<CartModel> allItems = (List<CartModel>) request.getAttribute("orderItems");

    // Group items by deliveryId
    Map<Integer, List<CartModel>> groupedOrders = new LinkedHashMap<>();
    if (allItems != null) {
        groupedOrders = allItems.stream().collect(Collectors.groupingBy(CartModel::getDeliveryId, LinkedHashMap::new, Collectors.toList()));
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>My Orders</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <%@ include file="./partials/header.jsp" %>
</head>

<body class="bg-gray-100 font-[Poppins]">

<div class="max-w-6xl mx-auto px-4 py-12">

  <% if (groupedOrders == null || groupedOrders.isEmpty()) { %>
    <div class="max-w-2xl mx-auto bg-white shadow-xl rounded-2xl p-10 border-t-4 border-orange-600 text-center">
      <i class="fas fa-box-open text-orange-500 text-5xl mb-4"></i>
      <h2 class="text-2xl font-extrabold text-gray-800 mb-2">No Orders Yet!</h2>
      <p class="text-gray-600">You haven’t placed any orders yet.</p>
      <a href="home">
        <button class="mt-6 bg-orange-600 hover:bg-orange-700 text-white font-semibold px-6 py-3 rounded-lg shadow">
          <i class="fas fa-store"></i> Shop Now
        </button>
      </a>
    </div>
  <% } else { %>

    <h1 class="text-3xl font-bold text-center text-red-600 mb-10">Your Order History</h1>
    
    <!-- Return Home -->
	<div class="text-left mb-8">
	  <a href="home">
	    <button class="bg-orange-600 hover:bg-orange-700 text-white font-semibold px-6 py-2 rounded shadow">
	      <i class="fas fa-arrow-left"></i> Back to Home
	    </button>
	  </a>
	</div>

    <% for (Map.Entry<Integer, List<CartModel>> entry : groupedOrders.entrySet()) {
         int deliveryId = entry.getKey();
         List<CartModel> orderItems = entry.getValue();
         double total = 0;
         String status = orderItems.get(0).getStatus(); // Assuming all items in same order have same status
    %>

    <!-- Order Card Start -->
    <div class="bg-white rounded-xl shadow-md p-8 mb-8 border border-black">

      <div class="mb-4 flex justify-between items-center">
        <h2 class="text-xl font-bold">Order ID #<%= deliveryId %></h2>
        <span class="px-3 py-1 rounded-full text-white font-semibold
                     <%= "Processing".equalsIgnoreCase(status) ? "bg-yellow-500" : "bg-green-600" %>">
          <%= status %>
        </span>
      </div>

      <!-- Order Items Table -->
      <table class="w-full text-left border border-gray-200 rounded-lg overflow-hidden mb-4 shadow-sm">
  <thead>
    <tr class="bg-gradient-to-r from-orange-500 via-red-500 to-orange-500 text-white text-sm uppercase tracking-wider">
      <th class="p-3">Product</th>
      <th class="p-3 text-center">Qty</th>
      <th class="p-3 text-center">Price</th>
      <th class="p-3 text-center">Total</th>
    </tr>
  </thead>
  <tbody class="text-gray-800 bg-white">
    <% for (CartModel item : orderItems) {
         double itemTotal = item.getPrice() * item.getQuantity();
         total += itemTotal;
    %>
    <tr class="border-b hover:bg-orange-50 transition duration-200">
      <td class="p-4">
        <div class="flex items-center gap-4">
          <img src="images/<%= item.getImageFilename() %>" class="w-16 h-16 object-cover rounded-md border" />
          <span class="text-lg font-medium"><%= item.getFoodName() %></span>
        </div>
      </td>
      <td class="p-4 text-center"><%= item.getQuantity() %></td>
      <td class="p-4 text-center">Rs. <%= String.format("%.2f", item.getPrice()) %></td>
      <td class="p-4 text-center">Rs. <%= String.format("%.2f", itemTotal) %></td>
    </tr>
    <% } %>
  </tbody>
  <tfoot>
    <tr class="bg-gray-100 font-semibold">
      <td colspan="3" class="p-4 text-right">Total:</td>
      <td class="p-4 text-center">Rs. <%= String.format("%.2f", total) %></td>
    </tr>
  </tfoot>
</table>
      
      <!-- Action Buttons -->
      <div class="flex flex-wrap justify-center gap-4 mt-6">
        <form action="CancelOrderServlet" method="post" onsubmit="return confirmCancel();">
          <input type="hidden" name="id" value="<%= deliveryId %>">
          <button type="submit"
            class="bg-red-600 hover:bg-red-700 text-white font-semibold px-6 py-2 rounded shadow">
            <i class="fas fa-times mr-1"></i> Cancel Order
          </button>
        </form>
        <a href="invoice.jsp?deliveryId=<%= deliveryId %>" target="_blank">
          <button type="button"
            class="bg-green-600 hover:bg-green-700 text-white font-semibold px-6 py-2 rounded shadow">
            <i class="fas fa-download mr-1"></i> Download Receipt
          </button>
        </a>
      </div>

    </div>
    <!-- Order Card End -->

    <% } %>
  <% } %>
</div>



<script>
function confirmCancel() {
  return confirm("Are you sure you want to cancel this order?");
}
</script>

<%@ include file="./partials/footer.jsp" %>

</body>
</html>
