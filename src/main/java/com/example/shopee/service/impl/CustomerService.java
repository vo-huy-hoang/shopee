package com.example.shopee.service.impl;

import com.example.shopee.dto.*;
import com.example.shopee.model.Product;
import com.example.shopee.repository.ICustomerRepository;
import com.example.shopee.repository.impl.CustomerRepository;
import com.example.shopee.service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<ProductDTO> search(ProductSearchDTO productSearchDTO) {
        return customerRepository.search(productSearchDTO);
    }

    @Override
    public Product findById (int id) {
        return customerRepository.findById(id);
    }

    @Override
    public void create(Product product) {
        customerRepository.create(product);
    }
    @Override
    public void update(Product product) {
        customerRepository.update(product);
    }
    @Override
    public void delete(int id) {
        customerRepository.delete(id);
    }

    @Override
    public void addCart(CartDTO cartDTO) {
        customerRepository.addCart(cartDTO);
    }

    @Override
    public List<CartDTO> list(UserDetail userDetail) {
        return customerRepository.list(userDetail);
    }

    @Override
    public void duplicateProduct(CartDTO cartDTO) {
        customerRepository.duplicateProduct(cartDTO);
    }

    @Override
    public void deleteCart(int productId) {
        customerRepository.deleteCart(productId);
    }

    @Override
    public Boolean existProductIdAndCutomerId(int customerId, int productId) {
        return customerRepository.existProductIdAndCutomerId(customerId, productId);
    }

    @Override
    public void createComment(CartDTO cartDTO) {
        customerRepository.createComment(cartDTO);
    }

    @Override
    public List<CartDTO> listComment(UserDetail userDetail) {
        return customerRepository.listComment(userDetail);
    }
}
