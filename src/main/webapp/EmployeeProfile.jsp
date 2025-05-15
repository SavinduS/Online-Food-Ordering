<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.foodordering.model.employee" %>

<%
    String role = (String) session.getAttribute("role");
    employee employee = (employee) session.getAttribute("loggedEmployee");

    if (employee == null || role == null ||
       !(role.equals("Manager") || role.equals("Staff") || role.equals("Delivery_Person"))) {
        out.println("<script>alert('Restricted: Valid employee login required.'); window.location='Login.jsp';</script>");
        return;
    }
%>



<!DOCTYPE html>
<html lang="en">
<head>
    <title>QuickBites - Employee Profile</title>
    <%@ include file="./partials/header.jsp" %>
    <script src="js/employeeProfileJS.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>

<body class="bg-gray-100 text-gray-800 font-sans min-h-screen">

    <div class="flex flex-col items-center p-8 min-h-screen">

        <!-- Back to Dashboard -->
        <div class="flex justify-start w-full max-w-7xl mb-6">
            <button onclick="location.href='AdminDashboard.jsp'"
                class="flex items-center gap-2 bg-orange-500 hover:bg-orange-600 text-white font-semibold px-5 py-3 rounded-xl shadow-md transition">
                <i class="fas fa-arrow-left"></i> Employee Dashboard
            </button>
        </div>

        <h1 class="text-4xl font-bold text-gray-800 mb-8 flex items-center gap-4 w-full max-w-7xl">
            <i class="fas fa-user-tie"></i> Employee Profile
        </h1>

        <!-- Profile Card -->
        <div class="w-full max-w-7xl bg-white shadow-lg rounded-2xl p-8 flex flex-col md:flex-row items-start gap-8 border border-gray-200">



            <!-- LEFT: Profile Overview -->
            <div class="md:w-1/2 flex flex-col items-center text-center">
                <div class="bg-gray-200 p-6 rounded-full">
                    <i class="fas fa-user text-4xl text-gray-600"></i>
                </div>
                <h2 class="text-2xl font-bold mt-4"><%= employee.getName() %></h2>
                <p class="text-sm text-gray-500 mb-6 capitalize"><%= employee.getPosition() %></p>

                <div class="space-y-3 text-left w-full max-w-sm">
                    <p class="text-gray-700"><i class="fas fa-id-badge mr-2 text-blue-600"></i> <strong>Employee ID:</strong> <%= employee.getEmpID() %></p>
                    <p class="text-gray-700"><i class="fas fa-envelope mr-2 text-red-600"></i> <strong>Email:</strong> <%= employee.getEmail() %></p>
                    <p class="text-gray-700"><i class="fas fa-phone mr-2 text-green-600"></i> <strong>Phone:</strong> <%= employee.getPhone_num() %></p>
                </div>
            </div>



            <!-- RIGHT: Edit Form -->
            <div class="md:w-1/2 w-full">
                <h3 class="text-xl font-semibold mb-4 text-gray-800">Edit Information</h3>
                
                <form action="employeeProfileUpdate" method="post" class="space-y-5">
                    <input type="hidden" name="empID" value="<%= employee.getEmpID() %>" />

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">
                            <i class="fas fa-phone-alt mr-1 text-green-500"></i>Phone Number
                        </label>
                        <input type="text" name="phone_num" value="<%= employee.getPhone_num() %>" required 
                            class="w-full border border-gray-300 rounded-xl px-4 py-3 focus:ring-2 focus:ring-orange-500 shadow-sm" />
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">
                            <i class="fas fa-lock mr-1 text-gray-500"></i>New Password
                        </label>
                        <input type="password" name="password" placeholder="Leave blank if no change" 
                            class="w-full border border-gray-300 rounded-xl px-4 py-3 focus:ring-2 focus:ring-orange-500 shadow-sm" />
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">
                            <i class="fas fa-lock mr-1 text-gray-500"></i>Confirm Password
                        </label>
                        <input type="password" name="password_confirm" 
                            class="w-full border border-gray-300 rounded-xl px-4 py-3 focus:ring-2 focus:ring-orange-500 shadow-sm" />
                    </div>

                    <div>
                        <button type="submit" class="bg-black text-white px-6 py-3 rounded-xl hover:bg-gray-800 shadow-md inline-flex items-center text-base">
                            <i class="fas fa-save mr-2"></i>Save Changes
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <%@ include file="./partials/footer.jsp" %>
</body>
</html>
