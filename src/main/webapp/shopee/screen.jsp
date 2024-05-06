<%--
  Created by IntelliJ IDEA.
  User: macbookair
  Date: 23/04/2024
  Time: 19:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fnt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Màn hình chính</title>
    <link rel="icon" href="https://scontent.xx.fbcdn.net/v/t1.15752-9/440527698_921457236384352_2491583310198348678_n.png?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_ohc=Nc2XoKBPFdkQ7kNvgEwfjWP&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_Q7cD1QHbCeoIEDqUoBGEYO4NMxS7m1IsrrN8oBJWZpZsgbT6wA&oe=66600268" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        div a {
            color: white !important;
        }
    </style>
</head>
<body>
<header style="background-color: orangered;">
    <div>
        <nav class="nav">
            <div style="display: flex; align-items: center; font-size: small; color: white;">
                <div><a class="nav-link" href="#" >Kênh Người Bán</a></div>
                <div><a class="nav-link" href="#" style="color: white;">Tải Ứng Dụng</a></div>
                <div><a class="nav-link" href="#" style="color: white;">Kết Nối</a></div>
            </div>

            <div style="flex: 1;"></div>

            <div style="display: flex; align-items: center; font-size: small;">
                <div><a class="nav-link" href="#" style="color: white;"><i class="fa-regular fa-bell"></i>Thông Báo</a></div>
                <div><a class="nav-link" href="#" style="color: white;"><i class="fa-light fa-question"></i>Hỗ Trợ</a></div>
                <div><a class="nav-link" href="#" style="color: white;"><i class="fa-solid fa-earth-americas"></i>Tiếng Việt</a></div>
                <div><a class="nav-link" href="/login" style="color: white;"><i class="fa-solid fa-right-from-bracket"></i>>Đăng Xuất</a></div>
            </div>
        </nav>
    </div>
</header>

<div class="main">
    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://cf.shopee.vn/file/vn-50009109-602ea6c311804b6532f183f2f36efa9d" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://cf.shopee.vn/file/vn-50009109-837ba65e66d01f61c4814d901aef5e1c" class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://cf.shopee.vn/file/vn-50009109-bbf083d4a61836f16551472a46282499" class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>

<div class="sidebar">
    <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
        <div class="offcanvas-header">
            <h5 class="offcanvas-title" id="offcanvasExampleLabel">Danh Mục Sản Phẩm</h5>
            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
            <div class="mt-3">
                <button class="btn btn-secondary" type="button" data-bs-toggle="dropdown">
                    <a class="dropdown-item" href="product.html">Iphone</a>
                </button>
            </div>

            <div class="mt-3">
                <a class="btn btn-secondary" href="macbook.html">Macbook</a>
            </div>

            <div class="mt-3">
                <a class="btn btn-secondary" href="apple_watch.html">Apple Watch</a>
            </div>

            <div class="mt-3">
                <a class="btn btn-secondary" href="apple_watch.html">AirPods</a>
            </div>

            <div class="mt-3">
                <a class="btn btn-secondary" href="ipad.html">Ipad</a>
            </div>
        </div>
    </div>
</div>

<div class="navbar">
    <button data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" type="button" class="btn btn-secondary" style="margin-left: 70px;"><i class="fa-solid fa-bars fa-lg"></i></button>
    <i class="fa-brands fa-apple fa-4x" style="margin-left: -30px;"></i>
    <a href="/cart"><div style="color: black;"><i class="fa-solid fa-cart-shopping fa-2x"></i>Giỏ Hàng</div></a>
    <a href="/login" style="text-decoration: none;"><div style="margin-right: 75px; color: black;"><i class="fa-solid fa-circle-user fa-2x" id="user"></i>${userDetail.username}</div></a>
</div>

<div class="container mt-5">
    <h2>Tìm kiếm sản phẩm</h2>
    <form action="/customer" method="get">
        <div class="row">
            <div class="col-md-4">
                <div class="mb-3">
                    <label for="name" class="form-label">Tên (Tìm kiếm gần đúng)</label>
                    <input type="text" value="${productSearchDTO.name}" class="form-control" id="name" name="name">
                </div>
            </div>

            <div class="col-md-4">
                <div class="mb-3">
                    <label for="price" class="form-label">Giá</label>
                    <select class="form-select" id="price" name="price">
                        <option value="">Tất cả</option>
                        <option value="d10" ${productSearchDTO.price == 'd10' ? 'selected': ''}>Dưới 10 triệu</option>
                        <option value="10-20" ${productSearchDTO.price == '10-20' ? 'selected': ''}>Từ 10 triệu đến dưới 20 triệu</option>
                        <option value="20-30" ${productSearchDTO.price == '20-30' ? 'selected': ''}>Từ 30 triệu đến dưới 30 triệu</option>
                        <option value="t30" ${productSearchDTO.price == 't30' ? 'selected': ''}>Trên 30 triệu</option>
                    </select>
                </div>
            </div>

            <div class="col-md-8">
                <div class="col-12 text-end">
                    <button type="reset" class="btn btn-info mt-5"><i class="fa-solid fa-rotate-left"></i>Đặt lại</button>
                    <button type="submit" class="btn btn-primary mt-5"><i class="fa-solid fa-magnifying-glass"></i>Tìm kiếm</button>
                </div>
            </div>
        </div>
    </form>
</div>

<div class="container">
    <div class="product">
        <h2 class="text-danger">${param.message}</h2>

        <c:if test="${userDetail.roles.contains('admin')}">
            <div class="col-12 text-end">
                <a href="customer?action=create" class="btn btn-success">Thêm Mới</a>
            </div>
        </c:if>
        <div class="row">
            <c:forEach var="product" items="${productList}" varStatus="varStatus">
                        <div class="col-12 col-xl-3 col-lg-4 col-md-6">
                            <div class="card">
                                <img src="https://product.hstatic.net/200000409445/product/14-max-tim_6dc05b654a3943fb8e9b03883b223d04_grande.jpg" class="card-img-top" alt="iphone">
                                <div class="card-body">
                                    <h5 class="card-title">${product.name}</h5>
                                    <p class="card-text">${product.price}</p>
                                    <a href="/cart?action=buy&id=${product.id}" class="btn btn-primary">Mua hàng</a>
                                    <a href="customer?action=viewProduct&id=${product.id}" class="btn btn-primary">Chi tiết</a>
                                    <c:if test="${userDetail.roles.contains('admin')}">
                                        <button data-bs-toggle="modal" data-bs-target="#confirmDeleteModal" onclick="deleteProduct(${product.id}, '${product.name}')" class="btn btn-danger"><i class="fas fa-trash"></i>Xoá</button>
                                    </c:if>
                                </div>
                            </div>
                        </div>
            </c:forEach>
        </div>
    </div>
</div>

<div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title fs-5" id="confirmDeleteModalLabel">Xác nhận xoá nhân viên</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Bạn có chắc chắn muốn xoá sản phẩm <span id="productNameToDelete" class="form-label text-danger"></span>
            </div>
            <form>
                <div class="modal-footer">
                    <input type="hidden" id="productIdDelete" name="id">
                    <input type="hidden" name="action" value="delete">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huỷ</button>
                    <button type="submit" class="btn btn-danger" id="confirmDeleteButton">Xoá</button>
                </div>
            </form>
        </div>
    </div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script>
        function deleteProduct(id, name) {
            $("#productNameToDelete").text(name);
            $("#productIdDelete").text(name).val(id);
        }
    </script>
</body>
</html>
