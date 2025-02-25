<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cập Nhật Lớp Học</title>
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
    <h2 class="text-center">Cập Nhật Lớp Học</h2>
    <form action="classes?action=update" method="post">
        <input type="hidden" name="class_id" value="${clazz.class_id}">

        <div class="mb-3">
            <label for="name" class="form-label">Tên Lớp</label>
            <input type="text" class="form-control" id="name" name="name" value="${clazz.name}" required>
        </div>

        <div class="mb-3">
            <label for="teacher_id" class="form-label">Giáo Viên Phụ Trách</label>
            <select class="form-select" id="teacher_id" name="teacher_id" required>
                <option value="">-- Chọn giáo viên --</option>
                <c:forEach var="teacher" items="${teachers}">
                    <option value="${teacher.id}" ${teacher.id == clazz.teacher.id ? 'selected' : ''}>
                            ${teacher.name}
                    </option>
                </c:forEach>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Cập Nhật</button>
        <a href="classes" class="btn btn-secondary">Hủy</a>
    </form>
</div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>