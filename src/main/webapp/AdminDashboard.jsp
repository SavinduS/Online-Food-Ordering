<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    <title>QuickBites - Employee Dashboard</title>
    <%@ include file="./partials/header.jsp" %>
</head>

<body class="bg-gray-50 min-h-screen text-gray-800 font-sans">
    <div class="flex flex-col min-h-screen">

        <!-- Header -->
        <header class="bg-white py-6 shadow relative text-center">
            <div class="absolute right-6 top-6">
                <a href="EmployeeProfile.jsp"
                   class="bg-blue-600 hover:bg-blue-700 text-white font-semibold px-4 py-2 rounded-md flex items-center gap-2 shadow">
                    <i class="fas fa-user-edit"></i> Edit Employee Profile
                </a>
            </div>
            <h1 class="text-4xl font-bold text-gray-800 mt-10">Employee Dashboard</h1>
        </header>

        <!-- Button Grid with Blog Styling -->
        <main class="flex-grow flex items-center justify-center p-10 bg-gradient-to-br from-white to-gray-100">
            <div class="grid grid-cols-1 sm:grid-cols-2 gap-x-6 gap-y-6 max-w-2xl w-full">

                <div class="bg-white rounded-xl shadow p-4">
                    <button onclick="location.href='employeeManagement'"
                            class="bg-teal-500 hover:bg-teal-600 text-white text-lg font-semibold rounded-lg px-4 py-6 w-full h-40 flex items-center justify-center gap-4 transition duration-300">
                        <i class="fas fa-users-cog text-3xl"></i> Employee Management
                    </button>
                </div>

                <div class="bg-white rounded-xl shadow p-4">
                    <button onclick="location.href='feedbackSummary'"
                            class="bg-green-600 hover:bg-green-700 text-white text-lg font-semibold rounded-lg px-4 py-6 w-full h-40 flex items-center justify-center gap-4 transition duration-300">
                        <i class="fas fa-comments text-3xl"></i> View Feedbacks
                    </button>
                </div>

                <div class="bg-white rounded-xl shadow p-4">
                    <button onclick="location.href='deliverySummary'"
                            class="bg-yellow-400 hover:bg-yellow-500 text-white text-lg font-semibold rounded-lg px-4 py-6 w-full h-40 flex items-center justify-center gap-4 transition duration-300">
                        <i class="fas fa-truck text-3xl"></i> Update Delivery Status
                    </button>
                </div>

                <div class="bg-white rounded-xl shadow p-4">
                    <button onclick="location.href='customerSummary'"
                            class="bg-purple-600 hover:bg-purple-700 text-white text-lg font-semibold rounded-lg px-4 py-6 w-full h-40 flex items-center justify-center gap-4 transition duration-300">
                        <i class="fas fa-user-friends text-3xl"></i> View Customer Details
                    </button>
                </div>

            </div>
        </main>

        <!-- QuickBites Branding -->
        <div class="text-center -mt-2 mb-4 text-lg font-semibold text-gray-600">
            QuickBites
        </div>

        <%@ include file="./partials/footer.jsp" %>
    </div>
</body>
</html>
