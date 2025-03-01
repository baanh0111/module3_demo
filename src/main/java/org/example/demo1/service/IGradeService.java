package org.example.demo1.service;

import org.example.demo1.entity.Grade;

import java.util.List;

public interface IGradeService {
    void save(Grade grade);
    void update(Grade grade);
    void delete(int gradeId);
    Grade findById(int gradeId);
    List<Grade> getAll();
    List<Grade> getByExamType(String examType);
}