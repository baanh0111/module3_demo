<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Thêm Học Phí</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      font-family: 'Arial', 'sans-serif', 'Roboto', 'Helvetica', 'Times New Roman';
    }
  </style>
</head>
<body>
<div class="container mt-4">
  <h2 class="text-center mb-4">Thêm Học Phí</h2>

  <form action="/tuitions" method="post">
    <input type="hidden" name="action" value="create">

    <!-- Chọn Sinh Viên -->
    <div class="mb-3">
      <label for="studentId" class="form-label">Học Sinh</label>
      <select name="studentId" id="studentId" class="form-select" required>
        <option value="">-- Chọn sinh viên --</option>
        <c:forEach var="student" items="${students}">
          <option value="${student.id}">${student.name}</option>
        </c:forEach>
      </select>

    </div>

    <!-- Nhập Số Tiền -->
    <div class="mb-3">
      <label for="amount" class="form-label">Số tiền</label>
      <input type="number" name="amount" id="amount" class="form-control" required min="0">
    </div>

    <!-- Nhập Ngày Hết Hạn -->
    <div class="mb-3">
      <label for="dueDate" class="form-label">Ngày hết hạn</label>
      <input type="date" name="dueDate" id="dueDate" class="form-control" required>
    </div>

    <!-- Chọn Trạng Thái Thanh Toán -->
    <div class="mb-3">
      <label class="form-label">Trạng thái thanh toán</label>
      <div class="form-check">
        <input class="form-check-input" type="radio" name="paidStatus" value="PAID" id="paid" required>
        <label class="form-check-label" for="paid">Đã thanh toán</label>
      </div>
      <div class="form-check">
        <input class="form-check-input" type="radio" name="paidStatus" value="UNPAID" id="unpaid" required>
        <label class="form-check-label" for="unpaid">Chưa thanh toán</label>
      </div>
    </div>

    <!-- Nhập Ngày Thanh Toán (Nếu đã thanh toán) -->
    <div class="mb-3">
      <label for="paymentDate" class="form-label">Ngày thanh toán (nếu có)</label>
      <input type="date" name="paymentDate" id="paymentDate" class="form-control">
    </div>

    <!-- Nút Submit -->
    <div class="text-center">
      <button type="submit" class="btn btn-success">Thêm Học Phí</button>
      <a href="/tuitions" class="btn btn-secondary">Hủy</a>
    </div>
  </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
  // Hiện ô ngày thanh toán nếu chọn "Đã thanh toán"
  document.querySelectorAll('input[name="paidStatus"]').forEach(function(radio) {
    radio.addEventListener('change', function() {
      document.getElementById('paymentDate').disabled = (this.value !== 'PAID');
    });
  });
</script>
</body>
</html>
