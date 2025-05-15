<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Session validation -->
<%
String role = (String) session.getAttribute("role");
if (role == null || !role.equals("Manager")) {
    out.println("<script>alert('Restricted: Manager access only.'); window.location='AdminDashboard.jsp';</script>");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>QuickBites - Add New Employee</title>
    <%@ include file="./partials/header.jsp" %>
    <script src="js/adminpageJS.js"></script>
</head>

<body class="bg-gray-100 text-gray-800 font-sans min-h-screen">

    <div class="flex flex-col items-center p-8 min-h-screen">

        <!-- Top Navigation -->
        <div class="flex justify-start w-full max-w-2xl mb-6">
            <button onclick="location.href='employeeManagement'"
                class="flex items-center gap-2 bg-orange-500 hover:bg-orange-600 text-white font-semibold px-5 py-3 rounded-xl shadow-md transition">
                <i class="fas fa-arrow-left"></i> Back to Employee Management
            </button>
        </div>

        <!-- Heading -->
        <h1 class="text-3xl font-bold text-gray-800 mb-8 flex items-center gap-4">
            <i class="fas fa-user-plus"></i> Add New Employee
        </h1>

        <!-- Add Employee Form -->
        <div class="w-full max-w-2xl bg-white p-8 rounded-2xl shadow-md border border-gray-200">
            <form action="addEmpServlet" method="post" class="flex flex-col gap-6 text-gray-700">

                <div class="flex flex-col">
                    <label class="mb-1 font-medium">Name</label>
                    <input type="text" name="name" placeholder="Enter employee name" required
                        class="px-4 py-3 rounded-xl bg-gray-50 border border-gray-300 placeholder-gray-400 outline-none focus:ring-2 focus:ring-orange-500">
                </div>

                <div class="flex flex-col">
                    <label class="mb-1 font-medium">NIC</label>
                    <input type="text" name="NIC" placeholder="Enter employee NIC number" required
                        class="px-4 py-3 rounded-xl bg-gray-50 border border-gray-300 placeholder-gray-400 outline-none focus:ring-2 focus:ring-orange-500">
                </div>

                <div class="flex flex-col">
                    <label class="mb-1 font-medium">Email</label>
                    <input type="email" name="email" placeholder="Enter email" required
                        class="px-4 py-3 rounded-xl bg-gray-50 border border-gray-300 placeholder-gray-400 outline-none focus:ring-2 focus:ring-orange-500">
                </div>

                <div class="flex flex-col">
                    <label class="mb-1 font-medium">Phone Number</label>
                    <input type="tel" name="phone_num" placeholder="Enter phone number" required
                        class="px-4 py-3 rounded-xl bg-gray-50 border border-gray-300 placeholder-gray-400 outline-none focus:ring-2 focus:ring-orange-500">
                </div>

                <div class="flex flex-col">
                    <label class="mb-1 font-medium">Password</label>
                    <input type="password" name="password" placeholder="Enter password" required
                        class="px-4 py-3 rounded-xl bg-gray-50 border border-gray-300 placeholder-gray-400 outline-none focus:ring-2 focus:ring-orange-500">
                </div>
                
                <div class="flex flex-col">
                    <label class="mb-1 font-medium">Confirm Password</label>
                    <input type="password" placeholder="Confirm new password" name="password_confirm" required
                        class="px-4 py-3 rounded-xl bg-gray-50 border border-gray-300 placeholder-gray-400 outline-none focus:ring-2 focus:ring-orange-500">
                </div>

                <div class="flex flex-col">
                    <label class="mb-1 font-medium">Position</label>
                    <select name="position" required
                        class="px-4 py-3 rounded-xl bg-gray-50 border border-gray-300 text-gray-700 outline-none focus:ring-2 focus:ring-orange-500">
                        <option value="" disabled selected>Select Position</option>
                        <option value="Manager">Manager</option>
                        <option value="Staff">Staff</option>
                        <option value="Delivery_Person">Delivery Person</option>
                    </select>
                </div>

                <!-- Buttons -->
                <div class="flex justify-between mt-6">
                    <button type="submit"
                        class="flex items-center justify-center gap-2 bg-green-500 hover:bg-green-600 text-white font-semibold px-6 py-3 rounded-xl shadow-md transition w-full mr-2">
                        <i class="fas fa-plus"></i> Add
                    </button>
                    <button type="button" onclick="location.href='employeeManagement'"
                        class="flex items-center justify-center gap-2 bg-red-500 hover:bg-red-600 text-white font-semibold px-6 py-3 rounded-xl shadow-md transition w-full ml-2">
                        <i class="fas fa-times"></i> Cancel
                    </button>
                </div>

            </form>
        </div>

    </div>

    <%@ include file="./partials/footer.jsp" %>
</body>
</html>
