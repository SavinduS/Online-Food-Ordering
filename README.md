# 🍽️ Online Food Ordering System

A full-stack web application built as a university project to simulate a real-world food ordering platform. The system supports customer-side features such as menu browsing, cart management, feedback, and payments, as well as admin-side modules for employee and order management.

---

## 📘 Introduction

This project aims to streamline the online food ordering experience through a responsive, session-managed interface. It includes features like cart handling, customer feedback, admin-managed delivery tracking, and invoice generation. The backend is built with Java and Servlets using the MVC architecture, and data is stored in a MySQL database.

---

## 🧩 Key Features

### 👨‍🍳 Customer Side:
- 🛒 Add to cart with session tracking  
- 📦 Place orders and view order history  
- 💬 Submit reviews and feedback  
- 💳 Enter delivery and payment details  
- 📄 Download invoice after successful payment  
- 🙋 View and update user profile  

### 🛠 Admin / Manager Side:
- 👥 Add, update, and delete employees  
- 🚚 View and update order delivery status  
- 📑 Access and manage customer feedback  
- 🔐 Secure role-based session access (Admin, Manager, Customer)

---

## 🛠️ Technology Stack

- **Frontend:** HTML, CSS (Tailwind CSS), JavaScript  
- **Backend:** Java, JSP, Servlets  
- **Database:** MySQL (via MySQL Workbench)  
- **IDE:** Eclipse  
- **Server:** Apache Tomcat 9  
- **Architecture:** MVC (Model-View-Controller)

---

## 💡 Design Patterns & OOP Principles

- **DAO (Data Access Object):** For separating business logic from data access  
- **Factory Method:** Used in `DBConnect.java` for centralized connection logic    
- **OOP Concepts Applied:** Encapsulation, Modularity, Abstraction, and Separation of Concerns

---

## 🔧 Installation Steps

To set up the project locally:

### 1. Clone the Repository

```bash
git clone https://github.com/SavinduS/online-food-ordering-system.git
cd online-food-ordering-system
```

### 2. Open in Eclipse
Open Eclipse

Go to File > Import > Existing Projects into Workspace

Select the cloned project folder

Click Finish

### 3. Configure Apache Tomcat
Add Tomcat v9 to your Eclipse server runtime

Right-click the project → Run on Server

---
## 🗃️ Database Setup
Open MySQL Workbench or preferred SQL tool

Run the file: onlinefoodordering.sql

### This will:

Create the onlinefoodordering database

Create all required tables

Insert sample data (e.g., food items, employees, reviews)

---

## 🧪 Example Use Cases

Customer adds food to cart → places an order → completes payment → downloads invoice

Admin logs in → updates delivery status → views customer reviews

New employee added by manager via secure admin panel

## 👨‍💻 Contributors

- Savindu Weerarathna - https://www.linkedin.com/in/savindu-weerarathna-65019a336/ – Team Lead
- Wishwa Dilshan - https://www.linkedin.com/in/wishwa-dilshan-87a055336/
- Supun Anjana - https://www.linkedin.com/in/supun-anjana-bb26342a0/
- Wathsika Wasura - https://www.linkedin.com/in/wathsika-wasura-266242344/
