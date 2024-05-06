package com.example.shopee.repository.impl;

import com.example.shopee.dto.ProductDTO;
import com.example.shopee.dto.ProductSearchDTO;
import com.example.shopee.dto.CartDTO;
import com.example.shopee.dto.UserDetail;
import com.example.shopee.model.Product;
import com.example.shopee.repository.ICustomerRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    @Override
    public List<ProductDTO> search(ProductSearchDTO productSearchDTO) {
        List<ProductDTO> productList = new ArrayList<>();
        try {
            StringBuilder stringBuilder = new StringBuilder("select id, name, price from product");
            // tìm kiếm theo tên
            stringBuilder.append(" where name like concat('%', ?)");

            // tìm kiếm theo giá
            if ("d10".equals(productSearchDTO.getPrice())) {
                stringBuilder.append(" and (price < 10000000)");
            } else if ("10-20".equals(productSearchDTO.getPrice())) {
                stringBuilder.append(" and (price >= 10000000 and price < 20000000)");
            } else if ("20-30".equals(productSearchDTO.getPrice())) {
                stringBuilder.append(" and (price >= 20000000 and price < 30000000)");
            } else if ("t30".equals(productSearchDTO.getPrice())) {
                stringBuilder.append(" and (price >= 30000000)");
            }
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(
                    stringBuilder.toString()
            );
            preparedStatement.setString(1, productSearchDTO.getName());
            ResultSet resultSet = preparedStatement.executeQuery();
            ProductDTO productDTO;
            while (resultSet.next()) {
                productDTO = new ProductDTO();
                productDTO.setId(resultSet.getInt("id"));
                productDTO.setName(resultSet.getString("name"));
                productDTO.setPrice(resultSet.getInt("price"));

                productList.add(productDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public Product findById(int id) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(
                    "select id, name, price, quantity from product where id = ?"
            );
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            Product product;
            while (resultSet.next()) {
                product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setName(resultSet.getString("name"));
                product.setPrice(resultSet.getInt("price"));
                product.setQuantity(resultSet.getString("quantity"));

                return product;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public void create(Product product) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(
                    "insert into product(name, price, quantity) values (?, ?, ?)"
            );
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getPrice());
            preparedStatement.setString(3, product.getQuantity());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(Product product) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(
                    "update product set name = ?, price = ?, quantity = ? where id = ?"
            );
            preparedStatement.setString(1, product.getName());
            preparedStatement.setInt(2, product.getPrice());
            preparedStatement.setString(3, product.getQuantity());
            preparedStatement.setInt(4, product.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(
                    "delete from product where id = ?"
            );

            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void addCart(CartDTO cartDTO) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(
                    "insert into customer_product (customer_id, product_id, quantity) values (?, ?, ?);"
            );
            preparedStatement.setInt(1, cartDTO.getCustomerId());
            preparedStatement.setInt(2, cartDTO.getProductId());
            preparedStatement.setString(3, cartDTO.getQuantity());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<CartDTO> list(UserDetail userDetail) {
        List<CartDTO> cartDTOList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(
                    "select cp.product_id, cp.customer_id, p.name, p.price, cp.quantity from customer_product as cp\n" +
                            "    left join customer c on c.id = cp.customer_id\n" +
                            "    left join product p on cp.product_id = p.id\n" +
                            "    left join user u on c.id = u.id\n" +
                            "    where u.username = ?"
            );

            preparedStatement.setString(1, userDetail.getUsername());
            ResultSet resultSet = preparedStatement.executeQuery();
            CartDTO cartDTO;
            while (resultSet.next()) {
                cartDTO = new CartDTO();
                cartDTO.setProductId(Integer.parseInt(resultSet.getString("product_id")));
                cartDTO.setCustomerId(Integer.parseInt(resultSet.getString("customer_id")));
                cartDTO.setName(resultSet.getString("name"));
                cartDTO.setPrice(resultSet.getInt("price"));
                cartDTO.setQuantity(resultSet.getString("quantity"));

                cartDTOList.add(cartDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartDTOList;
    }
    @Override
    public Boolean existProductIdAndCutomerId(int customerId, int productId) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(
                    "select product_id from customer_product where customer_id = ? and product_id = ?"
            );
            preparedStatement.setInt(1, customerId);
            preparedStatement.setInt(2, productId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public void duplicateProduct(CartDTO cartDTO) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(
                    "update customer_product set quantity = quantity + ? where product_id = ? and customer_id = ?"
            );
            preparedStatement.setString(1, cartDTO.getQuantity());
            preparedStatement.setInt(2, cartDTO.getProductId());
            preparedStatement.setInt(3, cartDTO.getCustomerId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteCart(int productId) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(
                    "delete from customer_product where product_id = ?"
            );

            preparedStatement.setInt(1, productId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void createComment(CartDTO cartDTO) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(
                    "insert into comment(customer_id, product_id, content) values (?, ?, ?)"
            );
            preparedStatement.setInt(1, cartDTO.getCustomerId());
            preparedStatement.setInt(2, cartDTO.getProductId());
            preparedStatement.setString(3, cartDTO.getContent());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<CartDTO> listComment(UserDetail userDetail) {
        List<CartDTO> cartDTOList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(
                    "select cm.product_id, cm.customer_id, cm.content from comment as cm\n" +
                            "left join customer c on c.id = cm.customer_id\n" +
                            "left join product p on cm.product_id = p.id\n" +
                            "left join user u on c.id = u.id\n" +
                            "where u.username = ?"
            );

            preparedStatement.setString(1, userDetail.getUsername());
            ResultSet resultSet = preparedStatement.executeQuery();
            CartDTO cartDTO;
            while (resultSet.next()) {
                cartDTO = new CartDTO();
                cartDTO.setProductId(Integer.parseInt(resultSet.getString("product_id")));
                cartDTO.setCustomerId(Integer.parseInt(resultSet.getString("customer_id")));
                cartDTO.setContent(resultSet.getString("content"));

                cartDTOList.add(cartDTO);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cartDTOList;
    }
}
