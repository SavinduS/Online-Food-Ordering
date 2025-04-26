<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>QuickBites - Admin Dashboard</title>
    <%@ include file="./partials/header.jsp" %>

    <!-- Tailwind CSS and FontAwesome already included in header.jsp -->
</head>

<!-- No need to add body class again because already in header.jsp -->

<div class="bg-gray-900 min-h-screen flex flex-col">

    <div class="flex-grow flex flex-col items-center justify-center p-8">
        <h1 class="text-4xl font-bold text-white mb-10">Admin Dashboard</h1>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-8 w-full max-w-4xl">

            <!-- Employee Management Button -->
            <button onclick="location.href='employeeManagement'"
                class="flex items-center justify-center bg-blue-700 hover:bg-blue-600 text-white font-bold py-10 rounded-2xl shadow-lg text-2xl gap-4 transition duration-300 w-full h-40">
                <i class="fas fa-users-cog text-4xl"></i> 
                Employee Management
            </button>

            <!-- View Feedbacks Button -->
            <button onclick="location.href='feedbackSummary'"
                class="flex items-center justify-center bg-green-700 hover:bg-green-600 text-white font-bold py-10 rounded-2xl shadow-lg text-2xl gap-4 transition duration-300 w-full h-40">
                <i class="fas fa-comments text-4xl"></i> 
                View Feedbacks
            </button>

            <!-- View Deliveries Button -->
            <button onclick="location.href='deliverySummary'"
                class="flex items-center justify-center bg-orange-700 hover:bg-orange-600 text-white font-bold py-10 rounded-2xl shadow-lg text-2xl gap-4 transition duration-300 w-full h-40">
                <i class="fas fa-truck text-4xl"></i> 
                View Deliveries
            </button>

            <!-- View Customers Details Button -->
            <button onclick="location.href='customerSummary'"
                class="flex items-center justify-center bg-purple-700 hover:bg-purple-600 text-white font-bold py-10 rounded-2xl shadow-lg text-2xl gap-4 transition duration-300 w-full h-40">
                <i class="fas fa-user-friends text-4xl"></i> 
                View Customers Details
            </button>

        </div>
    </div>

    <%@ include file="./partials/footer.jsp" %>

</div> <!-- dark background div closes here -->

</html>
