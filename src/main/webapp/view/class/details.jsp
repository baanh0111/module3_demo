<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết lớp học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Arial', 'sans-serif', 'Roboto', 'Helvetica', 'Times New Roman'; /* Font hỗ trợ tiếng Việt */
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4 text-center">Chi tiết lớp học</h2>

    <div class="card shadow-sm">
        <div class="card-body">
            <h5 class="card-title">Tên lớp: <strong>${clazz.name}</strong></h5>
            <p class="card-text">Giáo viên phụ trách: <strong>${teacherName}</strong></p>
            <p class="card-text">Số lượng học sinh: <strong>${studentCount}</strong></p>
        </div>
    </div>

    <h4 class="mt-4">Danh sách học sinh</h4>
    <table class="table table-bordered table-striped mt-3">
        <thead class="table-primary">
        <tr>
            <th>#</th>
            <th>Tên học sinh</th>
            <th>Ngày sinh</th>
            <th>Số điện thoại</th>
        </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty clazz.students}">
                <c:forEach var="student" items="${clazz.students}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${student.name}</td>
                        <td><fmt:formatDate value="${student.dob}" pattern="dd/MM/yyyy" /></td>
                        <td>${student.phone}</td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr>
                    <td colspan="4" class="text-center">Không có học sinh nào trong lớp này.</td>
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>

    <a href="/classes" class="btn btn-secondary mt-3">Quay lại</a>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>