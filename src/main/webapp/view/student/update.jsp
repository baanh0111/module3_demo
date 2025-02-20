<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Cập Nhật Học Sinh</title>
  <!-- Bootstrap 5 CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
  <h2 class="text-center">Cập Nhật Học Sinh</h2>
  <form action="students?action=update" method="post">
    <input type="hidden" name="id" value="${student.id}">

    <div class="mb-3">
      <label for="name" class="form-label">Họ và tên</label>
      <input type="text" class="form-control" id="name" name="name" value="${student.name}" required>
    </div>

    <div class="mb-3">
      <label for="dob" class="form-label">Ngày sinh</label>
      <input type="date" class="form-control" id="dob" name="dob" value="${student.dob}" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Giới tính</label>
      <div>
        <input type="radio" id="male" name="gender" value="Male" ${student.gender == 'Male' ? 'checked' : ''} required>
        <label for="male">Nam</label>

        <input type="radio" id="female" name="gender" value="Female" ${student.gender == 'Female' ? 'checked' : ''} required>
        <label for="female">Nữ</label>

        <input type="radio" id="other" name="gender" value="Other" ${student.gender == 'Other' ? 'checked' : ''} required>
        <label for="other">Khác</label>
      </div>
    </div>

    <div class="mb-3">
      <label for="address" class="form-label">Địa chỉ</label>
      <input type="text" class="form-control" id="address" name="address" value="${student.address}" required>
    </div>

    <div class="mb-3">
      <label for="phone" class="form-label">Số điện thoại</label>
      <input type="text" class="form-control" id="phone" name="phone" value="${student.phone}" required>
    </div>

    <div class="mb-3">
      <label for="email" class="form-label">Email</label>
      <input type="email" class="form-control" id="email" name="email" value="${student.email}" required>
    </div>

    <button type="submit" class="btn btn-primary">Cập Nhật</button>
    <a href="students" class="btn btn-secondary">Hủy</a>
  </form>
</div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
