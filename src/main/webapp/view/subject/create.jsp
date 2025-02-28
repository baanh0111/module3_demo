<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Thêm Môn Học</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h2 class="text-center">Thêm Môn Học</h2>
    <form method="post" action="/subjects?action=create">

        <div class="mb-3">
            <label for="subject_name" class="form-label">Tên Môn Học</label>
            <input type="text" class="form-control" id="subject_name" name="subject_name" required>
        </div>
        <button type="submit" class="btn btn-primary">Thêm Môn Học</button>
    </form>
</div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
