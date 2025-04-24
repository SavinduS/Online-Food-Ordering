<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<title>QuickBites - Admin Dashboard</title>

<%@ include file="./partials/header.jsp" %>

<link rel="stylesheet" href="css/Admin.css">
<script src="js/adminpageJS.js"></script>


	
    <div class="container">
        <h2>Employee Management</h2>
        <button class="add-btn" onclick="location.href='AddEmployee.jsp'"><i class="fas fa-user-plus"></i> Add New Employee</button>
        
        <input type="text" id="searchInput" placeholder="Search Details...">
        
        <table>
            <thead>
                <tr>
                	<th>Employee ID</th>
                    <th>NIC</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Position</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach var="emp" items="${allEmp}">
            	<tr>
            		<td> ${emp.empID} </td>
            		<td> ${emp.NIC} </td>
            		<td> ${emp.name} </td>
            		<td> ${emp.email} </td>
            		<td> ${emp.phone_num} </td>
            		<td> ${emp.position} </td>
                    <td>
   						 <form action="UpdateEmployee.jsp" method="get" style="display:inline;">
       						 <input type="hidden" name="empID" value="${emp.empID}">
       						 <input type="hidden" name="NIC" value="${emp.NIC}">
      						 <input type="hidden" name="name" value="${emp.name}">
      						 <input type="hidden" name="email" value="${emp.email}">
      						 <input type="hidden" name="phone_num" value="${emp.phone_num}">
     						 <input type="hidden" name="position" value="${emp.position}">
       						 <button type="submit" class="edit-btn">Edit <i class="fas fa-edit"></i></button>
    					</form>
					</td>
					
					<td>
						<form action="deleteEmpServlet" method="post" style="display:inline;">
							<input type="hidden" name="empID" value="${emp.empID}">
							<button class="delete-btn">Delete <i class="fas fa-trash-alt"></i></button>
						</form>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    
    
    <%@ include file="./partials/footer.jsp" %>
    
</body>
</html>
