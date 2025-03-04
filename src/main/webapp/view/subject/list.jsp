<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Danh sách môn học</title>
  <!-- Bootstrap 5 CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-4">
  <h2 class="text-center">Danh sách môn học</h2>

  <!-- Home Button -->
  <button class="btn btn-info mb-3" onclick="window.location.href='/';">Home</button>

  <!-- Add New Subject Button -->
  <button class="btn btn-primary mb-3" onclick="window.location.href='/subjects?action=create';">Thêm mới</button>

  <table class="table table-bordered table-hover">
    <thead class="table-primary">
    <tr>
      <th>STT</th>
      <th>Tên môn học</th>
      <th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="subject" items="${subjects}" varStatus="status">
      <tr>
        <td>${subject.id}</td>
        <td>${subject.name}</td>
        <td>

          <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#delete${subject.id}">
            Xóa
          </button>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>

  <c:forEach var="subject" items="${subjects}">
    <div class="modal fade" id="delete${subject.id}" tabindex="-1" aria-labelledby="modalLabel${subject.id}" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="modalLabel${subject.id}">Xóa môn học</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            Bạn có chắc chắn muốn xóa môn học <strong>${subject.name}</strong> không?
            <br>
            <i style="color: red">Hành động này không thể hoàn tác!</i>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
            <a href="/subjects?action=delete&id=${subject.id}" class="btn btn-primary">Xác nhận</a>
          </div>
        </div>
      </div>
    </div>
  </c:forEach>

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
