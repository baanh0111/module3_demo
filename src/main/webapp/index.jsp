<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản Lý Trường Học</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .card:hover {
            transform: scale(1.05);
            transition: 0.3s;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="#">Quản Lý Trường Học</a>
    </div>
</nav>

<!-- Main Content -->
<div class="container mt-5">
    <h2 class="text-center mb-4">Trang Chủ</h2>

    <div class="row">
        <div class="col-md-4 mb-3">
            <div class="card shadow">
                <div class="card-body text-center">
                    <h5 class="card-title">Quản Lý Sinh Viên</h5>
                    <a href="students" class="btn btn-primary">Truy cập</a>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-3">
            <div class="card shadow">
                <div class="card-body text-center">
                    <h5 class="card-title">Quản Lý Giáo Viên</h5>
                    <a href="teachers" class="btn btn-primary">Truy cập</a>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-3">
            <div class="card shadow">
                <div class="card-body text-center">
                    <h5 class="card-title">Quản Lý Lớp Học</h5>
                    <a href="classes" class="btn btn-primary">Truy cập</a>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-3">
            <div class="card shadow">
                <div class="card-body text-center">
                    <h5 class="card-title">Quản Lý Môn Học</h5>
                    <a href="subjects" class="btn btn-primary">Truy cập</a>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-3">
            <div class="card shadow">
                <div class="card-body text-center">
                    <h5 class="card-title">Quản Lý Điểm Học Sinh</h5>
                    <a href="grades" class="btn btn-primary">Truy cập</a>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-3">
            <div class="card shadow">
                <div class="card-body text-center">
                    <h5 class="card-title">Quản Lý Lịch Học</h5>
                    <a href="schedules" class="btn btn-primary">Truy cập</a>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
