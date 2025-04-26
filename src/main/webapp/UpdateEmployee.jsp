<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>QuickBites - Update Employee</title>
    <%@ include file="./partials/header.jsp" %>
</head>

<%
    String empID = request.getParameter("empID");
    String NIC = request.getParameter("NIC");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone_num = request.getParameter("phone_num");
    String position = request.getParameter("position");
%>

<div class="bg-gray-900 min-h-screen flex flex-col items-center p-8">

    <!-- Top Navigation -->
    <div class="flex justify-start w-full max-w-2xl mb-6">
        <button onclick="location.href='employeeManagement'"
            class="flex items-center gap-2 bg-orange-600 hover:bg-orange-700 text-white font-semibold px-5 py-3 rounded-xl shadow-md transition">
            <i class="fas fa-arrow-left"></i> Back to Employee Management
        </button>
    </div>

    <h1 class="text-3xl font-bold text-white mb-8 flex items-center gap-4">
        <i class="fas fa-user-edit"></i> Update Employee
    </h1>

    <!-- Update Employee Form -->
    <div class="w-full max-w-2xl bg-gray-800 p-8 rounded-2xl shadow-lg">
        <form action="updateEmpServlet" method="post" class="flex flex-col gap-6 text-white">

            <div class="flex flex-col">
                <label class="mb-1">Employee ID</label>
                <input type="text" value="<%=empID%>" name="empID" readonly
                    class="px-4 py-3 rounded-xl bg-gray-700 text-gray-400 outline-none">
            </div>

            <div class="flex flex-col">
                <label class="mb-1">NIC</label>
                <input type="text" value="<%=NIC%>" name="NIC" required
                    class="px-4 py-3 rounded-xl bg-gray-700 placeholder-gray-400 outline-none focus:ring-2 focus:ring-orange-500">
            </div>

            <div class="flex flex-col">
                <label class="mb-1">Name</label>
                <input type="text" value="<%=name%>" name="name" required
                    class="px-4 py-3 rounded-xl bg-gray-700 placeholder-gray-400 outline-none focus:ring-2 focus:ring-orange-500">
            </div>

            <div class="flex flex-col">
                <label class="mb-1">Email</label>
                <input type="email" value="<%=email%>" name="email" required
                    class="px-4 py-3 rounded-xl bg-gray-700 placeholder-gray-400 outline-none focus:ring-2 focus:ring-orange-500">
            </div>

            <div class="flex flex-col">
                <label class="mb-1">Phone Number</label>
                <input type="tel" value="<%=phone_num%>" name="phone_num" required
                    class="px-4 py-3 rounded-xl bg-gray-700 placeholder-gray-400 outline-none focus:ring-2 focus:ring-orange-500">
            </div>

            <div class="flex flex-col">
                <label class="mb-1">Password</label>
                <input type="password" placeholder="Enter new password" name="password" required
                    class="px-4 py-3 rounded-xl bg-gray-700 placeholder-gray-400 outline-none focus:ring-2 focus:ring-orange-500">
            </div>

            <div class="flex flex-col">
                <label class="mb-1">Position</label>
                <select name="position" required
                    class="px-4 py-3 rounded-xl bg-gray-700 text-white outline-none focus:ring-2 focus:ring-orange-500">
                    <option value="" disabled selected>Select Position</option>
                    <option value="Manager" <%= "Manager".equals(position) ? "selected" : "" %>>Manager</option>
                    <option value="Staff" <%= "Staff".equals(position) ? "selected" : "" %>>Staff</option>
                    <option value="Intern" <%= "Intern".equals(position) ? "selected" : "" %>>Intern</option>
                </select>
            </div>

            <!-- Buttons -->
            <div class="flex justify-between mt-6">
                <button type="submit"
                    class="flex items-center justify-center gap-2 bg-blue-600 hover:bg-blue-700 text-white font-semibold px-6 py-3 rounded-xl shadow-md transition w-full mr-2">
                    <i class="fas fa-save"></i> Update
                </button>
                <button type="button" onclick="location.href='employeeManagement'"
                    class="flex items-center justify-center gap-2 bg-red-600 hover:bg-red-700 text-white font-semibold px-6 py-3 rounded-xl shadow-md transition w-full ml-2">
                    <i class="fas fa-times"></i> Cancel
                </button>
            </div>

        </form>
    </div>

</div>

<%@ include file="./partials/footer.jsp" %>
</html>
