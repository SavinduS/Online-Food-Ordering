<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="./partials/header.jsp" %>
    
<section class="hero">
    <div class="slider">
        <!-- Slide 1 -->
        <div class="slide active">
            <div class="hero-content">
                <h1>Delicious Burgers, Freshly Made!</h1>
                <p>Order your favorite burger and get it delivered hot & fresh.</p>
                <a href="#menu" class="order-now-btn">Order Now</a>
            </div>
        </div>

        <!-- Slide 2 -->
        <div class="slide">
            <div class="hero-content">
                <h1>Craving for Pizza?</h1>
                <p>Enjoy cheesy, mouth-watering pizzas delivered in no time.</p>
                <a href="#menu" class="order-now-btn">Order Now</a>
            </div>
        </div>

        <!-- Slide 3 -->
        <div class="slide">
            <div class="hero-content">
                <h1>Freshly Cooked Pasta, Just for You!</h1>
                <p>Indulge in creamy, flavorful pasta dishes from QuickBites.</p>
                <a href="#menu" class="order-now-btn">Order Now</a>
            </div>
        </div>
    </div>

    <!-- Controls -->
    <div class="slider-controls">
        <button onclick="prevSlide()"><i class="fas fa-chevron-left"></i></button>
        <button onclick="nextSlide()"><i class="fas fa-chevron-right"></i></button>
    </div>
</section>

<!-- Featured Categories Section -->
<section class="featured-categories">
    <h2>Explore Our Categories</h2>
    <div class="categories-container">
        <!-- Burgers -->
        <div class="category">
            <img src="images\burger.jpg" alt="Burgers">
            <div class="category-info">
                <i class="fas fa-hamburger"></i>
                <h3>Burgers</h3>
            </div>
        </div>

        <!-- Pizzas -->
        <div class="category">
            <img src="images\pizza.jpg" alt="Pizzas">
            <div class="category-info">
                <i class="fas fa-pizza-slice"></i>
                <h3>Pizzas</h3>
            </div>
        </div>

        <!-- Desserts -->
        <div class="category">
            <img src="images\deserts.jpg" alt="Desserts">
            <div class="category-info">
                <i class="fas fa-ice-cream"></i>
                <h3>Desserts</h3>
            </div>
        </div>

        <!-- Beverages -->
        <div class="category">
            <img src="images\beverages.jpg" alt="Beverages">
            <div class="category-info">
                <i class="fas fa-mug-hot"></i>
                <h3>Beverages</h3>
            </div>
        </div>
    </div>
</section>


<!-- Products Section -->
<section class="products" id="menu">
    <h2>Our Delicious Products</h2>

    <!-- Burgers -->
    <div class="product-category">
        <h3><i class="fas fa-hamburger"></i> Burgers</h3>
        <div class="product-container">
            <div class="product">
                <img src="images\cheeseB.jpg" alt="Burger">
                <h4>Cheese Burger</h4>
                <p>$5.99</p>
                <button class="add-to-cart" onclick="addToCart('Cheese Burger', 5.99)">Add to Cart</button>
            </div>

            <div class="product">
                <img src="images\chickenB.jpg" alt="Burger">
                <h4>Chicken Burger</h4>
                <p>$6.49</p>
                <button class="add-to-cart" onclick="addToCart('Chicken Burger', 6.49)">Add to Cart</button>
            </div>

            <div class="product">
                <img src="images\beefB.jpg" alt="Burger">
                <h4>Beef Burger</h4>
                <p>$7.29</p>
                <button class="add-to-cart" onclick="addToCart('Beef Burger', 7.29)">Add to Cart</button>
            </div>

            <div class="product">
                <img src="images\vagieB.jpg" alt="Burger">
                <h4>Veggie Burger</h4>
                <p>$5.49</p>
                <button class="add-to-cart" onclick="addToCart('Veggie Burger', 5.49)">Add to Cart</button>
            </div>
        </div>
    </div>

    <!-- Pizzas -->
    <div class="product-category">
        <h3><i class="fas fa-pizza-slice"></i> Pizzas</h3>
        <div class="product-container">
            <div class="product">
                <img src="images\MargheritaP.jpg" alt="Pizza">
                <h4>Margherita Pizza</h4>
                <p>$8.99</p>
                <button class="add-to-cart" onclick="addToCart('Margherita Pizza', 8.99)">Add to Cart</button>
            </div>

            <div class="product">
                <img src="images\PepperoniP.jpg" alt="Pizza">
                <h4>Pepperoni Pizza</h4>
                <p>$9.49</p>
                <button class="add-to-cart" onclick="addToCart('Pepperoni Pizza', 9.49)">Add to Cart</button>
            </div>

            <div class="product">
                <img src="images\BBQChickenP.jpg" alt="Pizza">
                <h4>BBQ Chicken Pizza</h4>
                <p>$10.99</p>
                <button class="add-to-cart" onclick="addToCart('BBQ Chicken Pizza', 10.99)">Add to Cart</button>
            </div>

            <div class="product">
                <img src="images\VeggieP.jpg" alt="Pizza">
                <h4>Veggie Pizza</h4>
                <p>$8.49</p>
                <button class="add-to-cart" onclick="addToCart('Veggie Pizza', 8.49)">Add to Cart</button>
            </div>
        </div>
    </div>

             <!-- Desserts -->
    <div class="product-category">
        <h3><i class="fas fa-ice-cream"></i> Desserts</h3>
        <div class="product-container">
            <div class="product">
                <img src="images\ChocolateCake.jpg" alt="Chocolate Cake">
                <h4>Chocolate Cake</h4>
                <p>$4.99</p>
                <button class="add-to-cart" onclick="addToCart('Chocolate Cake', 4.99)">Add to Cart</button>
            </div>

            <div class="product">
                <img src="images\IceCream.jpg" alt="Ice Cream">
                <h4>Ice Cream</h4>
                <p>$3.49</p>
                <button class="add-to-cart" onclick="addToCart('Ice Cream', 3.49)">Add to Cart</button>
            </div>

            <div class="product">
                <img src="images\Donut.jpg" alt="Donut">
                <h4>Donut</h4>
                <p>$2.99</p>
                <button class="add-to-cart" onclick="addToCart('Donut', 2.99)">Add to Cart</button>
            </div>

            <div class="product">
                <img src="images\Cheesecake.jpg" alt="Donut">
                <h4>Cheesecake</h4>
                <p>$5.99</p>
                <button class="add-to-cart" onclick="addToCart('Cheesecake', 5.99)">Add to Cart</button>
            </div> 
        </div>
    </div>

     <!-- Beverages -->
     <div class="product-category">
        <h3><i class="fas fa-mug-hot"></i> Beverages</h3>
        <div class="product-container">
            <div class="product">
                <img src="images\coffee.jpg" alt="Coffee">
                <h4>Coffee</h4>
                <p>$2.99</p>
                <button class="add-to-cart" onclick="addToCart('Coffee', 2.99)">Add to Cart</button>
            </div>

            <div class="product">
                <img src="images\tea.jpg" alt="Tea">
                <h4>Tea</h4>
                <p>$2.49</p>
                <button class="add-to-cart" onclick="addToCart('Tea', 2.49)">Add to Cart</button>
            </div>

            <div class="product">
                <img src="images\orangejuice.jpg" alt="Orange Juice">
                <h4>Orange Juice</h4>
                <p>$3.99</p>
                <button class="add-to-cart" onclick="addToCart('Orange Juice', 3.99)">Add to Cart</button>
            </div>

            <div class="product">
                <img src="images\milshake.jpg" alt="Milkshake">
                <h4>Milkshake</h4>
                <p>$4.49</p>
                <button class="add-to-cart" onclick="addToCart('Milkshake', 4.49)">Add to Cart</button>
            </div>
        </div>
    </div>
