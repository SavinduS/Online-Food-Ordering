<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
    // ✅ Redirect to servlet if reviews list is not present
    if (request.getAttribute("reviews") == null) {
        response.sendRedirect("displayReviews");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Reviews Display</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  <%@ include file="./partials/header.jsp" %>
</head>

<body class="bg-[#fff8f0] font-sans">

<%
  String success = request.getParameter("success");
  if ("true".equals(success)) {
%>
<script>
  alert("✅ Review submitted successfully!");
</script>
<%
  } else if ("updated".equals(success)) {
%>
<script>
  alert("✅ Review updated successfully!");
</script>
<%
  }
%>

<!-- Hero Section -->
<section class="relative text-center py-20 bg-[#fff8f0] overflow-hidden">
  <div class="absolute top-[-120px] left-[-100px] w-[250px] h-[250px] bg-yellow-100 rounded-full mix-blend-multiply filter blur-2xl opacity-40 animate-pulse"></div>
  <div class="absolute top-[-80px] right-[-80px] w-[300px] h-[300px] bg-orange-200 rounded-full mix-blend-multiply filter blur-2xl opacity-30 animate-pulse"></div>

  <div class="relative z-10 px-4">
    <h1 class="text-4xl md:text-5xl font-bold text-[#1e293b]">
      From <span class="bg-yellow-300 px-2 py-1 rounded-md text-[#b45309] font-semibold">Reviews</span> to smiles,
      display customer love!
    </h1>

    <c:if test="${empty param.email or empty param.mobile or param.deleted eq 'true'}">
      <div class="mt-10 flex justify-center gap-4">
        <a href="ReviewCreate.jsp"
           class="bg-orange-500 hover:bg-orange-600 text-white px-6 py-3 rounded-full font-medium transition">
          + Add Review
        </a>
      </div>
    </c:if>
  </div>
</section>

<!-- Reviews Section -->
<section class="bg-white py-16 px-6">
  <div class="max-w-7xl mx-auto text-center mb-10">
    <h2 class="text-3xl font-bold text-gray-800 drop-shadow-md">Recent Feedback</h2>
    <p class="text-gray-500 mt-2">Here’s what customers recently said about QuickBites.</p>
  </div>

  <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
    <c:choose>
      <c:when test="${not empty reviews}">
        <c:forEach var="review" items="${reviews}">
          <div class="bg-white rounded-2xl shadow-lg border-l-4 border-red-800 p-6 hover:shadow-2xl transition duration-300 flex flex-col justify-between">
            <div>
              <div class="flex items-center gap-4 mb-4">
                <div class="bg-yellow-100 p-3 rounded-full shadow-sm">
                  <i class="fas fa-comments text-orange-500 text-xl"></i>
                </div>
                <div class="text-left">
                  <h4 class="text-lg font-semibold text-gray-800">${review.name}</h4>
                  <p class="text-sm text-gray-400 italic">said:</p>
                </div>
              </div>
              <p class="text-gray-600 text-sm leading-relaxed italic">"${review.comment}"</p>
            </div>

            <!-- Show Edit/Delete if current review matches email/mobile -->
            <c:if test="${not empty param.email and not empty param.mobile
                          and fn:toLowerCase(fn:trim(review.email)) eq fn:toLowerCase(fn:trim(param.email))
                          and fn:trim(review.mobile) eq fn:trim(param.mobile)}">
              <div class="flex justify-end gap-4 mt-6">
                <form action="ReviewUpdate.jsp" method="get">
                  <input type="hidden" name="email" value="${review.email}" />
                  <input type="hidden" name="mobile" value="${review.mobile}" />
                  <input type="hidden" name="rating" value="${review.rate}" />
                  <input type="hidden" name="comment" value="${review.comment}" />
                  <button type="submit" class="text-blue-600 hover:underline">Edit</button>
                </form>

                <form action="ReviewDeleteServlet" method="post"
                      onsubmit="return confirm('Are you sure you want to delete this review?');">
                  <input type="hidden" name="email" value="${review.email}" />
                  <input type="hidden" name="mobile" value="${review.mobile}" />
                  <button type="submit" class="text-red-600 hover:underline">Delete</button>
                </form>
              </div>
            </c:if>
          </div>
        </c:forEach>
      </c:when>
      <c:otherwise>
        <p class="col-span-3 text-gray-500 text-center">No reviews available at the moment.</p>
      </c:otherwise>
    </c:choose>
  </div>
</section>

<%@ include file="./partials/footer.jsp" %>
</body>
</html>
