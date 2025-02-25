package org.example.demo1.service.impl;

import org.example.demo1.entity.Subject;
import org.example.demo1.repository.SubjectRepository;
import org.example.demo1.service.ISubjectService;

import java.util.List;

public class SubjectService implements ISubjectService {
    private final SubjectRepository subjectRepository = new SubjectRepository();

    @Override
    public List<Subject> getAll() {
        return subjectRepository.findAll();
    }

    @Override
    public Subject findById(int id) {
        return subjectRepository.findById(id);
    }
}