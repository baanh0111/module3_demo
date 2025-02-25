<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thêm Mới Lịch Học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <style>
        input[type="text"].flatpickr-input {
            width: 100%;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Thêm Mới Lịch Học</h2>
    <form action="schedules?action=create" method="post">
        <div class="mb-3">
            <label for="class_id" class="form-label">Lớp Học</label>
            <select class="form-select" id="class_id" name="class_id" required>
                <option value="">-- Chọn lớp --</option>
                <c:forEach var="clazz" items="${classes}">
                    <option value="${clazz.class_id}">${clazz.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="subject_id" class="form-label">Môn Học</label>
            <select class="form-select" id="subject_id" name="subject_id" required>
                <option value="">-- Chọn môn --</option>
                <c:forEach var="subject" items="${subjects}">
                    <option value="${subject.subject_id}">${subject.subject_name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="day_of_week" class="form-label">Ngày Trong Tuần</label>
            <select class="form-select" id="day_of_week" name="day_of_week" required>
                <option value="">-- Chọn ngày --</option>
                <option value="Monday">Thứ 2</option>
                <option value="Tuesday">Thứ 3</option>
                <option value="Wednesday">Thứ 4</option>
                <option value="Thursday">Thứ 5</option>
                <option value="Friday">Thứ 6</option>
                <option value="Saturday">Thứ 7</option>
                <option value="Sunday">Chủ nhật</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="start_time" class="form-label">Thời Gian Bắt Đầu (HH:MM:SS) <span style="color: red;">*</span></label>
            <input type="text" class="form-control flatpickr-input" id="start_time" name="start_time" required>
        </div>
        <div class="mb-3">
            <label for="end_time" class="form-label">Thời Gian Kết Thúc (HH:MM:SS) <span style="color: red;">*</span></label>
            <input type="text" class="form-control flatpickr-input" id="end_time" name="end_time" required>
        </div>
        <button type="submit" class="btn btn-primary">Lưu</button>
        <a href="schedules" class="btn btn-secondary">Hủy</a>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
    // Cấu hình flatpickr để hiển thị và gửi định formato HH:MM:SS (24 giờ)
    flatpickr("#start_time", {
        enableTime: true,
        noCalendar: true,
        dateFormat: "H:i:S", // Định dạng 24 giờ (HH:MM:SS)
        time_24hr: true,
        minuteIncrement: 1,
        secondIncrement: 1, // Cho phép nhập giây
        defaultHour: 9, // Giá trị mặc định là 9:00:00
        defaultMinute: 0,
        defaultSecond: 0,
        onClose: function(selectedDates, dateStr, instance) {
            let time = dateStr;
            if (time) {
                // Đảm bảo định dạng HH:MM:SS, nếu chỉ nhập HH:MM thì thêm :00
                let parts = time.split(':');
                if (parts.length === 2) {
                    time = time + ':00'; // Thêm giây mặc định là 00 nếu chỉ nhập HH:MM
                }
                document.getElementById('start_time').value = time; // Gửi HH:MM:SS
            } else {
                document.getElementById('start_time').value = '09:00:00'; // Giá trị mặc định nếu không chọn
            }
        }
    });

    flatpickr("#end_time", {
        enableTime: true,
        noCalendar: true,
        dateFormat: "H:i:S", // Định dạng 24 giờ (HH:MM:SS)
        time_24hr: true,
        minuteIncrement: 1,
        secondIncrement: 1, // Cho phép nhập giây
        defaultHour: 10, // Giá trị mặc định là 10:00:00
        defaultMinute: 0,
        defaultSecond: 0,
        onClose: function(selectedDates, dateStr, instance) {
            let time = dateStr;
            if (time) {
                let parts = time.split(':');
                if (parts.length === 2) {
                    time = time + ':00'; // Thêm giây mặc định là 00 nếu chỉ nhập HH:MM
                }
                document.getElementById('end_time').value = time; // Gửi HH:MM:SS
            } else {
                document.getElementById('end_time').value = '10:00:00'; // Giá trị mặc định nếu không chọn
            }
        }
    });

    // Validation trước khi submit
    document.querySelector('form').addEventListener('submit', function(e) {
        const startTime = document.getElementById('start_time').value;
        const endTime = document.getElementById('end_time').value;
        if (!startTime || !endTime) {
            alert('Vui lòng nhập thời gian bắt đầu và kết thúc!');
            e.preventDefault();
            return false;
        }
        const timeRegex = /^([0-1][0-9]|2[0-3]):[0-5][0-9](:[0-5][0-9])?$/; // Cho phép HH:MM hoặc HH:MM:SS
        if (!timeRegex.test(startTime) || !timeRegex.test(endTime)) {
            alert('Thời gian phải có định dạng HH:MM hoặc HH:MM:SS (ví dụ: 09:30 hoặc 09:30:00)!');
            e.preventDefault();
            return false;
        }
        const [startHour, startMin] = startTime.split(':').slice(0, 2).map(Number); // Chỉ lấy giờ và phút
        const [endHour, endMin] = endTime.split(':').slice(0, 2).map(Number); // Chỉ lấy giờ và phút
        if (endHour * 60 + endMin <= startHour * 60 + startMin) {
            alert('Thời gian kết thúc phải lớn hơn thời gian bắt đầu!');
            e.preventDefault();
            return false;
        }
    });
</script>
</body>
</html>