<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>QuickBites - Feedback Summary</title>
    <%@ include file="./partials/header.jsp" %>
    <script src="js/adminpageJS.js"></script>
</head>

<div class="bg-gray-900 min-h-screen flex flex-col items-center p-8">

    <!-- Top Navigation -->
    <div class="flex justify-start w-full max-w-7xl mb-6">
        <button onclick="location.href='AdminDashboard.jsp'"
            class="flex items-center gap-2 bg-orange-600 hover:bg-orange-700 text-white font-semibold px-5 py-3 rounded-xl shadow-md transition">
            <i class="fas fa-arrow-left"></i> Admin Dashboard
        </button>
    </div>

    <h1 class="text-4xl font-bold text-white mb-8 flex items-center gap-4 w-full max-w-7xl">
        <i class="fas fa-comments"></i> Feedback Summary
    </h1>

    <!-- Search Input -->
    <div class="w-full max-w-7xl mb-6">
        <input id="searchInput" type="text" placeholder="Search Details..." 
               class="w-full px-6 py-3 rounded-xl bg-gray-800 text-white placeholder-gray-400 focus:ring-2 focus:ring-orange-500 outline-none shadow-lg">
    </div>

    <!-- Feedback Table -->
    <div class="w-full max-w-7xl overflow-x-auto bg-gray-800 p-6 rounded-xl shadow-lg">
        <table class="min-w-full text-sm text-gray-300">
            <thead class="bg-gray-700 text-gray-100">
                <tr>
                    <th class="px-6 py-3 text-left">Name</th>
                    <th class="px-6 py-3 text-left">Email</th>
                    <th class="px-6 py-3 text-left">Mobile</th>
                    <th class="px-6 py-3 text-left">Rating</th>
                    <th class="px-6 py-3 text-left">Comment</th>
                </tr>
            </thead>
            <tbody class="bg-gray-800">
                <c:forEach var="feedback" items="${allFeedback}">
                    <tr class="border-b border-gray-700 hover:bg-gray-700">
                        <td class="px-6 py-4">${feedback.name}</td>
                        <td class="px-6 py-4">${feedback.email}</td>
                        <td class="px-6 py-4">${feedback.mobile}</td>
                        <td class="px-6 py-4">${feedback.rate}</td>
                        <td class="px-6 py-4">${feedback.comment}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</div>

<%@ include file="./partials/footer.jsp" %>
</html>
