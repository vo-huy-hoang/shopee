package com.example.shopee.service.impl;

import com.example.shopee.dto.UserRegisterDTO;
import com.example.shopee.model.User;
import com.example.shopee.repository.IUserRepository;
import com.example.shopee.repository.impl.UserRepository;
import com.example.shopee.service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();
    @Override
    public User findByUserName(String username) {
        return userRepository.findByUserName(username);
    }

    @Override
    public List<String> findRolesByUsername(String username) {
        return userRepository.findRolesByUsername(username);
    }
    @Override
    public void save(UserRegisterDTO userRegisterDTO) {
        userRepository.save(userRegisterDTO);
    }
}
