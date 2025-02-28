<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Chi Tiết Lịch Học</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="#">Quản Lý Trường Học</a>
    </div>
</nav>

<!-- Main Content -->
<div class="container mt-4">
    <h2 class="text-center text-primary">Chi Tiết Lịch Học</h2>

    <div class="card p-3">
        <div class="card-body">
            <ul class="list-group list-group-flush">
                <li class="list-group-item"><strong>ID Lịch Học:</strong> ${schedule.schedule_id}</li>
                <li class="list-group-item"><strong>Tên Lớp:</strong> ${schedule.class_name}</li>
                <li class="list-group-item"><strong>Môn Học:</strong> ${schedule.subject_name}</li>
                <li class="list-group-item"><strong>Ngày Trong Tuần:</strong> ${schedule.day_of_week}</li>
                <li class="list-group-item"><strong>Thời Gian Bắt Đầu:</strong> ${schedule.start_time}</li>
                <li class="list-group-item"><strong>Thời Gian Kết Thúc:</strong> ${schedule.end_time}</li>
            </ul>
        </div>
    </div>

    <!-- Nút hành động -->
    <div class="d-flex justify-content-center mt-3">
        <a href="schedules" class="btn btn-primary me-2">Quay Lại</a>
        <a href="schedules?action=edit&schedule_id=${schedule.schedule_id}" class="btn btn-warning">Sửa</a>
    </div>
</div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
