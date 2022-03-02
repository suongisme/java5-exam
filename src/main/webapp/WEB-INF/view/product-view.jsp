<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý hàng hóa</title>
</head>

<style>

    label[for=file] {
        width: 130px;
        height: 130px;
        display: inline-block;
        cursor: pointer;
    }

    label > img {
        transition: all .4s
    }

    label[for=file]:hover #img {
        transform: scale(2);
    }

    img {
        width: 100%;
        height: 100%;
    }

    thead > tr {
        background: yellow;
    }

    .even {
        background: gray;
    }
</style>
<body>
    <h2>QUẢN LÝ HÀNG HÓA</h2>

    <div>
        <form method="post" action="products/submit" enctype="multipart/form-data">
<%--            <div>--%>
<%--                <label>Mã sản phẩm: </label>--%>
<%--                <input name="id" placeholder="Mã sản phẩm?" value="${product.id}">--%>
<%--            </div>--%>
            <input hidden name="image" value="${product.image}">
            <div>
                <label>Tên sản phẩm: </label>
                <input name="name" placeholder="Tên sản phẩm?" value="${product.name}">
            </div>

            <div>
                <label>Giá sản phẩm: </label>
                <input type="number" name="price" placeholder="Giá sản phẩm?" value="${product.price}">
            </div>

            <div style="display: flex;">
                <label>Ảnh sản phẩm: </label>
                <input id="file" type="file" name="file" hidden>
                <label for="file">
                    <c:if test="${product.image != null}">
                        <img id="img" src="${pageContext.request.contextPath} ${product.image}" alt="${product.name}">
                    </c:if>
                    <c:if test="${product.image == null}">
                        <img src="${pageContext.request.contextPath}/images/upload.jpg">
                    </c:if>
                </label>
            </div>

            <div>
                <button ${product.id != null ? 'disabled' : ''}>Thêm</button>
                <button ${product.id == null ? 'disabled' : ''}>Sửa</button>
                <a href="<c:url value="products"/>">Reset</a>
            </div>
        </form>
    </div>
    <div>
        <table border="1" width="100%">
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
                <c:forEach var = "product" items="${listProduct}" varStatus="status">
                    <tr class="${ status.index % 2 == 0 ? 'even' : 'odd'}" }}>
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
<script>
    const inputFile = document.querySelector('input[type=file]');

    inputFile.addEventListener('change', (event) => {
        const selectedFile = event.target.files[0];
        const reader = new FileReader();

        const image = document.querySelector('img');
        image.title = selectedFile.name;
        image.id = 'img';

        reader.onload = (e) => {
            image.src = e.target.result;
        }
        reader.readAsDataURL(selectedFile);
    })
</script>
</html>