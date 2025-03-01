package org.example.demo1.repository;

import org.example.demo1.entity.Class;
import org.example.demo1.entity.Student;
import org.example.demo1.entity.Teacher;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static org.example.demo1.repository.BaseRepository.getConnection;

public class ClassRepository {

    public List<Class> findAll() {
        List<Class> classes = new ArrayList<>();
        String query = "SELECT c.class_id AS class_id, c.class_name AS class_name, " +
                "t.teacher_id AS teacher_id, t.name AS teacher_name, t.dob, t.gender, t.address, t.phone, t.email " +
                "FROM classes c LEFT JOIN teachers t ON c.teacher_id = t.teacher_id";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                classes.add(mapResultSetToClass(resultSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi lấy danh sách lớp học: " + e.getMessage(), e);
        }
        return classes;
    }

    public Class findById(int class_id) { // Thay int id thành int class_id
        String query = "SELECT c.class_id AS class_id, c.class_name AS class_name, " +
                "t.teacher_id AS teacher_id, t.name AS teacher_name, t.dob, t.gender, t.address, t.phone, t.email " +
                "FROM classes c " +
                "LEFT JOIN teachers t ON c.teacher_id = t.teacher_id " +
                "WHERE c.class_id = ?";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, class_id); // Sử dụng class_id thay vì id
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return mapResultSetToClass(resultSet);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi tìm lớp học theo ID: " + e.getMessage(), e);
        }
        return null;
    }

    public List<Class> findAllByName(String name) {
        List<Class> classes = new ArrayList<>();
        String query = "SELECT c.class_id AS class_id, c.class_name AS class_name, " +
                "t.teacher_id AS teacher_id, t.name AS teacher_name, t.dob, t.gender, t.address, t.phone, t.email " +
                "FROM classes c LEFT JOIN teachers t ON c.teacher_id = t.teacher_id WHERE c.class_name LIKE ?"; // Sửa c.name thành c.class_name

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, "%" + name + "%");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                classes.add(mapResultSetToClass(resultSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi tìm kiếm lớp học theo tên: " + e.getMessage(), e);
        }
        return classes;
    }

    public void save(Class clazz) {
        String query = "INSERT INTO classes (class_name, teacher_id) VALUES (?, ?)";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, clazz.getName());
            if (clazz.getTeacher() != null) {
                statement.setInt(2, clazz.getTeacher().getId());
            } else {
                statement.setNull(2, Types.INTEGER);
            }

            statement.executeUpdate();
            System.out.println("Thêm lớp học thành công: " + clazz);
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi thêm lớp học: " + e.getMessage(), e);
        }
    }

    /*public void update(int class_id, Class clazz) throws SQLException {
        String query = "UPDATE classes SET class_name = ?, teacher_id = ? WHERE class_id = ?";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, clazz.getName());
            if (clazz.getTeacher() != null) {
                statement.setInt(2, clazz.getTeacher().getId());
            } else {
                statement.setNull(2, Types.INTEGER);
            }
            statement.setInt(3, class_id);

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Cập nhật thành công lớp học ID: " + class_id);
            } else {
                throw new SQLException("Không tìm thấy lớp học ID: " + class_id);
            }
        }
    }*/
    public void update(int class_id, Class clazz) {
        String sql = "UPDATE Classes SET class_name = ?, teacher_id = ? WHERE class_id = ?";
        try (Connection connection = BaseRepository.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, clazz.getName());
            statement.setInt(2, clazz.getTeacher().getId());
            statement.setInt(3, class_id);

            int rowsUpdated = statement.executeUpdate();
            System.out.println("Rows affected: " + rowsUpdated);
            if (rowsUpdated > 0) {
                System.out.println("✅ Class updated successfully.");
            } else {
                System.out.println("⚠️ No class found with class_id: " + class_id);
            }
        } catch (SQLException e) {
            System.out.println("SQL Error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public void remove(int class_id) throws SQLException { // Thay int id thành int class_id
        String query = "DELETE FROM classes WHERE class_id = ?";
        try (Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, class_id); // Sử dụng class_id thay vì id
            int rowsAffected = statement.executeUpdate();
            if (rowsAffected == 0) {
                throw new SQLException("Không tìm thấy lớp học với ID: " + class_id);
            } else {
                System.out.println("Xóa thành công lớp học có ID: " + class_id);
            }
        } catch (SQLException e) {
            throw new SQLException("Lỗi khi xóa lớp học: " + e.getMessage(), e);
        }
    }

    public int countStudentsInClass(int classId) {
        String query = "SELECT COUNT(*) FROM class_students WHERE class_id = ?";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, classId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi đếm số lượng học sinh trong lớp: " + e.getMessage(), e);
        }
        return 0;
    }

    public List<Student> getStudentsByClassId(int class_id) {
        List<Student> students = new ArrayList<>();
        String query = "SELECT s.student_id, s.name, s.dob, s.gender, s.address, s.phone, s.email " +
                "FROM students s " +
                "JOIN class_students cs ON s.student_id = cs.student_id WHERE cs.class_id = ?";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, class_id);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                students.add(mapResultSetToStudent(resultSet));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi lấy danh sách học sinh trong lớp: " + e.getMessage(), e);
        }
        return students;
    }

    public String getTeacherNameByClassId(int classId) {
        String query = "SELECT t.name FROM teachers t JOIN classes c ON t.teacher_id = c.teacher_id WHERE c.class_id = ?";

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setInt(1, classId);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getString("name");
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi lấy tên giáo viên phụ trách lớp: " + e.getMessage(), e);
        }
        return null;
    }

    private Class mapResultSetToClass(ResultSet resultSet) throws SQLException {
        int class_id = resultSet.getInt("class_id");
        String name = resultSet.getString("class_name");

        Teacher teacher = new Teacher(
                resultSet.getInt("teacher_id"),
                resultSet.getString("teacher_name"),
                resultSet.getDate("dob"),
                resultSet.getString("gender"),
                resultSet.getString("address"),
                resultSet.getString("phone"),
                resultSet.getString("email")
        );

        List<Student> students = getStudentsByClassId(class_id);

        return new Class(class_id, name, teacher, students);
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

    public List<Teacher> findTeachersWithoutClass() {
        List<Teacher> teachers = new ArrayList<>();
        String query = "SELECT * FROM Teachers t WHERE t.teacher_id NOT IN (SELECT teacher_id FROM Classes WHERE teacher_id IS NOT NULL)";

        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Teacher teacher = new Teacher(
                        rs.getInt("teacher_id"),
                        rs.getString("name"),
                        rs.getDate("dob"),
                        rs.getString("gender"),
                        rs.getString("address"),
                        rs.getString("phone"),
                        rs.getString("email")
                );
                teachers.add(teacher);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teachers;
    }

    public List<Student> getStudentsInClassId(int class_id) {
        List<Student> students = new ArrayList<>();
        String query = "SELECT s.student_id, s.name, s.dob, s.phone " +
                "FROM Students s " +
                "JOIN Class_Students cs ON s.student_id = cs.student_id " +
                "WHERE cs.class_id = ?";

        try (Connection conn = BaseRepository.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setInt(1, class_id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Student student = new Student(
                        rs.getInt("student_id"),
                        rs.getString("name"),
                        rs.getDate("dob"),
                        null,
                        null,
                        rs.getString("phone"),
                        null
                );
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

}