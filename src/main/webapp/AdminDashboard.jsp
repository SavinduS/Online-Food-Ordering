<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session == null || !"admin".equals(session.getAttribute("role"))) {
        response.sendRedirect("Login.jsp");
    }
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>QuickBites - Admin Dashboard</title>
    <%@ include file="./partials/header.jsp" %>
</head>

<body class="bg-gray-100 min-h-screen text-gray-800 font-sans">

    <div class="flex flex-col min-h-screen">

        <!-- Header area -->
        <div class="bg-white shadow-md py-6">
            <h1 class="text-center text-3xl font-bold text-gray-800">Admin Dashboard</h1>
        </div>

        <!-- Main buttons grid -->
        <div class="flex-grow flex flex-col items-center justify-center p-8">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-8 w-full max-w-5xl">

                <!-- Employee Management Button -->
                <button onclick="location.href='employeeManagement'"
                    class="flex items-center justify-center bg-blue-500 hover:bg-blue-600 text-white font-semibold py-10 rounded-xl shadow-md text-xl gap-4 transition duration-300 w-full h-36">
                    <i class="fas fa-users-cog text-3xl"></i> 
                    Employee Management
                </button>

                <!-- View Feedbacks Button -->
                <button onclick="location.href='feedbackSummary'"
                    class="flex items-center justify-center bg-green-500 hover:bg-green-600 text-white font-semibold py-10 rounded-xl shadow-md text-xl gap-4 transition duration-300 w-full h-36">
                    <i class="fas fa-comments text-3xl"></i> 
                    View Feedbacks
                </button>

                <!-- View Deliveries Button -->
                <button onclick="location.href='deliverySummary'"
                    class="flex items-center justify-center bg-yellow-500 hover:bg-yellow-600 text-white font-semibold py-10 rounded-xl shadow-md text-xl gap-4 transition duration-300 w-full h-36">
                    <i class="fas fa-truck text-3xl"></i> 
                    Update Delivery Status
                </button>

                <!-- View Customers Details Button -->
                <button onclick="location.href='customerSummary'"
                    class="flex items-center justify-center bg-purple-500 hover:bg-purple-600 text-white font-semibold py-10 rounded-xl shadow-md text-xl gap-4 transition duration-300 w-full h-36">
                    <i class="fas fa-user-friends text-3xl"></i> 
                    View Customer Details
                </button>

            </div>
        </div>

        <%@ include file="./partials/footer.jsp" %>

    </div>
</body>
</html>
