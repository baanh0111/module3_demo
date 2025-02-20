<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Danh sách giáo viên</title>
  <!-- Bootstrap 5 CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
  <h2 class="text-center">Danh sách giáo viên</h2>
  <button class="btn btn-primary" onclick="window.location.href='/teachers?action=create';">Thêm mới</button>
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
          <button type="button" class="btn btn-warning" onclick="window.location.href='/teachers?action=update&id=${teacher.id}';">
            Cập nhật
          </button>
          <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#delete${teacher.id}">
            Xóa
          </button>
        </td>

        <div class="modal fade" id="delete${teacher.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Xóa giáo viên</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                Bạn có muốn xóa giáo viên có tên là ${teacher.name} không?
                <br>
                <i style="color: red">Hành động này không thể hoàn tác!!!!</i>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" onclick="window.location.href='/teachers?action=delete&id=${teacher.id}';">Xác nhận</button>
              </div>
            </div>
          </div>
        </div>
      </tr>
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
    document.getElementById('alert-message').style.display = 'none';
  }, 3000)
</script>
</body>
</html>
