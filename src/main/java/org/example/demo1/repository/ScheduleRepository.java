package org.example.demo1.repository;

import org.example.demo1.entity.Schedule;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static org.example.demo1.repository.BaseRepository.getConnection;

public class ScheduleRepository {
    public List<Schedule> findAll() {
        List<Schedule> schedules = new ArrayList<>();
        String query = "SELECT s.*, c.class_name, sub.subject_name " +
                "FROM schedules s " +
                "JOIN classes c ON s.class_id = c.class_id " +
                "JOIN subjects sub ON s.subject_id = sub.subject_id";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                schedules.add(mapResultSetToSchedule(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi lấy danh sách lịch học: " + e.getMessage(), e);
        }
        return schedules;
    }

    public Schedule findById(int schedule_id) {
        String query = "SELECT s.*, c.class_name, sub.subject_name " +
                "FROM schedules s " +
                "JOIN classes c ON s.class_id = c.class_id " +
                "JOIN subjects sub ON s.subject_id = sub.subject_id " +
                "WHERE s.schedule_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, schedule_id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return mapResultSetToSchedule(rs);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi tìm lịch học theo ID: " + e.getMessage(), e);
        }
        return null;
    }

    public void save(Schedule schedule) {
        if (schedule.getStart_time() == null || schedule.getEnd_time() == null) {
            throw new IllegalArgumentException("Thời gian bắt đầu và kết thúc không được để trống");
        }
        String query = "INSERT INTO schedules (class_id, subject_id, day_of_week, start_time, end_time) " +
                "VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, schedule.getClass_id());
            ps.setInt(2, schedule.getSubject_id());
            ps.setString(3, schedule.getDay_of_week());
            ps.setTime(4, schedule.getStart_time());
            ps.setTime(5, schedule.getEnd_time());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi thêm lịch học: " + e.getMessage(), e);
        }
    }

    public void update(int schedule_id, Schedule schedule) {
        if (schedule.getStart_time() == null || schedule.getEnd_time() == null) {
            throw new IllegalArgumentException("Thời gian bắt đầu và kết thúc không được để trống");
        }
        String query = "UPDATE schedules SET class_id = ?, subject_id = ?, day_of_week = ?, start_time = ?, end_time = ? WHERE schedule_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, schedule.getClass_id());
            ps.setInt(2, schedule.getSubject_id());
            ps.setString(3, schedule.getDay_of_week());
            ps.setTime(4, schedule.getStart_time());
            ps.setTime(5, schedule.getEnd_time());
            ps.setInt(6, schedule_id);
            int rowsUpdated = ps.executeUpdate();
            if (rowsUpdated == 0) {
                throw new SQLException("Không tìm thấy lịch học với ID: " + schedule_id);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi cập nhật lịch học: " + e.getMessage(), e);
        }
    }

    public void remove(int schedule_id) throws SQLException {
        String query = "DELETE FROM schedules WHERE schedule_id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, schedule_id);
            int rowsAffected = ps.executeUpdate();
            if (rowsAffected == 0) {
                throw new SQLException("Không tìm thấy lịch học với ID: " + schedule_id);
            }
        }
    }

    private Schedule mapResultSetToSchedule(ResultSet rs) throws SQLException {
        return new Schedule(
                rs.getInt("schedule_id"),
                rs.getInt("class_id"),
                rs.getInt("subject_id"),
                rs.getString("day_of_week"),
                rs.getTime("start_time"),
                rs.getTime("end_time"),
                rs.getString("class_name"), // Thêm ánh xạ class_name
                rs.getString("subject_name") // Thêm ánh xạ subject_name
        );
    }
}