</section>

<script src="js\home.js"></script>

<!-- How It Works Section -->
<section class="how-it-works">
    <h2>How It Works</h2>
    <div class="steps-container">
        <!-- Step 1: Choose Your Meal -->
        <div class="step">
            <i class="fas fa-utensils"></i>
            <h3>Choose Your Meal</h3>
            <p>Browse our menu and select your favorite items.</p>
        </div>

        <!-- Step 2: Add to Cart -->
        <div class="step">
            <i class="fas fa-shopping-cart"></i>
            <h3>Add to Cart</h3>
            <p>Pick your meals and add them to the cart.</p>
        </div>

        <!-- Step 3: Checkout & Pay -->
        <div class="step">
            <i class="fas fa-credit-card"></i>
            <h3>Checkout & Pay</h3>
            <p>Pay securely with various payment options.</p>
        </div>

        <!-- Step 4: Get It Delivered -->
        <div class="step">
            <i class="fas fa-motorcycle"></i>
            <h3>Get It Delivered</h3>
            <p>Enjoy fast and fresh home delivery.</p>
        </div>
    </div>
</section>

<!-- Special Offers & Discounts Section -->
<section class="special-offers">
    <div class="offers-content">
        <!-- Left Side: Image -->
        <div class="offers-image">
            <img src="images\offer.jpg" alt="Special Offers">
        </div>

        <!-- Right Side: Offers -->
        <div class="offers-details">
            <h2><i class="fas fa-tags"></i> Special Offers & Discounts</h2>
            <div class="offers-container">
                
                <!-- Offer 1 -->
                <div class="offer">
                    <i class="fas fa-percentage"></i>
                    <h3>Get 20% Off Your First Order</h3>
                    <p>Use code <strong>WELCOME20</strong> at checkout.</p>
                </div>

                <!-- Offer 2 -->
                <div class="offer">
                    <i class="fas fa-gift"></i>
                    <h3>Buy 1 Get 1 Free</h3>
                    <p>On all medium-sized pizzas this weekend only.</p>
                </div>

                <!-- Offer 3 -->
                <div class="offer">
                    <i class="fas fa-ice-cream"></i>
                    <h3>Save 15% on Desserts</h3>
                    <p>Use code <strong>SWEET15</strong> on any dessert order.</p>
                </div>

                <!-- Offer 4 -->
                <div class="offer">
                    <i class="fas fa-shipping-fast"></i>
                    <h3>Free Delivery for Orders Over $30</h3>
                    <p>No delivery charges when you spend $30 or more.</p>
                </div>

            </div>
        </div>
    </div>
</section>

<!-- Call-to-Action Section -->
<section class="cta-section">
    <div class="cta-content">
        
        <!-- Left Side: Download Our App -->
        <div class="cta-app">
            <h2><i class="fas fa-mobile-alt"></i> Download Our App</h2>
            <p>Order your favorite meals faster with our mobile app.</p>
            <div class="app-buttons">
                <a href="#" class="app-store"><i class="fab fa-apple"></i> App Store</a>
                <a href="#" class="google-play"><i class="fab fa-google-play"></i> Google Play</a>
            </div>
        </div>

        <!-- Right Side: Subscribe to Newsletter -->
        <div class="cta-newsletter">
            <h2><i class="fas fa-envelope"></i> Subscribe for Exclusive Offers</h2>
            <p>Get special discounts and updates directly in your inbox.</p>
            <form class="newsletter-form">
                <input type="email" placeholder="Enter your email" required>
                <button type="submit">Subscribe</button>
            </form>
        </div>

    </div>
</section>

<%@ include file="./partials/footer.jsp" %>

</body>
</html>
    