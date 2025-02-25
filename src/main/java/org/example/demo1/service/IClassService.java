package org.example.demo1.service;

import org.example.demo1.entity.Class;
import org.example.demo1.entity.Teacher;
import org.example.demo1.entity.Student;

import java.sql.SQLException;
import java.util.List;


public interface IClassService {
    List<Class> getAll();

    void save(Class clazz);

    void remove(int class_id) ;

    void update(int class_id, Class clazz) ;

    Class findById(int class_id);

    List<Class> findAllByName(String name);

    int countStudentsInClass(int classId);

    List<Student> getStudentsByClassId(int class_id);

    List<Student> getStudentsInClassId(int class_id);

    List<Teacher> getTeachersWithoutClass();

    String getTeacherNameByClassId(int classId);
}
