<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Thêm Điểm Mới</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2>Thêm Điểm Mới</h2>
    <form action="/grades?action=add" method="post">
        <div class="mb-3">
            <label for="student_id" class="form-label">Học Sinh</label>
            <select name="student_id" id="student_id" class="form-select" required>
                <c:forEach var="student" items="${students}">
                    <option value="${student.id}">${student.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="subject_id" class="form-label">Môn Học</label>
            <select name="subject_id" id="subject_id" class="form-select" required>
                <c:forEach var="subject" items="${subjects}">
                    <option value="${subject.subject_id}">${subject.subject_name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="score" class="form-label">Điểm</label>
            <input type="number" name="score" id="score" class="form-control" step="0.1" required>
        </div>
        <div class="mb-3">
            <label for="exam_type" class="form-label">Loại Kỳ Thi</label>
            <select name="exam_type" id="exam_type" class="form-select" required>
                <option value="Regular">Regular</option>
                <option value="Midterm">Midterm</option>
                <option value="Final">Final</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Thêm Điểm</button>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>