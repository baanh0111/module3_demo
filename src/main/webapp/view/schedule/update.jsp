<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Cập Nhật Lịch Học</title>
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
        input[type="time"] {
            width: 100%;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
        }
        input[type="time"]::-webkit-calendar-picker-indicator {
            filter: invert(1);
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center mb-4">Cập Nhật Lịch Học</h2>
    <form action="schedules?action=edit" method="post">
        <input type="hidden" name="schedule_id" value="${schedule.schedule_id}">
        <div class="mb-3">
            <label for="class_id" class="form-label">Lớp Học</label>
            <select class="form-select" id="class_id" name="class_id" required>
                <option value="">-- Chọn lớp --</option>
                <c:forEach var="clazz" items="${classes}">
                    <option value="${clazz.class_id}" ${clazz.class_id == schedule.class_id ? 'selected' : ''}>
                            ${clazz.name}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="subject_id" class="form-label">Môn Học</label>
            <select class="form-select" id="subject_id" name="subject_id" required>
                <option value="">-- Chọn môn học --</option>
                <c:forEach var="subject" items="${subjects}">
                    <option value="${subject.subject_id}" ${subject.subject_id == schedule.subject_id ? 'selected' : ''}>
                            ${subject.subject_name}
                    </option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="day_of_week" class="form-label">Ngày Trong Tuần</label>
            <select class="form-select" id="day_of_week" name="day_of_week" required>
                <option value="">-- Chọn ngày --</option>
                <option value="Monday" ${schedule.day_of_week == 'Monday' ? 'selected' : ''}>Thứ 2</option>
                <option value="Tuesday" ${schedule.day_of_week == 'Tuesday' ? 'selected' : ''}>Thứ 3</option>
                <option value="Wednesday" ${schedule.day_of_week == 'Wednesday' ? 'selected' : ''}>Thứ 4</option>
                <option value="Thursday" ${schedule.day_of_week == 'Thursday' ? 'selected' : ''}>Thứ 5</option>
                <option value="Friday" ${schedule.day_of_week == 'Friday' ? 'selected' : ''}>Thứ 6</option>
                <option value="Saturday" ${schedule.day_of_week == 'Saturday' ? 'selected' : ''}>Thứ 7</option>
                <option value="Sunday" ${schedule.day_of_week == 'Sunday' ? 'selected' : ''}>Chủ nhật</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="start_time" class="form-label">Thời Gian Bắt Đầu (HH:MM)</label>
            <input type="time" class="form-control" id="start_time" name="start_time" value="${schedule.start_time.toString().substring(0, 5)}" required>
        </div>
        <div class="mb-3">
            <label for="end_time" class="form-label">Thời Gian Kết Thúc (HH:MM)</label>
            <input type="time" class="form-control" id="end_time" name="end_time" value="${schedule.end_time.toString().substring(0, 5)}" required>
        </div>

        <!-- Nút Home, Hủy và Cập Nhật -->
        <div class="d-flex justify-content-between">
            <div>
                <button type="button" class="btn btn-info me-2" onclick="window.location.href='/';">Home</button>
                <a href="schedules" class="btn btn-secondary">Hủy</a>
            </div>
            <button type="submit" class="btn btn-primary">Cập Nhật</button>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>