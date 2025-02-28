<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Quản Lý Giáo Viên</title>

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
    <h2 class="text-center flex-grow-1">Danh sách giáo viên</h2>
    <button class="btn btn-secondary me-2" onclick="window.location.href='/';">Trang Chủ</button>
    <button class="btn btn-primary" onclick="window.location.href='/teachers?action=create';">Thêm mới</button>
  </div>

  <!-- Bảng danh sách giáo viên -->
  <div class="card p-3">
    <table class="table table-bordered table-hover">
      <thead class="table-primary">
      <tr class="text-center">
        <th>STT</th>
        <th>Họ và tên</th>
        <th>Ngày sinh</th>
        <th>Giới tính</th>
        <th>Địa chỉ</th>
        <th>Số điện thoại</th>
        <th>Email</th>
        <th>Hành động</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="teacher" items="${teachers}" varStatus="status">
        <tr class="text-center">
          <td>${status.index + 1}</td>
          <td>${teacher.name}</td>
          <td>${teacher.dob}</td>
          <td>${teacher.gender}</td>
          <td>${teacher.address}</td>
          <td>${teacher.phone}</td>
          <td>${teacher.email}</td>
          <td>
            <a href="/teachers?action=update&id=${teacher.id}" class="btn btn-warning btn-sm">Sửa</a>
            <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#delete${teacher.id}">Xóa</button>
          </td>
        </tr>

        <!-- Modal xác nhận xóa -->
        <div class="modal fade" id="delete${teacher.id}" tabindex="-1" aria-labelledby="modalLabel${teacher.id}" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header bg-danger text-white">
                <h5 class="modal-title" id="modalLabel${teacher.id}">Xóa giáo viên</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body text-center">
                <p>Bạn có chắc chắn muốn xóa giáo viên <strong>${teacher.name}</strong> không?</p>
                <p class="text-danger"><i>Hành động này không thể hoàn tác!</i></p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                <a href="/teachers?action=delete&id=${teacher.id}" class="btn btn-danger">Xác nhận</a>
              </div>
            </div>
          </div>
        </div>
      </c:forEach>
      </tbody>
    </table>
  </div>

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
