<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thêm giáo viên</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand" href="#">Quản Lý Giáo Viên</a>
    </div>
</nav>

<!-- Main Content -->
<div class="container mt-4">
    <h2 class="text-center text-primary">Thêm giáo viên</h2>

    <div class="card p-4">
        <form action="/teachers?action=create" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Họ và tên</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>

            <div class="mb-3">
                <label for="dob" class="form-label">Ngày sinh</label>
                <input type="date" class="form-control" id="dob" name="dob" required>
            </div>

            <div class="mb-3">
                <label for="gender" class="form-label">Giới tính</label>
                <select class="form-select" id="gender" name="gender" required>
                    <option value="Male">Nam</option>
                    <option value="Female">Nữ</option>
                    <option value="Other">Khác</option>
                </select>
            </div>

            <div class="mb-3">
                <label for="address" class="form-label">Địa chỉ</label>
                <input type="text" class="form-control" id="address" name="address" required>
            </div>

            <div class="mb-3">
                <label for="phone" class="form-label">Số điện thoại</label>
                <input type="tel" class="form-control" id="phone" name="phone" required>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <!-- Nút Quay Lại và Thêm Giáo Viên -->
            <div class="d-flex justify-content-between">
                <a href="/teachers" class="btn btn-secondary">Quay lại</a>
                <button type="submit" class="btn btn-primary">Thêm giáo viên</button>
            </div>
        </form>
    </div>
</div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
