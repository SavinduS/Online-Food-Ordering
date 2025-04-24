<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

	
<title>QuickBites - Add Employees</title>

<%@ include file="./partials/header.jsp" %>

<link rel="stylesheet" href="css\Admin.css">
<script src="js/adminpageJS.js"></script>

	
	
    <div class="form-container">
        <h2>Add New Employee</h2>
        <form action="addEmpServlet" method="post">
            <label>Name:</label>
            <input type="text" placeholder="Enter employee name" name="name" required>
            
            <label>NIC:</label>
            <input type="text" placeholder="Enter employee NIC number" name="NIC" required>

            <label>Email:</label>
            <input type="email" placeholder="Enter email" name="email" required>

            <label>Phone Number:</label>
            <input type="tel" placeholder="Enter phone number" name="phone_num" required>

            <label>Password:</label>
            <input type="password" placeholder="Enter password" name="password" required>

            <label>Position:</label>
            <select name="position" required>
                <option value="" disabled selected>Select Position</option>
                <option value="Manager">Manager</option>
                <option value="Staff">Staff</option>
                <option value="Intern">Intern</option>
            </select>

            <button type="submit" class="submit-btn">Add Employee</button>
            <button type="button" class="cancel-btn" onclick="location.href='AdminDashboard'">Cancel</button>
        </form>
    </div>
    
    
    <%@ include file="./partials/footer.jsp" %>
    
   
    
    
</body>
</html>
