package com.example.shopee.repository;

import com.example.shopee.dto.ProductDTO;
import com.example.shopee.dto.ProductSearchDTO;
import com.example.shopee.dto.CartDTO;
import com.example.shopee.dto.UserDetail;
import com.example.shopee.model.Product;

import java.util.List;

public interface ICustomerRepository {
    List<ProductDTO> search (ProductSearchDTO productSearchDTO);

    Product findById(int id);
    void create(Product product);

    void update(Product product);

    void delete(int id);

    void addCart(CartDTO cartDTO);

//    CartDTO findByIdCart(int id);

    List<CartDTO> list(UserDetail userDetail);

    void duplicateProduct(CartDTO cartDTO);

    void deleteCart(int productId);

    Boolean existProductIdAndCutomerId(int customerId, int productId);

    void createComment(CartDTO cartDTO);

    List<CartDTO> listComment(UserDetail userDetail);
}
