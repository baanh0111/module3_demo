//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package org.example.demo1.service;

import java.util.List;
import org.example.demo1.entity.Subject;

public interface ISubjectService {
    List<Subject> getAllSubject();

    Subject getSubjectById(int var1);

    boolean addSubject(Subject var1);

    boolean updateSubject(Subject var1);

    boolean deleteSubject(int var1);
}
