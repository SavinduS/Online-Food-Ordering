<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
String role = (String) session.getAttribute("role");
if (role == null || !(role.equals("Manager") || role.equals("Staff"))) {
    out.println("<script>alert('Restricted: Only Manager or Staff allowed.'); window.location='AdminDashboard.jsp';</script>");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>QuickBites - Feedback Summary</title>
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
            <i class="fas fa-comments"></i> Feedback Summary
        </h1>

        <!-- Search Input -->
        <div class="w-full max-w-7xl mb-6">
            <input id="searchInput" type="text" placeholder="Search Details..."
                   class="w-full px-6 py-3 rounded-xl bg-white text-gray-700 placeholder-gray-400 border border-gray-300 focus:ring-2 focus:ring-orange-500 outline-none shadow-sm">
        </div>

        <!-- Feedback Table -->
        <div class="w-full max-w-7xl overflow-x-auto bg-white p-6 rounded-2xl shadow-md border border-gray-200">
            <table class="min-w-full text-sm text-gray-800">
                <thead class="bg-gray-200 text-gray-700">
                    <tr>
                        <th class="px-6 py-3 text-left">Name</th>
                        <th class="px-6 py-3 text-left">Email</th>
                        <th class="px-6 py-3 text-left">Mobile</th>
                        <th class="px-6 py-3 text-left">Rating</th>
                        <th class="px-6 py-3 text-left">Comment</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="feedback" items="${allFeedback}">
                        <tr class="border-b hover:bg-gray-100">
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
</body>
</html>
