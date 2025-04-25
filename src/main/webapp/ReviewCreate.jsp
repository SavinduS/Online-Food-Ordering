<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Review Create</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body class="bg-white font-sans">

  <%@ include file="./partials/header.jsp" %>

  <!-- Hero Section -->
  <section class="relative bg-cover bg-center bg-no-repeat py-20 px-5" style="background-image: url('images/Review sec1.jpg')">
    <div class="text-center text-white"><br><br>
      <h1 class="text-5xl font-bold drop-shadow-lg">Share Your Experience</h1>
      <p class="text-lg mt-4">We value your feedback! Let us know how we did.</p>
    </div>
  </section>

  <!-- Review Form -->
  <form action="RegisterServlet" method="post" autocomplete="off">
    <section class="flex justify-center py-12 px-4 bg-gradient-to-br from-yellow-900/90 to-yellow-300/80">
      <div class="bg-gray-100 p-8 rounded-lg w-full max-w-2xl hover:shadow-xl transition">
        <div class="flex items-center justify-between mb-6 border-b pb-4 border-red-600">
          <h2 class="text-2xl font-bold text-gray-900">Submit Your Review</h2>
        </div>

        <div class="space-y-5">
          <div class="relative">
            <i class="fas fa-user absolute top-3.5 left-4 text-gray-700"></i>
            <input type="text" name="name" placeholder="Your Name*" required class="w-full pl-12 py-3 border border-gray-300 rounded-lg focus:outline-none focus:border-red-600">
          </div>

          <div class="relative">
            <i class="fas fa-envelope absolute top-3.5 left-4 text-gray-700"></i>
            <input type="email" name="email" placeholder="Your Email*" required class="w-full pl-12 py-3 border border-gray-300 rounded-lg focus:outline-none focus:border-red-600">
          </div>

          <div class="relative">
            <i class="fas fa-phone absolute top-3.5 left-4 text-gray-700"></i>
            <input type="tel" name="mobile" placeholder="Your Phone Number*" pattern="[0-9]{10}" maxlength="10" required class="w-full pl-12 py-3 border border-gray-300 rounded-lg focus:outline-none focus:border-red-600">
          </div>

          <div class="relative">
            <i class="fas fa-star absolute top-3.5 left-4 text-gray-700"></i>
            <select name="rating" required class="w-full pl-12 pr-4 py-3 border border-gray-300 rounded-lg bg-white focus:outline-none focus:border-red-600 appearance-none">
              <option value="" disabled selected>Rating*</option>
              <option value="1">1 - Poor</option>
              <option value="2">2 - Fair</option>
              <option value="3">3 - Good</option>
              <option value="4">4 - Very Good</option>
              <option value="5">5 - Excellent</option>
            </select>
          </div>

          <div class="relative">
            <i class="fas fa-comment-dots absolute top-4 left-4 text-gray-700"></i>
            <textarea name="message" rows="4" placeholder="Your Review*" required class="w-full pl-12 pt-4 pr-4 pb-2 border border-gray-300 rounded-lg focus:outline-none focus:border-red-600 resize-none"></textarea>
          </div>

          <button type="submit" class="bg-red-600 hover:bg-red-800 text-white py-3 rounded-lg font-medium w-full transition">
            Submit Review
          </button>
        </div>
      </div>
    </section>
  </form>

  <!-- Dynamic Review Cards Section (from DB) -->
  <section class="flex flex-wrap justify-center gap-6 px-4 py-12 bg-cover bg-center bg-no-repeat" style="background-image: url('images/annie-spratt-R3LcfTvcGWY-unsplash.jpg')">
    <c:forEach var="review" items="${reviews}" varStatus="loop">
      <c:if test="${loop.index < 6}">
        <div class="bg-white w-64 rounded-lg shadow-md p-6 text-left hover:shadow-xl transition">
          <div class="flex items-center gap-4 mb-4">
            <i class="fas fa-user-circle text-4xl text-red-700"></i>
            <div>
              <h4 class="text-lg font-bold text-gray-800">${review.name}</h4>
              <p class="text-sm text-gray-600">Rating: ${review.rate}</p>
            </div>
          </div>
          <p class="text-sm text-gray-600 mb-4">"${review.comment}"</p>

          <!-- ✅ Conditional Buttons Only for Recent Submitter -->
          <c:if test="${review.name == param.name && review.email == param.email && review.mobile == param.mobile}">
            <div class="flex gap-2">
              <!-- Update -->
              <form action="ReviewUpdate.jsp" method="get">
                <input type="hidden" name="name" value="${review.name}" />
                <input type="hidden" name="email" value="${review.email}" />
                <input type="hidden" name="mobile" value="${review.mobile}" />
                <input type="hidden" name="rating" value="${review.rate}" />
                <input type="hidden" name="comment" value="${review.comment}" />
                <button type="submit" class="bg-blue-500 text-white px-3 py-1 rounded hover:bg-blue-600">Update</button>
              </form>

              <!-- Delete -->
              <form action="ReviewDelete.jsp" method="get">
                <input type="hidden" name="name" value="${review.name}" />
                <input type="hidden" name="email" value="${review.email}" />
                <input type="hidden" name="mobile" value="${review.mobile}" />
                <button type="submit" class="bg-red-500 text-white px-3 py-1 rounded hover:bg-red-600">Delete</button>
              </form>
            </div>
          </c:if>
        </div>
      </c:if>
    </c:forEach>
  </section>

  <%@ include file="./partials/footer.jsp" %>
</body>
</html>
