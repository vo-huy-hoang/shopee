package com.example.shopee.repository.impl;

import com.example.shopee.dto.UserRegisterDTO;
import com.example.shopee.model.User;
import com.example.shopee.repository.IUserRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    @Override
    public User findByUserName(String username) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(
                    "select id, username, password from user where username = ?;"
            );
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();

            User user;
            if (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("id"));
                user.setUsername(resultSet.getString("username"));
                user.setPassword(resultSet.getString("password"));

                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<String> findRolesByUsername(String username) {
        List<String> roles = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(
                    "select r.name as role from user u inner join user_role ur on u.id = ur.user_id\n" +
                            "inner join role r on ur.role_id = r.id where u.username = ?;"
            );

            preparedStatement.setString(1, username);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                roles.add(resultSet.getString("role"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return roles;
    }

    @Override
    public void save(UserRegisterDTO userRegisterDTO) {
        try {
            PreparedStatement preparedStatement = BaseRepository.getConnection().prepareStatement(
                    "insert into user(username, password) values (?, ?)"
            );
            preparedStatement.setString(1, userRegisterDTO.getUsername());
            preparedStatement.setString(2, userRegisterDTO.getPassword());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
