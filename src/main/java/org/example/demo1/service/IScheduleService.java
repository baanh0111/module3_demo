package org.example.demo1.service;

import org.example.demo1.entity.Schedule;

import java.sql.SQLException;
import java.util.List;

public interface IScheduleService {
    List<Schedule> getAll();
    void save(Schedule schedule);
    void remove(int schedule_id) throws SQLException;
    void update(int schedule_id, Schedule schedule);
    Schedule findById(int schedule_id);
}