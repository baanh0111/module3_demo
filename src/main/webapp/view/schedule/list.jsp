<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Danh Sách Lịch Học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Danh Sách Lịch Học</h2>
    <a href="schedules?action=create" class="btn btn-primary mb-3">Thêm Mới</a>
    <table class="table table-striped">
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
                    <a href="schedules?action=details&schedule_id=${schedule.schedule_id}" class="btn btn-info">Chi tiết</a>
                    <a href="schedules?action=edit&schedule_id=${schedule.schedule_id}" class="btn btn-warning">Sửa</a>
                    <a href="schedules?action=delete&schedule_id=${schedule.schedule_id}" class="btn btn-danger" onclick="return confirm('Bạn có chắc muốn xóa?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>