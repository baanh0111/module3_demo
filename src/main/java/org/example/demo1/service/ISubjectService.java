package org.example.demo1.service;



import org.example.demo1.entity.Subject;

import java.util.List;

public interface ISubjectService {
    List<Subject> getAllSubject();
    Subject getSubjectById(int subject_id);
    boolean addSubject(Subject subject);
    boolean updateSubject(Subject subject);
    boolean deleteSubject(int subject_id);
}
