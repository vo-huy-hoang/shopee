package com.example.shopee.controller;

import com.example.shopee.dto.UserRegisterDTO;
import com.example.shopee.service.IUserService;
import com.example.shopee.service.impl.UserService;
import com.example.shopee.util.BCryptUtil;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.ServletException;

import java.io.IOException;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    private final IUserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        String pwBcry =  BCryptUtil.hashPassword(password);

        UserRegisterDTO userRegisterDto = new UserRegisterDTO();
        userRegisterDto.setPassword(pwBcry);
        userRegisterDto.setUsername(username);
        userService.save(userRegisterDto);
        HttpSession session = request.getSession();
        session.setAttribute("username", userRegisterDto.getUsername()); // đặt tên gì cx dc
        response.sendRedirect("/login.jsp");
    }
}
