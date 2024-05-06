package com.example.shopee.controller;

import com.example.shopee.dto.CartDTO;
import com.example.shopee.dto.UserDetail;
import com.example.shopee.model.Product;
import com.example.shopee.service.ICustomerService;
import com.example.shopee.service.IUserService;
import com.example.shopee.service.impl.CustomerService;
import com.example.shopee.service.impl.UserService;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.ServletException;

import java.io.IOException;
import java.net.URLEncoder;

@WebServlet(name = "CartServlet", value = "/cart")
public class CartServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();
    private IUserService userService = new UserService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "buy":
                showBuyProduct(request, response);
                break;
            case "deleteCart":
                deleteCart(request, response);
                break;
            default:
                listCart(request, response);
        }
    }

    private void showBuyProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = customerService.findById(id);
        UserDetail userDetail = (UserDetail) request.getSession().getAttribute("userDetail");
        if (product == null) {
            request.getRequestDispatcher("error-404.jsp").forward(request, response);
        } else {
            request.setAttribute("id", product.getId());
            request.setAttribute("name", product.getName());
            request.setAttribute("price", product.getPrice());
            request.setAttribute("quantity", product.getQuantity());
            request.setAttribute("commentList", customerService.listComment(userDetail));

            request.getRequestDispatcher("shopee/showProduct.jsp").forward(request, response);
        }
    }
    private void listCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CartDTO cartDTO = new CartDTO();
        request.setAttribute("cart", cartDTO);
        UserDetail userDetail = (UserDetail) request.getSession().getAttribute("userDetail");
        request.setAttribute("cartList", customerService.list(userDetail));
        request.getRequestDispatcher("shopee/cart.jsp").forward(request, response);
    }
    private void deleteCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        Product product = customerService.findById(productId);
        if (product == null) {
            request.getRequestDispatcher("error-404.jsp").forward(request, response);
        } else {
            customerService.deleteCart(productId);
            response.sendRedirect("cart?message=" + URLEncoder.encode("Xoá thành công giỏ hàng", "UTF8"));
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "buyProduct":
                cart(request, response);
                break;
            case "commentProduct":
                commment(request, response);
                break;
        }
    }


    private void cart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        String quantity = request.getParameter("productQuantity");

        UserDetail userDetail = (UserDetail) request.getSession().getAttribute("userDetail");
        int customerId = userService.findByUserName(userDetail.getUsername()).getId();
        CartDTO cartDTO = new CartDTO(customerId, productId, quantity);
        if (customerService.existProductIdAndCutomerId(customerId, productId)) {
            customerService.duplicateProduct(cartDTO);
        } else {
            customerService.addCart(cartDTO);
        }
        response.sendRedirect("/cart?message=" + URLEncoder.encode("Thêm mới thành công", "UTF8"));
    }
    private void commment(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String comment = request.getParameter("comment");
        int productId = Integer.parseInt(request.getParameter("productId"));
        UserDetail userDetail = (UserDetail) request.getSession().getAttribute("userDetail");
        int customerId = userService.findByUserName(userDetail.getUsername()).getId();
        CartDTO cartDTO = new CartDTO();

        cartDTO.setContent(comment);
        cartDTO.setProductId(productId);
        cartDTO.setCustomerId(customerId);

        customerService.createComment(cartDTO);
        response.sendRedirect("/cart?action=buy&id=" + productId);
    }
}
