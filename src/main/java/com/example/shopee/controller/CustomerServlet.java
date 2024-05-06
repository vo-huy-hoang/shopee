package com.example.shopee.controller;

import com.example.shopee.dto.ProductSearchDTO;
import com.example.shopee.model.Product;
import com.example.shopee.service.ICustomerService;
import com.example.shopee.service.impl.CustomerService;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.ServletException;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "viewProduct":
                viewProduct(request, response);
                break;
            default:
                listProduct(request, response);
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("shopee/create.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = customerService.findById(id);
        if (product == null) {
            request.getRequestDispatcher("error-404.jsp").forward(request, response);
        } else {
            request.setAttribute("id", product.getId());
            request.setAttribute("name", product.getName());
            request.setAttribute("price", product.getPrice());
            request.setAttribute("quantity", product.getQuantity());

            request.getRequestDispatcher("shopee/edit.jsp").forward(request, response);
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = customerService.findById(id);
        if (product == null) {
            request.getRequestDispatcher("error-404.jsp").forward(request, response);
        } else {
            customerService.delete(id);
            response.sendRedirect("customer?message=" + URLEncoder.encode("Xoá thành công", "UTF8"));
        }
    }

    private void viewProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = customerService.findById(id);
        if (product == null) {
            request.getRequestDispatcher("error-404.jsp").forward(request, response);
        } else {
            request.setAttribute("product", product);
            request.getRequestDispatcher("shopee/viewProduct.jsp").forward(request, response);
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductSearchDTO productSearchDTO = new ProductSearchDTO();
        if (request.getParameter("name") !=  null) {
            productSearchDTO.setName(request.getParameter("name"));
        }
        productSearchDTO.setPrice(request.getParameter("price"));
        request.setAttribute("productSearchDTO", productSearchDTO);
        request.setAttribute("productList", customerService.search(productSearchDTO));
        request.getRequestDispatcher("shopee/screen.jsp").forward(request, response);
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
            case "create":
                createProduct(request, response);
                break;
            case "edit":
                editProduct(request, response);
                break;
            default:
                listProduct(request, response);
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String quantity = request.getParameter("quantity");

        Product product = new Product(name, price, quantity);
        customerService.create(product);
        response.sendRedirect("/customer?message=" + URLEncoder.encode("Thêm mới thành công", "UTF8"));
    }

    private void editProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = customerService.findById(id);
        if (product == null) {
            request.getRequestDispatcher("error-404.jsp");
        }
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        String quantity = request.getParameter("quantity");

        product.setName(name);
        product.setPrice(price);
        product.setQuantity(quantity);

        customerService.update(product);
        response.sendRedirect("/customer?message=" + URLEncoder.encode("Cập nhật thành công", "UTF8"));
    }


}
