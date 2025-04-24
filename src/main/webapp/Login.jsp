<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - Quickbites</title>
    <script src="https://cdn.tailwindcss.com"></script>
  </head>

  <body class="min-h-screen flex bg-black text-white">
    <!-- Left: Login Form -->
    <div class="w-1/2 bg-black flex flex-col justify-center items-center p-10">
      <h1 class="text-4xl font-bold mb-4">Welcome Back</h1>
      <p class="mb-6 text-white/70">Login to explore delicious content 🍔</p>

      <!-- 👇 Connected to LoginServlet -->
      <form action="LoginServlet" method="post" class="w-full max-w-sm space-y-4">
        <input
          type="text"
          name="email"
          placeholder="Email"
          required
          class="w-full px-4 py-2 rounded bg-white text-black focus:outline-none focus:ring-2 focus:ring-red-600"
        />
        <input
          type="password"
          name="password"
          placeholder="Password"
          required
          class="w-full px-4 py-2 rounded bg-white text-black focus:outline-none focus:ring-2 focus:ring-red-600"
        />
        
        <div class="flex items-center justify-between text-sm text-white/80">
          <label>
            <input type="checkbox" class="mr-2" />
            Remember me
          </label>
          <a href="#" class="underline">Forgot password?</a>
        </div>

        <button
          type="submit"
          class="w-full bg-red-700 text-white py-2 rounded hover:bg-white hover:text-red-700 transition"
        >
          Login
        </button>

        <!-- 🔺 Error Message if login fails -->
        <%
          String error = (String) request.getAttribute("error");
          if (error != null) {
        %>
          <p class="text-red-500 text-sm text-center"><%= error %></p>
        <%
          }
        %>
      </form>

      <p class="mt-4 text-sm text-white/60">
        Don't have an account?
        <a href="CoustomerRegistration.jsp" class="text-red-500 underline hover:text-red-400">Sign up</a>
      </p>
    </div>

    <!-- Right: Background Image -->
    <div class="w-1/2 relative">
      <img
        src="asserts/burgerlogin.jpg"
        alt="Burger"
        class="w-full h-full object-cover"
      />
      <div class="absolute inset-0 bg-black/40"></div> <!-- Dark overlay -->
    </div>
  </body>
</html>
