<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QuickBites - Online Food Ordering</title>
    <link rel="stylesheet" href="css\home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/alpinejs/3.13.2/cdn.min.js" defer></script>
</head>
<body>

    <!-- Header / Navigation Bar -->
    <header>
        <div class="container">
            <div class="logo">
                <a href="#"><i class="fas fa-utensils"></i> QuickBites</a>
            </div>

            <nav>
                <ul class="nav-links">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Reviews</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#menu" class="order-btn">Order Now</a></li>
                </ul>
            </nav>

            <div class="nav-icons">
                <div class="search-box">
                    <input type="text" placeholder="Search food...">
                    <button><i class="fas fa-search"></i></button>
                </div>
                <a href="#" class="cart"><i class="fas fa-shopping-cart"></i><span class="cart-badge">3</span></a>
                <a href="#" class="user"><i class="fas fa-user"></i></a>
            </div>

            <div class="menu-toggle">
                <i class="fas fa-bars"></i>
            </div>
        </div>
    </header>

    <script>
        // Mobile Menu Toggle
        const menuToggle = document.querySelector(".menu-toggle");
        const navLinks = document.querySelector(".nav-links");

        menuToggle.addEventListener("click", () => {
            navLinks.classList.toggle("active");
        });
    </script>


