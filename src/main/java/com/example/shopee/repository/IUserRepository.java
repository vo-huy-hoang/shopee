package com.example.shopee.repository;

import com.example.shopee.dto.UserRegisterDTO;
import com.example.shopee.model.User;

import java.util.List;

public interface IUserRepository {
    User findByUserName(String username);
    List<String> findRolesByUsername(String username);
    void save(UserRegisterDTO userRegisterDTO);
}
