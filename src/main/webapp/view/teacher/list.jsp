<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Danh sách giáo viên</title>
  <!-- Bootstrap 5 CDN -->
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
    .btn-primary, .btn-success, .btn-warning, .btn-danger, .btn-info {
      border-radius: 5px; /* Bo góc nút */
      padding: 6px 12px; /* Tăng padding cho nút */
      transition: all 0.3s ease; /* Hiệu ứng mượt mà */
    }
    .btn-primary:hover, .btn-success:hover, .btn-warning:hover, .btn-danger:hover, .btn-info:hover {
      opacity: 0.9; /* Hiệu ứng hover */
    }
    .form-control {
      border-radius: 5px;
    }
    .table {
      border-radius: 5px;
      overflow: hidden; /* Đảm bảo bo góc không bị cắt */
    }
    .table-primary {
      background-color: #007bff; /* Màu xanh đậm cho header */
      color: white;
    }
    .alert {
      border-radius: 5px;
      margin-top: 15px;
    }
    .modal-content {
      border-radius: 10px;
    }
    .modal-header {
      background-color: #dc3545; /* Màu đỏ cho header modal xóa */
      color: white;
      border-bottom: none;
    }
    .modal-footer {
      border-top: none;
    }
  </style>
</head>
<body>
<div class="container mt-4">
  <h2 class="text-center mb-4">Danh sách giáo viên</h2>

  <!-- Nút Home và Thêm mới -->
  <div class="d-flex justify-content-between mb-3">
    <div>
      <button class="btn btn-info me-2" onclick="window.location.href='/';">Home</button>
      <button class="btn btn-primary" onclick="window.location.href='/teachers?action=create';">Thêm mới</button>
    </div>
  </div>

  <!-- Bảng danh sách giáo viên -->
  <table class="table table-bordered table-hover">
    <thead class="table-primary">
    <tr>
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
      <tr>
        <td>${teacher.id}</td>
        <td>${teacher.name}</td>
        <td>${teacher.dob}</td>
        <td>${teacher.gender}</td>
        <td>${teacher.address}</td>
        <td>${teacher.phone}</td>
        <td>${teacher.email}</td>
        <td>
          <button type="button" class="btn btn-warning btn-sm" onclick="window.location.href='/teachers?action=update&id=${teacher.id}';">
            Cập nhật
          </button>
          <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#delete${teacher.id}">
            Xóa
          </button>
        </td>
      </tr>

      <!-- Modal xác nhận xóa -->
      <div class="modal fade" id="delete${teacher.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Xóa giáo viên</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              Bạn có chắc chắn muốn xóa giáo viên <strong>${teacher.name}</strong> không?
              <br>
              <i style="color: red">Hành động này không thể hoàn tác!</i>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
              <button type="button" class="btn btn-primary" onclick="window.location.href='/teachers?action=delete&id=${teacher.id}';">Xác nhận</button>
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
    </tbody>
  </table>

  <!-- Thông báo -->
  <c:if test="${message != null}">
    <div class="alert alert-success" role="alert" id="alert-message">
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