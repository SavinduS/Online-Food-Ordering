<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>QuickBites - Update Employee</title>

<%@ include file="./partials/header.jsp" %>

<link rel="stylesheet" href="css\Admin.css">
<script src="js/adminpageJS.js"></script>

	<%
	
		String empID = request.getParameter("empID");
		String NIC = request.getParameter("NIC");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone_num = request.getParameter("phone_num");
		String position = request.getParameter("position");
		
	%>

    <div class="form-container">
    
    
        <h2>Update Employee Details</h2>
        <form action="updateEmpServlet" method="post">
        
        	<label>Employee ID:</label>
            <input type="text" value="<%=empID%>" name="empID" readonly>
            
        	<label>NIC:</label>
            <input type="text" value="<%=NIC%>" name="NIC" required>
            
            <label>Name:</label>
            <input type="text" value="<%=name%>" name="name" required>

            <label>Email:</label>
            <input type="email" value="<%=email%>" name="email" required>

            <label>Phone Number:</label>
            <input type="tel" value="<%=phone_num%>" name="phone_num" required>

            <label>Password:</label>
            <input type="password" placeholder="Enter new password" name="password" required>

            <label>Position:</label>
            <select required name="position">
                <option value="" disabled selected>Select Position</option>
                <option value="Manager">Manager</option>
                <option value="Staff">Staff</option>
                <option value="Intern">Intern</option>
            </select>

            <button type="submit" class="submit-btn">Update</button>
            <button type="button" class="cancel-btn" onclick="location.href='AdminDashboard'">Cancel</button>
        </form>
    </div>
    
    <%@ include file="./partials/footer.jsp" %>
</body>
</html>
