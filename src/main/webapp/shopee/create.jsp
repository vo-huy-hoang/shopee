<%--
  Created by IntelliJ IDEA.
  User: macbookair
  Date: 24/04/2024
  Time: 22:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Màn Hình Thêm Mới</title>
    <link rel="icon" href="https://scontent.xx.fbcdn.net/v/t1.15752-9/440527698_921457236384352_2491583310198348678_n.png?_nc_cat=106&ccb=1-7&_nc_sid=5f2048&_nc_ohc=Nc2XoKBPFdkQ7kNvgEwfjWP&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&oh=03_Q7cD1QHbCeoIEDqUoBGEYO4NMxS7m1IsrrN8oBJWZpZsgbT6wA&oe=66600268" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<div class="container">
    <h1 class="text-center">Thêm Mới Sản Phẩm</h1>
    <form action="/customer?action=create" method="post">
        <div class="mb-3">
            <label for="name" class="form-label">Tên</label>
            <input type="text" value="${name}" class="form-control" id="name" name="name">
            <p class="text-danger">${massageError.name}</p>
        </div>

        <div class="mb-3">
            <label for="price" class="form-label">Giá</label>
            <input type="text" value="${price}" class="form-control" id="price" name="price">
            <p class="text-danger">${massageError.price}</p>
        </div>

        <div class="mb-3">
            <label for="quantity" class="form-label">Số Lượng</label>
            <input type="text" value="${salary}" class="form-control" id="quantity" name="quantity">
            <p class="text-danger">${massageError.salary}</p>
        </div>

        <a href="/customer" class="btn btn-danger">Huỷ</a>
        <button type="submit" class="btn btn-primary">Lưu</button>
    </form>
    <br>
</div>
</body>
</html>
