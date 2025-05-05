<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*, com.foodordering.model.UpdateStatusModel, com.foodordering.services.UpdateStatusService" %>

<%
String role = (String) session.getAttribute("role");
if (role == null || !(role.equals("Manager") || role.equals("Staff") || role.equals("Delivery_Person"))) {
    out.println("<script>alert('Restricted: Valid employee login required.'); window.location='Login.jsp';</script>");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>QuickBites - Delivery Update</title>
    <%@ include file="./partials/header.jsp" %>
    <script src="js/adminpageJS.js"></script>
</head>

<body class="bg-gray-100 text-gray-800 font-sans min-h-screen">

    <div class="flex flex-col items-center p-8 min-h-screen">

        <!-- Top Navigation -->
        <div class="flex justify-start w-full max-w-7xl mb-6">
            <button onclick="location.href='AdminDashboard.jsp'"
                class="flex items-center gap-2 bg-orange-500 hover:bg-orange-600 text-white font-semibold px-5 py-3 rounded-xl shadow-md transition">
                <i class="fas fa-arrow-left"></i> Admin Dashboard
            </button>
        </div>

        <!-- Heading -->
        <h1 class="text-4xl font-bold text-gray-800 mb-8 flex items-center gap-4 w-full max-w-7xl">
            <i class="fas fa-truck"></i> Update Delivery Status
        </h1>

        <!-- Search Input -->
        <div class="w-full max-w-7xl mb-6">
            <input id="searchInput" type="text" placeholder="Search Details..."
                class="w-full px-6 py-3 rounded-xl bg-white text-gray-700 placeholder-gray-400 border border-gray-300 focus:ring-2 focus:ring-orange-500 outline-none shadow-sm">
        </div>

        <!-- Delivery Table -->
        <div class="w-full max-w-7xl overflow-x-auto bg-white p-6 rounded-2xl shadow-md border border-gray-200">
            <table class="min-w-full text-sm text-gray-800">
                <thead class="bg-orange-500 text-white">
                    <tr>
                        <th class="p-3 text-left">Order ID</th>
                        <th class="p-3 text-left">Customer</th>
                        <th class="p-3 text-left">Phone</th>
                        <th class="p-3 text-left">Address</th>
                        <th class="p-3 text-left">City</th>
                        <th class="p-3 text-left">Postal Code</th>
                        <th class="p-3 text-left">Food</th>
                        <th class="p-3 text-left">Qty</th>
                        <th class="p-3 text-left">Price</th>
                        <th class="p-3 text-left">Status</th>
                        <th class="p-3 text-left">Update</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        UpdateStatusService service = new UpdateStatusService();
                        List<UpdateStatusModel> orders = service.getAllOrders();
                        for (UpdateStatusModel o : orders) {
                    %>
                    <tr class="border-b hover:bg-gray-100">
                        <td class="p-3 font-semibold"><%= o.getOrderId() %></td>
                        <td class="p-3"><%= o.getFirstName() %> <%= o.getLastName() %></td>
                        <td class="p-3"><%= o.getPhone() %></td>
                        <td class="p-3"><%= o.getAddress() %></td>
                        <td class="p-3"><%= o.getCity() %></td>
                        <td class="p-3"><%= o.getPostalCode() %></td>
                        <td class="p-3"><%= o.getFoodName() %></td>
                        <td class="p-3"><%= o.getQuantity() %></td>
                        <td class="p-3">Rs. <%= o.getPrice() %></td>
                        <td class="p-3"><%= o.getStatus() %></td>
                        <td class="p-3">
                            <form method="post" action="UpdateStatusServlet" class="flex items-center gap-2">
                                <input type="hidden" name="orderId" value="<%= o.getOrderId() %>" />
                                <select name="newStatus" class="border border-gray-300 rounded px-3 py-2 bg-white text-sm">
                                    <option value="Processing" <%= o.getStatus().equals("Processing") ? "selected" : "" %>>Processing</option>
                                    <option value="Out for Delivery" <%= o.getStatus().equals("Out for Delivery") ? "selected" : "" %>>Out for Delivery</option>
                                    <option value="Delivered" <%= o.getStatus().equals("Delivered") ? "selected" : "" %>>Delivered</option>
                                </select>
                                <button type="submit"
                                    class="bg-green-500 hover:bg-green-600 text-white text-sm px-4 py-2 rounded shadow-sm transition">
                                    Save
                                </button>
                            </form>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

    </div>

    <%@ include file="./partials/footer.jsp" %>
</body>
</html>
