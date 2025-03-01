<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sửa Điểm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Sửa Điểm</h2>
    <form action="/grades?action=update" method="post">
        <input type="hidden" name="grade_id" value="${grade.grade_id}">
        <div class="mb-3">
            <label for="student_id" class="form-label">Học Sinh</label>
            <select class="form-select" id="student_id" name="student_id" required>
                <option value="">-- Chọn học sinh --</option>
                <c:forEach var="student" items="${students}">
                    <option value="${student.id}" ${student.id == grade.student_id ? 'selected' : ''}>
                            ${student.name}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="subject_id" class="form-label">Môn Học</label>
            <select class="form-select" id="subject_id" name="subject_id" required>
                <option value="">-- Chọn môn --</option>
                <c:forEach var="subject" items="${subjects}">
                    <option value="${subject.subject_id}" ${subject.subject_id == grade.subject_id ? 'selected' : ''}>
                            ${subject.subject_name}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="score" class="form-label">Điểm Số</label>
            <input type="number" class="form-control" id="score" name="score" step="0.25" min="0" max="10"
                   value="${grade.score}" required>
        </div>
        <div class="mb-3">
            <label for="exam_type" class="form-label">Loại Kỳ Thi</label>
            <select class="form-select" id="exam_type" name="exam_type" required>
                <option value="">-- Chọn loại kỳ thi --</option>
                <option value="Regular" ${grade.exam_type == 'Regular' ? 'selected' : ''}>Regular</option>
                <option value="Midterm" ${grade.exam_type == 'Midterm' ? 'selected' : ''}>Midterm</option>
                <option value="Final" ${grade.exam_type == 'Final' ? 'selected' : ''}>Final</option>
            </select>
        </div>
        <button type="submit" class="btn btn-primary">Cập Nhật Điểm</button>
        <a href="/grades?action=list" class="btn btn-secondary">Hủy</a>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>