<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.foodordering.model.CartModel" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Your Cart - QuickBites</title>
    <link rel="icon" type="image/png" href="images/Q.png" />
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="flex flex-col min-h-screen bg-gray-100">

<%@ include file="./partials/header.jsp" %>

<main class="flex-grow">
    <div class="max-w-6xl mx-auto p-6">
        <h2 class="text-3xl font-bold mb-6 text-orange-600">🛒 Your Cart</h2>

        <%
            List<CartModel> itemsInCart = (List<CartModel>) session.getAttribute("cartItems");
            double total = 0.0;
        %>

        <% if (itemsInCart != null && !itemsInCart.isEmpty()) {
               for (CartModel item : itemsInCart) {
                   total += item.getPrice() * item.getQuantity();
        %>

        <!-- Single Cart Item -->
        <div class="flex items-center justify-between gap-4 mb-6 p-4 bg-white shadow rounded-lg">
            <!-- Left Side: Image and Info -->
            <div class="flex items-center gap-4">
                <img src="images/<%= item.getImageFilename() %>" class="w-24 h-24 object-cover rounded">
                <div>
                    <h3 class="text-xl font-semibold"><%= item.getFoodName() %></h3>
                    <p class="text-gray-700 mb-2">
                        Rs. <%= item.getPrice() %> x <%= item.getQuantity() %> =
                        <b>Rs. <%= String.format("%.2f", item.getPrice() * item.getQuantity()) %></b>
                    </p>
                </div>
            </div>

            <!-- Right Side: Quantity Control and Remove -->
            <div class="flex items-center gap-2">
                <!-- Decrease -->
                <form action="update-cart" method="post">
                    <input type="hidden" name="cart_id" value="<%= item.getFoodId() %>"/>
                    <input type="hidden" name="action" value="decrease"/>
                    <button type="submit" class="w-8 h-8 rounded-md bg-orange-300 hover:bg-orange-400 text-white text-lg font-bold flex items-center justify-center">−</button>
                </form>

                <span class="font-semibold text-lg"><%= item.getQuantity() %></span>

                <!-- Increase -->
                <form action="update-cart" method="post">
                    <input type="hidden" name="cart_id" value="<%= item.getFoodId() %>"/>
                    <input type="hidden" name="action" value="increase"/>
                    <button type="submit" class="w-8 h-8 rounded-md bg-orange-500 hover:bg-orange-600 text-white text-lg font-bold flex items-center justify-center">+</button>
                </form>

                <!-- Remove -->
                <form action="remove-cart-item" method="post" onsubmit="return confirm('Are you sure you want to remove this item?');">
                    <input type="hidden" name="cart_id" value="<%= item.getFoodId() %>"/>
                    <button type="submit" class="ml-2 px-2 py-1 text-sm text-red-500 hover:underline font-semibold">Remove</button>
                </form>
            </div>
        </div>

        <% } %>

        <!-- Total Section -->
        <div class="mt-8 p-6 bg-white rounded shadow flex items-center justify-between">
            <h3 class="text-xl font-bold">Total: Rs. <%= String.format("%.2f", total) %></h3>
            <a href="payment.jsp" class="bg-orange-500 hover:bg-orange-600 text-white px-6 py-2 rounded-lg font-semibold">Proceed to Checkout</a>
        </div>

        <% } else { %>

        <!-- Empty Cart -->
        <div class="bg-white p-8 text-center text-gray-600 rounded shadow min-h-[300px] flex items-center justify-center flex-col">
            <p>Your cart is empty.</p>
            <a href="home" class="text-orange-600 font-semibold hover:underline mt-2">Shop Now</a>
        </div>

        <% } %>
    </div>
</main>

<%@ include file="./partials/footer.jsp" %>

</body>
</html>
