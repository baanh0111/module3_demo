package org.example.demo1.entity;

import java.sql.Date;

public class Student extends Person {
    private String studentCode;

    public Student(int id, String name, Date dob, String gender, String address, String phone, String email) {
        super(id, name, dob, gender, address, phone, email);
        this.studentCode = studentCode;
    }


    public String getStudentCode() {
        return studentCode;
    }

    public void setStudentCode(String studentCode) {
        this.studentCode = studentCode;
    }

    @Override
    public String getRole() {
        return "Student";
    }

    @Override
    public String toString() {
        return super.toString();
    }
}

