<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>QuickBites - Employee Management</title>
    <%@ include file="./partials/header.jsp" %>
    <script src="js/adminpageJS.js"></script>
</head>

<div class="bg-gray-900 min-h-screen flex flex-col items-center p-8">

    <!-- Top Navigation -->
    <div class="flex justify-between w-full max-w-7xl mb-6">
        <button onclick="location.href='AdminDashboard.jsp'"
            class="flex items-center gap-2 bg-orange-600 hover:bg-orange-700 text-white font-semibold px-5 py-3 rounded-xl shadow-md transition">
            <i class="fas fa-arrow-left"></i> Admin Dashboard
        </button>
        <button onclick="location.href='AddEmployee.jsp'"
            class="flex items-center gap-2 bg-green-600 hover:bg-green-700 text-white font-semibold px-5 py-3 rounded-xl shadow-md transition">
            <i class="fas fa-user-plus"></i> Add New Employee
        </button>
    </div>

    <h1 class="text-4xl font-bold text-white mb-8 flex items-center gap-4 w-full max-w-7xl">
        <i class="fas fa-users-cog"></i> Employee Management
    </h1>

    <!-- Search Input -->
    <div class="w-full max-w-7xl mb-6">
        <input id="searchInput" type="text" placeholder="Search Details..." 
               class="w-full px-6 py-3 rounded-xl bg-gray-800 text-white placeholder-gray-400 focus:ring-2 focus:ring-orange-500 outline-none shadow-lg">
    </div>

    <!-- Employee Table -->
    <div class="w-full max-w-7xl overflow-x-auto bg-gray-800 p-6 rounded-xl shadow-lg">
        <table class="min-w-full text-sm text-gray-300">
            <thead class="bg-gray-700 text-gray-100">
                <tr>
                    <th class="px-6 py-3 text-left">Employee ID</th>
                    <th class="px-6 py-3 text-left">NIC</th>
                    <th class="px-6 py-3 text-left">Name</th>
                    <th class="px-6 py-3 text-left">Email</th>
                    <th class="px-6 py-3 text-left">Phone Number</th>
                    <th class="px-6 py-3 text-left">Position</th>
                    <th class="px-6 py-3 text-left">Edit</th>
                    <th class="px-6 py-3 text-left">Delete</th>
                </tr>
            </thead>
            <tbody class="bg-gray-800">
                <c:forEach var="emp" items="${allEmp}">
                    <tr class="border-b border-gray-700 hover:bg-gray-700">
                        <td class="px-6 py-4">${emp.empID}</td>
                        <td class="px-6 py-4">${emp.NIC}</td>
                        <td class="px-6 py-4">${emp.name}</td>
                        <td class="px-6 py-4">${emp.email}</td>
                        <td class="px-6 py-4">${emp.phone_num}</td>
                        <td class="px-6 py-4">${emp.position}</td>
                        <td class="px-6 py-4">
                            <form action="UpdateEmployee.jsp" method="post">
                                <input type="hidden" name="empID" value="${emp.empID}">
                                <input type="hidden" name="NIC" value="${emp.NIC}">
                                <input type="hidden" name="name" value="${emp.name}">
                                <input type="hidden" name="email" value="${emp.email}">
                                <input type="hidden" name="phone_num" value="${emp.phone_num}">
                                <input type="hidden" name="position" value="${emp.position}">
                                <button type="submit" class="flex items-center gap-2 bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg transition shadow-md">
                                    <i class="fas fa-edit"></i> Edit
                                </button>
                            </form>
                        </td>
                        <td class="px-6 py-4">
                            <form action="deleteEmpServlet" method="post">
                                <input type="hidden" name="empID" value="${emp.empID}">
                                <button type="submit" class="flex items-center gap-2 bg-red-600 hover:bg-red-700 text-white px-4 py-2 rounded-lg transition shadow-md">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</div>

<%@ include file="./partials/footer.jsp" %>
</html>
