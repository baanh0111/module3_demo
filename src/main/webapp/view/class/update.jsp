<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cập Nhật Lớp Học</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', 'sans-serif', 'Roboto', 'Helvetica', 'Times New Roman'; /* Font hỗ trợ tiếng Việt */
            background-color: #f8f9fa; /* Màu nền nhẹ */
        }
        .container {
            max-width: 600px; /* Giới hạn chiều rộng nhỏ hơn để phù hợp với form */
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
        .btn-primary, .btn-secondary, .btn-info {
            border-radius: 5px; /* Bo góc nút */
            padding: 8px 16px; /* Tăng padding cho nút */
            transition: all 0.3s ease; /* Hiệu ứng mượt mà */
        }
        .btn-primary:hover, .btn-secondary:hover, .btn-info:hover {
            opacity: 0.9; /* Hiệu ứng hover */
        }
        .form-control, .form-select {
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Cập Nhật Lớp Học</h2>
    <form action="classes?action=update" method="post">
        <input type="hidden" name="class_id" value="${clazz.class_id}">

        <div class="mb-3">
            <label for="name" class="form-label">Tên Lớp</label>
            <input type="text" class="form-control" id="name" name="name" value="${clazz.name}" required>
        </div>

        <div class="mb-3">
            <label for="teacher_id" class="form-label">Giáo Viên Phụ Trách</label>
            <select class="form-select" id="teacher_id" name="teacher_id" required>
                <option value="">-- Chọn giáo viên --</option>
                <c:forEach var="teacher" items="${teachers}">
                    <option value="${teacher.id}" ${teacher.id == clazz.teacher.id ? 'selected' : ''}>
                            ${teacher.name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <!-- Nút Home, Hủy và Cập Nhật -->
        <div class="d-flex justify-content-between">
            <div>
                <button type="button" class="btn btn-info me-2" onclick="window.location.href='/';">Home</button>
                <a href="classes" class="btn btn-secondary">Hủy</a>
            </div>
            <button type="submit" class="btn btn-primary">Cập Nhật</button>
        </div>
    </form>
</div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>