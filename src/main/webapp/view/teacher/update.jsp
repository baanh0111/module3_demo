<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <title>Cập Nhật Giáo Viên</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
  <h2 class="text-center">Cập Nhật Giáo Viên</h2>
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
      <select class="form-control" name="gender" required>
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
      <input type="text" class="form-control" name="phone" value="${teacher.phone}" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Email</label>
      <input type="email" class="form-control" name="email" value="${teacher.email}" required>
    </div>

    <button type="submit" class="btn btn-primary">Cập Nhật</button>
    <a href="teachers" class="btn btn-secondary">Hủy</a>
  </form>
</div>
</body>
</html>
