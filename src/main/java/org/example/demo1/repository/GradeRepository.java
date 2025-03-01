package org.example.demo1.repository;

import org.example.demo1.entity.Grade;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class GradeRepository {
    public void save(Grade grade) {
        String query = "INSERT INTO grades (student_id, subject_id, score, date_entered, exam_type) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = BaseRepository.getConnection(); // Sử dụng BaseRepository
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, grade.getStudent_id());
            ps.setInt(2, grade.getSubject_id());
            ps.setDouble(3, grade.getScore());
            ps.setDate(4, grade.getDate_entered());
            ps.setString(5, grade.getExam_type());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi thêm điểm: " + e.getMessage(), e);
        }
    }

    public void update(Grade grade) {
        String query = "UPDATE grades SET student_id = ?, subject_id = ?, score = ?, date_entered = ?, exam_type = ? WHERE grade_id = ?";
        try (Connection conn = BaseRepository.getConnection(); // Sử dụng BaseRepository
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, grade.getStudent_id());
            ps.setInt(2, grade.getSubject_id());
            ps.setDouble(3, grade.getScore());
            ps.setDate(4, grade.getDate_entered());
            ps.setString(5, grade.getExam_type());
            ps.setInt(6, grade.getGrade_id());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi cập nhật điểm: " + e.getMessage(), e);
        }
    }

    public void delete(int gradeId) {
        String query = "DELETE FROM grades WHERE grade_id = ?";
        try (Connection conn = BaseRepository.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, gradeId);
            int rowsAffected = ps.executeUpdate();
            System.out.println("Rows affected for grade_id " + gradeId + ": " + rowsAffected);
            if (rowsAffected == 0) {
                throw new RuntimeException("Không tìm thấy bản ghi với grade_id = " + gradeId);
            }
        } catch (SQLException e) {
            System.err.println("SQLException when deleting grade_id " + gradeId + ": " + e.getMessage());
            throw new RuntimeException("Lỗi khi xóa điểm: " + e.getMessage(), e);
        }
    }

    public Grade findById(int gradeId) {
        String query = "SELECT * FROM grades WHERE grade_id = ?";
        try (Connection conn = BaseRepository.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, gradeId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapResultSetToGrade(rs);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi tìm điểm: " + e.getMessage(), e);
        }
        return null;
    }

    public List<Grade> findAll() {
        List<Grade> grades = new ArrayList<>();
        String query = "SELECT g.grade_id, g.student_id, g.subject_id, g.score, g.date_entered, g.exam_type " +
                "FROM grades g " +
                "JOIN students s ON g.student_id = s.student_id " + // Join với students
                "JOIN subjects sub ON g.subject_id = sub.subject_id " + // Join với subjects
                "ORDER BY g.student_id, g.subject_id";
        try (Connection conn = BaseRepository.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                grades.add(mapResultSetToGrade(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi lấy danh sách điểm: " + e.getMessage(), e);
        }
        return grades;
    }

    public List<Grade> findByExamType(String examType) {
        List<Grade> grades = new ArrayList<>();
        String query = "SELECT * FROM grades WHERE exam_type = ? ORDER BY student_id, subject_id";
        try (Connection conn = BaseRepository.getConnection(); // Sử dụng BaseRepository
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, examType);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                grades.add(mapResultSetToGrade(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi lấy điểm theo loại kỳ thi: " + e.getMessage(), e);
        }
        return grades;
    }


    private Grade mapResultSetToGrade(ResultSet rs) throws SQLException {
        return new Grade(
                rs.getInt("grade_id"),
                rs.getInt("student_id"),
                rs.getInt("subject_id"),
                rs.getDouble("score"),
                rs.getDate("date_entered"),
                rs.getString("exam_type")
        );
    }
}