<%--
  Created by IntelliJ IDEA.
  User: macbookair
  Date: 01/05/2024
  Time: 01:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fnt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Giỏ Hàng</title>
    <link rel="icon" href="https://scontent.xx.fbcdn.net/v/t1.15752-9/440527698_921457236384352_2491583310198348678_n.png?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_ohc=Nc2XoKBPFdkQ7kNvgEwfjWP&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_Q7cD1QHbCeoIEDqUoBGEYO4NMxS7m1IsrrN8oBJWZpZsgbT6wA&oe=66600268" type="image/x-icon">q
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>
    <div>
        <div class="row">
            <div class="col-6 col-md-3">
                <h2>Giỏ Hàng</h2>
            </div>

            <div class="col-6 col-md-3">
                <div class="col-6 col-md-3"><a href="/customer" class="btn btn-danger">Trở về màn hình chính</a></div>
            </div>
        </div>
        <form action="/cart" method="post">
            <div class="container mt-5">
                <div class="container mt-4">
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">Sản Phẩm</th>
                            <th scope="col">Đơn Giá</th>
                            <th scope="col">Số Lượng</th>
                            <th scope="col">Thao tác</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="cart" items="${cartList}" varStatus="varStatus">
                            <tr>
                                <td>${cart.name}</td>
                                <td>${cart.price}</td>
                                <td>${cart.quantity}</td>
                                <td>
                                    <button type="button" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal" onclick="deleteCart(${cart.productId}, ${cart.customerId})" class="btn btn-danger"><i class="fas fa-trash"></i>Xoá</button>
                                    <button type="submit" class="btn btn-primary">Mua Hàng</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <a href=""></a>
                </div>
            </div>
        </form>
            <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title fs-5" id="confirmDeleteModalLabel">Xác nhận xoá nhân viên</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            Bạn có chắc chắn muốn xoá sản phẩm <span id="customerIdDelete" class="form-label text-danger"></span>
                        </div>
                        <form action="/cart">
                            <div class="modal-footer">
                                <input type="hidden" id="productIdDelete" name="productId">
                                <input type="hidden" name="action" value="deleteCart">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huỷ</button>
                                <button type="submit" class="btn btn-danger" id="confirmDeleteButton">Xoá</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script>
        function deleteCart(productId, customerId) {
            $("#productIdDelete").val(productId);
            $("#customerIdDelete").val(customerId);
        }
    </script>
</body>
</html>
