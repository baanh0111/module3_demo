package org.example.demo1.service.impl;

import org.example.demo1.entity.Schedule;
import org.example.demo1.repository.ScheduleRepository;
import org.example.demo1.service.IScheduleService;

import java.sql.SQLException;
import java.util.List;

public class ScheduleService implements IScheduleService {
    private final ScheduleRepository scheduleRepository = new ScheduleRepository();

    @Override
    public List<Schedule> getAll() {
        return scheduleRepository.findAll();
    }

    @Override
    public void save(Schedule schedule) {
        scheduleRepository.save(schedule);
    }

    @Override
    public void remove(int schedule_id) throws SQLException {
        scheduleRepository.remove(schedule_id);
    }

    @Override
    public void update(int schedule_id, Schedule schedule) {
        scheduleRepository.update(schedule_id, schedule);
    }

    @Override
    public Schedule findById(int schedule_id) {
        return scheduleRepository.findById(schedule_id);
    }
}