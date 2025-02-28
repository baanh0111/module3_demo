<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Danh Sách Lịch Học</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .table-hover tbody tr:hover {
            background-color: #e9ecef;
            transition: 0.3s;
        }
        .card {
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .modal-content {
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
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2 class="text-center flex-grow-1">Danh Sách Lịch Học</h2>
        <button class="btn btn-secondary me-2" onclick="window.location.href='/';">Trang Chủ</button>
        <a href="schedules?action=create" class="btn btn-primary">Thêm Mới</a>
    </div>

    <!-- Bảng danh sách lịch học -->
    <div class="card p-3">
        <table class="table table-bordered table-hover">
            <thead class="table-primary">
            <tr class="text-center">
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
                <tr class="text-center">
                    <td>${loop.count}</td>
                    <td>${schedule.class_name}</td>
                    <td>${schedule.subject_name}</td>
                    <td>${schedule.day_of_week}</td>
                    <td>${schedule.start_time}</td>
                    <td>${schedule.end_time}</td>
                    <td>
                        <a href="schedules?action=details&schedule_id=${schedule.schedule_id}" class="btn btn-info btn-sm">Chi tiết</a>
                        <a href="schedules?action=edit&schedule_id=${schedule.schedule_id}" class="btn btn-warning btn-sm">Sửa</a>
                        <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#delete${schedule.schedule_id}">
                            Xóa
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Modal xác nhận xóa -->
    <c:forEach var="schedule" items="${schedules}">
        <div class="modal fade" id="delete${schedule.schedule_id}" tabindex="-1" aria-labelledby="modalLabel${schedule.schedule_id}" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-danger text-white">
                        <h5 class="modal-title" id="modalLabel${schedule.schedule_id}">Xóa Lịch Học</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                        <p>Bạn có chắc chắn muốn xóa lịch học của lớp <strong>${schedule.class_name}</strong> - môn <strong>${schedule.subject_name}</strong> không?</p>
                        <p class="text-danger"><i>Hành động này không thể hoàn tác!</i></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                        <a href="schedules?action=delete&schedule_id=${schedule.schedule_id}" class="btn btn-danger">Xác nhận</a>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>

    <!-- Hiển thị thông báo -->
    <c:if test="${message != null}">
        <div class="alert alert-success text-center mt-3" role="alert" id="alert-message">
                ${message}
        </div>
    </c:if>
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
