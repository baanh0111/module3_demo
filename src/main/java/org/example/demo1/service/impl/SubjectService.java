//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package org.example.demo1.service.impl;

import java.util.List;
import org.example.demo1.entity.Subject;
import org.example.demo1.repository.SubjectRepository;
import org.example.demo1.service.ISubjectService;

public class SubjectService implements ISubjectService {
    private final SubjectRepository subjectRepository = new SubjectRepository();

    public SubjectService() {
    }

    public List<Subject> getAllSubject() {
        return this.subjectRepository.getAllSubject();
    }

    public Subject getSubjectById(int subject_id) {
        return this.subjectRepository.getSubjectById(subject_id);
    }

    public boolean addSubject(Subject subject) {
        return this.subjectRepository.addSubject(subject);
    }

    public boolean updateSubject(Subject subject) {
        return this.subjectRepository.updateSubject(subject);
    }

    public boolean deleteSubject(int subject_id) {
        return this.subjectRepository.deleteSubject(subject_id);
    }
}
