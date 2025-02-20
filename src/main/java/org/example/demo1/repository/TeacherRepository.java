package org.example.demo1.repository;



import org.example.demo1.entity.Teacher;
import org.example.demo1.repository.BaseRepository;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class TeacherRepository {

    // Lấy danh sách giáo viên từ database
    public List<Teacher> findAll() {
        List<Teacher> teachers = new ArrayList<>();
        try {
            Statement statement = BaseRepository.getConnection().createStatement();
            // Sử dụng tên bảng "Teachers" theo định nghĩa trong SQL
            ResultSet resultSet = statement.executeQuery("SELECT * FROM Teachers");
            while (resultSet.next()) {
                int id = resultSet.getInt("teacher_id");
                String name = resultSet.getString("name");
                Date dob = resultSet.getDate("dob");
                String gender = resultSet.getString("gender");
                String address = resultSet.getString("address");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                teachers.add(new Teacher(id, name, dob, gender, address, phone, email));

            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return teachers;
    }

    // Lấy danh sách giáo viên theo tên (tìm kiếm theo chứa chuỗi)
    public List<Teacher> findAllByName(String name) {
        List<Teacher> allTeachers = findAll();
        List<Teacher> temp = new ArrayList<>();
        for (Teacher teacher : allTeachers) {
            if (teacher.getName().contains(name)) {
                temp.add(teacher);
            }
        }
        return temp;
    }

    // Lưu giáo viên mới vào database
    public void save(Teacher teacher) {
        try {
            PreparedStatement statement = BaseRepository.getConnection()
                    .prepareStatement("INSERT INTO Teachers(name, dob, gender, address, phone, email) VALUES (?, ?, ?, ?, ?, ?)");
            statement.setString(1, teacher.getName());
            statement.setDate(2, teacher.getDob());
            statement.setString(3, teacher.getGender());
            statement.setString(4, teacher.getAddress());
            statement.setString(5, teacher.getPhone());
            statement.setString(6, teacher.getEmail());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Tìm giáo viên theo id
    public Teacher findById(int id) {
        try {
            PreparedStatement statement = BaseRepository.getConnection()
                    .prepareStatement("SELECT * FROM Teachers WHERE teacher_id = ?");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                int teacherId = resultSet.getInt("teacher_id");
                String name = resultSet.getString("name");
                Date dob = resultSet.getDate("dob");
                String gender = resultSet.getString("gender");
                String address = resultSet.getString("address");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                return new Teacher(teacherId, name, dob, gender, address, phone, email);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    // Xóa giáo viên theo id
    public void remove(int id) {
        try {
            PreparedStatement statement = BaseRepository.getConnection()
                    .prepareStatement("DELETE FROM Teachers WHERE teacher_id = ?");
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Cập nhật thông tin giáo viên theo id
    public void update(int id, Teacher teacher) {
        try {
            PreparedStatement statement = BaseRepository.getConnection()
                    .prepareStatement("UPDATE Teachers SET name = ?, dob = ?, gender = ?, address = ?, phone = ?, email = ? WHERE teacher_id = ?");
            statement.setString(1, teacher.getName());
            statement.setDate(2, teacher.getDob());
            statement.setString(3, teacher.getGender());
            statement.setString(4, teacher.getAddress());
            statement.setString(5, teacher.getPhone());
            statement.setString(6, teacher.getEmail());
            statement.setInt(7, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}

