<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Danh sách lớp học</title>
  <!-- Bootstrap 5 CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Arial', 'sans-serif', 'Roboto', 'Helvetica', 'Times New Roman'; /* Font hỗ trợ tiếng Việt */
    }
  </style>
</head>
<body>
<div class="container mt-4">
  <h2 class="text-center mb-4">Danh sách lớp học</h2>
  <button class="btn btn-primary mb-3" onclick="window.location.href='/classes?action=create';">Thêm mới</button>

  <table class="table table-bordered table-hover">
    <thead class="table-primary">
    <tr class="text-center">
      <th>STT</th>
      <th>Tên lớp</th>
      <th>Giáo viên phụ trách</th>
      <th>Số lượng học sinh</th>
      <th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="clazz" items="${classes}" varStatus="status">
      <tr class="text-center">
        <td>${status.index + 1}</td>
        <td>${clazz.name}</td>
        <td>${clazz.teacher.name}</td>
        <td>${clazz.students != null ? clazz.students.size() : 0}</td>
        <td>
          <a href="/classes?action=details&class_id=${clazz.class_id}" class="btn btn-info btn-sm">Chi tiết</a>
          <a href="/classes?action=edit&class_id=${clazz.class_id}" class="btn btn-warning btn-sm">Sửa</a>
          <button type="button" class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#delete${clazz.class_id}"> <!-- Sử dụng class_id -->
            Xóa
          </button>
        </td>
      </tr>

      <!-- Modal xác nhận xóa -->
      <div class="modal fade" id="delete${clazz.class_id}" tabindex="-1" aria-labelledby="modalLabel${clazz.class_id}" aria-hidden="true"> <!-- Sử dụng class_id -->
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="modalLabel${clazz.class_id}">Xóa lớp học</h5> <!-- Sử dụng class_id -->
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              Bạn có chắc chắn muốn xóa lớp <strong>${clazz.name}</strong> không?
              <br>
              <i class="text-danger">Hành động này không thể hoàn tác!</i>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
              <a href="/classes?action=delete&class_id=${clazz.class_id}" class="btn btn-danger">Xác nhận</a> <!-- Sử dụng class_id -->
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
    </tbody>
  </table>

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