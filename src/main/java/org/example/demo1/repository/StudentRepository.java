package org.example.demo1.repository;

import org.example.demo1.entity.Student;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository {

    public List<Student> findAll() {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM students";

        try (Connection connection = BaseRepository.getConnection();
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                students.add(mapResultSetToStudent(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi lấy danh sách sinh viên: " + e.getMessage(), e);
        }
        return students;
    }

    public List<Student> findAllByName(String name) {
        List<Student> students = new ArrayList<>();
        String query = "SELECT * FROM Students WHERE name LIKE ?";

        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, "%" + name + "%");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                students.add(mapResultSetToStudent(resultSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi tìm kiếm sinh viên theo tên: " + e.getMessage(), e);
        }
        return students;
    }

    public void save(Student student) {
        String gender = normalizeGender(student.getGender());

        String sql = "INSERT INTO Students (name, dob, gender, address, phone, email) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, student.getName());
            stmt.setDate(2, student.getDob() != null ? new java.sql.Date(student.getDob().getTime()) : null);
            stmt.setString(3, gender);
            stmt.setString(4, student.getAddress());
            stmt.setString(5, student.getPhone());
            stmt.setString(6, student.getEmail());

            stmt.executeUpdate();
            System.out.println("Thêm sinh viên thành công: " + student);
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi thêm sinh viên: " + e.getMessage(), e);
        }
    }


    public Student findById(int id) {
        String query = "SELECT * FROM Students WHERE student_id = ?";

        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return mapResultSetToStudent(resultSet);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi tìm sinh viên theo ID: " + e.getMessage(), e);
        }
        return null;
    }

    public void update(Student student) {
        String gender = normalizeGender(student.getGender());
        String query = "UPDATE Students SET name = ?, dob = ?, gender = ?, address = ?, phone = ?, email = ? WHERE student_id = ?";

        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, student.getName());
            statement.setDate(2, student.getDob() != null ? new java.sql.Date(student.getDob().getTime()) : null);
            statement.setString(3, gender);
            statement.setString(4, student.getAddress());
            statement.setString(5, student.getPhone());
            statement.setString(6, student.getEmail());
            statement.setInt(7, student.getId());

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Cập nhật thành công sinh viên ID: " + student.getId());
            } else {
                System.out.println("Không tìm thấy sinh viên ID: " + student.getId());
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi cập nhật sinh viên: " + e.getMessage(), e);
        }
    }

    public void remove(int id) {
        String query = "DELETE FROM Students WHERE student_id = ?";

        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, id);
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected == 0) {
                System.out.println("Không có sinh viên nào bị xóa. ID không tồn tại hoặc lỗi truy vấn.");
            } else {
                System.out.println("Xóa thành công sinh viên có ID: " + id);
            }

        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi xóa sinh viên: " + e.getMessage(), e);
        }
    }

    private Student mapResultSetToStudent(ResultSet resultSet) throws SQLException {
        int id = resultSet.getInt("student_id");
        String name = resultSet.getString("name");
        java.sql.Date dob = resultSet.getDate("dob");
        String gender = resultSet.getString("gender");
        String address = resultSet.getString("address");
        String phone = resultSet.getString("phone");
        String email = resultSet.getString("email");

        return new Student(id, name, dob, gender, address, phone, email);
    }

    private String normalizeGender(String gender) {
        if (gender == null || gender.trim().isEmpty()) {
            throw new IllegalArgumentException("Giới tính không được để trống!");
        }

        gender = gender.trim().toLowerCase();
        switch (gender) {
            case "male": return "Male";
            case "female": return "Female";
            case "other": return "Other";
            default: throw new IllegalArgumentException("Giới tính không hợp lệ! Chỉ chấp nhận 'Male', 'Female' hoặc 'Other'.");
        }
    }
    public Student getStudentById(int id) {
        String query = "SELECT * FROM students WHERE id = ?";
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return new Student(
                        resultSet.getInt("id"),
                        resultSet.getString("name"),
                        resultSet.getDate("dob"),
                        resultSet.getString("gender"),
                        resultSet.getString("address"),
                        resultSet.getString("phone"),
                        resultSet.getString("email")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Trả về null nếu không tìm thấy sinh viên
    }
}
