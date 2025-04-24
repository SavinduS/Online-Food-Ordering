package com.foodordering.model;

public class Food {
    private int id;
    private String name;
    private String category;
    private double price;
    private String imageFilename;

    /** Default constructor */
    public Food() {}

    /**
     * Constructor with parameters.
     * 
     * @param id            ID of the food
     * @param name          Name of the food item
     * @param category      Category (e.g., Burgers, Pizzas)
     * @param price         Price of the food
     * @param imageFilename Image file name for displaying the product
     */
    public Food(int id, String name, String category, double price, String imageFilename) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
        this.imageFilename = imageFilename;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }
    public void setCategory(String category) {
        this.category = category;
    }

    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }

    public String getImageFilename() {
        return imageFilename;
    }
    public void setImageFilename(String imageFilename) {
        this.imageFilename = imageFilename;
    }
}


