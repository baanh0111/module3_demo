<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Danh sách học phí</title>
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
    .btn-primary, .btn-warning, .btn-danger, .btn-info {
      border-radius: 5px; /* Bo góc nút */
      padding: 6px 12px; /* Tăng padding cho nút */
      transition: all 0.3s ease; /* Hiệu ứng mượt mà */
    }
    .btn-primary:hover, .btn-warning:hover, .btn-danger:hover, .btn-info:hover {
      opacity: 0.9; /* Hiệu ứng hover */
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
    .badge {
      font-size: 0.9em;
    }
  </style>
</head>
<body>
<div class="container mt-4">
  <h2 class="text-center mb-4">Danh sách học phí</h2>

  <!-- Nút Home và Thêm mới -->
  <div class="d-flex justify-content-between mb-3">
    <div>
      <button class="btn btn-info me-2" onclick="window.location.href='/home';">Home</button>
      <button class="btn btn-primary" onclick="window.location.href='/tuitions?action=create';">Thêm mới</button>
    </div>
  </div>

  <!-- Bảng danh sách học phí -->
  <table class="table table-bordered table-hover">
    <thead class="table-primary">
    <tr class="text-center">
      <th>STT</th>
      <th>Tên sinh viên</th>
      <th>Số tiền</th>
      <th>Ngày hết hạn</th>
      <th>Trạng thái</th>
      <th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="tuition" items="${tuitions}" varStatus="status">
      <tr class="text-center">
        <td>${status.index + 1}</td>
        <td>${tuition.student.name}</td>
        <td>${tuition.amount}</td>
        <td>${tuition.dueDate}</td>
        <td>
                    <span class="badge ${tuition.paidStatus == 'PAID' ? 'bg-success' : 'bg-danger'}">
                        ${tuition.paidStatus == 'PAID' ? 'Đã thanh toán' : 'Chưa thanh toán'}
                    </span>
        </td>
        <td>
          <a href="/tuitions?action=update&id=${tuition.tuitionId}" class="btn btn-warning btn-sm">Sửa</a>
          <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#delete${tuition.tuitionId}">Xóa</button>
        </td>
      </tr>

      <!-- Modal xác nhận xóa -->
      <div class="modal fade" id="delete${tuition.tuitionId}" tabindex="-1" aria-labelledby="modalLabel${tuition.tuitionId}" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="modalLabel${tuition.tuitionId}">Xóa học phí</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              Bạn có chắc chắn muốn xóa học phí của sinh viên <strong>${tuition.student.name}</strong> không?
              <br>
              <i class="text-danger">Hành động này không thể hoàn tác!</i>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
              <a href="/tuitions?action=delete&id=${tuition.tuitionId}" class="btn btn-danger">Xác nhận</a>
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
    </tbody>
  </table>

  <!-- Thông báo -->
  <c:if test="${message != null}">
    <div class="alert alert-success text-center" role="alert" id="alert-message">
        ${message}
    </div>
  </c:if>
</div>

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