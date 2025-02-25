<%@ page import="org.example.demo1.entity.Teacher" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thêm lớp học</title>
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
    <h2 class="text-center mb-4">Thêm lớp học</h2>
    <form method="post">
        <div class="mb-3">
            <label for="className" class="form-label">Tên lớp</label>
            <input type="text" class="form-control" id="className" name="name" placeholder="Nhập tên lớp" required>
        </div>

        <div class="mb-3">
            <label for="teacher" class="form-label">Giáo viên phụ trách</label>
            <select class="form-select" id="teacher" name="teacherId" required>
                <option value="" disabled selected>Chọn giáo viên(Giáo viên chưa phụ trách lớp nào)</option>
                <% List<Teacher> teachers = (List<Teacher>) request.getAttribute("teachers");
                    for (Teacher teacher : teachers) { %>
                <option value="<%= teacher.getId() %>"><%= teacher.getName() %></option>
                <% } %>
            </select>
        </div>

        <div class="d-flex justify-content-between">
            <a href="/classes" class="btn btn-secondary">Quay lại</a>
            <button type="submit" class="btn btn-primary">Thêm lớp</button>
        </div>
    </form>
</div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
