package org.example.demo1.service.impl;

import org.example.demo1.entity.Grade;
import org.example.demo1.repository.GradeRepository;
import org.example.demo1.service.IGradeService;

import java.util.List;

public class GradeService implements IGradeService {
    private final GradeRepository gradeRepository = new GradeRepository();

    @Override
    public void save(Grade grade) {
        gradeRepository.save(grade);
    }

    @Override
    public void update(Grade grade) {
        gradeRepository.update(grade);
    }

    @Override
    public void delete(int gradeId) {
        System.out.println("Deleting grade with ID: " + gradeId);
        gradeRepository.delete(gradeId);
    }

    @Override
    public Grade findById(int gradeId) {
        return gradeRepository.findById(gradeId);
    }

    @Override
    public List<Grade> getAll() {
        return gradeRepository.findAll();
    }

    @Override
    public List<Grade> getByExamType(String examType) {
        return gradeRepository.findByExamType(examType);
    }
}