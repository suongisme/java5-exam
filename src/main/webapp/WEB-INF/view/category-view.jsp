<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý danh mục</title>
</head>
<body>
    <h2>QUẢN LÝ DANH MỤC HÀNG HÓA</h2>

    <div>
        <form method="post" action="categories/submit">
            <div>
                <label>Mã danh mục: </label>
                <input name="id" placeholder="Mã danh mục?" value="${category.id}">
            </div>

            <div>
                <label>Tên danh mục: </label>
                <input name="name" placeholder="Tên danh mục?" value="${category.name}">
            </div>

            <div>
                <button ${category.id != null ? 'disabled' : ''}>Thêm</button>
                <button ${category.id == null ? 'disabled' : ''}>Sửa</button>
                <a href="<c:url value="categories"/>">Reset</a>
            </div>
        </form>
    </div>
    <div>
        <table border="1">
            <thead>
                <tr>
                    <th>Tên Danh Mục</th>
                    <th>...</th>
                    <th>...</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var = "category" items="${listCategory}">
                    <tr>
                        <td>${category.name}</td>
                        <td>
                            <a href="<c:url value="categories/${category.id}"/>"> Sửa </a>
                        </td>
                        <td>
                            <a  href="<c:url value="categories/delete/${category.id}"/>"> Xóa </a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

    </div>
</body>
</html>