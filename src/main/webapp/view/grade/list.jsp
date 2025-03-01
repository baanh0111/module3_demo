<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Danh Sách Điểm Tổng Hợp</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Danh Sách Điểm Tổng Hợp</h2>
    <c:if test="${param.success}">
        <c:choose>
            <c:when test="${not empty param.deletedGradeId}">
                <div class="alert alert-success">Thao tác thành công! Đã xóa điểm với ID ${param.deletedGradeId}.</div>
            </c:when>
            <c:otherwise>
                <div class="alert alert-success">Thao tác thành công!</div>
            </c:otherwise>
        </c:choose>
    </c:if>
    <a href="/grades?action=add" class="btn btn-primary mb-3">Thêm Điểm Mới</a>
    <div class="mb-3">
        <a href="/grades?action=list" class="btn btn-secondary">Tất Cả Điểm</a>
        <a href="/grades?action=listRegular" class="btn btn-secondary">Điểm Regular</a>
        <a href="/grades?action=listMidterm" class="btn btn-secondary">Điểm Midterm</a>
        <a href="/grades?action=listFinal" class="btn btn-secondary">Điểm Final</a>
    </div>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>ID Điểm</th>
            <th>ID Học Sinh</th>
            <th>Học Sinh</th>
            <th>Môn Học</th>
            <th>Điểm</th>
            <th>Loại Kỳ Thi</th>
            <th>Ngày Nhập</th>
            <th>Hành Động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="grade" items="${grades}">
            <tr>
                <td>${grade.grade_id}</td>
                <td>${grade.student_id}</td>
                <td>
                    <c:forEach var="student" items="${students}">
                        <c:if test="${student.id == grade.student_id}">
                            ${student.name}
                        </c:if>
                    </c:forEach>
                </td>
                <td>
                    <c:forEach var="subject" items="${subjects}">
                        <c:if test="${subject.subject_id == grade.subject_id}">
                            ${subject.subject_name}
                        </c:if>
                    </c:forEach>
                </td>
                <td>${grade.score}</td>
                <td>${grade.exam_type}</td>
                <td>${grade.date_entered}</td>
                <td>
                    <a href="/grades?action=edit&grade_id=${grade.grade_id}" class="btn btn-sm btn-warning">Sửa</a>
                    <a href="/grades?action=delete&grade_id=${grade.grade_id}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn có chắc muốn xóa điểm này?')">Xóa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>