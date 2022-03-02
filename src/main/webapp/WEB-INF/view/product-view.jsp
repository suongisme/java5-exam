<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý hàng hóa</title>
</head>
<body>
    <h2>QUẢN LÝ HÀNG HÓA</h2>

    <div>
        <form method="post" action="products/submit" enctype="multipart/form-data">
<%--            <div>--%>
<%--                <label>Mã sản phẩm: </label>--%>
<%--                <input name="id" placeholder="Mã sản phẩm?" value="${product.id}">--%>
<%--            </div>--%>
            <input style="display: none" value="${product.image}">
            <div>
                <label>Tên sản phẩm: </label>
                <input name="name" placeholder="Tên sản phẩm?" value="${product.name}">
            </div>

            <div>
                <label>Giá sản phẩm: </label>
                <input type="number" name="price" placeholder="Giá sản phẩm?" value="${product.price}">
            </div>

            <div>
                <label>Ảnh sản phẩm: </label>
                <input type="file" name="file">
            </div>

            <div>
                <button ${product.id != null ? 'disabled' : ''}>Thêm</button>
                <button ${product.id == null ? 'disabled' : ''}>Sửa</button>
                <a href="<c:url value="products"/>">Reset</a>
            </div>
        </form>
    </div>
    <div>
        <table border="1">
            <thead>
                <tr>
                    <th>Tên Sản Phẩm</th>
                    <th>Giá Sản Phẩm</th>
                    <th>Ngày tạo</th>
                    <th>...</th>
                    <th>...</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var = "product" items="${listProduct}">
                    <tr>
                        <td>${product.name}</td>
                        <td>${product.price}</td>
                        <td>${product.createDate}</td>
                        <td>
                            <a href="<c:url value="products/${product.id}"/>"> Sửa </a>
                        </td>
                        <td>
                            <a  href="<c:url value="products/delete/${product.id}"/>"> Xóa </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </div>
</body>
</html>