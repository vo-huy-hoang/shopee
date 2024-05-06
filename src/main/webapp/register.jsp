<%--
  Created by IntelliJ IDEA.
  User: macbookair
  Date: 20/04/2024
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fnt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Đăng Ký</title>
    <link rel="icon" href="https://scontent.xx.fbcdn.net/v/t1.15752-9/440527698_921457236384352_2491583310198348678_n.png?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_ohc=Nc2XoKBPFdkQ7kNvgEwfjWP&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_Q7cD1QHbCeoIEDqUoBGEYO4NMxS7m1IsrrN8oBJWZpZsgbT6wA&oe=66600268" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<div class="header">
    <div style="margin-bottom: 20px; font-size: 30px;">
        <img src="https://downloadlogomienphi.com/sites/default/files/logos/download-logo-vector-shopee-mien-phi.jpg" alt="">
        Đăng Ký
    </div>
</div>
<div style="background-color: orangered; padding-bottom: 20%;">
    <div class="container">
        <div class="row">
            <div class="col-6">
                <img src="https://finatech.s3.ap-southeast-1.amazonaws.com/20220929/23109627/Shopee.jpg" alt="logo shopee">
            </div>
            <div class="col-6 bg-white" style="margin-top: 80px;">
                <h2 style="display: flex; justify-content: space-around;">Register</h2>
                <div class="row">
                    <div class="col-3"></div>
                    <div class="col-6">
                        <form action="register" method="post">
                            <input value="${username}" type="text" class="form-control" id="username" name="username" placeholder="Email/Số điện thoại/Tên đăng nhập">
                            <div class="mb-3">
                                <input type="password" class="form-control" id="password" name="password"
                                       placeholder="Mật khẩu">
                            </div>
                            <div class="mb-3">
                                <input type="password" placeholder="Nhập Lại Mật Khẩu" class="form-control" id="passwordRepeat" name="passwordRepeat">
                            </div>
                            <p class="text-danger">${message}</p>
                            <div class="form-check" style="padding-right: 185px;">
                                <input class="form-check-input" type="checkbox" value="on" id="remember-me"
                                       name="remember-me" checked>
                                <label class="form-check-label" for="remember-me">
                                    Ghi nhớ
                                </label>
                            </div>
                            <button type="submit" class="btn btn-primary">Đăng Ký</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
