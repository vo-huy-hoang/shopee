package com.example.shopee.dto;

public class CartDTO {
    private int id;
    private String name;
    private int price;
    private String quantity;
    private int productId;
    private int customerId;
    private String content;

    public CartDTO() {
    }

    public CartDTO(int id, String name, int price, String quantity, int productId, int customerId) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.quantity = quantity;
        this.productId = productId;
        this.customerId = customerId;
    }

    public CartDTO(int customerId, int productId, String quantity) {
        this.quantity = quantity;
        this.productId = productId;
        this.customerId = customerId;
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

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
