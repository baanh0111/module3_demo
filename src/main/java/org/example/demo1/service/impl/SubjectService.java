package org.example.demo1.service.impl;

import org.example.demo1.entity.Student;
import org.example.demo1.entity.Subject;
import org.example.demo1.repository.SubjectRepository;
import org.example.demo1.service.ISubjectService;

import java.util.List;

public class SubjectService implements ISubjectService {
    private final SubjectRepository subjectRepository;

    public SubjectService() {
        this.subjectRepository = new SubjectRepository();
    }

    @Override
    public List<Subject> getAllSubject() {
        return subjectRepository.getAllSubject();
    }

    @Override
    public Subject getSubjectById(int subject_id) {
        return subjectRepository.getSubjectById(subject_id);
    }


    @Override
    public boolean addSubject(Subject subject) {
        return subjectRepository.addSubject(subject);
    }

    @Override
    public boolean updateSubject(Subject subject) {
        return subjectRepository.updateSubject(subject);
    }

    @Override
    public boolean deleteSubject(int subject_id) {
        return subjectRepository.deleteSubject(subject_id);
    }
}
