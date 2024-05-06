package com.example.shopee.service;

import com.example.shopee.dto.UserRegisterDTO;
import com.example.shopee.model.User;

import java.util.List;

public interface IUserService {
    User findByUserName(String username);
    List<String> findRolesByUsername(String username);

    void save(UserRegisterDTO userRegisterDTO);
}
