<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./partials/header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>About Us - QuickBites</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="font-sans text-gray-800">

<!-- Hero Section with Curve -->
<section class="relative bg-gradient-to-r from-[#d72323] via-[#f97316] to-[#f59e0b] text-white py-24 overflow-hidden">
  <div class="max-w-7xl mx-auto px-6 md:px-10 flex flex-col items-center justify-center text-center space-y-6">
    <h1 class="text-5xl font-extrabold leading-tight tracking-tight">
      We’re passionate about our food
    </h1>
   	<p class="max-w-2xl text-base md:text-lg text-orange-100 font-bold leading-relaxed">
	  Our journey begins with selecting the finest ingredients, ensuring freshness and quality in every bite.s
	  Great food isn’t just a meal — it’s an experience filled with passion, care, and flavor.
	</p>
   	
    <a href="home" class="mt-4 inline-block bg-white text-[#d72323] px-8 py-3 rounded-full font-semibold shadow hover:bg-orange-100 hover:text-[#b91c1c] transition duration-300">
      Explore Our Menu<br>
    </a><br><br><br><br><br>
  </div>

  <!-- Improved Custom Curve SVG -->
  <svg class="absolute bottom-0 left-0 w-full" viewBox="0 0 1440 230" xmlns="http://www.w3.org/2000/svg">
    <path fill="#ffffff" fill-opacity="1" d="M0,128L60,138.7C120,149,240,171,360,160C480,149,600,107,720,90.7C840,75,960,85,1080,112C1200,139,1320,181,1380,202.7L1440,224L1440,320L1380,320C1320,320,1200,320,1080,320C960,320,840,320,720,320C600,320,480,320,360,320C240,320,120,320,60,320L0,320Z"></path>
  </svg>
</section>

<!-- Why Choose Us -->
<section class="py-20 bg-white">
  <div class="max-w-7xl mx-auto px-4 text-center">
    <h2 class="text-3xl font-bold text-[#b91c1c] mb-12">Why Choose Us</h2>
    <div class="grid gap-10 md:grid-cols-3">
      <div class="group bg-gray-50 rounded-xl p-6 shadow hover:shadow-lg hover:border-t-4 hover:border-[#b91c1c] transition-all duration-300 ease-in-out">
        <div class="text-[#b91c1c] text-4xl mb-4 group-hover:scale-110 transition-transform duration-300 ease-in-out"><i class="fas fa-award"></i></div>
        <h3 class="text-xl font-semibold mb-2">14+ Years Experience</h3>
        <p class="text-gray-600">Providing quality service since 2009 with consistency and passion.</p>
      </div>
      <div class="group bg-gray-50 rounded-xl p-6 shadow hover:shadow-lg hover:border-t-4 hover:border-[#b91c1c] transition-all duration-300 ease-in-out">
        <div class="text-yellow-400 text-4xl mb-4 group-hover:scale-110 transition-transform duration-300 ease-in-out"><i class="fas fa-star"></i></div>
        <h3 class="text-xl font-semibold mb-2">100+ User Ratings</h3>
        <p class="text-gray-600">Highly recommended and rated by happy customers across Sri Lanka.</p>
      </div>
      <div class="group bg-gray-50 rounded-xl p-6 shadow hover:shadow-lg hover:border-t-4 hover:border-[#b91c1c] transition-all duration-300 ease-in-out">
        <div class="text-red-500 text-4xl mb-4 group-hover:scale-110 transition-transform duration-300 ease-in-out"><i class="fas fa-map-marker-alt"></i></div>
        <h3 class="text-xl font-semibold mb-2">7+ Branches</h3>
        <p class="text-gray-600">We’ve expanded island-wide to deliver quick, tasty meals to everyone.</p>
      </div>
    </div>
  </div>
</section>

<!-- Mission & Vision Section -->
<section class="relative bg-gray-100 py-20">
  <div class="max-w-7xl mx-auto px-6 grid md:grid-cols-2 gap-12 items-center relative z-10">
    
    <!-- Image Column -->
    <div class="flex justify-center">
      <img src="images/ABOUTUS.jpg" alt="History" 
           class="rounded-xl shadow-xl max-h-[500px] w-full object-cover md:w-[90%] hover:scale-105 transition-transform duration-300" />
    </div>

    <!-- Text Column -->
    <div class="flex flex-col justify-center space-y-6">
      <div class="bg-white p-6 rounded-xl shadow-md border-l-4 border-[#d72323] hover:shadow-lg hover:translate-y-1 transition-all duration-300">
        <h3 class="text-2xl font-bold text-[#b91c1c] mb-2">Our Mission</h3>
        <p class="text-gray-700 leading-relaxed">
          To deliver flavorful, hygienic meals made with love — bringing satisfaction to every customer, every time.
          We're here to build a strong food culture rooted in care and consistency.
        </p>
      </div>
      <div class="bg-white p-6 rounded-xl shadow-md border-l-4 border-[#d72323] hover:shadow-lg hover:translate-y-1 transition-all duration-300">
        <h3 class="text-2xl font-bold text-[#b91c1c] mb-2">Our Vision</h3>
        <p class="text-gray-700 leading-relaxed">
          To become the most trusted name in quick-service dining in Sri Lanka — where quality, value, and taste meet.
        </p>
      </div>
    </div>
  </div>
</section>


<!-- History Section -->
<section class="bg-white py-20 px-6">
  <div class="max-w-6xl mx-auto grid md:grid-cols-2 gap-12">
    <div class="bg-[#fef2f2] p-6 rounded-xl shadow-md hover:shadow-xl hover:scale-[1.02] transition-transform duration-300 ease-in-out">
      <h3 class="text-xl font-bold text-[#b91c1c] mb-2">Our Origins</h3>
      <p class="text-gray-700 leading-relaxed">
        Founded in 2009 in Colombo 7, we started as a single kitchen with a big dream — delivering fast food without compromising quality.
        Today, that same dream continues to grow.
      </p>
    </div>
    <div class="bg-[#fef2f2] p-6 rounded-xl shadow-md hover:shadow-xl hover:scale-[1.02] transition-transform duration-300 ease-in-out">
      <h3 class="text-xl font-bold text-[#b91c1c] mb-2">Our Story</h3>
      <p class="text-gray-700 leading-relaxed">
        With 14+ years in the food industry, QuickBites has become a household name. Each milestone reflects our commitment to delivering food that connects hearts.
      </p>
    </div>
  </div>
</section>

<%@ include file="./partials/footer.jsp" %>
</body>
</html>
