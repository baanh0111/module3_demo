<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Danh Sách Điểm Tổng Hợp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
        }
        h2 {
            color: #343a40; /* Màu chữ đậm */
            font-weight: bold;
        }
        .btn-primary, .btn-secondary, .btn-warning, .btn-danger, .btn-info {
            border-radius: 5px; /* Bo góc nút */
            padding: 6px 12px; /* Tăng padding cho nút */
            transition: all 0.3s ease; /* Hiệu ứng mượt mà */
        }
        .btn-primary:hover, .btn-secondary:hover, .btn-warning:hover, .btn-danger:hover, .btn-info:hover {
            opacity: 0.9; /* Hiệu ứng hover */
        }
        .table {
            border-radius: 5px;
            overflow: hidden; /* Đảm bảo bo góc không bị cắt */
        }
        .table thead {
            background-color: #007bff; /* Màu xanh đậm cho header */
            color: white;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f2f2f2; /* Màu nền nhẹ cho hàng lẻ */
        }
        .alert {
            border-radius: 5px;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Danh Sách Điểm Tổng Hợp</h2>

    <!-- Thông báo -->
    <c:if test="${param.success}">
        <c:choose>
            <c:when test="${not empty param.deletedGradeId}">
                <div class="alert alert-success" id="alert-message">Thao tác thành công! Đã xóa điểm với ID ${param.deletedGradeId}.</div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-success" id="alert-message">Thao tác thành công!</div>
            </c:otherwise>
        </c:choose>
    </c:if>

    <!-- Nút Home, Thêm Điểm Mới và các nút lọc -->
    <div class="d-flex justify-content-between mb-3">
        <div>
            <button class="btn btn-info me-2" onclick="window.location.href='/home';">Home</button>
            <button class="btn btn-primary" onclick="window.location.href='/grades?action=add';">Thêm Điểm Mới</button>
        </div>
        <div>
            <a href="/grades?action=list" class="btn btn-secondary me-1">Tất Cả Điểm</a>
            <a href="/grades?action=listRegular" class="btn btn-secondary me-1">Điểm Regular</a>
            <a href="/grades?action=listMidterm" class="btn btn-secondary me-1">Điểm Midterm</a>
            <a href="/grades?action=listFinal" class="btn btn-secondary">Điểm Final</a>
        </div>
    </div>

    <!-- Bảng danh sách điểm -->
    <table class="table table-striped table-hover">
        <thead>
        <tr>
            <th>ID Điểm</th>
            <th>ID Học Sinh</th>
            <th>Học Sinh</th>
            <th>Môn Học</th>
            <th>Điểm</th>
            <th>Loại Kỳ Thi</th>
            <th>Ngày Nhập</th>
            <th>Hành Động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="grade" items="${grades}">
            <tr>
                <td>${grade.grade_id}</td>
                <td>${grade.student_id}</td>
                <td>
                    <c:forEach var="student" items="${students}">
                        <c:if test="${student.id == grade.student_id}">
                            ${student.name}
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="subject" items="${subjects}">
                        <c:if test="${subject.subject_id == grade.subject_id}">
                            ${subject.subject_name}
                        </c:if>
                    </c:forEach>
                </td>
                <td>${grade.score}</td>
                <td>${grade.exam_type}</td>
                <td>${grade.date_entered}</td>
                <td>
                    <a href="/grades?action=edit&grade_id=${grade.grade_id}" class="btn btn-sm btn-warning">Sửa</a>
                    <a href="/grades?action=delete&grade_id=${grade.grade_id}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn có chắc muốn xóa điểm này?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    setTimeout(function () {
        let alertMessage = document.getElementById('alert-message');
        if (alertMessage) {
            alertMessage.style.display = 'none';
        }
    }, 3000);
</script>
</body>
</html>