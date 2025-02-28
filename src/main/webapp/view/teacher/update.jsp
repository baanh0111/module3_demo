<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Cập Nhật Giáo Viên</title>

  <!-- Bootstrap 5 -->
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
    <a class="navbar-brand" href="#">Quản Lý Giáo Viên</a>
  </div>
</nav>

<!-- Main Content -->
<div class="container mt-4">
  <h2 class="text-center text-primary">Cập Nhật Giáo Viên</h2>

  <div class="card p-4">
    <form action="teachers?action=update" method="post">
      <input type="hidden" name="id" value="${teacher.id}">

      <div class="mb-3">
        <label class="form-label">Họ và tên</label>
        <input type="text" class="form-control" name="name" value="${teacher.name}" required>
      </div>

      <div class="mb-3">
        <label class="form-label">Ngày sinh</label>
        <input type="date" class="form-control" name="dob" value="${teacher.dob}" required>
      </div>

      <div class="mb-3">
        <label class="form-label">Giới tính</label>
        <select class="form-select" name="gender" required>
          <option value="Male" ${teacher.gender == 'Male' ? 'selected' : ''}>Nam</option>
          <option value="Female" ${teacher.gender == 'Female' ? 'selected' : ''}>Nữ</option>
          <option value="Other" ${teacher.gender == 'Other' ? 'selected' : ''}>Khác</option>
        </select>
      </div>

      <div class="mb-3">
        <label class="form-label">Địa chỉ</label>
        <input type="text" class="form-control" name="address" value="${teacher.address}" required>
      </div>

      <div class="mb-3">
        <label class="form-label">Số điện thoại</label>
        <input type="tel" class="form-control" name="phone" value="${teacher.phone}" required>
      </div>

      <div class="mb-3">
        <label class="form-label">Email</label>
        <input type="email" class="form-control" name="email" value="${teacher.email}" required>
      </div>

      <!-- Nút Hủy và Cập Nhật -->
      <div class="d-flex justify-content-between">
        <a href="teachers" class="btn btn-secondary">Hủy</a>
        <button type="submit" class="btn btn-primary">Cập Nhật</button>
      </div>
    </form>
  </div>
</div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
