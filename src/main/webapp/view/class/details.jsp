<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Danh Sách Lớp Học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', 'Roboto', sans-serif;
            background-color: #f8f9fa;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="#">Quản Lý Lớp Học</a>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="text-center text-primary">Danh Sách Lớp Học</h2>

    <div class="d-flex justify-content-end mb-3">
        <a href="/classes?action=add" class="btn btn-success">+ Thêm Lớp Mới</a>
    </div>

    <table class="table table-bordered table-striped">
        <thead class="table-primary">
        <tr>
            <th>#</th>
            <th>Tên lớp</th>
            <th>Giáo viên phụ trách</th>
            <th>Số lượng học sinh</th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty classList}">
                <c:forEach var="clazz" items="${classList}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${clazz.name}</td>
                        <td>${clazz.teacherName}</td>
                        <td>${clazz.studentCount}</td>
                        <td>
                            <a href="/classes?action=details&id=${clazz.id}" class="btn btn-info btn-sm">Xem</a>
                            <a href="/classes?action=edit&id=${clazz.id}" class="btn btn-warning btn-sm">Sửa</a>
                            <a href="/classes?action=delete&id=${clazz.id}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa lớp này?')">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="5" class="text-center">Không có lớp học nào.</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>

    <a href="/" class="btn btn-secondary">Quay lại Trang Chủ</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
