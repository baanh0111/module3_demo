<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Danh Sách Lớp Học</title>

  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      background-color: #f8f9fa;
    }
    .card:hover {
      transform: scale(1.05);
      transition: 0.3s;
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
<div class="container mt-5">
  <h2 class="text-center mb-4">Danh Sách Lớp Học</h2>

  <button class="btn btn-success mb-4" onclick="window.location.href='/classes?action=create';">➕ Thêm Lớp Mới</button>

  <div class="row">
    <c:forEach var="clazz" items="${classes}" varStatus="status">
      <div class="col-md-4 mb-3">
        <div class="card shadow">
          <div class="card-body text-center">
            <h5 class="card-title">📚 ${clazz.name}</h5>
            <p class="card-text"><strong>Giáo Viên:</strong> ${clazz.teacher.name}</p>
            <p class="card-text"><strong>Học Sinh:</strong> ${clazz.students != null ? clazz.students.size() : 0}</p>
            <a href="/classes?action=details&class_id=${clazz.class_id}" class="btn btn-info btn-sm">📄 Chi tiết</a>
            <a href="/classes?action=edit&class_id=${clazz.class_id}" class="btn btn-warning btn-sm">✏️ Sửa</a>
            <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#delete${clazz.class_id}">
              ❌ Xóa
            </button>
          </div>
        </div>
      </div>

      <!-- Modal xác nhận xóa -->
      <div class="modal fade" id="delete${clazz.class_id}" tabindex="-1" aria-labelledby="modalLabel${clazz.class_id}" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="modalLabel${clazz.class_id}">Xóa lớp học</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              Bạn có chắc chắn muốn xóa lớp <strong>${clazz.name}</strong> không?
              <br>
              <i class="text-danger">Hành động này không thể hoàn tác!</i>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
              <a href="/classes?action=delete&class_id=${clazz.class_id}" class="btn btn-danger">Xác nhận</a>
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>

  <c:if test="${message != null}">
    <div class="alert alert-success text-center" role="alert" id="alert-message">
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
