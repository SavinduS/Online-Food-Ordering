package com.foodordering.model;

public class CartModel {
    private int id;
    private String userEmail;
    private int foodId;
    private int quantity;
    private String foodName;
    private double price;
    private String imageFilename;

    //New fields for order display
    private int deliveryId;
    private String status;

    public CartModel() {}

    public CartModel(int id, String userEmail, int foodId, int quantity, String foodName, double price, String imageFilename) {
        this.id = id;
        this.userEmail = userEmail;
        this.foodId = foodId;
        this.quantity = quantity;
        this.foodName = foodName;
        this.price = price;
        this.imageFilename = imageFilename;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUserEmail() { return userEmail; }
    public void setUserEmail(String userEmail) { this.userEmail = userEmail; }

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

    //New Fields: Delivery ID and Order Status
    public int getDeliveryId() { return deliveryId; }
    public void setDeliveryId(int deliveryId) { this.deliveryId = deliveryId; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
