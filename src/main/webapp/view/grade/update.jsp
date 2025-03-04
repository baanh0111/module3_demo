<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sửa Điểm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', 'sans-serif', 'Roboto', 'Helvetica', 'Times New Roman'; /* Font hỗ trợ tiếng Việt */
            background-color: #f8f9fa; /* Màu nền nhẹ */
        }
        .container {
            max-width: 600px; /* Giới hạn chiều rộng nhỏ hơn để phù hợp với form */
            background-color: #ffffff; /* Nền trắng cho container */
            padding: 20px;
            border-radius: 10px; /* Bo góc */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Đổ bóng nhẹ */
            margin-top: 50px; /* Khoảng cách trên lớn hơn */
        }
        h2 {
            color: #343a40; /* Màu chữ đậm */
            font-weight: bold;
        }
        .btn-primary, .btn-secondary, .btn-info {
            border-radius: 5px; /* Bo góc nút */
            padding: 8px 16px; /* Tăng padding cho nút */
            transition: all 0.3s ease; /* Hiệu ứng mượt mà */
        }
        .btn-primary:hover, .btn-secondary:hover, .btn-info:hover {
            opacity: 0.9; /* Hiệu ứng hover */
        }
        .form-control, .form-select {
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Sửa Điểm</h2>
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
                <option value="">-- Chọn môn học --</option>
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

        <!-- Nút Home, Quay lại và Cập Nhật -->
        <div class="d-flex justify-content-between">
            <div>
                <button type="button" class="btn btn-info me-2" onclick="window.location.href='/';">Home</button>
                <a href="/grades?action=list" class="btn btn-secondary">Quay lại</a>
            </div>
            <button type="submit" class="btn btn-primary">Cập Nhật Điểm</button>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>