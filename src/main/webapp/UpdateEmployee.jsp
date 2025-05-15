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
    <title>QuickBites - Update Employee</title>
    <%@ include file="./partials/header.jsp" %>
    <script src="js/adminpageJS.js"></script>
</head>

<!-- Pre-fill the form fields -->
<%
    String empID = request.getParameter("empID");
    String NIC = request.getParameter("NIC");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone_num = request.getParameter("phone_num");
    String position = request.getParameter("position");
%>

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
            <i class="fas fa-user-edit"></i> Update Employee
        </h1>

        <!-- Update Employee Form -->
        <div class="w-full max-w-2xl bg-white p-8 rounded-2xl shadow-md border border-gray-200">
        
            <form action="updateEmpServlet" method="post" class="flex flex-col gap-6 text-gray-700">

                <div class="flex flex-col">
                    <label class="mb-1 font-medium">Employee ID</label>
                    <input type="text" value="<%=empID%>" name="empID" readonly
                        class="px-4 py-3 rounded-xl bg-gray-100 text-gray-500 border border-gray-300 outline-none">
                </div>

                <div class="flex flex-col">
                    <label class="mb-1 font-medium">NIC</label>
                    <input type="text" value="<%=NIC%>" name="NIC" required
                        class="px-4 py-3 rounded-xl bg-gray-50 border border-gray-300 placeholder-gray-400 outline-none focus:ring-2 focus:ring-orange-500">
                </div>

                <div class="flex flex-col">
                    <label class="mb-1 font-medium">Name</label>
                    <input type="text" value="<%=name%>" name="name" required
                        class="px-4 py-3 rounded-xl bg-gray-50 border border-gray-300 placeholder-gray-400 outline-none focus:ring-2 focus:ring-orange-500">
                </div>

                <div class="flex flex-col">
                    <label class="mb-1 font-medium">Email</label>
                    <input type="email" value="<%=email%>" name="email" required
                        class="px-4 py-3 rounded-xl bg-gray-50 border border-gray-300 placeholder-gray-400 outline-none focus:ring-2 focus:ring-orange-500">
                </div>

                <div class="flex flex-col">
                    <label class="mb-1 font-medium">Phone Number</label>
                    <input type="tel" value="<%=phone_num%>" name="phone_num" required
                        class="px-4 py-3 rounded-xl bg-gray-50 border border-gray-300 placeholder-gray-400 outline-none focus:ring-2 focus:ring-orange-500">
                </div>


                <div class="flex flex-col">
                    <label class="mb-1 font-medium">Position</label>
                    <select name="position" required
                        class="px-4 py-3 rounded-xl bg-gray-50 border border-gray-300 text-gray-700 outline-none focus:ring-2 focus:ring-orange-500">
                        <option value="" disabled>Select Position</option>
                        <option value="Manager" <%= "Manager".equals(position) ? "selected" : "" %>>Manager</option>
                        <option value="Staff" <%= "Staff".equals(position) ? "selected" : "" %>>Staff</option>
                        <option value="Intern" <%= "Delivery_Person".equals(position) ? "selected" : "" %>>Delivery Person</option>
                    </select>
                </div>

                <!-- Buttons -->
                <div class="flex justify-between mt-6">
                    <button type="submit"
                        class="flex items-center justify-center gap-2 bg-blue-500 hover:bg-blue-600 text-white font-semibold px-6 py-3 rounded-xl shadow-md transition w-full mr-2">
                        <i class="fas fa-save"></i> Update
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
