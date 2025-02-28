package org.example.demo1.repository;

import org.example.demo1.entity.Subject;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SubjectRepository {

    public List<Subject> getAllSubject() {
        List<Subject> subjects = new ArrayList<>();
        String sql = "SELECT subject_id, subject_name FROM subjects"; // Vérifiez les noms des colonnes !

        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("subject_id"); // ✅ Correction ici
                String name = resultSet.getString("subject_name");
                subjects.add(new Subject(id, name));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return subjects;
    }


    public Subject getSubjectById(int subject_id) {
        String query = "SELECT * FROM subjects WHERE subject_id = ?";
        try (Connection conn = BaseRepository.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {
            pstmt.setInt(1, subject_id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                return new Subject(rs.getInt("id"), rs.getString("name"));
            }
        } catch (SQLException e) {
            System.err.println("Lỗi khi lấy môn học theo ID: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }

    public boolean addSubject(Subject subject) {
        String query = "INSERT INTO subjects (subject_name) VALUES (?)";
        try (Connection conn = BaseRepository.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, subject.getName());
            int affectedRows = pstmt.executeUpdate();

            if (affectedRows > 0) {
                System.out.println("Môn học đã được thêm thành công: " + subject.getName());
                return true;
            }

        } catch (SQLException e) {
            System.err.println("Lỗi khi thêm môn học: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateSubject(Subject subject) {
        String query = "UPDATE subjects SET subject_name = ? WHERE subject_id = ?";
        try (Connection conn = BaseRepository.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, subject.getName());
            pstmt.setInt(2, subject.getId());
            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Lỗi khi cập nhật môn học: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteSubject(int subject_id) {
        String query = "DELETE FROM subjects WHERE subject_id = ?";
        try (Connection conn = BaseRepository.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, subject_id);
            return pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Lỗi khi xóa môn học: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
}
