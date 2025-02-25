<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Chi Tiết Lịch Học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Chi Tiết Lịch Học</h2>
    <div class="card">
        <div class="card-body">
            <p><strong>ID Lịch Học:</strong> ${schedule.schedule_id}</p>
            <p><strong>Tên Lớp:</strong> ${schedule.class_name}</p>
            <p><strong>Môn Học:</strong> ${schedule.subject_name}</p>
            <p><strong>Ngày Trong Tuần:</strong> ${schedule.day_of_week}</p>
            <p><strong>Thời Gian Bắt Đầu:</strong> ${schedule.start_time}</p>
            <p><strong>Thời Gian Kết Thúc:</strong> ${schedule.end_time}</p>
            <a href="schedules" class="btn btn-secondary">Quay Lại</a>
            <a href="schedules?action=edit&schedule_id=${schedule.schedule_id}" class="btn btn-warning">Sửa</a>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>