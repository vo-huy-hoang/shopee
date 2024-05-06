package com.example.shopee.controller;

import com.example.shopee.dto.UserDetail;
import com.example.shopee.model.User;
import com.example.shopee.service.IUserService;
import com.example.shopee.service.impl.UserService;
import com.example.shopee.util.BCryptUtil;
import com.example.shopee.util.JWTUtil;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.ServletException;

import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private final IUserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userService.findByUserName(username);
        if (user == null || !BCryptUtil.checkPassword(password, user.getPassword())) {
            request.setAttribute("username", username);
            request.setAttribute("message", "Tên tài khoản hoặc mật khẩu không chính xác!");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }
        String rememberMe = request.getParameter("remember-me");
        if ("on".equals(rememberMe)) {
            String token = JWTUtil.generateTokenLogin(username);
            Cookie cookie = new Cookie("remember-me", token);
            cookie.setMaxAge(7 * 24 * 60 * 60); // 7 ngày
            response.addCookie(cookie);
        }
        HttpSession session = request.getSession();
        // đăng nhập thành công, phân quyền
        UserDetail userDetail = new UserDetail(user.getUsername(), userService.findRolesByUsername(user.getUsername()));
        // lưu username vào session
        session.setAttribute("userDetail", userDetail); // đặt tên gì cx dc
        response.sendRedirect("/customer");
    }
}
