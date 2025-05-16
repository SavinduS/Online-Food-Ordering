CREATE DATABASE IF NOT EXISTS onlinefoodordering;
USE onlinefoodordering;

-- Table: customer
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `rating` varchar(45) DEFAULT NULL,
  `comment` varchar(990) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
INSERT INTO `customer` VALUES 
(1,'Kamal Perera','main@gmail.com','0711234567','5','Excellent service and delicious food! Will definitely order again.'),
(2,'Nadeesha Silva','a@gmail.com','0772345678','4','The delivery was on time and the packaging was very neat. Highly recommend!'),
(3,'Sandun Kumara','b@gmail.com','0753456789','5','Food quality was top-notch, and the customer service was very friendly.'),
(4,'Bimsara Jayasuriya','c@gmail.com','0724567890','4','Tastes amazing! One of the best food ordering experiences I\'ve had.'),
(5,'Nirasha Fernando','d@gmail.com','0765678901','5','Great value for money. Portions were generous and flavors were authentic.'),
(6,'Thilina Wickramasinghe','e@gmail.com','0786789012','5','Impressed with the speed and taste. Keep up the good work!');

-- Table: food
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `category` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image_filename` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);
INSERT INTO `food` VALUES 
(1,'Cheese Burger','Burgers',2300.00,'cheeseB.jpg','2025-04-23 19:28:36'),
(2,'Chicken Burger','Burgers',1800.00,'chickenB.jpg','2025-04-23 19:28:36'),
(3,'Beef Burger','Burgers',2000.00,'beefB.jpg','2025-04-23 19:28:36'),
(4,'Veggie Burger','Burgers',1500.00,'vagieB.jpg','2025-04-23 19:28:36'),
(5,'Margherita Pizza','Pizzas',3500.00,'MargheritaP.jpg','2025-04-23 19:28:36'),
(6,'Pepperoni Pizza','Pizzas',3200.00,'PepperoniP.jpg','2025-04-23 19:28:36'),
(7,'BBQ Chicken Pizza','Pizzas',3450.00,'BBQChickenP.jpg','2025-04-23 19:28:36'),
(8,'Veggie Pizza','Pizzas',2900.00,'VeggieP.jpg','2025-04-23 19:28:36'),
(9,'Chocolate Cake','Desserts',600.00,'ChocolateCake.jpg','2025-04-23 19:28:36'),
(10,'Ice Cream','Desserts',400.00,'IceCream.jpg','2025-04-23 19:28:36'),
(11,'Donut','Desserts',350.00,'Donut.jpg','2025-04-23 19:28:36'),
(12,'Cheesecake','Desserts',1300.00,'Cheesecake.jpg','2025-04-23 19:28:36'),
(13,'Coffee','Beverages',700.00,'coffee.jpg','2025-04-23 19:28:36'),
(14,'Tea','Beverages',150.00,'tea.jpg','2025-04-23 19:28:36'),
(15,'Orange Juice','Beverages',300.00,'orangejuice.jpg','2025-04-23 19:28:36'),
(16,'Milkshake','Beverages',650.00,'milshake.jpg','2025-04-23 19:28:36');

-- Table: employee
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `empID` int NOT NULL AUTO_INCREMENT,
  `NIC` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone_num` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `password_confirm` varchar(45) NOT NULL,
  `position` varchar(45) NOT NULL,
  PRIMARY KEY (`empID`),
  UNIQUE KEY `NIC_UNIQUE` (`NIC`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_num_UNIQUE` (`phone_num`)
);
INSERT INTO `employee` VALUES 
(1,'12345678909876','manager m','testmanager@gmail.com','0704583306','123456','123456','Manager'),
(3,'987654345678','staff s','teststaff@gmail.com','0987654321','123456','123456','Staff'),
(4,'654567890989','delivery d','testdelivery@gmail.com','0876789876','123456','123456','Delivery_Person');

-- Table: customerregistration
DROP TABLE IF EXISTS `customerregistration`;
CREATE TABLE `customerregistration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `confirmpassword` varchar(45) NOT NULL,
  `phonenumber` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
);

-- Table: cart
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) NOT NULL,
  `food_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`)
);

-- Table: delivery
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- Table: orders
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `delivery_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `food_name` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `image_filename` varchar(255) DEFAULT NULL,
  `status` varchar(50) DEFAULT 'Processing',
  PRIMARY KEY (`id`)
);

-- Table: payment
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cardholder_name` varchar(100) NOT NULL,
  `card_number` varchar(20) NOT NULL,
  `expiry_date` varchar(10) NOT NULL,
  `cvv` varchar(3) NOT NULL,
  PRIMARY KEY (`id`)
);
