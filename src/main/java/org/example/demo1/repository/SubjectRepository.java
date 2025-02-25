package org.example.demo1.repository;

import org.example.demo1.entity.Subject;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static org.example.demo1.repository.BaseRepository.getConnection;

public class SubjectRepository {
    public List<Subject> findAll() {
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

    public Subject findById(int id) {
        String query = "SELECT * FROM subjects WHERE id = ?";
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

    private Subject mapResultSetToSubject(ResultSet rs) throws SQLException {
        return new Subject(
                rs.getInt("subject_id"),
                rs.getString("subject_name")
        );
    }
}