<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Danh sách Lớp học</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
  <h2 class="text-center">Danh sách Lớp học</h2>
  <a href="classes?action=new" class="btn btn-primary">Thêm Lớp</a>
  <table class="table table-bordered mt-3">
    <thead class="table-primary">
    <tr>
      <th>ID</th>
      <th>Tên Lớp</th>
      <th>Giáo viên</th>
      <th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="classes" items="${classList}">
      <tr>
        <td>${classes.classes.id}</td>
        <td>${classes.name}</td>
        <td>${classes.teacher.id}</td>
        <td>
          <a href="classes?action=edit&id=${classes.id}" class="btn btn-warning">Sửa</a>
          <a href="classes?action=delete&id=${classes.id}" class="btn btn-danger">Xóa</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>
