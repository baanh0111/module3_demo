package org.example.demo1.repository;

import org.example.demo1.entity.Student;
import org.example.demo1.entity.Tuition;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static org.example.demo1.repository.BaseRepository.getConnection;

public class TuitionRepository {

    // Lấy danh sách tất cả học phí
    public List<Tuition> getAllTuition() {
        List<Tuition> tuitions = new ArrayList<>();
        String sql = "SELECT * FROM Tuition";

        try (Connection conn = BaseRepository.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int tuitionId = rs.getInt("tuition_id");
                int studentId = rs.getInt("student_id"); // ✅ Corrected
                Student student = new StudentRepository().findById(studentId); // ✅ Corrected
                BigDecimal amount = rs.getBigDecimal("amount");
                Date dueDate = rs.getDate("due_date");
                String paidStatus = rs.getString("paid_status");
                Date paymentDate = rs.getDate("payment_date");

                Tuition tuition = new Tuition(tuitionId, student, amount, dueDate, paidStatus, paymentDate);
                tuitions.add(tuition);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("Total tuitions fetched: " + tuitions.size()); // Debug
        return tuitions;
    }

    // Lấy học phí theo ID
    public Tuition getTuitionById(int tuitionId) {
        String query = "SELECT * FROM Tuition WHERE tuition_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, tuitionId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapResultSetToTuition(rs);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi tìm học phí theo ID: " + e.getMessage(), e);
        }
        return null;
    }

    // Thêm học phí mới
    public boolean addTuition(Tuition tuition) {
        String query = "INSERT INTO Tuition (student_id, amount, due_date, paid_status, payment_date) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, tuition.getStudent().getId()); // ✅ Corrected
            ps.setBigDecimal(2, tuition.getAmount());
            ps.setDate(3, new java.sql.Date(tuition.getDueDate().getTime()));
            ps.setString(4, tuition.getPaidStatus());
            ps.setDate(5, tuition.getPaymentDate() != null ? new java.sql.Date(tuition.getPaymentDate().getTime()) : null);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi thêm học phí: " + e.getMessage(), e);
        }
    }

    // Cập nhật học phí
    public boolean updateTuition(Tuition tuition) {
        String query = "UPDATE Tuition SET student_id = ?, amount = ?, due_date = ?, paid_status = ?, payment_date = ? WHERE tuition_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, tuition.getStudent().getId()); // ✅ Corrected
            ps.setBigDecimal(2, tuition.getAmount());
            ps.setDate(3, new java.sql.Date(tuition.getDueDate().getTime()));
            ps.setString(4, tuition.getPaidStatus());
            ps.setDate(5, tuition.getPaymentDate() != null ? new java.sql.Date(tuition.getPaymentDate().getTime()) : null);
            ps.setInt(6, tuition.getTuitionId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi cập nhật học phí: " + e.getMessage(), e);
        }
    }

    // Xóa học phí theo ID
    public boolean deleteTuition(int tuitionId) {
        String query = "DELETE FROM Tuition WHERE tuition_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, tuitionId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi xóa học phí: " + e.getMessage(), e);
        }
    }

    // Chuyển đổi ResultSet thành đối tượng Tuition
    private Tuition mapResultSetToTuition(ResultSet rs) throws SQLException {
        Student student = new StudentRepository().findById(rs.getInt("student_id")); // ✅ Fix
        return new Tuition(
                rs.getInt("tuition_id"),
                student,  // ✅ Corrected to pass Student object
                rs.getBigDecimal("amount"),
                rs.getDate("due_date"),
                rs.getString("paid_status"),
                rs.getDate("payment_date")
        );
    }
}
