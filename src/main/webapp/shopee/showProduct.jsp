<%--
  Created by IntelliJ IDEA.
  User: macbookair
  Date: 02/05/2024
  Time: 19:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fnt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Màn Hình Mua Sản Phẩm</title>
    <link rel="icon" href="https://scontent.xx.fbcdn.net/v/t1.15752-9/440527698_921457236384352_2491583310198348678_n.png?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_ohc=Nc2XoKBPFdkQ7kNvgEwfjWP&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_Q7cD1QHbCeoIEDqUoBGEYO4NMxS7m1IsrrN8oBJWZpZsgbT6wA&oe=66600268" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<div class="row">
    <div class="col-6">
        <img src="https://product.hstatic.net/200000409445/product/14-max-tim_6dc05b654a3943fb8e9b03883b223d04_grande.jpg" alt="">
    </div>

    <div class="col-6">
        <div class="container">
            <form action="/cart?action=buyProduct" method="post">
                <div class="row">
                    <div class="col-md-3"><label for="productId">Mã Sản Phẩm:</label></div>
                    <div class="col-md-3"><p id="productId">${id}</p></div>
                </div>

                <input type="hidden" name="productId" value="${id}">

                <div class="row">
                    <div class="col-md-3"><label for="productName">Tên:</label></div>
                    <div class="col-md-3"><p id="productName">${name}</p></div>
                </div>

                <div class="row">
                    <div class="col-md-3"><label for="productPrice">Giá:</label></div>
                    <div class="col-md-3"><p id="productPrice">${price}</p></div>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        <label for="productQuantity">Số Lượng:</label>
                        <input type="number" value="1" id="productQuantity" name="productQuantity">
                    </div>
                </div>

                <div class="row">
                    <div class="col-6 col-md-3"><a href="/customer" class="btn btn-danger">Trở về</a></div>
                    <button type="submit" class="btn btn-primary col-6 col-md-3">Mua Hàng</button>
                </div>
            </form>

            <form action="/cart?action=commentProduct" method="post">
                <input type="hidden" name="productId" value="${id}">
                <div class="mb-3">
                    <input type="text" value="${content}" class="form-control" id="comment" name="comment" placeholder="Bình Luận">
                </div>
                <div class="mb-3"><button type="submit" class="btn btn-primary">Lưu</button></div>
            </form>

            <c:forEach var="comment" items="${commentList}" varStatus="varStatus">
                <p class="text-break">${comment.content}</p>
            </c:forEach>
        </div>
    </div>
</div>
<script>
    let increase = 1;
    let decrease = 0;
    function increase() {
        $("#number").val($("#number").val() + 1);
    }
    function decrease() {
        $("#number").val($("#number").val() - 1);
    }
</script>
</body>
</html>
