<%--
  Created by IntelliJ IDEA.
  User: macbookair
  Date: 27/04/2024
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Xem Sản Phẩm</title>
    <link rel="icon" href="https://scontent.xx.fbcdn.net/v/t1.15752-9/440527698_921457236384352_2491583310198348678_n.png?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_ohc=Nc2XoKBPFdkQ7kNvgEwfjWP&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_Q7cD1QHbCeoIEDqUoBGEYO4NMxS7m1IsrrN8oBJWZpZsgbT6wA&oe=66600268" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <div class="container">
        <h1 class="text-center">Chi Tiết Sản Phẩm</h1>
        <form action="/customer?action=viewProduct" method="get">
            <div class="row">
                <div class="col-md-3"><label for="productId">Mã Sản Phẩm:</label></div>
                <div class="col-md-3"><p id="productId">${product.id}</p></div>
            </div>

            <div class="row">
                <div class="col-md-3"><label for="productName">Tên:</label></div>
                <div class="col-md-3"><p id="productName">${product.name}</p></div>
            </div>

            <div class="row">
                <div class="col-md-3"><label for="productPrice">Giá:</label></div>
                <div class="col-md-3"><p id="productPrice">${product.price}</p></div>
            </div>

            <div class="row">
                <div class="col-md-3"><label for="productQuantity">Số Lượng:</label></div>
                <div class="col-md-3"><p id="productQuantity">${product.quantity}</p></div>
            </div>

            <div class="row">
                <div class="col-md-3"><a href="/customer" class="btn btn-danger">Trở về</a></div>
            </div>
        </form>
    </div>
</body>
</html>
