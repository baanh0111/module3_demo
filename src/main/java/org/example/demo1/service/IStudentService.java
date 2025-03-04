package org.example.demo1.service;

import org.example.demo1.entity.Student;

import java.util.List;

public interface IStudentService extends IService<Student>  {
    List<Student> searchByName(String keyword);
}
