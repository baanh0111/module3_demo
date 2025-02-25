package org.example.demo1.service;

import org.example.demo1.entity.Subject;

import java.util.List;

public interface ISubjectService {
    List<Subject> getAll();
    Subject findById(int id);
}