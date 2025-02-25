package org.example.demo1.entity;

import java.util.List;

public class Class {
    private int class_id;
    private String name;
    private Teacher teacher;
    private List<Student> students;

    public Class() {}

    public Class(int class_id, String name, Teacher teacher, List<Student> students) {
        this.class_id = class_id;
        this.name = name;
        this.teacher = teacher;
        this.students = students;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }

    @Override
    public String toString() {
        return "Class{" +
                "class_id=" + class_id + // Thay id bằng class_id
                ", name='" + name + '\'' +
                ", teacher=" + (teacher != null ? teacher.getName() : "Không có") +
                ", số lượng học sinh=" + (students != null ? students.size() : 0) +
                '}';
    }
}