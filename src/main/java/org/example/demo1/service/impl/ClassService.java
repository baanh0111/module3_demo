package org.example.demo1.service.impl;

import org.example.demo1.entity.Class;
import org.example.demo1.entity.Student;
import org.example.demo1.entity.Teacher;
import org.example.demo1.repository.ClassRepository;
import org.example.demo1.service.IClassService;

import java.sql.SQLException;
import java.util.List;

/**
 * Triển khai các chức năng cho dịch vụ quản lý lớp học.
 */
public class ClassService implements IClassService {
    private final ClassRepository classRepository = new ClassRepository();

    @Override
    public List<Class> getAll() {
        return classRepository.findAll();
    }

    @Override
    public void save(Class clazz) {
        classRepository.save(clazz);
    }

    @Override
    public void remove(int class_id)  { // Thay int id thành int class_id
        try {
            classRepository.remove(class_id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void update(int class_id, Class clazz) { // Thay int id thành int class_id
        classRepository.update(class_id, clazz);
    }

    @Override
    public Class findById(int class_id) { // Thay int id thành int class_id
        return classRepository.findById(class_id);
    }


    @Override
    public List<Class> findAllByName(String name) {
        return classRepository.findAllByName(name);
    }

    @Override
    public int countStudentsInClass(int classId) {
        return classRepository.countStudentsInClass(classId);
    }

    @Override
    public List<Student> getStudentsByClassId(int class_id) {
        return classRepository.getStudentsByClassId(class_id);
    }

    public List<Teacher> getTeachersWithoutClass() {
        return classRepository.findTeachersWithoutClass();
    }

    @Override
    public String getTeacherNameByClassId(int classId) {
        return classRepository.getTeacherNameByClassId(classId);
    }
    public List<Student> getStudentsInClassId(int class_id){
        return classRepository.getStudentsInClassId(class_id);
    }
}