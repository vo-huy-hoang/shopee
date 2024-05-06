package com.example.shopee.model;

public class Product {
    private int id;
    private String name;
    private int price;
    private String quantity;

    public Product() {
    }

    public Product(String name, int price, String quantity) {
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

    public Product(int id, String name, int price, String quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
    }

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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }
}
