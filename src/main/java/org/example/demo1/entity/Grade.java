package org.example.demo1.entity;



import java.sql.Date;

public class Grade {
    private int gradeId;
    private int studentId;
    private int subjectId;
    private double score;
    private Date dateEntered;
    private String examType;

    public int getGradeId() {
        return gradeId;
    }

    public void setGradeId(int gradeId) {
        this.gradeId = gradeId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public Date getDateEntered() {
        return dateEntered;
    }

    public void setDateEntered(Date dateEntered) {
        this.dateEntered = dateEntered;
    }
    public String getExamType() {
        return examType;
    }
    public void setExamType(String examType) {
        this.examType = examType;
    }
}