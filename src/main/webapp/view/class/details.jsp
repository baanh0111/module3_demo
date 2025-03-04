<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Chi tiết lớp học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', 'sans-serif', 'Roboto', 'Helvetica', 'Times New Roman'; /* Font hỗ trợ tiếng Việt */
            background-color: #f8f9fa; /* Màu nền nhẹ */
        }
        .container {
            max-width: 1200px; /* Giới hạn chiều rộng */
            background-color: #ffffff; /* Nền trắng cho container */
            padding: 20px;
            border-radius: 10px; /* Bo góc */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Đổ bóng nhẹ */
            margin-top: 50px; /* Khoảng cách trên lớn hơn */
        }
        h2 {
            color: #343a40; /* Màu chữ đậm */
            font-weight: bold;
        }
        .card {
            border-radius: 10px;
        }
        .card-body {
            padding: 20px;
        }
        .btn-secondary, .btn-info {
            border-radius: 5px; /* Bo góc nút */
            padding: 8px 16px; /* Tăng padding cho nút */
            transition: all 0.3s ease; /* Hiệu ứng mượt mà */
        }
        .btn-secondary:hover, .btn-info:hover {
            opacity: 0.9; /* Hiệu ứng hover */
        }
        .table {
            border-radius: 5px;
            overflow: hidden; /* Đảm bảo bo góc không bị cắt */
        }
        .table-primary {
            background-color: #007bff; /* Màu xanh đậm cho header */
            color: white;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f2f2f2; /* Màu nền nhẹ cho hàng lẻ */
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4 text-center">Chi tiết lớp học</h2>

    <div class="card shadow-sm">
        <div class="card-body">
            <h5 class="card-title">Tên lớp: <strong>${clazz.name}</strong></h5>
            <p class="card-text">Giáo viên phụ trách: <strong>${teacherName}</strong></p>
            <p class="card-text">Số lượng học sinh: <strong>${studentCount}</strong></p>
        </div>
    </div>

    <h4 class="mt-4">Danh sách học sinh</h4>
    <table class="table table-bordered table-striped mt-3">
        <thead class="table-primary">
        <tr>
            <th>#</th>
            <th>Tên học sinh</th>
            <th>Ngày sinh</th>
            <th>Số điện thoại</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty clazz.students}">
                <c:forEach var="student" items="${clazz.students}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${student.name}</td>
                        <td><fmt:formatDate value="${student.dob}" pattern="dd/MM/yyyy" /></td>
                        <td>${student.phone}</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4" class="text-center">Không có học sinh nào trong lớp này.</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>

    <!-- Nút Home và Quay lại -->
    <div class="d-flex justify-content-between mt-3">
        <div>

            <a href="/classes" class="btn btn-secondary">Quay lại</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>