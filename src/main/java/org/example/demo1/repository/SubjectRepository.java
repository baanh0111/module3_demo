package org.example.demo1.repository;

import org.example.demo1.entity.Subject;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static org.example.demo1.repository.BaseRepository.getConnection;
public class SubjectRepository {
    public List<Subject> getAllSubject() {
        List<Subject> subjects = new ArrayList<>();
        String query = "SELECT * FROM subjects";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                subjects.add(mapResultSetToSubject(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi lấy danh sách môn học: " + e.getMessage(), e);
        }
        return subjects;
    }

    public Subject getSubjectById(int id) {
        String query = "SELECT * FROM subjects WHERE subject_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapResultSetToSubject(rs);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi tìm môn học theo ID: " + e.getMessage(), e);
        }
        return null;
    }

    public boolean addSubject(Subject subject) {
        String query = "INSERT INTO subjects (subject_name) VALUES (?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, subject.getName()); // SỬA LẠI
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi thêm môn học: " + e.getMessage(), e);
        }
    }

    public boolean updateSubject(Subject subject) {
        String query = "UPDATE subjects SET subject_name = ? WHERE subject_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, subject.getName()); // SỬA LẠI
            ps.setInt(2, subject.getId()); // SỬA LẠI
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi cập nhật môn học: " + e.getMessage(), e);
        }
    }

    public boolean deleteSubject(int subject_id) {
        String query = "DELETE FROM subjects WHERE subject_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, subject_id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi xoá môn học: " + e.getMessage(), e);
        }
    }
    private Subject mapResultSetToSubject(ResultSet rs) throws SQLException {
        return new Subject(
                rs.getInt("subject_id"),
                rs.getString("subject_name")
        );
    }

}
