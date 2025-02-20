package org.example.demo1.service.impl;

import org.example.demo1.entity.Teacher;
import org.example.demo1.repository.TeacherRepository;
import org.example.demo1.service.ITeacherService;

import java.util.List;

public class TeacherService implements ITeacherService {
    private static TeacherRepository teacherRepository = new TeacherRepository();

    @Override
    public List<Teacher> getAll() {
        return teacherRepository.findAll();
    }

    @Override
    public void save(Teacher teacher) {
        teacherRepository.save(teacher);
    }

    @Override
    public void remove(int id) {
        teacherRepository.remove(id);
    }

    @Override
    public void update(int id, Teacher teacher) {
        teacherRepository.update(id, teacher);
    }

    @Override
    public Teacher findById(int id) {
        return teacherRepository.findById(id);
    }

    @Override
    public List<Teacher> findAllByName(String name) {
        return teacherRepository.findAllByName(name);
    }
}
