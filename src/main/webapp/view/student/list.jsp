<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Danh sách học sinh</title>
  <!-- Bootstrap 5 CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
  <h2 class="text-center">Danh sách học sinh</h2>
  <button class="btn btn-primary" onclick="window.location.href='/students?action=create';">Thêm mới</button>
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
    <c:forEach var="student" items="${students}" varStatus="status">
      <tr>
        <td>${student.id}</td>
        <td>${student.name}</td>
        <td>${student.dob}</td>
        <td>${student.gender}</td>
        <td>${student.address}</td>
        <td>${student.phone}</td>
        <td>${student.email}</td>
        <td>
          <a href="/students?action=edit&id=${student.id}" class="btn btn-warning">Sửa</a>
          <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#delete${student.id}">
            Xóa
          </button>
        </td>

      </tr>

      <!-- Modal xác nhận xóa -->
      <div class="modal fade" id="delete${student.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Xóa học sinh</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              Bạn có chắc chắn muốn xóa học sinh <strong>${student.name}</strong> không?
              <br>
              <i style="color: red">Hành động này không thể hoàn tác!</i>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
              <a href="/students?action=delete&id=${student.id}" class="btn btn-primary">Xác nhận</a>
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
    </tbody>
  </table>

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

