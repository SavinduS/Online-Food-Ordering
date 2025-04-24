package com.foodordering.model;

public class CartModel {
    private int id;
    private int userId;
    private int foodId;
    private int quantity;
    private String foodName;
    private double price;
    private String imageFilename;

    // Constructors
    public CartModel() {}

    public CartModel(int id, int userId, int foodId, int quantity, String foodName, double price, String imageFilename) {
        this.id = id;
        this.userId = userId;
        this.foodId = foodId;
        this.quantity = quantity;
        this.foodName = foodName;
        this.price = price;
        this.imageFilename = imageFilename;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public int getFoodId() { return foodId; }
    public void setFoodId(int foodId) { this.foodId = foodId; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public String getFoodName() { return foodName; }
    public void setFoodName(String foodName) { this.foodName = foodName; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public String getImageFilename() { return imageFilename; }
    public void setImageFilename(String imageFilename) { this.imageFilename = imageFilename; }
}

