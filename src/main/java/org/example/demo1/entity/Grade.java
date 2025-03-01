package org.example.demo1.entity;

import java.sql.Date;

public class Grade {
    private int grade_id;
    private int student_id;
    private int subject_id;
    private double score;
    private Date date_entered;
    private String exam_type; // Regular, Midterm, Final

    public Grade() {}

    public Grade(int grade_id, int student_id, int subject_id, double score, Date date_entered, String exam_type) {
        this.grade_id = grade_id;
        this.student_id = student_id;
        this.subject_id = subject_id;
        this.score = score;
        this.date_entered = date_entered;
        this.exam_type = exam_type;
    }

    // Getters và Setters
    public int getGrade_id() {
        return grade_id;
    }

    public void setGrade_id(int grade_id) {
        this.grade_id = grade_id;
    }

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public int getSubject_id() {
        return subject_id;
    }

    public void setSubject_id(int subject_id) {
        this.subject_id = subject_id;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public Date getDate_entered() {
        return date_entered;
    }

    public void setDate_entered(Date date_entered) {
        this.date_entered = date_entered;
    }

    public String getExam_type() {
        return exam_type;
    }

    public void setExam_type(String exam_type) {
        this.exam_type = exam_type;
    }

}