<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Chi Tiết Lịch Học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', 'sans-serif', 'Roboto', 'Helvetica', 'Times New Roman'; /* Font hỗ trợ tiếng Việt */
            background-color: #f8f9fa; /* Màu nền nhẹ */
        }
        .container {
            max-width: 600px; /* Giới hạn chiều rộng nhỏ hơn để phù hợp với chi tiết */
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
        .btn-secondary, .btn-warning, .btn-info {
            border-radius: 5px; /* Bo góc nút */
            padding: 8px 16px; /* Tăng padding cho nút */
            transition: all 0.3s ease; /* Hiệu ứng mượt mà */
        }
        .btn-secondary:hover, .btn-warning:hover, .btn-info:hover {
            opacity: 0.9; /* Hiệu ứng hover */
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Chi Tiết Lịch Học</h2>
    <div class="card shadow-sm">
        <div class="card-body">
            <p><strong>ID Lịch Học:</strong> ${schedule.schedule_id}</p>
            <p><strong>Tên Lớp:</strong> ${schedule.class_name}</p>
            <p><strong>Môn Học:</strong> ${schedule.subject_name}</p>
            <p><strong>Ngày Trong Tuần:</strong> ${schedule.day_of_week}</p>
            <p><strong>Thời Gian Bắt Đầu:</strong> ${schedule.start_time}</p>
            <p><strong>Thời Gian Kết Thúc:</strong> ${schedule.end_time}</p>

            <!-- Nút Home, Quay lại và Sửa -->
            <div class="d-flex justify-content-between mt-3">
                <div>
                    <button type="button" class="btn btn-info me-2" onclick="window.location.href='/';">Home</button>
                    <a href="schedules" class="btn btn-secondary">Quay lại</a>
                </div>
                <a href="schedules?action=edit&schedule_id=${schedule.schedule_id}" class="btn btn-warning">Sửa</a>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>