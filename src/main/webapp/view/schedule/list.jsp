<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Danh Sách Lịch Học</title>
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
        .btn-primary, .btn-info, .btn-warning, .btn-danger {
            border-radius: 5px; /* Bo góc nút */
            padding: 6px 12px; /* Tăng padding cho nút */
            transition: all 0.3s ease; /* Hiệu ứng mượt mà */
        }
        .btn-primary:hover, .btn-info:hover, .btn-warning:hover, .btn-danger:hover {
            opacity: 0.9; /* Hiệu ứng hover */
        }
        .table {
            border-radius: 5px;
            overflow: hidden; /* Đảm bảo bo góc không bị cắt */
        }
        .table-light {
            background-color: #007bff; /* Màu xanh đậm cho header */
            color: white;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f2f2f2; /* Màu nền nhẹ cho hàng lẻ */
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Danh Sách Lịch Học</h2>

    <!-- Nút Home và Thêm Mới -->
    <div class="d-flex justify-content-between mb-3">
        <div>
            <button class="btn btn-info me-2" onclick="window.location.href='/home';">Home</button>
            <button class="btn btn-primary" onclick="window.location.href='/schedules?action=create';">Thêm Mới</button>
        </div>
    </div>

    <!-- Bảng danh sách lịch học -->
    <table class="table table-striped table-hover">
        <thead class="table-light">
        <tr>
            <th>STT</th>
            <th>Tên Lớp</th>
            <th>Môn Học</th>
            <th>Ngày Trong Tuần</th>
            <th>Thời Gian Bắt Đầu</th>
            <th>Thời Gian Kết Thúc</th>
            <th>Hành Động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="schedule" items="${schedules}" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${schedule.class_name}</td>
                <td>${schedule.subject_name}</td>
                <td>${schedule.day_of_week}</td>
                <td>${schedule.start_time}</td>
                <td>${schedule.end_time}</td>
                <td>
                    <a href="schedules?action=details&schedule_id=${schedule.schedule_id}" class="btn btn-info btn-sm">Chi tiết</a>
                    <a href="schedules?action=edit&schedule_id=${schedule.schedule_id}" class="btn btn-warning btn-sm">Sửa</a>
                    <a href="schedules?action=delete&schedule_id=${schedule.schedule_id}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>