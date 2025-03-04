package org.example.demo1.entity;

public class Subject {
    private int subject_id;
    private String subject_name; // Đổi từ "name" thành "subject_name"

    public Subject() {}

    public Subject(int subject_id, String subject_name) { // Cập nhật constructor
        this.subject_id = subject_id;
        this.subject_name = subject_name;
    }

    // Getters và Setters
    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public String getSubject_name() {
        return subject_name;
    }

    public void setSubject_name(String subject_name) {
        this.subject_name = subject_name;
    }
}